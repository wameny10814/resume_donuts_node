-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-03 10:06:37
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
(5, 0, NULL, NULL, '劉玉珍', '劉玉珍', '1144d332-d6ac-4e15-951f-9381d61ad4b7.jpg', 1, '2022-08-02 10:58:24'),
(6, 0, NULL, NULL, 'dsdadad', 'werwrwerwrewrwre', '3c363ff3-1913-43e6-9955-ed9b479ab4a7.jpg', 1, '2022-08-02 15:34:37'),
(7, 0, NULL, NULL, 'dddddddddddddddddd', '1231231231231231231231231', '3dccc0bd-9358-4220-9b80-563f1cdbbee1.jpg', 1, '2022-08-02 15:38:56'),
(16, 0, NULL, NULL, '狗狗給', '狗狗給給給給', 'ec496e7b-5a5f-46e2-86fd-152647f5d28b.jpg', 1, '2022-08-02 16:37:06'),
(17, 0, '2022-08-03', '2022-08-03', 'baby', 'baby', 'e2e2bab2-fbc4-4595-975b-6477b7a11f6e.jpg', 1, '2022-08-03 11:24:47'),
(18, 0, '2022-08-03', '2022-08-03', '安安123123123', 'DJ4DJ4DJ4庫子 ', '41d1ef1b-366b-46e7-b71f-a6c892b2e292.jpg', 1, '2022-08-03 11:44:05');

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
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
