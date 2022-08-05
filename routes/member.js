const express = require("express");
const bcrypt = require("bcrypt");
const router = express.Router(); // 建立 router 物件
const db = require(__dirname + "/../modules/mysql-connect");
const yuupload = require(__dirname + "/../modules/yu-upload-images");
const { toDateString, toDatetimeString } = require(__dirname +
    "/../modules/date-tools");

//註冊會員
router.post("/add", async (req, res) => {
    // if(! req.session.admin){
    //     return res.redirect('/');
    // }
    // const schema = Joi.object({
    //     name: Joi.string()
    //         .min(3)
    //         .required()
    //         .label('姓名必填'),
    //     email: Joi.string()
    //         .email()
    //         .required(),
    //     mobile: Joi.string(),
    //     birthday: Joi.any(),
    //     address: Joi.string(),
    // });
    // 自訂訊息
    // https://stackoverflow.com/questions/48720942/node-js-joi-how-to-display-a-custom-error-messages

    // console.log( schema.validate(req.body, {abortEarly: false}) );
    const sql =
        "INSERT INTO `member`(`account`, `pass_hash`, `birthday`, `email`, `level`, `creat_at`) VALUES (?,?,?,?,0,NOW())";
    const { account, pass_hash, birthday, email } = req.body;
    // const saltRounds = 10;
    // const myPlaintextPassword = "s0//P4$$w0rD";
    var hash = await bcrypt.hash(pass_hash, 10);
    // bcrypt.hash(myPlaintextPassword, saltRounds, function (err, hash) {
    //     // Store hash in your password DB.
    // });
    const [result] = await db.query(sql, [account, hash, birthday, email]);

    res.json(result);
});
//撈取現在資料庫資料
router.get("/memberdata", async (req, res) => {
    const loaddata = `SELECT sid, account, pass_hash, name, birthday, email, mobile, address, avatar, level, creat_at FROM member WHERE sid=${res.locals.payload.sid}`;
    const [r2] = await db.query(loaddata);
    //
    r2.forEach((el) => (el.birthday = toDateString(el.birthday)));
    res.json(r2);

});
//修改會員資料
router.post("/memberupdate", async (req, res) => {
    //先確認現在會員等級
    const sqllevelcheck = `SELECT  level FROM member WHERE sid=${res.locals.payload.sid}`;
    const [resultcheck] = await db.query(sqllevelcheck);
    if (resultcheck[0].level > 2) {
        const sql = `UPDATE member SET account=?, birthday=?,email=?,mobile=?,address=? WHERE sid=${res.locals.payload.sid}`;
        const { account, birthday, email, mobile, address } = req.body;
        const [result] = await db.query(sql, [
            account,
            birthday,
            email,
            mobile,
            address,
        ]);
        const loaddata = `SELECT account, birthday, email, mobile, address FROM member WHERE sid=${res.locals.payload.sid}`;
        const [r2] = await db.query(loaddata);
        r2.forEach((el) => (el.birthday = toDateString(el.birthday)));
        console.log('updatedata',r2);
        res.json(r2);
    } else {
        const sql = `UPDATE member SET account=?, birthday=?,email=?,mobile=?,address=?,level=2 WHERE sid=${res.locals.payload.sid}`;
        const { account, birthday, email, mobile, address } = req.body;
        const [result] = await db.query(sql, [
            account,
            birthday,
            email,
            mobile,
            address,
        ]);
        //date-tools 轉日期
        const loaddata = `SELECT account, birthday, email, mobile, address FROM member WHERE sid=${res.locals.payload.sid}`;
        const [r2] = await db.query(loaddata);
        r2.forEach((el) => (el.birthday = toDateString(el.birthday)));
        console.log('result',r2);
        res.json(r2);

    }
});
//上傳頭貼
router.post("/yuupload", yuupload.single("avatar"), async (req, res) => {
    //先確認現在會員等級
    const sqllevelcheck = `SELECT  level FROM member WHERE sid=${res.locals.payload.sid}`;
    const [resultcheck] = await db.query(sqllevelcheck);
    if (resultcheck[0].level > 1) {
        const sql = `UPDATE member SET avatar =? WHERE member.sid =${res.locals.payload.sid}`;
        db.query(sql, [req.file.filename], function (err, result) {
            console.log("inserted 88 data");
        });

        res.json(req.file);
    } else {
        const sql = `UPDATE member SET avatar =?, level=1 WHERE member.sid =${res.locals.payload.sid}`;
        console.log(res.locals.payload.sid);
        db.query(sql, [req.file.filename], function (err, result) {
            console.log("inserted 88 data");
        });

        res.json(req.file);
    }
});

router.post("/membersdupdate", async (req, res) => {
    const output = {
        success: false,
    };
    const oldpsd = `SELECT  pass_hash FROM member WHERE sid=${res.locals.payload.sid}`;
    const [oldpsdfromdb] = await db.query(oldpsd);
    const { psdOld, psdNew } = req.body;
    //密碼對比
    // console.log(oldpsd, oldpsdfromdb[0].pass_hash);
    output.success = await bcrypt.compare(psdOld, oldpsdfromdb[0].pass_hash);
    // console.log("output.success", output.success);
    //對比正確後新密碼寫入db
    if (output.success === true) {
        // console.log('1');
        const sql = `UPDATE member SET pass_hash =? WHERE member.sid =${res.locals.payload.sid}`;
        var hash = await bcrypt.hash(psdNew, 10);
        const [querydone] = await db.query(sql, [hash]);
        const result = {...querydone,success:true};
        // console.log('result',result);
        res.json(result);
    } else {
        // console.log('2');
        // console.log('output',output);
        output.success = false;
        res.json(output);
    }
});

module.exports = router;
