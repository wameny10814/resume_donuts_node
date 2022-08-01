require("dotenv").config();
const express = require("express");
const multer = require("multer");
//yuchen 大頭貼上傳---------------------------------------------
const yuupload = require(__dirname + "/modules/yu-upload-images");
const willowupload = require(__dirname + "/modules/upload-images");
//upload要改名字
const upload = require(__dirname + "/modules/upload-images");

const session = require("express-session");
const moment = require("moment-timezone");
const axios = require("axios");
const bcrypt = require("bcryptjs");

const db = require(__dirname + "/modules/mysql-connect");
const { toDateString, toDatetimeString } = require(__dirname +
    "/modules/date-tools");

const MysqlStore = require("express-mysql-session")(session);
const sessionStore = new MysqlStore({}, db);
const cors = require("cors");
const jwt = require("jsonwebtoken");
const app = express();

app.set("case sensitive routing", true);

// Top-level middlewares
const corsOptions = {
    // 全部允許
    credentials: true,
    origin: (origin, cb) => {
        console.log({ origin });
        cb(null, true);
    },
};
app.use(cors(corsOptions));

app.use(
    session({
        saveUninitialized: false,
        resave: false,
        secret: "dkfdl85493igdfigj9457394573irherer",
        store: sessionStore,
        cookie: {
            maxAge: 1800000, // 30 min
        },
    })
);

// middleware: 中介軟體 (function)
// const bodyParser = express.urlencoded({extended: false});
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//yuchen 登入----------------------------------------------------------
app.get("/", function (req, res) {
    res.send("hellw");
});
app.use((req, res, next) => {
    // res.locals.shinder = '哈囉';

    // template helper functions
    res.locals.toDateString = toDateString;
    res.locals.toDatetimeString = toDatetimeString;
    res.locals.session = req.session;

    //解密寫在middle ware 才可以全部頁面都拿到token
    const auth = req.get("Authorization");
    res.locals.payload = null;
    if (auth && auth.indexOf("Bearer ") === 0) {
        const token = auth.slice(7);
        //jwt判定完成存進locals.payload 裡面
        //2022-07-20 15 36 28 如果路由需要確認有沒有登入才做的話
        //jwt 每次request 都需要給token
        res.locals.payload = jwt.verify(token, process.env.JWT_SECRET);
        console.log("payload", res.locals.payload);
    }

    next();
});

app.get("/try-qs", (req, res) => {
    res.json(req.query);
});

// middleware: 中介軟體 (function)
// const bodyParser = express.urlencoded({extended: false});
app.post("/try-post", (req, res) => {
    res.json(req.body);
});

//yuchen 大頭貼上傳------------------------------------------
// app.post("/yu-upload", yuupload.single("avatar"), (req, res) => {
//     // const sql2 ="INSERT INTO `member`(`avatar`) VALUES (?) WHERE sid=(10)";
//     const sql ="UPDATE `member` SET `avatar` =? WHERE `member`.`sid` = 11";
//     console.log(res.locals.payload.sid);
//     db.query(sql, [req.file.filename], function (err, result) {
//         console.log("inserted 88 data");
//     });

//     res.json(req.file);
// });

app.post("/try-uploads", upload.array("photos"), (req, res) => {
    res.json(req.files);
});

app.get("/try-json", (req, res) => {
    const data = require(__dirname + "/data/data01");
    console.log(data);
    res.locals.rows = data;
    res.render("try-json");
});

// const adminsRouter = require(__dirname + "/routes/admins");
// prefix 前綴路徑

//因先把admin刪掉so這先段跑不了
// const adminsRouter = require(__dirname + "/routes/admins");
// // prefix 前綴路徑
// app.use("/admins", adminsRouter);
// app.use(adminsRouter);

// app.get("/try-session", (req, res) => {
//     req.session.my_var = req.session.my_var || 0;
//     req.session.my_var++;
//     res.json({
//         my_var: req.session.my_var,
//         session: req.session,
//     });
// });

// address-book
const addressbook = require(__dirname + "/routes/address-book1");
// prefix 前綴路徑
app.use("/address-book", addressbook);

//yuchen router--------------------------------------------------
const memberRouter = require(__dirname + "/routes/member");
app.use("/member", memberRouter);

//yuchen 登入-----------------------------------------
app.route("/login-jwt")
    .get(async (req, res) => {
        res.render("login-jwt");
    })
    .post(async (req, res) => {
        const output = {
            success: false,
            error: "",
            code: 0,
            data: {},
        };
        //用帳號撈會員資料
        const sql = "SELECT * FROM member WHERE account=?";
        const [r1] = await db.query(sql, [req.body.account]);

        if (!r1.length) {
            // 帳號錯誤
            output.code = 401;
            output.error = "帳密錯誤";
            return res.json(output);
        }
        //const row = r1[0];
        //密碼對比
        output.success = await bcrypt.compare(
            req.body.password,
            r1[0].pass_hash
        );
        if (!output.success) {
            // 密碼錯誤
            output.code = 402;
            output.error = "帳密錯誤";
        } else {
            // 成功登入
            //登入成功生成token
            const token = jwt.sign(
                {
                    sid: r1[0].sid,
                    account: r1[0].account,
                    level: r1[0].level,
                },
                process.env.JWT_SECRET
            );

            output.data = {
                token,
                sid: r1[0].sid,
                account: r1[0].account,
                level: r1[0].level,
            };
        }

        res.json(output);
    });

//logout登出
app.get("/logout", (req, res) => {
    delete req.session.admin;
    res.redirect("/");
});

// ------- static folder -----------
app.use(express.static("public"));
app.use("/bootstrap", express.static("node_modules/bootstrap/dist"));
app.use("/joi", express.static("node_modules/joi/dist"));
// ------- 404 ------------------------------------
app.use((req, res) => {
    res.send(`<h2>找不到頁面 404</h2>`);
});

app.listen(process.env.PORT, () => {
    console.log(`server started: ${process.env.PORT}`);
    console.log({ NODE_ENV: process.env.NODE_ENV });
});
