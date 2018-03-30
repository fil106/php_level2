-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 02 2018 г., 19:09
-- Версия сервера: 5.6.37
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `galery`
--
CREATE DATABASE IF NOT EXISTS `galery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `galery`;

-- --------------------------------------------------------

--
-- Структура таблицы `galery`
--

DROP TABLE IF EXISTS `galery`;
CREATE TABLE `galery` (
  `id_galery` int(11) NOT NULL,
  `name_foto` varchar(250) NOT NULL,
  `hash_file` varchar(250) NOT NULL,
  `name_file` varchar(250) NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `galery`
--

INSERT INTO `galery` (`id_galery`, `name_foto`, `hash_file`, `name_file`, `view`) VALUES
(69, '', '076e3caed758a1c18c91a0e9cae3368f.jpg', 'Chrysanthemum.jpg', 0),
(70, '', '2b04df3ecc1d94afddff082d139c6f15.jpg', 'Koala.jpg', 0),
(71, '', 'fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'Tulips.jpg', 0),
(72, '', '5a44c7ba5bbe4ec867233d67e4806848.jpg', 'Jellyfish.jpg', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id_galery`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `galery`
--
ALTER TABLE `galery`
  MODIFY `id_galery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
