-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 21 2018 г., 22:16
-- Версия сервера: 5.5.53
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `GU`
--
DROP DATABASE IF EXISTS `GU`;
CREATE DATABASE IF NOT EXISTS `GU` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `GU`;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `prim` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id_user`, `login`, `pass`, `prim`) VALUES
(1, 'user', '$2y$10$mBPas3uNzVeY0AYq4MWu7es7BfLAmI6j4r8fjmkaNRGeupNax69ZO', '');

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

DROP TABLE IF EXISTS `basket`;
CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `ID_UUID` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `prim` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `status` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `foto_category` varchar(500) NOT NULL,
  `description_category` varchar(1000) NOT NULL,
  `UUID_categiry` varchar(250) NOT NULL,
  `id_pages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `status`, `name`, `parent_id`, `foto_category`, `description_category`, `UUID_categiry`, `id_pages`) VALUES
(1, '1', 'Товары для серфинга', 0, '', '', '', 6),
(2, '1', 'Товары для дайвинга', 0, '', '', '', 8),
(7, '1', 'Гидрокостюмы', 1, 'images/serf/gidro.png', '', '', 10),
(8, '1', 'Доски', 1, 'images/serf/doska.png', '', '', 11),
(9, '1', 'Аксессуары', 1, 'images/serf/aksessuar.png', '', '', 12),
(10, '1', 'Кайтсерфы', 1, 'images/serf/jacknife_boards.png', '', '', 13),
(11, '1', 'Чехлы', 1, 'images/serf/salmon pink.png', '', '', 14),
(12, '1', 'Маски', 2, 'images/diving/mask.png', '', '', 15),
(13, '1', 'BCD куртки', 2, 'images/diving/seacsub-ego.png', '', '', 18),
(14, '1', 'Компьтеры', 2, 'images/diving/cressi-giotto.png', '', '', 19),
(15, '1', 'Подводные аппараты', 2, 'images/diving/seadoo-aquaranger.png', '', '', 20);

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
(14, '', '076e3caed758a1c18c91a0e9cae3368f.jpg', 'Chrysanthemum.jpg', 8),
(15, '', 'ba45c8f60456a672e003a875e469d0eb.jpg', 'Desert.jpg', 1),
(16, '', 'bdf3bf1da3405725be763540d6601144.jpg', 'Hydrangeas.jpg', 2),
(17, '', 'fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'Tulips.jpg', 0),
(18, '', '9d377b10ce778c4938b3c7e2c63a229a.jpg', 'Penguins.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id_good` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `foto` varchar(250) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view` int(4) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `short_description` text NOT NULL,
  `ID_UUID` varchar(250) NOT NULL DEFAULT 'SELECT UUID()'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id_good`, `name`, `price`, `id_category`, `status`, `foto`, `date`, `view`, `description`, `short_description`, `ID_UUID`) VALUES
(3, 'Good 3', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 20, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(4, 'Good 4', 100500, 8, 2, 'images/Livello26.png', '2017-10-10 18:57:45', 49, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n- 6.1 oz. 100% preshrunk heavyweight cotton\r\n- Shoulder-to-shoulder taping\r\n- Double-needle sleeves and bottom hem \r\n\r\nIt uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be192f-c337-11e7-84ca-00ffc5973b66'),
(5, 'Good 5', 2001, 8, 4, 'images/Livello27.png', '2017-11-02 18:57:45', 56, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1a5e-c337-11e7-84ca-00ffc5973b67'),
(6, 'Good 6', 1020, 9, 2, 'images/Livello28.png', '2017-11-01 18:57:45', 42, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1b8d-c337-11e7-84ca-00ffc5973b68'),
(7, 'Good 7', 1, 12, 2, 'images/shop.png', '2017-11-02 18:57:45', 28, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1cbc-c337-11e7-84ca-00ffc5973b69'),
(8, 'Good 8', 800, 12, 1, 'images/shop.png', '2017-11-02 18:57:45', 359, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1deb-c337-11e7-84ca-00ffc5973b61'),
(9, 'Good 9', 480, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(10, 'Good 10', 100500, 8, 2, 'images/Livello26.png', '2017-10-10 18:57:45', 49, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n- 6.1 oz. 100% preshrunk heavyweight cotton\r\n- Shoulder-to-shoulder taping\r\n- Double-needle sleeves and bottom hem \r\n\r\nIt uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be192f-c337-11e7-84ca-00ffc5973b66'),
(11, 'Good 11', 2001, 8, 4, 'images/Livello27.png', '2017-11-02 18:57:45', 55, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1a5e-c337-11e7-84ca-00ffc5973b67'),
(12, 'Good 12', 1020, 9, 2, 'images/Livello28.png', '2017-11-01 18:57:45', 41, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1b8d-c337-11e7-84ca-00ffc5973b68'),
(13, 'Good 13', 1, 12, 2, 'images/shop.png', '2017-11-02 18:57:45', 28, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1cbc-c337-11e7-84ca-00ffc5973b69'),
(14, 'Good 14', 800, 12, 1, 'images/shop.png', '2017-11-02 18:57:45', 359, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1deb-c337-11e7-84ca-00ffc5973b61'),
(15, 'Good 15', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 17, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(16, 'Good 16', 100500, 8, 2, 'images/Livello26.png', '2017-10-10 18:57:45', 49, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n- 6.1 oz. 100% preshrunk heavyweight cotton\r\n- Shoulder-to-shoulder taping\r\n- Double-needle sleeves and bottom hem \r\n\r\nIt uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be192f-c337-11e7-84ca-00ffc5973b66'),
(17, 'Good 17', 2001, 8, 4, 'images/Livello27.png', '2017-11-02 18:57:45', 55, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1a5e-c337-11e7-84ca-00ffc5973b67'),
(18, 'Good 18', 1020, 9, 2, 'images/Livello28.png', '2017-11-01 18:57:45', 41, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1b8d-c337-11e7-84ca-00ffc5973b68'),
(19, 'Good 19', 1, 12, 2, 'images/shop.png', '2017-11-02 18:57:45', 28, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1cbc-c337-11e7-84ca-00ffc5973b69'),
(20, 'Good 20', 800, 12, 1, 'images/shop.png', '2017-11-02 18:57:45', 359, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1deb-c337-11e7-84ca-00ffc5973b61'),
(21, 'Good 21', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(22, 'Good 22', 100500, 8, 2, 'images/Livello26.png', '2017-10-10 18:57:45', 49, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n- 6.1 oz. 100% preshrunk heavyweight cotton\r\n- Shoulder-to-shoulder taping\r\n- Double-needle sleeves and bottom hem \r\n\r\nIt uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be192f-c337-11e7-84ca-00ffc5973b66'),
(23, 'Good 23', 2001, 8, 4, 'images/Livello27.png', '2017-11-02 18:57:45', 55, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1a5e-c337-11e7-84ca-00ffc5973b67'),
(24, 'Good 24', 1020, 9, 2, 'images/Livello28.png', '2017-11-01 18:57:45', 41, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1b8d-c337-11e7-84ca-00ffc5973b68'),
(25, 'Good 25', 1, 12, 2, 'images/shop.png', '2017-11-02 18:57:45', 28, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1cbc-c337-11e7-84ca-00ffc5973b69'),
(26, 'Good 26', 800, 12, 1, 'images/shop.png', '2017-11-02 18:57:45', 359, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1deb-c337-11e7-84ca-00ffc5973b61'),
(27, 'Good 301', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 20, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(28, 'Good 901', 480, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(29, 'Good 1501', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 17, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(30, 'Good 2101', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(31, 'Good 322', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 20, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(32, 'Good 922', 480, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(33, 'Good 1522', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 17, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(34, 'Good 2122', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(35, 'Good 30122', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 20, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65');
INSERT INTO `goods` (`id_good`, `name`, `price`, `id_category`, `status`, `foto`, `date`, `view`, `description`, `short_description`, `ID_UUID`) VALUES
(36, 'Good 90122', 480, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(37, 'Good 150122', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 17, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(38, 'Good 210122', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 16, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `paarent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `paarent_id`) VALUES
(1, 'Главная страница', '', 0),
(2, 'О Магазине', 'info', 1),
(3, 'Каталог', 'catalog', 1),
(4, 'Статьи', 'article', 1),
(5, 'Контакты', 'contact', 1),
(6, 'Товары для серфинга', 'serf', 3),
(8, 'Товары для дайвинга', 'diving', 3),
(10, 'Гидрокостюмы', 'gidro', 6),
(11, 'Доски', 'doska_serf', 6),
(12, 'Аксессуары', 'acsessuar', 6),
(13, 'Кайтсерфы', 'kitesurfers', 6),
(14, 'Чехлы', 'case', 6),
(15, 'Маски', 'mask', 8),
(18, 'BCD куртки', 'seacsub-ego', 8),
(19, 'Компьтеры', 'cressi_giotto', 8),
(20, 'Подводные аппараты', 'seadoo-aquaranger', 8),
(21, 'Фотогаллерея', 'galery', 1),
(22, 'Фотогаллерея AJAX', 'galery_ajax', 21),
(23, 'Фотогаллерея классическая', 'galery', 21);

-- --------------------------------------------------------

--
-- Структура таблицы `users_auth`
--

DROP TABLE IF EXISTS `users_auth`;
CREATE TABLE `users_auth` (
  `id_user` int(11) NOT NULL,
  `id_user_session` int(11) NOT NULL,
  `hash_cookie` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `prim` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_auth`
--

INSERT INTO `users_auth` (`id_user`, `id_user_session`, `hash_cookie`, `date`, `prim`) VALUES
(1, 20, 'bd932d35942548d5ac9a19f9df4fbc033e9dba6973cdbf5af410d7ccaa1c6d8d', '2018-03-22', '1521657863.50213625013555052883787'),
(1, 21, '1f995313428b3b55ecf3e69c84dfc586a6d6ae29d4f2d950a7d7061653b04c85', '2018-03-22', '1521657966.6272444080857779958640'),
(1, 25, '56f0f674ad25291eb1d9b4db65610c22c6f769a59854d866632470fd51e2e3aa', '2018-03-22', '1521658301.95525441286885438521625'),
(1, 26, '29766f0ac9684060fe9c9eed6a47084c55bb1e9a2b0e70c6243eae1bdac8f778', '2018-03-22', '1521658431.29164764745321112419551'),
(1, 27, '624a46b94e4a6c5596f50c446a8520a63f24f33d849e6a2542568fe6fa8bfddc', '2018-03-22', '1521658638.8525320181944471964885'),
(1, 29, '73fa5522190be6ac096ae92e556e2b4db941516cab8d4d29f6c510906d65c341', '2018-03-22', '1521658896.35622634223907045169385'),
(1, 30, '2c446d137444ef081cb364b995b4a49abb909c8c16bf9438634350df4dc32560', '2018-03-22', '1521659065.2288937857253225985987'),
(1, 31, '90e6da51da3364280a913de126614afc40d031cc4f16a57fde966a0108524cb0', '2018-03-22', '1521659387.79937047838755224565102'),
(1, 33, 'fcdc8fd2057ef3b31a6d3fc5708dde844696e754b26d348ea1d5db958ce01329', '2018-03-22', '1521659670.93857579240906422995501'),
(1, 35, '91b17686841f78a502d4a38056b7e2f58a2e5b0ac421d5d6fc2ffb09c71a96c7', '2018-03-22', '1521659741.51358153613484869182487'),
(1, 36, 'f6760dd65d29581d81606bc916fd56e68eb4459dce17c01094977f9f5e8b8b97', '2018-03-22', '1521659753.10824048403850800726116');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `id_pages` (`id_pages`);

--
-- Индексы таблицы `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id_galery`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id_good`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_auth`
--
ALTER TABLE `users_auth`
  ADD PRIMARY KEY (`id_user_session`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `galery`
--
ALTER TABLE `galery`
  MODIFY `id_galery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id_good` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `users_auth`
--
ALTER TABLE `users_auth`
  MODIFY `id_user_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_pages`) REFERENCES `pages` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_auth`
--
ALTER TABLE `users_auth`
  ADD CONSTRAINT `users_auth_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
