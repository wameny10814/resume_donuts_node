-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-11 06:15:33
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
-- 資料表結構 `cart-orderdetail`
--

CREATE TABLE `cart-orderdetail` (
  `sid` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cart-orderdetail`
--

INSERT INTO `cart-orderdetail` (`sid`, `orders_id`, `product_sid`, `p_name`, `price`, `quantity`) VALUES
(1, 1, 1, '草莓波堤', 105, 3),
(2, 1, 2, '宇治抹茶波堤', 200, 4),
(3, 2, 2, '宇治抹茶波堤', 500, 10),
(4, 2, 3, '歐菲香', 160, 4),
(5, 3, 1, '草莓波堤', 70, 2),
(6, 3, 2, '宇治抹茶波堤', 100, 2),
(7, 3, 4, '巧克力歐菲香', 45, 1),
(8, 3, 3, '歐菲香', 400, 10);

-- --------------------------------------------------------

--
-- 資料表結構 `cart-orders`
--

CREATE TABLE `cart-orders` (
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
-- 傾印資料表的資料 `cart-orders`
--

INSERT INTO `cart-orders` (`sid`, `member_sid`, `created_at`, `total_quantity`, `pay_price`, `pay_type`, `store_name`, `market_name`, `ship_name`, `ship_phone`, `ship_email`, `ship_address`, `discount_code`) VALUES
(1, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(2, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(3, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(4, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(5, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(6, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL),
(7, 1, '2022-08-01', 10, 500, '到店取貨', '大安店', NULL, '游小豪', 977037182, 'loveyu@aa.bb.cc', '新北市板橋區安安路77號88樓', NULL),
(8, 2, '2022-08-02', 44, 600, '超商取貨', NULL, '7-11大同門市', '游中豪', 977037184, 'loveyu@aa.bb.dd', '新北市板橋區安安路77號99樓', NULL);

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

-- --------------------------------------------------------

--
-- 資料表結構 `goodwriting`
--

CREATE TABLE `goodwriting` (
  `goodwritingid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `goodtitle` varchar(255) DEFAULT NULL,
  `goodwords` varchar(255) DEFAULT NULL,
  `goodimg` varchar(255) DEFAULT NULL,
  `good_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `goodwriting`
--

INSERT INTO `goodwriting` (`goodwritingid`, `userid`, `goodtitle`, `goodwords`, `goodimg`, `good_at`) VALUES
(3, 0, '安安123', '美國眾議院議長裴洛西（Nancy Pelosi）旋風訪台引發全球矚目，卻也讓不斷文攻武嚇台灣的中國氣炸，中國官媒《央視新聞》還刻意整理有哪些「好朋友」表態支持中國，更誇稱有「上百個」國家、國際組織在第一時間「挺中」。不過 G7 國家也發表聯合聲明，表示支持裴洛西訪台。\n\n就裴洛西訪台行為，聯合國秘書長發言人杜加里克（Stephane Dujarric）2 日於記者會上僅稱會維持 1971年於聯合國大會上第 2758 號決議的立場。\n\n阿拉伯國家聯盟首席助理秘書長兼秘書長辦公室主任扎齊發表聲明指出，阿盟支持', 'e0156571-c2ec-442b-be0d-6d3bccd18d58.jpg', '2022-08-04 12:13:45'),
(6, 0, '安安', '這篇文章介紹了CSS文字的水平和垂直對齊方式，上面介紹了幾種比較常會用到的方法，當然還有非常多的方法可以來調整我們想要的文字對齊效果供我們探索，下一篇將會介紹設定文字大小、粗細和字型等CSS屬性!', '3e408862-c955-4b88-9f90-1f774952f87f.jpg', '2022-08-04 19:01:24'),
(8, 0, '123', '123', '42a63c51-d802-4747-b3bc-c6d69bcf4f56.jpg', '2022-08-11 11:41:51'),
(9, 0, '123', '123', 'c3d98377-4d86-4b21-81e2-69cd508975bf.jpg', '2022-08-11 11:42:02'),
(10, 0, '123', '123', '6f1c6a4d-f494-4a39-9d40-9563da5a1c2c.jpg', '2022-08-11 11:42:13'),
(11, 0, '13', '123', '8459fa78-f680-4390-8937-bdaf7527674e.jpg', '2022-08-11 11:42:23'),
(12, 0, '123', '123', '3359e381-4b7c-4f87-b633-320ad0e93fa1.jpg', '2022-08-11 11:42:35'),
(13, 0, '123', '123', '4164ab26-7c34-4cd5-8052-b5f7811bce2e.jpg', '2022-08-11 11:42:43'),
(14, 0, '123', '123', '732a871b-6268-47d5-a211-abb05369f218.jpg', '2022-08-11 11:42:53'),
(15, 0, '123', '123', '846c032d-1c6a-4bcf-b72f-4ec4ed1f5614.jpg', '2022-08-11 11:43:06');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `sid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `pass_hash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `creat_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`sid`, `account`, `pass_hash`, `name`, `birthday`, `email`, `mobile`, `address`, `avatar`, `level`, `creat_at`) VALUES
(1, '1', '1', '', '0000-00-00', '1', 0, '', '', 1, '2022-07-28 10:11:49'),
(2, '7gfgdfg', '11gdfgfg', '', '0000-00-00', 'ggfdgdfg', 0, '', '', 1, '2022-07-28 10:12:26'),
(3, 'dsadasd', 'dsadads', '', '2022-07-13', 'dsad@hamcl.com', 0, '', '', 1, '2022-07-28 10:48:38'),
(4, 'FDSFSDF', 'fdsfsdf', '', '2022-07-19', 'fdsfd@mail.com', 0, '', '', 1, '2022-07-28 10:49:44'),
(5, 'gfdgdfg', 'aaaaaa', '', '0000-00-00', 'gfdgdfg@mail.com', 0, '', '', 1, '2022-07-28 13:21:17'),
(7, '456', '$2b$10$F4L7cRdkeIATlSBVh8JOG.zXxxBOUviqySKjcgf.j4.AddX7EWvLm', '', '2022-07-12', '123@mail.com', 0, '', '', 1, '2022-07-28 13:43:58'),
(8, '123', '$2b$10$Jw2YtKg9xCF/pLc5h/R6A.BHV2vLTEMoEtEQvSlnnzheXvlkxMnXe', '', '2022-06-29', '123@mail.com', 0, '', '', 1, '2022-07-28 13:52:07'),
(9, 'sunny', '$2b$10$IZmTxLb6f67ydsDPETk8bOGE9WJfW/gC2VIIad5yIJ3P8Ls7D89/u', '', '2022-07-12', 'FDSF@mail.com', 0, '', '', 1, '2022-07-28 14:36:27'),
(10, 'ming', '$2b$10$0ELkPPcDZrbh5W6c..6Ad.AMKiaRT8h/1PhHe0Ld3zmFAsUgej3Xm', '', '0000-00-00', '', 0, 'wwwwwwwwwwwwwwwww', '', 1, '2022-07-28 14:49:34'),
(11, '444', '$2b$10$9DSo9IeKaye0sevIkAZPOeTe5J2.Y/16Rgxd4ggUxhdUK/lrRn2ZG', '', '2022-06-29', '444@mail.com', 0, '', '', 1, '2022-07-29 10:48:28');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `test-carts`
--

