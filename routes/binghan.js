const express = require("express");
const db = require(__dirname + "/../modules/mysql-connect");
const router = express.Router(); // 建立 router 物件

router.get("/contribute", async (req, res) => {
  const sql = `SELECT COUNT(*) FROM cart_orders WHERE 1`;
  const [result] = await db.query(sql);
  res.json(result);
});
