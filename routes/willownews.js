const express = require("express");
const db = require(__dirname + "/../modules/mysql-connect");
const { toDateString, toDatetimeString } = require(__dirname +
    "/../modules/date-tools");
const moment = require("moment-timezone");
const Joi = require("joi");
const upload = require(__dirname + "/../modules/upload-images");

const router = express.Router(); // 建立 router 物件

router.get("/newsdata", async (req, res) => {
    const sql = `SELECT newsid,userid,newstitle,words,newsimg,newsstyle,news_at FROM willownews WHERE newsstyle=1`;
    const [result] = await db.query(sql);
    res.json(result);
});

router.delete("/newsdata", async (req, res) => {
    let output = {
        success: false,
        data: req.query,
        error: "",
        information: "",
    };
    const { sid } = req.query;
    if (!!req.query === true) {
        console.log(sid);
        const sql = `DELETE FROM willownews WHERE newsid=?`;
        const [result] = await db.query(sql, [sid]);
        output.success = true;
        output.information = "delet ok";
    }

    // console.log(sid)

    //  const sql = `DELETE FROM willownews WHERE 0`;
    // `SELECT userid,account,password,name FROM willowadminuser WHERE 1`;
    // const [result] = await db.query(sql, [req.body]);
    res.json(output);
});
//  router.get("/memberdata", async (req, res) => {
//     const sql = `SELECT sid, account, pass_hash, name, birthday, email, mobile, address, avatar, level, creat_at FROM member WHERE sid=${res.locals.payload.sid}`;

//     const [result] = await db.query(sql, [req.body]);

//     res.json(result);
// });

// upload.none()用中介轉乘 url inclding
//讀進入update畫面的get
router.get("/newsupdate", async (req, res) => {
    const { sid } = req.query;
    const sql = `SELECT newsid,userid,newstitle,words,newsimg,newsstyle,news_at FROM willownews WHERE newsid=?`;
    const [result] = await db.query(sql, [sid]);
    // res.json(result);
    console.log(result);
    res.json(result);
});

//更新資料
router.put("/newsupdate", async (req, res) => {
    let output = {
        success: false,
        data: req.body,
        error: "",
        information: "",
    };
    const { userid, newsid, newstitle, words, newsimg, newsstyle } = req.body;
    console.log(userid, newsid);

    const sql = `UPDATE willownews SET userid=?,newstitle=?,words=?,newsimg=?,newsstyle=? WHERE  newsid=${newsid}`;

    const [result] = await db.query(sql, [
        userid,
        newstitle,
        words,
        newsimg,
        newsstyle,
    ]);
    if (result.affectedRows === 1) {
        output.success = true;
        output.information = "update ok";
    } else {
        output.error = "error";
    }
    res.json(output);
});

router.post("/newsadd", async (req, res) => {
    // (`newsid`, `userid`, `newstitle`, `words`, `newsimg`, `newsstyle`, `news_at`)
    const { userid, newstitle, words, newsimg, newsstyle } = req.body;
    console.log(req.body);
    let output = {
        success: false,
        data: req.body,
        error: "",
        information: "",
    };
    if (!!req.body === true) {
        const sql =
            "INSERT INTO `willownews`(`userid`,`newstitle`,`starttime`,`finishtime`,`words`,`newsimg`,`newsstyle`,`news_at`) VALUES (?,?,NOW(),NOW(),?,?,?,NOW())";

        const [result] = await db.query(sql, [
            userid,
            newstitle,
            words,
            newsimg,
            newsstyle,
        ]);
        output.success = true;
        output.information = "insert ok";
    }

    res.json(output);
});

module.exports = router;
