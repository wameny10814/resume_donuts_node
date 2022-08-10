-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-10 09:49:59
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
-- 資料表結構 `cart_orders`
--

CREATE TABLE `cart_orders` (
  `sid` int(11) NOT NULL,
  `member_sid` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `pay_price` int(11) NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `market_name` varchar(50) DEFAULT NULL,
  `ship_name` varchar(50) NOT NULL,
  `ship_phone` int(11) NOT NULL,
  `ship_email` varchar(50) NOT NULL,
  `ship_address` varchar(50) NOT NULL,
  `discount_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cart_orders`
--

INSERT INTO `cart_orders` (`sid`, `member_sid`, `created_at`, `total_quantity`, `pay_price`, `pay_type`, `store_name`, `market_name`, `ship_name`, `ship_phone`, `ship_email`, `ship_address`, `discount_code`) VALUES
(1, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(2, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(3, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(4, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(5, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(6, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(7, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(8, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart_orders`
--
ALTER TABLE `cart_orders`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_orders`
--
ALTER TABLE `cart_orders`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
