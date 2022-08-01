const express = require("express");
const db = require(__dirname + "/../modules/mysql-connect");
const { toDateString, toDatetimeString } = require(__dirname +
    "/../modules/date-tools");
const moment = require("moment-timezone");
const Joi = require("joi");
const upload = require(__dirname + "/../modules/upload-images");

const router = express.Router(); // 建立 router 物件

router.get("/", async (req, res) => {
    res.send("hellowillow");
});

// upload.none()用中介轉乘 url inclding
router.post("/newsadd", async (req, res) => {
    // (`newsid`, `userid`, `newstitle`, `words`, `newsimg`, `newsstyle`, `news_at`)
    const { userid, newstitle, words, newsimg, newsstyle } = req.body;
   console.log( req.body)
    const sql =
        "INSERT INTO `willownews`(`userid`,`newstitle`,`words`,`newsimg`,`newsstyle`,`news_at`) VALUES (?,?,?,?,?,NOW())";

    const [result] = await db.query(sql, [
        userid,
        newstitle,
        words,
        newsimg,
        newsstyle,
    ]);

    res.json(result);
});

module.exports = router;
