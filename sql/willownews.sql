-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-04 13:10:09
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
-- 資料表結構 `willownews`
--

CREATE TABLE `willownews` (
  `newsid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `starttime` date DEFAULT NULL,
  `finishtime` date DEFAULT NULL,
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
(5, 0, NULL, NULL, '劉玉123絲', '劉玉123', '5fbf82cd-a6d7-4e3a-8548-64f030c1a5f5.jpg', 1, '2022-08-02 10:58:24'),
(16, 0, NULL, NULL, '狗狗給ddddd', '狗狗給給給給ddddd', '5fd85250-55f2-405c-92e5-8ad7a9c35580.jpg', 1, '2022-08-02 16:37:06'),
(17, 0, '2022-08-03', '2022-08-03', 'baby', 'baby', 'e2e2bab2-fbc4-4595-975b-6477b7a11f6e.jpg', 1, '2022-08-03 11:24:47'),
(18, 0, '2022-08-03', '2022-08-03', 'asdadadadadddad', 'ddddddddd', '5b55dc71-5b93-4c35-859e-f02439c9cbb8.jpg', 1, '2022-08-03 11:44:05'),
(20, 0, '2022-08-09', '2022-08-26', '23r23r23r23r', '23r23r23r23r23r23r', '60da3f94-2cda-41f1-9565-e6032eb4d9c0.jpg', 2, '2022-08-04 16:26:17'),
(21, 0, '2022-08-01', '2022-08-31', '活動1', '活動1', 'bdbd6dc0-483b-475a-b2f9-6325ce099fd9.jpg', 2, '2022-08-04 16:27:21'),
(22, 0, '2022-08-20', '2022-08-22', 'qweqweqewqewqew', 'eqweqewqweqewqewqweqweqew', 'bf4b240c-9409-407f-a9d1-2b14aa5b8665.jpg', 2, '2022-08-04 16:29:46');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `willownews`
--
ALTER TABLE `willownews`
  ADD PRIMARY KEY (`newsid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `willownews`
--
ALTER TABLE `willownews`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
