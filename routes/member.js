const express = require("express");
const bcrypt = require("bcrypt");
const router = express.Router(); // 建立 router 物件
const db = require(__dirname + "/../modules/mysql-connect");

// router.get('/add', async (req, res)=>{
//        res.render('address-book/add');
//     });

//c
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
        "INSERT INTO `member`(`account`, `pass_hash`, `birthday`, `email`, `level`, `creat_at`) VALUES (?,?,?,?,1,NOW())";
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

router.get("/memberdata", async (req, res) => {
    const sql = `SELECT sid, account, pass_hash, name, birthday, email, mobile, address, avatar, level, creat_at FROM member WHERE sid=${res.locals.payload.sid}`;
    // const sql2 =SELECT `sid`, `account`, `pass_hash`, `name`, `birthday`, `email`, `mobile`, `address`, `avatar`, `level`, `creat_at` FROM `member` WHERE sid =1;
    const [result] = await db.query(sql, [req.body]);

    res.json(result);
});

router.post("/memberupdate", async (req, res) => {
    const sql = `UPDATE member SET birthday=?,email=?,mobile=?,address=? WHERE sid=${res.locals.payload.sid}`;
    console.log("sid", res.locals.payload.sid);
    const { birthday, email, mobile, address } = req.body;
    const [result] = await db.query(sql, [birthday, email, mobile, address]);

    res.json(result);
});

module.exports = router;
