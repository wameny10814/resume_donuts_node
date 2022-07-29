-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-07-29 12:18:27
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

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
