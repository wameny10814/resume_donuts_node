const express = require("express");
const db = require(__dirname + "/../modules/mysql-connect");
const {toDateString,
    toDatetimeString,} = require(__dirname + "/../modules/date-tools");

const router = express.Router(); // 建立 router 物件

router.get("/", async (req, res) => {
    let output = {
        perPage: 10,
        page: 1,
        totalRows: 0,
        totalPages: 0,
        rows: [],
    };
    // let page = +req.query.page || 1;
    let page = parseInt(req.query.page) || 1;
    if (page < 1) {
        return res.redirect("?page=1");
    }

    const sql01 = "SELECT COUNT(1) totalRows FROM address_book";
    const [[{ totalRows }]] = await db.query(sql01);
    let totalPages = 0;
    if (totalRows) {
        totalPages = Math.ceil(totalRows / output.perPage);
        if (page > totalPages) {
            return res.redirect(`?page=${totalPages}`);
        }
        const sql02 = `SELECT * FROM address_book LIMIT ${
            (page - 1) * output.perPage
        }, ${output.perPage}`;
        const [r2] = await db.query(sql02);

        // r2.forEach(el => {
        //     el.birthday=toDateString(el.birthday);
        // });
        output.rows = r2;
    }

    //展開複製，每次都複製進去，有改變change
    //解構賦值
    output = { ...output, page, totalRows, totalPages };
    res.render("address-book/main", output);
});

module.exports = router;
