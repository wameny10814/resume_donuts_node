const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();

const router = express.Router(); // 建立 router 物件

// loveyu 購物車寫入資料庫 ----------------------------
app.get("/cartsData", (req, res) => {
  res.json({
    name: "Bill999ddd9dddd",
    age: 999,
  });
});
// app.post("/cartsData", (req, res) => {
//   const sql =
//     "INSERT INTO `cart_orders`(`member_sid`, `created_at`, `total_quantity`, `pay_price`, `pay_type`, `store_name`, `market_name`, `ship_name`, `ship_phone`, `ship_email`, `ship_address`, `discount_code`) VALUES (?,NOW(),?,?,?,?,?,?,?,?,?,?)";
//   const { member_sid, total_quantity, pay_price, pay_type } = req.body;
//   const [result] = await db.query(sql, [member_sid, total_quantity, pay_price, pay_type]);
//   res.json(result);
// });

module.exports = router;
