-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-05 09:38:24
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
(29, 0, '2022-07-31 00:00:00', '2022-08-12 00:00:00', '李炳翰', '李炳翰', '0dc043a6-ab55-4972-b1ae-276d4b172d6a.jpg', 2, '2022-08-05 14:50:11');

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
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
