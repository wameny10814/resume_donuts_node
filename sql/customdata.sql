-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-16 20:46:58
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
-- 資料庫： `group-e`
--

-- --------------------------------------------------------

--
-- 資料表結構 `customdata`
--

CREATE TABLE `customdata` (
  `sid` int(11) NOT NULL,
  `mem` int(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `donut` varchar(255) DEFAULT NULL,
  `layer` varchar(255) DEFAULT NULL,
  `decoration` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customdata`
--

INSERT INTO `customdata` (`sid`, `mem`, `img`, `donut`, `layer`, `decoration`, `price`) VALUES
(21, 1, '', '', 'milk', 'strawberry', 40),
(22, 1, '', 'Ponde', 'milk', 'strawberry', 45),
(23, 1, '', 'origin', 'chocolate', 'sugarpowder', 30);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `customdata`
--
ALTER TABLE `customdata`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customdata`
--
ALTER TABLE `customdata`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