CREATE TABLE `test-carts` (
  `sid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `willowadminuser`
--

CREATE TABLE `willowadminuser` (
  `userid` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- 傾印資料表的資料 `willowadminuser`
--

INSERT INTO `willowadminuser` (`userid`, `account`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'jason'),
(2, 'opuser', 'Aa123456', 'sally'),
(3, 'seuser', 'Aa23882388', 'cindy');

-- --------------------------------------------------------

--
-- 資料表結構 `willownews`
--

CREATE TABLE `willownews` (
  `newsid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `finishtime` datetime DEFAULT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `newsimg` varchar(255) DEFAULT NULL,
  `newsstyle` int(11) DEFAULT NULL,
  `news_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `willownews`
--

INSERT INTO `willownews` (`newsid`, `userid`, `starttime`, `finishtime`, `newstitle`, `words`, `newsimg`, `newsstyle`, `news_at`) VALUES
(16, 0, NULL, NULL, '狗狗給ddddd', '狗狗給給給給ddddd', '5fd85250-55f2-405c-92e5-8ad7a9c35580.jpg', 1, '2022-08-02 16:37:06'),
(18, 0, '2022-08-03 00:00:00', '2022-08-03 00:00:00', 'asdadadadadddad', 'ddddddddd', '5b55dc71-5b93-4c35-859e-f02439c9cbb8.jpg', 1, '2022-08-03 11:44:05'),
(20, 0, '2022-08-09 00:00:00', '2022-08-26 00:00:00', '23r23r23r23r', '23r23r23r23r23r23r', '60da3f94-2cda-41f1-9565-e6032eb4d9c0.jpg', 2, '2022-08-04 16:26:17'),
(21, 0, '2022-08-01 00:00:00', '2022-08-31 00:00:00', '活動1', '活動1', 'bdbd6dc0-483b-475a-b2f9-6325ce099fd9.jpg', 2, '2022-08-04 16:27:21'),
(22, 0, '2022-11-20 00:00:00', '2022-11-20 00:00:00', 'qweqweqewqewqew', 'eqweqewqweqewqewqweqweqew', 'eefd2d06-a700-432f-936c-c068ebc645b6.png', 2, '2022-08-04 16:29:46'),
(23, 0, '2022-07-25 00:00:00', '2022-08-01 00:00:00', 'dsdaqweqeeeqeee', 'we1111111rwerwredsdasdadadsadsr', '09c33ac2-1a75-435e-a755-ab1b1a5f0554.jpg', 2, '2022-08-05 11:35:54'),
(26, 0, '2022-08-25 00:00:00', '2022-09-10 00:00:00', '蕙蕙蕙123', '蕙蕙蕙333', 'b72c4e85-e474-4fc3-b89b-7a3b1a66e997.jpg', 2, '2022-08-05 12:40:42'),
(27, 0, '2022-08-09 00:00:00', '2022-09-27 00:00:00', '蕙蕙蕙123', 'qweqweqweqweqweqewqweqwe', 'e6080e13-2e83-4cee-a440-492d5d9d898d.jpg', 2, '2022-08-05 13:22:04'),
(28, 0, '2022-07-01 00:00:00', '2022-08-01 00:00:00', '蕙蕙dadadd蕙123eeeddddee', '蕙asdadad蕙蕙333eeeddddee', '7431fdfe-59cd-4878-bd82-632b218de7c0.png', 2, '2022-08-05 13:22:41'),
(29, 0, '2022-07-31 00:00:00', '2022-08-12 00:00:00', '李炳翰', '李炳翰', '0dc043a6-ab55-4972-b1ae-276d4b172d6a.jpg', 2, '2022-08-05 14:50:11'),
(30, 0, '2022-08-10 16:35:12', '2022-08-10 16:35:12', 'qweqwe', 'qweqweqwe', '1335ce3e-350e-480e-90e9-33be96c94c2f.png', 1, '2022-08-10 16:35:12');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart-orderdetail`
--
ALTER TABLE `cart-orderdetail`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `cart-orders`
--
ALTER TABLE `cart-orders`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `cart_orders`
--
ALTER TABLE `cart_orders`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `goodwriting`
--
ALTER TABLE `goodwriting`
  ADD PRIMARY KEY (`goodwritingid`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- 資料表索引 `test-carts`
--
ALTER TABLE `test-carts`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `willowadminuser`
--
ALTER TABLE `willowadminuser`
  ADD PRIMARY KEY (`userid`);

--
-- 資料表索引 `willownews`
--
ALTER TABLE `willownews`
  ADD PRIMARY KEY (`newsid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart-orderdetail`
--
ALTER TABLE `cart-orderdetail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart-orders`
--
ALTER TABLE `cart-orders`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_orders`
--
ALTER TABLE `cart_orders`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `goodwriting`
--
ALTER TABLE `goodwriting`
  MODIFY `goodwritingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `test-carts`
--
ALTER TABLE `test-carts`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `willowadminuser`
--
ALTER TABLE `willowadminuser`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `willownews`
--
ALTER TABLE `willownews`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
