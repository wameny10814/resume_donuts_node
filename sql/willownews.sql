-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-01 13:35:11
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
  `newstitle` varchar(255) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `newsimg` varchar(255) DEFAULT NULL,
  `newsstyle` int(11) DEFAULT NULL,
  `news_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `willownews`
--

INSERT INTO `willownews` (`newsid`, `userid`, `newstitle`, `words`, `newsimg`, `newsstyle`, `news_at`) VALUES
(1, 1, NULL, 'gggg', 'dddd', NULL, '2022-06-09 21:21:39'),
(2, 1, NULL, 'asdasdasdasd', 'dddddddd', NULL, '2022-08-01 10:42:43'),
(3, 0, 'rrrrr', 'werewrwerwerewrrwer', 'f8557ed4-cf31-4203-91bf-53631a8fc81a.jpg', 1, '2022-08-01 19:29:43'),
(4, 0, '新增test1', '安安阿\n', '0c3e3dc5-2fb3-49aa-b421-89d9b199a452.jpg', 1, '2022-08-01 19:30:16');

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
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
