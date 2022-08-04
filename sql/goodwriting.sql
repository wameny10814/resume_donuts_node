-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-04 13:06:28
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
(6, 0, '安安', '這篇文章介紹了CSS文字的水平和垂直對齊方式，上面介紹了幾種比較常會用到的方法，當然還有非常多的方法可以來調整我們想要的文字對齊效果供我們探索，下一篇將會介紹設定文字大小、粗細和字型等CSS屬性!', '3e408862-c955-4b88-9f90-1f774952f87f.jpg', '2022-08-04 19:01:24');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `goodwriting`
--
ALTER TABLE `goodwriting`
  ADD PRIMARY KEY (`goodwritingid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `goodwriting`
--
ALTER TABLE `goodwriting`
  MODIFY `goodwritingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
