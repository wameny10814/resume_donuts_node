require("dotenv").config();
const express = require("express");
const multer = require("multer");

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
app.use((req, res, next) => {
    res.locals.toDateString = toDateString;
    res.locals.toDatetimeString = toDatetimeString;

    res.locals.session = req.session; //存入locals.session 在ejs可以直接用 req.session這個名字不用加locals

    const auth = req.get("Authorization");
    // res.locals.payload = null;
    res.locals.loginUser = null;
    if (auth && auth.indexOf("Bearer ") === 0) {
        const token = auth.slice(7);
        // res.locals.payload = jwt.verify(token, process.env.JWT_SECRET);
        res.locals.loginUser = jwt.verify(token, process.env.JWT_SECRET);
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


app.post("/try-upload", upload.single("avatar"), (req, res) => {
    res.json(req.file);
});

app.post("/try-uploads", upload.array("photos"), (req, res) => {
    res.json(req.files);
});

app.get("/try-json", (req, res) => {
    const data = require(__dirname + "/data/data01");
    console.log(data);
    res.locals.rows = data;
    res.render("try-json");
});


//因先把admin刪掉so這先段跑不了
// const adminsRouter = require(__dirname + "/routes/admins");
// // prefix 前綴路徑
// app.use("/admins", adminsRouter);
// app.use(adminsRouter);

app.get("/try-session", (req, res) => {
    req.session.my_var = req.session.my_var || 0;
    req.session.my_var++;
    res.json({
        my_var: req.session.my_var,
        session: req.session,
    });
});

// address-book
const addressbook = require(__dirname + "/routes/address-book1");
// prefix 前綴路徑
app.use("/address-book", addressbook);


// 登入login
app.route("/login")
    .get(async (req, res) => {
        res.render("login");
    })
    .post(async (req, res) => {
        const output = {
            success: false,
            error: "",
            code: 0,
        };
        const sql = "SELECT * FROM admins WHERE account=?";
        const [r1] = await db.query(sql, [req.body.account]);

        if (!r1.length) {
            // 帳號錯誤
            output.code = 401;
            output.error = "帳密錯誤";
            return res.json(output);
        }
        //const row = r1[0];

        output.success = await bcrypt.compare(
            req.body.password,
            r1[0].pass_hash
        );
        console.log(await bcrypt.compare(req.body.password, r1[0].pass_hash));
        if (!output.success) {
            // 密碼錯誤
            output.code = 402;
            output.error = "帳密錯誤";
        } else {
            req.session.admin = {
                sid: r1[0].sid,
                account: r1[0].account,
            };
        }

        res.json(output);
    });

//login jwt
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
        const sql = "SELECT * FROM admins WHERE account=?";
        const [r1] = await db.query(sql, [req.body.account]);

        if (!r1.length) {
            // 帳號錯誤
            output.code = 401;
            output.error = "帳密錯誤";
            return res.json(output);
        }
        //const row = r1[0];

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
            const token = jwt.sign(
                {
                    sid: r1[0].sid,
                    account: r1[0].account,
                },
                process.env.JWT_SECRET
            );

            output.data = {
                sid: r1[0].sid,
                token,
                account: r1[0].account,
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
// ------- 404 -----------
app.use((req, res) => {
    res.send(`<h2>找不到頁面 404</h2>`);
});

app.listen(process.env.PORT, () => {
    console.log(`server started: ${process.env.PORT}`);
    console.log({ NODE_ENV: process.env.NODE_ENV });
});
