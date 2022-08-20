const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require(__dirname + "/../modules/mysql-connect");

const router = express.Router(); // 建立 router 物件

// loveyu 購物車寫入資料庫 ----------------------------
// router.post("/cartsData", (req, res) => {
//   const sql =
//     "INSERT INTO `cart_orders`(`member_sid`, `created_at`, `total_quantity`, `pay_price`, `pay_type`, `store_name`, `market_name`, `ship_name`, `ship_phone`, `ship_email`, `ship_address`, `discount_code`) VALUES (?,NOW(),?,?,?,?,?,?,?,?,?,?)";
//     const {total_quantity,pay_price,ship_name,ship_phone,ship_email,ship_address} =req.body;
//     const [result]=await db.query(sql, [total_quantity,pay_price,ship_name,ship_phone,ship_email,ship_address]);
//     res.json(result)
// });

router.post("/cartsData", async (req, res) => {
  const {
    memSid ,
    created_at,
    count,
    product_price,
    shipName,
    shipPhone,
    shipEmail,
    addressDetail,
  } = req.body;
  let output = {
    success: false,
    data: req.body,
    error: "",
    information: "",
  };
  if (!!req.body === true) {
    const sql =
      "INSERT INTO `cart_orders`(`member_sid`, `created_at`, `total_quantity`, `pay_price`, `pay_type`, `store_name`, `market_name`, `ship_name`, `ship_phone`, `ship_email`, `ship_address`, `discount_code`) VALUES (?,NOW(),?,?,?,?,?,?,?,?,?,?)";
    const [result] = await db.query(sql, [
      mem,
      img,
      donut,
      layer,
      decoration,
      price,
    ]);
    output.success = true;
    output.information = "insert ok";
  }
  res.json(output);
});

module.exports = router;
