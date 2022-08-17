const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();

const router = express.Router(); // 建立 router 物件


// loveyu 購物車寫入資料庫 ----------------------------
app.get("/cartsData", (req, res) => {
    res.json({
      name: "Bill9999",
      age: 999,
    });
  });
  app.post("/cartsData", (req, res) => {
    console.log(req.body);
  });


module.exports = router;