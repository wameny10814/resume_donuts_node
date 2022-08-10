-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-10 09:53:31
-- 伺服器版本： 10.4.24-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `group-e`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart_orderdetail`
--

CREATE TABLE `cart_orderdetail` (
  `sid` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cart_orderdetail`
--

INSERT INTO `cart_orderdetail` (`sid`, `orders_id`, `product_sid`, `p_name`, `price`, `quantity`) VALUES
(1, 1, 1, '草莓波堤', 105, 3),
(2, 1, 2, '宇治抹茶波堤', 200, 4),
(3, 2, 2, '宇治抹茶波堤', 500, 10),
(4, 2, 3, '歐菲香', 160, 4),
(5, 3, 1, '草莓波堤', 70, 2),
(6, 3, 2, '宇治抹茶波堤', 100, 2),
(7, 3, 4, '巧克力歐菲香', 45, 1),
(8, 3, 3, '歐菲香', 400, 10);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;