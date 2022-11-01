-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.60.86
-- Время создания: Ноя 01 2022 г., 10:35
-- Версия сервера: 5.7.37-40
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `f0256723_uyjoy`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment`
--

CREATE TABLE `ore_gj_apartment` (
  `id` int(11) UNSIGNED NOT NULL,
  `parse_from` varchar(20) NOT NULL DEFAULT '' COMMENT 'С какого сайта спарсено',
  `parse_internal_id` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Внутренний ID с сайта-донора',
  `parse_internal_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Ссылка на объект на сайте-доноре',
  `parse_owner_info_name` varchar(100) NOT NULL DEFAULT '',
  `parse_owner_info_phone` varchar(20) NOT NULL DEFAULT '',
  `parse_owner_info_user_type` varchar(40) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `obj_type_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `loc_country` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `loc_region` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `loc_city` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `visits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_manual_updated` timestamp NULL DEFAULT NULL,
  `date_end_activity` timestamp NULL DEFAULT NULL,
  `activity_always` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_price_poa` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `price` bigint(11) UNSIGNED NOT NULL DEFAULT '0',
  `price_to` bigint(11) UNSIGNED NOT NULL DEFAULT '0',
  `num_of_rooms` tinyint(4) NOT NULL DEFAULT '0',
  `floor` tinyint(4) NOT NULL DEFAULT '0',
  `floor_total` tinyint(4) NOT NULL DEFAULT '0',
  `square` float NOT NULL DEFAULT '0',
  `land_square` float NOT NULL DEFAULT '0',
  `window_to` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title_ru` text,
  `description_ru` text,
  `description_near_ru` text,
  `address_ru` varchar(255) NOT NULL DEFAULT '',
  `berths` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `lat` varchar(25) NOT NULL DEFAULT '0',
  `lng` varchar(25) NOT NULL DEFAULT '0',
  `rating` tinyint(4) NOT NULL DEFAULT '0',
  `date_up_search` timestamp NULL DEFAULT NULL,
  `is_special_offer` tinyint(4) NOT NULL DEFAULT '0',
  `is_free_to` timestamp NULL DEFAULT NULL,
  `price_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '5',
  `sorter` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `owner_active` tinyint(4) NOT NULL DEFAULT '0',
  `owner_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `exchange_to_ru` text,
  `note` text,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `autoVKPostId` varchar(50) NOT NULL DEFAULT '',
  `autoFBPostId` varchar(50) NOT NULL DEFAULT '',
  `autoTwitterPostId` varchar(50) NOT NULL DEFAULT '',
  `count_img` tinyint(3) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `open_plan` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `room_type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `balcony_type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `wc_type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `floor_coat` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `garage_type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `build_year` varchar(50) NOT NULL DEFAULT '',
  `repair` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `object_state` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `building_type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `plot_type` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment`
--

INSERT INTO `ore_gj_apartment` (`id`, `parse_from`, `parse_internal_id`, `parse_internal_url`, `parse_owner_info_name`, `parse_owner_info_phone`, `parse_owner_info_user_type`, `type`, `obj_type_id`, `loc_country`, `loc_region`, `loc_city`, `city_id`, `visits`, `date_updated`, `date_created`, `date_manual_updated`, `date_end_activity`, `activity_always`, `is_price_poa`, `price`, `price_to`, `num_of_rooms`, `floor`, `floor_total`, `square`, `land_square`, `window_to`, `title_ru`, `description_ru`, `description_near_ru`, `address_ru`, `berths`, `active`, `lat`, `lng`, `rating`, `date_up_search`, `is_special_offer`, `is_free_to`, `price_type`, `sorter`, `owner_active`, `owner_id`, `exchange_to_ru`, `note`, `phone`, `autoVKPostId`, `autoFBPostId`, `autoTwitterPostId`, `count_img`, `deleted`, `parent_id`, `open_plan`, `room_type`, `balcony_type`, `wc_type`, `floor_coat`, `garage_type`, `build_year`, `repair`, `object_state`, `building_type`, `plot_type`) VALUES
(18, '', '0', '0', '', '', '', 1, 1, 225, 5128638, 5128581, 8, 0, '2022-02-15 19:00:46', '2019-01-04 21:43:46', NULL, NULL, 1, 0, 12000, 0, 3, 4, 9, 60, 0, 2, 'квартира на ул. Авиамоторная', '<p>2 комнатная квартира на улице Авиамоторная 22/12</p>', 'В двух шагах до метро', 'Авиамоторная 22/12', '', 0, '55.748873', '37.7184591', 0, NULL, 0, NULL, 4, 3, 1, 2, '', '', '', '', '', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(20, '', '0', '0', '', '', '', 1, 2, 185, 524894, 524901, 9, 0, '2022-02-15 19:02:12', '2019-01-04 21:43:46', '2022-02-15 19:02:12', NULL, 1, 0, 7500, 0, 5, 2, 2, 170, 0, 2, 'Челобитьевское шоссе', '<p>Дом на Челобитьевском шоссе</p>\n', 'ТЦ \"Ашан\"', 'Челобитьевское шоссе', '2', 0, '55.9162225', '37.5509652', 0, NULL, 0, NULL, 3, 5, 1, 2, '', '', '', '', '', '', 3, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(21, '', '0', '0', '', '', '', 1, 1, 185, 524894, 524901, 9, 0, '2022-02-15 19:02:03', '2019-01-04 21:43:46', '2022-02-15 19:02:03', NULL, 1, 0, 1200, 0, 1, 2, 10, 40, 0, 1, 'Однокомнатная квартира Псковская улица', '<p>Однокомнатная квартира на улице Псковская</p>\n', '', 'улица Псковская, 10К1', '1', 0, '55.9034239', '37.5502048', 0, NULL, 0, NULL, 3, 6, 1, 2, '', '', '', '', '', '', 3, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(22, '', '0', '0', '', '', '', 1, 2, 185, 524894, 524901, 13, 102, '2022-10-27 21:56:36', '2019-01-04 21:43:46', '2022-02-15 18:56:18', NULL, 1, 0, 15000, 0, 8, 2, 2, 330, 0, 2, 'дом на Рублёвском шоссе', '<p>Сдаётся дом на Рублёвском шоссе, рядом с метро Крылатское</p>\n', 'метро', 'на Рублёвском шоссе', '4', 1, '55.7469425', '37.4174575', 0, NULL, 0, NULL, 3, 7, 1, 2, '', '', '', '', '', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(23, '', '0', '0', '', '', '', 1, 2, 185, 524894, 524901, 12, 93, '2022-10-23 20:30:40', '2019-01-04 21:43:46', '2022-02-15 18:55:56', NULL, 1, 0, 5400, 0, 4, 1, 2, 350, 0, 2, 'дача в пос. Столбовая', '<p>дача в пос. Столбовая Чеховского района</p>\n', '', '', '2', 1, '55.248646837009005', '37.49985183773765', 0, NULL, 0, NULL, 3, 8, 1, 1, '', '', '', '', '', '', 3, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(24, '', '0', '0', '', '', '', 1, 2, 185, 524894, 524901, 9, 125, '2022-10-26 06:28:00', '2019-01-04 21:43:46', '2022-02-15 19:01:51', NULL, 1, 0, 45000, 0, 4, 0, 2, 150, 0, 2, 'Дача посуточно в Бадеево', '<p>Дача посуточно в Бадеево</p>\n', '', 'Россия, Московская область, Чеховский район, Бадеево', '', 1, '41.311093287782', '69.28542328311', 0, NULL, 0, NULL, 5, 9, 1, 1, '', '', '', '', '', '', 2, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(25, '', '0', '0', '', '', '', 1, 1, 185, 524894, 524901, 11, 131, '2022-10-23 14:25:23', '2019-01-04 21:43:46', '2022-02-15 18:52:12', NULL, 1, 0, 1500, 0, 1, 12, 24, 40, 0, 1, 'Однокомнатная квартира на Новом Арбате', '<p>Уютная однокомнатная квартира в центре Москвы. Насладитесь прекрасным видом из окон высотки на улицы столицы нашей страны</p>\n', '5 минут до метро Смоленская', 'Ул. Новый Арбат, д. 26', '', 1, '55.7530745', '37.5858817', 0, NULL, 0, NULL, 2, 10, 1, 2, '', '', '', '', '', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(26, '', '0', '0', '', '', '', 1, 1, 185, 524894, 524901, 10, 126, '2022-10-26 06:54:34', '2019-01-04 21:43:46', '2022-02-15 18:51:50', NULL, 1, 0, 36000, 0, 1, 7, 14, 35, 0, 1, 'Квартира, ул. Большая Полянка, д. 28', '<p>Комната с приятными оттенками синего и красивая ванная комната помогут Вам расслабиться после трудового дня</p>\n', 'Метро \"Полянка\" в пятиминутной доступности', 'ул. Большая Полянка, д. 28', '1', 1, '55.735955', '37.6186773', 0, NULL, 0, NULL, 5, 11, 1, 1, '', '', '', '', '', '', 3, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(27, '', '0', '0', '', '', '', 1, 1, 185, 524894, 524901, 9, 117, '2022-10-28 07:46:32', '2019-01-04 21:43:46', '2022-02-15 18:49:38', NULL, 1, 0, 1200, 0, 2, 6, 14, 58, 0, 1, '2 комн. кв. рядом с м. Проспект Мира', '<p>Эта квартира вдохновит Вас на новые достижения. Здесь есть отдельная гостиная, в которой можно с комфортом встречать коллег или отдыхать с друзьями</p>\n', 'метро Проспект Мира в 3 минутной доступности', 'Ул. Гиляровского, д. 20', '2+1', 1, '55.7789065', '37.6310073', 0, NULL, 0, NULL, 2, 12, 1, 2, '', '', '', '', '', '', 7, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(28, '', '0', '0', '', '', '', 1, 1, 185, 524894, 524901, 9, 162, '2022-10-22 02:32:14', '2019-01-04 21:43:46', '2022-02-15 18:49:15', NULL, 1, 0, 750, 0, 1, 9, 14, 36, 0, 2, '1 комн. кв. метро Арбатская, Большой Афанасьевский переулок 10', '<p>В 7 минутной доступности от метро Арбатская</p>\n', 'метро', 'Большой Афанасьевский переулок 10', '1+1', 1, '55.7506831', '37.5968604', 0, NULL, 0, NULL, 2, 13, 1, 2, '', '', '', '', '', '', 5, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(29, '', '0', '0', '', '', '', 2, 1, 185, 524894, 524901, 9, 160, '2022-10-27 00:57:49', '2019-01-04 21:43:46', '2022-02-15 18:48:56', NULL, 1, 0, 5550000, 0, 3, 11, 12, 80, 0, 1, '3 комн. кв. в минутной доступности до м.Павелецкая', '<p>В этой просторной и комфортабельной квартире Вы сможете насладиться видом на столицу нашей Родины и после удачного дня расслабиться в большой ванне</p>\n', '', 'Ул. Зацепа, д. 22', '2+2+1', 1, '55.7300745', '37.6336848', 0, NULL, 0, NULL, 1, 16, 1, 2, '', '', '', '', '', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(30, '', '0', '0', '', '', '', 1, 6, 225, 5332921, 5368361, 9, 126, '2022-10-28 09:40:38', '2019-01-04 21:43:46', '2022-02-15 18:48:13', NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunset Hotel', '<p>Отель Sunset Los Angeles расположен в самом сердце Западного Голливуда. Этот отель находится в глухом переулке, усаженном деревьями, всего в нескольких шагах от известного бульвара Сансет-Стрип в Западном Голливуде. К услугам гостей 2 открытых бассейна и ресторан.</p>\n\n<p>В числе удобств номеров обеденная зона и телевизор с плоским экраном. В некоторых номерах есть полностью оборудованная кухня, из некоторых номеров открывается вид.</p>\n\n<p>На территории работает бар. К услугам гостей фитнес-центр и спа-центр. В числе удобств сад и круглосуточная стойка регистрации.</p>\n', '', 'North Alta Loma Road', '', 1, '34.0935396', '-118.381941', 0, NULL, 0, NULL, 2, 18, 1, 1, NULL, '', '', '', '', '', 2, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(31, '', '0', '0', '', '', '', 1, 7, 225, 5332921, 5368361, 0, 47, '2022-10-28 01:00:37', '2019-01-04 21:43:46', '2019-01-04 22:43:46', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'люкс', '', '', '', '', 1, '34.0935396', '-118.381941', 0, NULL, 0, NULL, 5, 14, 1, 1, NULL, '', '', '', '', '', 1, 0, 30, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(32, '', '0', '0', '', '', '', 1, 7, 225, 5332921, 5368361, 0, 73, '2022-10-27 17:08:59', '2019-01-04 21:43:46', '2019-01-04 22:43:46', NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'полулюкс', '', '', '', '', 1, '34.0935396', '-118.381941', 0, NULL, 0, NULL, 5, 15, 1, 1, NULL, '', '', '', '', '', 1, 0, 30, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(33, '', '0', '0', '', '', '', 2, 5, 185, 529352, 466806, 9, 111, '2022-10-24 17:43:58', '2019-01-04 21:43:46', '2022-02-15 18:51:15', NULL, 1, 1, 0, 0, 0, 0, 10, 0, 0, 0, 'Жилой комплекс мкр. Спортивный ', '<p>Микрорайон «Спортивный» представляет собой современную комплексную застройку, в рамках которой осуществляется возведение разносекционных кирпичных зданий переменной этажности.</p>\n\n<p>Застройщиком спроектированы одно-, двух- и трехкомнатные квартиры. Отделочные работы не осуществляются.</p>\n\n<p>Благоустройство прилегающей территории включает в себя организацию детских и спортивных площадок, зоны отдыха и озеленение. Предусмотрены открытые гостевые автомобильные стоянки. Первые этажи зданий отведены под размещение помещений общественного назначения, магазинов и офисов. В шаговой доступности расположены детские сады, школы, медицинские учреждения, магазины.</p>\n', '', 'Спортивный мкр', '', 1, '56.637722', '47.919306', 0, NULL, 0, NULL, 1, 17, 1, 1, NULL, '', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(34, '', '0', '0', '', '', '', 2, 1, 185, 529352, 466806, 0, 79, '2022-10-25 00:13:16', '2019-01-04 21:43:46', '2022-02-15 18:51:06', NULL, 1, 0, 1323660, 0, 2, 2, 10, 66.2, 0, 1, '2-комнатная', '', '', '', '', 1, '56.637722', '47.919306', 0, NULL, 0, NULL, 1, 1, 1, 1, NULL, '', '', '', '', '', 1, 0, 33, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(35, '', '0', '0', '', '', '', 2, 1, 185, 529352, 466806, 0, 73, '2022-10-25 20:36:31', '2019-01-04 21:43:46', '2019-01-04 22:43:46', NULL, 1, 0, 1903080, 0, 3, 7, 10, 95, 0, 2, '3-комнатная', '', '', '', '', 1, '56.637722', '47.919306', 0, NULL, 0, NULL, 1, 2, 1, 1, NULL, '', '', '', '', '', 1, 0, 33, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(46, '', '0', '0', '', '', '', 1, 3, 0, 0, 0, 9, 85, '2022-10-25 14:39:22', '2022-03-09 14:13:22', '2022-03-09 14:18:02', NULL, 1, 1, 0, 0, 0, 1, 9, 130, 0, 0, 'Аренда нежилого помещение в Центре Города!', '<p>ЦЕНТР! Аренда нежилого помещение</p>\n\n<p>Адрес: Юнусабад, по ул. Богишамол, ор: мечеть Бадамзар</p>\n\n<p>Общая площадь: 130м²</p>\n\n<p>ВДОЛЬ ДОРОГИ!</p>\n\n<p>3-4 парковочных мест!</p>\n\n<p>Цена: 1600 у.е. </p>\n\n<p>Тел: +998 99-131-00-01, +998 97-717-72-28</p>\n', 'Бадамзар мечеть', 'Юнусабад, по ул. Богишамол, ор: мечеть Бадамзар', '', 1, '0', '0', 0, NULL, 0, NULL, 5, 21, 1, 6, NULL, '', '+998 99-131-00-01', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(47, '', '0', '0', '', '', '', 2, 1, 0, 0, 0, 9, 94, '2022-06-09 01:08:17', '2022-03-09 15:24:45', NULL, '2022-06-08 21:00:00', 0, 1, 0, 0, 3, 4, 0, 100, 0, 2, 'Новостройка. Ц5 Пожарка 3х4х9 100м2  Закрытый двор. Ремонт. Мебель, техника.  Ориентир Ширин, посольство Германии, Пожарка,', '<p>#3комнатная</p>\n\n<p>Новостройка.<br />\nЦ5 Пожарка<br />\n3х4х9 100м2</p>\n\n<p>Закрытый двор. Ремонт. Мебель, техника.</p>\n\n<p>Ориентир Ширин, посольство Германии, Пожарка, Ц5, Ц6</p>\n', 'Кафе Ширин, посольство Германии, Пожарка, Ц5, Ц6\r\n', 'Шара Рашидова Ц5', '2', 0, '41.377061', '69.285306', 0, NULL, 0, NULL, 1, 22, 0, 7, NULL, NULL, '+998909071800', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0),
(49, '', '0', '0', '', '', '', 5, 4, 0, 0, 0, 14, 131, '2022-10-27 08:08:25', '2022-04-13 07:12:39', '2022-04-28 21:08:10', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 20, 0, 'Земельный участок', '<p>20 сотку Полный комплектующие ферму поменяю в городе трёх комнатную квартиру</p>\n', '', 'Yuqori chirchiq ', '', 1, '41.187387', '69.498081', 0, NULL, 0, NULL, 8, 23, 1, 8, '', '', '+998900222020', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_city`
--

CREATE TABLE `ore_gj_apartment_city` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_ru` varchar(100) NOT NULL DEFAULT '',
  `sorter` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_city`
--

INSERT INTO `ore_gj_apartment_city` (`id`, `name_ru`, `sorter`, `active`, `date_updated`) VALUES
(7, 'Москва', 1, 0, '2022-02-19 22:05:52'),
(8, 'Нью-Йорк', 2, 0, '2022-02-19 22:05:45'),
(9, 'Ташкент', 3, 1, '2022-02-15 18:23:53'),
(10, 'Самарканд', 4, 1, '2022-02-15 18:51:49'),
(11, 'Ургенч', 5, 1, '2022-02-15 18:52:12'),
(12, 'Фергана', 6, 1, '2022-02-15 18:55:56'),
(13, 'Наманган', 7, 1, '2022-02-15 18:56:18'),
(14, 'Ташкентская область', 8, 1, '2022-04-13 14:52:28');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_complain`
--

CREATE TABLE `ore_gj_apartment_complain` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_ip` varchar(60) NOT NULL DEFAULT '',
  `user_ip_ip2_long` varchar(60) NOT NULL DEFAULT '',
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `complain_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `session_id` char(32) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `body` text,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_complain_reason`
--

CREATE TABLE `ore_gj_apartment_complain_reason` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `sorter` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_complain_reason`
--

INSERT INTO `ore_gj_apartment_complain_reason` (`id`, `name_ru`, `sorter`, `active`, `date_updated`) VALUES
(1, 'Спам, повторяющееся объявление или реклама', 1, 0, '2020-03-16 05:33:53'),
(2, 'Описание или цена не соответствуют действительности', 2, 0, '2020-03-16 05:33:55'),
(3, 'Компания, маскирующаяся под частное лицо', 3, 0, '2020-03-16 05:33:56'),
(4, 'Другое', 4, 0, '2020-03-16 05:33:57');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_document`
--

CREATE TABLE `ore_gj_apartment_document` (
  `id` int(11) UNSIGNED NOT NULL,
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `original_name` varchar(255) NOT NULL DEFAULT '',
  `modified_name` varchar(255) NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_obj_type`
--

CREATE TABLE `ore_gj_apartment_obj_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `icon_file` varchar(255) NOT NULL DEFAULT '',
  `sorter` smallint(6) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ya_type` tinyint(1) NOT NULL DEFAULT '0',
  `ya_subtype` varchar(255) NOT NULL DEFAULT '',
  `with_obj` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_grid` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_obj_type`
--

INSERT INTO `ore_gj_apartment_obj_type` (`id`, `name_ru`, `icon_file`, `sorter`, `date_updated`, `parent_id`, `ya_type`, `ya_subtype`, `with_obj`, `show_in_search`, `show_in_grid`) VALUES
(1, 'квартира', 'apartment.png', 1, '2020-03-16 05:49:23', 5, 1, 'квартира,flat', 0, 1, 1),
(2, 'дом', 'house.png', 3, '2020-03-16 05:33:37', 0, 1, 'дом,house,дом с участком,house with lot', 0, 1, 1),
(3, 'офис', 'commercial.png', 2, '2020-03-16 05:49:58', 0, 2, 'office', 0, 1, 1),
(4, 'земельный участок', '', 4, '2020-03-16 05:49:48', 0, 1, 'участок,lot', 0, 1, 1),
(5, 'новостройка', '', 5, '2020-03-16 05:49:39', 0, 0, '', 1, 1, 1),
(6, 'гостиница', '', 6, '2020-03-16 05:33:48', 0, 2, 'hotel', 1, 1, 1),
(7, 'номер гостиницы', '', 7, '2020-03-16 05:50:09', 6, 0, '', 0, 0, 0),
(8, 'гараж', '', 8, '2020-03-16 05:33:51', 0, 1, 'гараж,garage', 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_panorama`
--

CREATE TABLE `ore_gj_apartment_panorama` (
  `id` int(11) UNSIGNED NOT NULL,
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `width` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `height` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_reference`
--

CREATE TABLE `ore_gj_apartment_reference` (
  `reference_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `reference_value_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_reference`
--

INSERT INTO `ore_gj_apartment_reference` (`reference_id`, `reference_value_id`, `apartment_id`) VALUES
(2, 10, 18),
(2, 11, 18),
(2, 12, 18),
(2, 14, 18),
(2, 15, 18),
(5, 32, 18),
(1, 1, 18),
(1, 2, 18),
(1, 3, 18),
(1, 4, 18),
(1, 6, 18),
(1, 7, 18),
(3, 21, 18),
(3, 22, 18),
(3, 24, 18),
(3, 26, 18),
(3, 27, 18),
(4, 29, 18),
(4, 30, 18),
(4, 31, 18),
(7, 36, 18),
(7, 39, 18),
(5, 32, 29),
(5, 33, 29),
(5, 34, 29),
(1, 2, 29),
(1, 4, 29),
(1, 5, 29),
(1, 35, 29),
(3, 25, 29),
(3, 26, 29),
(3, 27, 29),
(2, 11, 29),
(2, 12, 29),
(2, 13, 29),
(5, 32, 28),
(5, 34, 28),
(1, 1, 28),
(1, 2, 28),
(1, 3, 28),
(1, 4, 28),
(1, 6, 28),
(1, 7, 28),
(3, 18, 28),
(3, 19, 28),
(3, 20, 28),
(3, 21, 28),
(3, 24, 28),
(3, 25, 28),
(3, 26, 28),
(3, 27, 28),
(2, 11, 28),
(2, 12, 28),
(2, 13, 28),
(2, 14, 28),
(4, 29, 28),
(4, 30, 28),
(4, 31, 28),
(7, 36, 28),
(7, 37, 28),
(7, 38, 28),
(7, 39, 28),
(5, 32, 27),
(5, 33, 27),
(5, 34, 27),
(1, 1, 27),
(1, 2, 27),
(1, 3, 27),
(1, 4, 27),
(1, 5, 27),
(1, 6, 27),
(1, 7, 27),
(1, 35, 27),
(3, 19, 27),
(3, 20, 27),
(3, 21, 27),
(3, 22, 27),
(3, 23, 27),
(3, 24, 27),
(3, 25, 27),
(3, 26, 27),
(3, 27, 27),
(2, 11, 27),
(2, 12, 27),
(2, 13, 27),
(2, 14, 27),
(2, 15, 27),
(2, 16, 27),
(2, 17, 27),
(4, 29, 27),
(4, 30, 27),
(4, 31, 27),
(7, 37, 27),
(7, 38, 27),
(7, 39, 27),
(10, 43, 27),
(10, 44, 27),
(10, 45, 27),
(9, 40, 27),
(9, 41, 27),
(9, 42, 27),
(5, 32, 26),
(5, 33, 26),
(5, 34, 26),
(1, 1, 26),
(1, 2, 26),
(1, 3, 26),
(1, 4, 26),
(1, 5, 26),
(1, 6, 26),
(1, 7, 26),
(1, 35, 26),
(3, 19, 26),
(3, 20, 26),
(3, 21, 26),
(3, 22, 26),
(3, 23, 26),
(3, 24, 26),
(3, 25, 26),
(3, 26, 26),
(3, 27, 26),
(2, 11, 26),
(2, 12, 26),
(2, 13, 26),
(2, 14, 26),
(2, 15, 26),
(2, 16, 26),
(2, 17, 26),
(4, 28, 26),
(4, 29, 26),
(4, 30, 26),
(4, 31, 26),
(7, 36, 26),
(7, 37, 26),
(7, 38, 26),
(7, 39, 26),
(10, 43, 26),
(10, 44, 26),
(10, 45, 26),
(9, 40, 26),
(9, 41, 26),
(9, 42, 26),
(5, 34, 25),
(1, 2, 25),
(1, 4, 25),
(1, 35, 25),
(3, 25, 25),
(3, 26, 25),
(3, 27, 25),
(2, 11, 25),
(2, 12, 25),
(10, 45, 25),
(5, 32, 23),
(5, 33, 23),
(1, 1, 23),
(1, 2, 23),
(1, 3, 23),
(1, 4, 23),
(1, 5, 23),
(1, 6, 23),
(1, 7, 23),
(3, 19, 23),
(3, 20, 23),
(3, 21, 23),
(3, 23, 23),
(3, 24, 23),
(3, 25, 23),
(3, 26, 23),
(3, 27, 23),
(2, 11, 23),
(2, 12, 23),
(2, 13, 23),
(4, 29, 23),
(7, 37, 23),
(7, 38, 23),
(7, 39, 23),
(5, 32, 22),
(5, 33, 22),
(5, 34, 22),
(1, 2, 22),
(1, 4, 22),
(1, 5, 22),
(1, 35, 22),
(3, 25, 22),
(3, 26, 22),
(3, 27, 22),
(2, 11, 22),
(2, 12, 22),
(2, 13, 22),
(5, 33, 24),
(1, 2, 24),
(1, 3, 24),
(1, 4, 24),
(1, 6, 24),
(1, 7, 24),
(3, 20, 24),
(3, 23, 24),
(3, 24, 24),
(3, 25, 24),
(3, 26, 24),
(3, 27, 24),
(2, 12, 24),
(2, 13, 24),
(2, 14, 24),
(2, 16, 24),
(2, 17, 24),
(4, 29, 24),
(4, 30, 24),
(4, 31, 24),
(7, 37, 24),
(7, 38, 24),
(7, 39, 24),
(1, 6, 21),
(1, 7, 21),
(3, 24, 21),
(3, 26, 21),
(3, 27, 21),
(2, 12, 21),
(2, 14, 21),
(4, 29, 21),
(7, 36, 21),
(7, 39, 21),
(5, 32, 20),
(5, 33, 20),
(5, 34, 20),
(1, 2, 20),
(1, 3, 20),
(1, 4, 20),
(1, 5, 20),
(1, 6, 20),
(1, 7, 20),
(1, 35, 20),
(3, 19, 20),
(3, 20, 20),
(3, 24, 20),
(3, 25, 20),
(3, 26, 20),
(3, 27, 20),
(2, 11, 20),
(2, 12, 20),
(2, 13, 20),
(2, 14, 20),
(4, 29, 20),
(4, 30, 20),
(7, 36, 20),
(7, 39, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_reference_categories`
--

CREATE TABLE `ore_gj_apartment_reference_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `sorter` smallint(6) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `style` enum('column1','column2','column3') NOT NULL DEFAULT 'column1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_reference_categories`
--

INSERT INTO `ore_gj_apartment_reference_categories` (`id`, `type`, `title_ru`, `sorter`, `date_updated`, `style`) VALUES
(1, 1, 'Комфорт', 2, '2019-03-16 05:14:59', 'column3'),
(2, 1, 'Ванная', 4, '2019-03-16 05:15:00', 'column3'),
(3, 1, 'Кухня', 3, '2019-03-16 05:15:00', 'column3'),
(4, 1, 'Работа', 5, '2019-03-16 05:15:00', 'column3'),
(5, 1, 'Безопасность', 1, '2019-03-16 05:15:00', 'column3'),
(7, 1, 'Развлечения', 6, '2019-03-16 05:15:00', 'column3'),
(9, 1, 'Условия', 8, '2019-03-16 05:15:00', 'column1'),
(10, 1, 'Услуги', 7, '2019-03-16 05:15:01', 'column1'),
(11, 2, 'Свободная планировка', 9, '2019-03-16 05:15:01', 'column1'),
(12, 2, 'Тип комнат', 10, '2019-03-16 05:15:01', 'column1'),
(13, 2, 'Тип балкона', 11, '2019-03-16 05:15:01', 'column1'),
(14, 2, 'Тип санузла', 12, '2019-03-16 05:15:01', 'column1'),
(15, 2, 'Покрытие пола', 13, '2019-03-16 05:15:02', 'column1'),
(16, 2, 'Тип гаража', 14, '2019-03-16 05:15:02', 'column1'),
(17, 2, 'Ремонт', 15, '2019-03-16 05:15:02', 'column1'),
(18, 2, 'Состояние объекта', 16, '2019-03-16 05:15:02', 'column1'),
(19, 2, 'Тип здания', 17, '2019-03-16 05:15:03', 'column1'),
(20, 2, 'Тип участка', 18, '2019-03-16 05:15:03', 'column1'),
(21, 2, 'Коммуникации', 19, '2019-03-16 05:15:03', 'column1');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_reference_values`
--

CREATE TABLE `ore_gj_apartment_reference_values` (
  `id` int(11) UNSIGNED NOT NULL,
  `reference_category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `sorter` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `for_rent` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `for_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `buy` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `rent` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `exchange` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_reference_values`
--

INSERT INTO `ore_gj_apartment_reference_values` (`id`, `reference_category_id`, `title_ru`, `sorter`, `for_rent`, `for_sale`, `buy`, `rent`, `exchange`, `date_updated`) VALUES
(1, 1, 'сушилка для белья', 1, 1, 0, 0, 1, 1, '2019-03-16 05:15:03'),
(2, 1, 'пластиковые окна', 2, 1, 1, 1, 1, 1, '2019-03-16 05:15:03'),
(3, 1, 'плотные шторы для комфортного сна', 3, 1, 0, 0, 1, 1, '2019-03-16 05:15:04'),
(4, 1, 'красивый вид', 4, 1, 1, 1, 1, 1, '2019-03-16 05:15:04'),
(5, 1, 'тихая квартира', 5, 1, 1, 1, 1, 1, '2019-03-16 05:15:04'),
(6, 1, 'утюг', 6, 1, 0, 0, 1, 1, '2019-03-16 05:15:04'),
(7, 1, 'гладильная доска', 7, 1, 0, 0, 1, 1, '2019-03-16 05:15:04'),
(8, 1, 'тапочки', 8, 1, 0, 0, 1, 1, '2019-03-16 05:15:05'),
(9, 1, 'snack Pack при заезде (бутылка воды, круассаны, крекеры и пр.)', 9, 1, 0, 0, 1, 1, '2019-03-16 05:15:05'),
(11, 2, 'стиральная машина', 2, 1, 1, 1, 1, 1, '2019-03-16 05:15:05'),
(12, 2, 'ванна', 3, 1, 1, 1, 1, 1, '2019-03-16 05:15:05'),
(13, 2, 'водонагреватель', 4, 1, 1, 1, 1, 1, '2019-03-16 05:15:05'),
(14, 2, 'фен', 5, 1, 0, 0, 1, 1, '2019-03-16 05:15:06'),
(15, 2, 'мыло', 6, 1, 0, 0, 1, 1, '2019-03-16 05:15:06'),
(16, 2, 'шампунь', 7, 1, 0, 0, 1, 1, '2019-03-16 05:15:06'),
(17, 2, 'гель для душа', 8, 1, 0, 0, 1, 1, '2019-03-16 05:15:06'),
(18, 3, 'все для приготовления пищи', 1, 1, 0, 0, 1, 1, '2019-03-16 05:15:07'),
(19, 3, 'фильтр для воды', 2, 1, 0, 0, 1, 1, '2019-03-16 05:15:07'),
(20, 3, 'электрочайник', 3, 1, 0, 0, 1, 1, '2019-03-16 05:15:07'),
(21, 3, 'все для приема пищи', 4, 1, 0, 0, 1, 1, '2019-03-16 05:15:07'),
(22, 3, 'чай, кофе, сахар', 5, 1, 0, 0, 1, 1, '2019-03-16 05:15:07'),
(23, 3, 'обеденный стол на 3 персоны', 6, 1, 0, 0, 1, 1, '2019-03-16 05:15:08'),
(24, 3, 'микроволновая печь', 7, 1, 0, 0, 1, 1, '2019-03-16 05:15:08'),
(25, 3, 'вытяжка', 8, 1, 1, 1, 1, 1, '2019-03-16 05:15:08'),
(26, 3, 'плита', 9, 1, 1, 1, 1, 1, '2019-03-16 05:15:08'),
(27, 3, 'холодильник', 10, 1, 1, 1, 1, 1, '2019-03-16 05:15:08'),
(28, 4, 'междугородние и международные звонки (до $2 в день) включены в стоимость', 1, 1, 0, 0, 1, 1, '2019-03-16 05:15:09'),
(29, 4, 'телефон', 2, 1, 0, 0, 1, 1, '2019-03-16 05:15:09'),
(30, 4, 'безлимитный скоростной интернет включен в стоимость', 3, 1, 0, 0, 1, 1, '2019-03-16 05:15:09'),
(31, 4, 'рабочий стол', 4, 1, 0, 0, 1, 1, '2019-03-16 05:15:09'),
(32, 5, 'кодовый замок', 1, 1, 1, 1, 1, 1, '2019-03-16 05:15:10'),
(33, 5, 'металлическая дверь в тамбур', 2, 1, 1, 1, 1, 1, '2019-03-16 05:15:10'),
(34, 5, 'металлическая дверь в подъезд', 3, 1, 1, 1, 1, 1, '2019-03-16 05:15:10'),
(35, 1, 'домофон', 10, 1, 1, 1, 1, 1, '2019-03-16 05:15:10'),
(36, 7, 'кабельное ТВ', 1, 1, 0, 0, 1, 1, '2019-03-16 05:15:10'),
(37, 7, 'DVD-проигрыватель', 2, 1, 0, 0, 1, 1, '2019-03-16 00:59:49'),
(38, 7, 'спутниковое ТВ', 3, 1, 0, 0, 1, 1, '2019-03-16 05:15:11'),
(39, 7, 'телевизор', 4, 1, 0, 0, 1, 1, '2019-03-16 00:59:49'),
(40, 9, 'Ранний въезд (до 14:00) и поздний выезд (после 12:00) оплачиваются как 50% суточного проживания.', 1, 1, 0, 0, 1, 1, '2019-03-16 05:15:11'),
(41, 9, 'Минимальный срок проживания - двое суток.', 2, 1, 0, 0, 1, 1, '2019-03-16 05:15:11'),
(42, 9, 'НЕ допускается проживание домашних животных.', 3, 1, 0, 0, 1, 1, '2019-03-16 05:19:42'),
(43, 10, 'Уборка включена в стоимость: Каждый рабочий день в соответствии со списком работ, размещенным в квартире.', 1, 1, 0, 0, 1, 1, '2019-03-16 05:20:22'),
(44, 10, 'Смена белья и полотенец включена в стоимость: Раз в четыре дня.', 2, 1, 0, 0, 1, 1, '2019-03-16 05:20:37'),
(45, 10, 'Цены указаны в рублях РФ. Текущий курс обмена валют вы можете посмотреть на сайте ЦБ РФ.', 3, 1, 1, 1, 1, 1, '2019-03-16 05:20:53'),
(46, 1, 'кондиционер', 12, 1, 1, 1, 1, 1, '2019-03-16 05:21:13'),
(47, 7, 'интернет', 5, 1, 1, 1, 1, 1, '2019-03-16 00:59:49'),
(48, 1, 'с мебелью', 13, 1, 1, 1, 1, 1, '2019-03-16 05:21:21'),
(49, 3, 'мебель на кухне', 11, 1, 1, 1, 1, 1, '2019-03-16 05:21:31'),
(51, 3, 'встроенная техника', 12, 1, 1, 1, 1, 1, '2019-03-16 05:21:39'),
(52, 11, 'Да', 1, 1, 1, 1, 1, 1, '2019-03-16 05:21:48'),
(53, 11, 'Нет', 2, 1, 1, 1, 1, 1, '2019-03-16 05:22:03'),
(54, 12, 'Раздельные', 1, 1, 1, 1, 1, 1, '2019-03-16 05:28:45'),
(55, 12, 'Смежные', 2, 1, 1, 1, 1, 1, '2019-03-16 05:28:52'),
(56, 13, 'Балкон', 1, 1, 1, 1, 1, 1, '2019-03-16 05:28:58'),
(57, 13, 'Лоджия', 2, 1, 1, 1, 1, 1, '2019-03-16 05:29:17'),
(58, 13, '2 балкона', 3, 1, 1, 1, 1, 1, '2019-03-16 05:32:26'),
(59, 13, '2 лоджии', 4, 1, 1, 1, 1, 1, '2019-03-16 00:59:49'),
(60, 14, 'Совмещённый', 1, 1, 1, 1, 1, 1, '2019-03-16 05:32:38'),
(61, 14, 'Раздельный', 2, 1, 1, 1, 1, 1, '2019-03-16 05:32:48'),
(62, 14, '2 санузла', 3, 1, 1, 1, 1, 1, '2019-03-16 00:59:49'),
(63, 15, 'Ковролин', 1, 1, 1, 1, 0, 1, '2019-03-16 05:33:16'),
(64, 15, 'Ламинат', 2, 1, 1, 1, 0, 1, '2019-03-16 05:34:28'),
(65, 15, 'Паркет', 3, 1, 1, 1, 0, 1, '2019-03-16 05:34:34'),
(66, 15, 'Линолеум', 4, 1, 1, 1, 0, 1, '2019-03-16 05:34:40'),
(67, 16, 'Гараж', 1, 1, 1, 1, 1, 1, '2019-03-16 05:34:48'),
(68, 16, 'Машиноместо', 2, 1, 1, 1, 1, 1, '2019-03-16 05:34:18'),
(69, 16, 'Бокс', 3, 1, 1, 1, 1, 1, '2019-03-16 05:34:56'),
(70, 17, 'Дизайнерский', 1, 1, 1, 1, 1, 1, '2019-03-16 05:35:02'),
(71, 17, 'Евро', 2, 1, 1, 1, 1, 1, '2019-03-16 05:35:12'),
(72, 17, 'С отделкой', 3, 1, 1, 1, 1, 1, '2019-03-16 05:35:18'),
(73, 17, 'Требует ремонта', 4, 1, 1, 1, 1, 1, '2019-03-16 05:35:23'),
(74, 17, 'Хороший ремонт', 5, 1, 1, 1, 1, 1, '2019-03-16 05:35:31'),
(75, 17, 'Частичный ремонт', 6, 1, 1, 1, 1, 1, '2019-03-16 05:35:40'),
(76, 17, 'Черновая отделка', 7, 1, 1, 1, 1, 1, '2019-03-16 05:35:47'),
(77, 18, 'Отличное', 1, 1, 1, 1, 1, 1, '2019-03-16 05:35:55'),
(78, 18, 'Хорошее', 2, 1, 1, 1, 1, 1, '2019-03-16 05:36:02'),
(79, 18, 'Нормальное', 3, 1, 1, 1, 1, 1, '2019-03-16 00:59:49'),
(80, 18, 'Плохое', 4, 1, 1, 1, 1, 1, '2019-03-16 05:37:45'),
(81, 19, 'Блочный', 1, 1, 1, 1, 1, 1, '2019-03-16 05:37:52'),
(82, 19, 'Деревянный', 2, 1, 1, 1, 1, 1, '2019-03-16 05:37:59'),
(83, 19, 'Кирпичный', 3, 1, 1, 1, 1, 1, '2019-03-16 05:38:06'),
(84, 19, 'Монолит', 4, 1, 1, 1, 1, 1, '2019-03-16 05:38:12'),
(85, 19, 'Панельный', 5, 1, 1, 1, 1, 1, '2019-03-16 05:38:18'),
(86, 20, 'ИЖС', 1, 1, 1, 1, 1, 1, '2019-03-16 05:38:25'),
(87, 20, 'Садоводство', 2, 1, 1, 1, 1, 1, '2019-03-16 05:38:31'),
(88, 21, 'Электричество', 1, 1, 1, 1, 1, 1, '2019-03-16 05:38:39'),
(89, 21, 'Газ', 2, 1, 1, 1, 1, 1, '2019-03-16 05:38:46'),
(90, 21, 'Водопровод', 3, 1, 1, 1, 1, 1, '2019-03-16 05:38:53'),
(91, 21, 'Канализация', 4, 1, 1, 1, 1, 1, '2019-03-16 05:39:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_statistics`
--

CREATE TABLE `ore_gj_apartment_statistics` (
  `id` int(11) UNSIGNED NOT NULL,
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_statistics`
--

INSERT INTO `ore_gj_apartment_statistics` (`id`, `apartment_id`, `date_created`, `ip_address`, `browser`) VALUES
(1795, 32, '2022-10-24 12:08:18', '114.119.141.206', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1796, 27, '2022-10-24 16:29:31', '66.249.66.130', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1797, 33, '2022-10-24 17:43:58', '114.119.141.206', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1798, 27, '2022-10-24 17:49:30', '66.249.66.140', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1799, 31, '2022-10-24 19:21:13', '114.119.141.201', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1800, 34, '2022-10-24 19:32:05', '114.119.141.206', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1801, 34, '2022-10-25 00:12:07', '87.250.224.9', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)'),
(1802, 34, '2022-10-25 00:13:16', '5.45.207.95', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)'),
(1803, 46, '2022-10-25 01:50:03', '114.119.141.217', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1804, 22, '2022-10-25 03:42:49', '114.119.141.206', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1805, 27, '2022-10-25 04:22:20', '66.249.66.140', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1806, 27, '2022-10-25 04:44:13', '66.249.66.130', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1807, 46, '2022-10-25 06:48:46', '66.249.66.144', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1808, 26, '2022-10-25 10:20:23', '213.230.97.115', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
(1809, 46, '2022-10-25 14:39:22', '66.249.66.144', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1810, 49, '2022-10-25 19:16:15', '66.249.66.142', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1811, 35, '2022-10-25 20:36:31', '114.119.141.203', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1812, 32, '2022-10-25 23:57:16', '207.46.13.24', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36'),
(1813, 49, '2022-10-26 05:42:24', '66.249.66.142', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1814, 49, '2022-10-26 06:11:26', '66.249.66.140', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1815, 24, '2022-10-26 06:28:00', '114.119.141.217', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1816, 26, '2022-10-26 06:54:34', '66.249.66.144', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1817, 30, '2022-10-26 13:54:14', '114.119.129.198', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1818, 27, '2022-10-26 16:35:40', '66.249.64.6', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1819, 29, '2022-10-27 00:57:49', '114.119.141.217', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1820, 27, '2022-10-27 04:36:09', '66.249.64.4', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1821, 49, '2022-10-27 08:08:25', '84.54.90.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
(1822, 32, '2022-10-27 17:08:59', '114.119.141.201', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1823, 22, '2022-10-27 21:56:36', '114.119.129.198', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)'),
(1824, 31, '2022-10-28 01:00:37', '157.55.39.55', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),
(1825, 27, '2022-10-28 07:46:32', '66.249.66.140', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(1826, 30, '2022-10-28 09:40:38', '5.45.207.99', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_times_in`
--

CREATE TABLE `ore_gj_apartment_times_in` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `title_ru` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_times_in`
--

INSERT INTO `ore_gj_apartment_times_in` (`id`, `title_ru`) VALUES
(1, 'До полудня'),
(2, 'После полудня');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_times_out`
--

CREATE TABLE `ore_gj_apartment_times_out` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `title_ru` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_times_out`
--

INSERT INTO `ore_gj_apartment_times_out` (`id`, `title_ru`) VALUES
(1, 'До полудня'),
(2, 'После полудня');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_video`
--

CREATE TABLE `ore_gj_apartment_video` (
  `id` int(11) UNSIGNED NOT NULL,
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `video_file` varchar(255) NOT NULL DEFAULT '',
  `video_html` text,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_apartment_window_to`
--

CREATE TABLE `ore_gj_apartment_window_to` (
  `id` int(11) UNSIGNED NOT NULL,
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_apartment_window_to`
--

INSERT INTO `ore_gj_apartment_window_to` (`id`, `title_ru`, `date_updated`) VALUES
(1, 'на улицу', '2019-03-16 05:33:13'),
(2, 'во двор', '2019-03-16 05:33:16'),
(3, 'на море', '2019-03-16 05:33:17'),
(4, 'на озеро', '2019-03-16 05:33:18');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_articles`
--

CREATE TABLE `ore_gj_articles` (
  `id` int(11) UNSIGNED NOT NULL,
  `page_title_ru` varchar(255) NOT NULL DEFAULT '',
  `page_body_ru` text,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `sorter` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_articles`
--

INSERT INTO `ore_gj_articles` (`id`, `page_title_ru`, `page_body_ru`, `date_updated`, `active`, `sorter`) VALUES
(5, 'Лучшие города для холостяков', '<p>\r\n	Итак, Вы устали знакомиться на улицах и в барах своего города в попытках найти того или ту единственную, или может быть, у Вас было достаточно неудач на первых свиданиях, и поэтому Вас не заставишь выйти из дома в субботу вечером. Не отчаивайтесь. &quot;Форбс&quot; составил список лучших городов для холостяков и незамужних девушек, изучив такие факторы как &quot;потрясность&quot;, число холостяков и незамужних девушек, ночная жизнь и рост числа рабочих мест, и они полностью подходят следующим&nbsp; топ-5 городов для знакомств:</p>\r\n<p>\r\n	1.Нью-Йорк<br />\r\n	2.Бостон<br />\r\n	3.Чикаго<br />\r\n	4.Сиэтл<br />\r\n	5.Вашингтон, округ Колумбия</p>\r\n', '2020-03-16 05:37:37', 1, 1),
(6, 'Наилучшие города для семьи', '<p>\r\n	Детский журнал провел обширное исследование среди 100 городов США в поисках лучших из них для того, чтобы растить детей. Учитывались такие факторы как, детское здравоохранение, школы, плата за жилье, качество воздуха.</p>\r\n<p>\r\n	1.Денвер, штат Колорадо<br />\r\n	2.Норфолк/Вирджиния-Бич/Ньюпорт-Ньюс, штат Виргиния<br />\r\n	3.Миннеаполис/Сент-Пол, штат Миннесота<br />\r\n	4.Майами, штат Флорида<br />\r\n	5.Орландо, штат Флорида</p>\r\n', '2020-03-16 05:37:39', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_badwords`
--

CREATE TABLE `ore_gj_badwords` (
  `id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_badwords`
--

INSERT INTO `ore_gj_badwords` (`id`, `name`) VALUES
(1, 'Трус'),
(2, 'Балбес'),
(3, 'Fuck');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_block_ip`
--

CREATE TABLE `ore_gj_block_ip` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(60) NOT NULL DEFAULT '',
  `ip_long` varchar(60) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL COMMENT 'Дата создания',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_booking_table`
--

CREATE TABLE `ore_gj_booking_table` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(60) NOT NULL DEFAULT '',
  `user_ip_ip2_long` varchar(60) NOT NULL DEFAULT '',
  `active` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `time_in` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `time_out` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text,
  `comment_admin` text,
  `details` text,
  `amount` float NOT NULL DEFAULT '0',
  `num_guest` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_carousel`
--

CREATE TABLE `ore_gj_carousel` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_carousel_images`
--

CREATE TABLE `ore_gj_carousel_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `carousel_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sorter` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `text_ru` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_clients`
--

CREATE TABLE `ore_gj_clients` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `contract_number` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `second_name` varchar(255) NOT NULL DEFAULT '',
  `middle_name` varchar(255) NOT NULL DEFAULT '',
  `birthdate` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `additional_phone` varchar(255) NOT NULL DEFAULT '',
  `acts` text,
  `additional_info` text,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_comments`
--

CREATE TABLE `ore_gj_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_ip` varchar(60) NOT NULL DEFAULT '',
  `user_ip_ip2_long` varchar(60) NOT NULL DEFAULT '',
  `parent_id` int(11) UNSIGNED DEFAULT '0',
  `owner_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `model_name` varchar(64) NOT NULL DEFAULT '',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_name` varchar(64) NOT NULL DEFAULT '',
  `user_email` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `body` text,
  `rating` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_comments`
--

INSERT INTO `ore_gj_comments` (`id`, `user_ip`, `user_ip_ip2_long`, `parent_id`, `owner_id`, `model_name`, `model_id`, `user_name`, `user_email`, `status`, `body`, `rating`, `date_created`, `date_updated`) VALUES
(1, '128.68.137.94', '2151975262', 0, 0, 'Entries', 3, 'sip', 'parsing10@rambler.ru', 0, 'Ооо Вот это LIKE !!! \r\n \r\n \r\n', 0, '2022-10-02 16:56:11', '2022-10-02 16:56:11'),
(2, '128.68.137.94', '2151975262', 0, 0, 'Entries', 3, 'sip', 'parsing10@rambler.ru', 0, 'Ооо Вот это LIKE !!! \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nhttps://t.me/ReplicaSites', 0, '2022-10-03 05:44:13', '2022-10-03 05:44:13');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_comparison_list`
--

CREATE TABLE `ore_gj_comparison_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `apartment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_comparison_list`
--

INSERT INTO `ore_gj_comparison_list` (`id`, `user_id`, `apartment_id`, `session_id`, `date_updated`) VALUES
(8, 1, 49, 'ef98a1070aac159c53730cd2b8eaee84', '2022-05-07 01:38:36'),
(12, 0, 25, 'dc83a7c31d0fa1898ecdb0f4b13715d5', '2022-09-29 03:28:21');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_configuration`
--

CREATE TABLE `ore_gj_configuration` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('bool','text','enum','hidden') NOT NULL DEFAULT 'text',
  `section` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `allowEmpty` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_configuration`
--

INSERT INTO `ore_gj_configuration` (`id`, `type`, `section`, `name`, `value`, `allowEmpty`, `date_updated`) VALUES
(1, 'text', 'cache', 'cachingTime', '600', 0, '2011-11-26 09:01:21'),
(2, 'text', 'main', 'module_articles_itemsPerPage', '10', 0, '2016-08-15 04:30:25'),
(3, 'text', 'main', 'module_articles_truncateAfterWords', '50', 1, '2016-08-15 04:30:25'),
(4, 'text', 'main', 'module_usercpanel_bookingsPerPage', '6', 0, '2016-08-15 04:30:25'),
(5, 'text', 'mail', 'adminEmail', 'uzxans@mail.ru', 0, '2022-04-14 10:35:44'),
(6, 'text', 'main', 'adminPhone', '', 1, '2016-08-15 04:30:25'),
(7, 'text', 'main', 'adminSkype', 'uzxan\n', 1, '2022-03-11 07:52:14'),
(8, 'text', 'main', 'adminICQ', '616147066', 1, '2016-08-15 04:30:25'),
(9, 'text', 'main', 'adminAddress', '', 1, '2016-08-15 04:30:25'),
(10, 'text', 'main', 'moduleEntries_entriesPerPage', '10', 0, '2016-08-15 04:30:25'),
(11, 'text', 'apartment', 'moduleApartments_maxRooms', '8', 0, '2016-08-15 04:30:25'),
(12, 'text', 'apartment', 'moduleApartments_maxFloor', '30', 0, '2016-08-15 04:30:25'),
(13, 'text', 'gmap', 'module_apartments_gmapsCenterX', '37.620717508911184', 0, '2016-08-15 04:30:25'),
(14, 'text', 'gmap', 'module_apartments_gmapsCenterY', '55.75411314653655', 0, '2016-08-15 04:30:25'),
(15, 'text', 'gmap', 'module_apartments_gmapsZoomApartment', '15', 0, '2016-08-15 04:30:25'),
(16, 'bool', 'gmap', 'useGoogleMap', '0', 0, '2022-02-15 18:18:57'),
(17, 'text', 'main', 'adminPaginationPageSize', '20', 0, '2016-08-15 04:30:25'),
(18, 'bool', 'notifier', 'module_notifier_adminNewBooking', '1', 0, '2016-08-15 04:30:25'),
(19, 'bool', 'notifier', 'module_notifier_userPaymentSuccess', '1', 0, '2016-08-15 04:30:25'),
(20, 'bool', 'notifier', 'module_notifier_userNewUser', '1', 0, '2016-08-15 04:30:25'),
(21, 'bool', 'notifier', 'module_notifier_adminNewUser', '1', 0, '2016-08-15 04:30:25'),
(22, 'bool', 'notifier', 'module_notifier_adminNewContactform', '1', 0, '2016-08-15 04:30:25'),
(23, 'bool', 'ymap', 'useYandexMap', '1', 0, '2022-02-15 18:21:52'),
(24, 'text', 'ymap', 'module_apartments_ymapsCenterX', '41.311158', 0, '2022-02-15 18:23:22'),
(25, 'text', 'ymap', 'module_apartments_ymapsCenterY', '69.279737', 0, '2022-02-15 18:23:27'),
(26, 'text', 'ymap', 'module_apartments_ymapsZoomApartment', '15', 0, '2016-08-15 04:30:25'),
(27, 'text', 'ymap', 'module_apartments_ymapsSpanX', '41.311158', 0, '2022-02-15 19:11:59'),
(28, 'text', 'ymap', 'module_apartments_ymapsSpanY', '69.279737', 0, '2022-02-15 19:12:07'),
(29, 'text', 'ymap', 'module_apartments_ymapApiKey', 'cebf4e10-91d1-4a6c-9294-b3744160cef4', 1, '2022-02-15 18:21:57'),
(30, 'bool', 'search', 'usePriceSlider', '0', 0, '2022-04-28 20:59:46'),
(31, 'bool', 'search', 'useSquareSlider', '0', 0, '2016-08-15 04:30:25'),
(32, 'bool', 'search', 'useFloorSlider', '0', 0, '2016-08-15 04:30:25'),
(33, 'bool', 'search', 'useRoomSlider', '0', 0, '2016-08-15 04:30:25'),
(34, 'bool', 'apartment', 'usePrettyPrice', '0', 0, '2016-08-15 04:30:25'),
(35, 'bool', 'apartment', 'useUserads', '1', 0, '2016-08-15 04:30:25'),
(36, 'bool', 'apartment', 'useUseradsModeration', '1', 0, '2016-08-15 04:30:25'),
(37, 'bool', 'notifier', 'module_notifier_ownerNewBooking', '1', 0, '2012-05-26 01:00:00'),
(38, 'bool', 'apartment', 'useReferenceLinkInView', '1', 0, '2016-08-15 04:30:25'),
(39, 'text', 'main', 'defaultCity', 'Ташкент', 0, '2022-02-15 18:05:08'),
(40, 'bool', 'apartment', 'useShowUserInfo', '1', 0, '2012-04-27 11:01:21'),
(41, 'bool', 'apartment', 'useSliderSimilarAds', '1', 0, '2012-04-27 11:01:21'),
(42, 'text', 'main', 'round_price', '0', 0, '2012-08-31 06:11:36'),
(43, 'bool', 'mail', 'mailUseSMTP', '1', 0, '2022-04-14 10:35:53'),
(44, 'text', 'mail', 'mailSMTPHost', 'localhost', 0, '2012-07-08 08:27:22'),
(45, 'text', 'mail', 'mailSMTPPort', '25', 0, '2012-07-08 08:27:22'),
(46, 'text', 'mail', 'mailSMTPLogin', 'login', 1, '2012-07-08 08:27:22'),
(47, 'text', 'mail', 'mailSMTPPass', 'pass', 1, '2012-07-08 08:27:22'),
(48, 'hidden', 'main', 'version_name', 'Open Real Estate FREE', 0, '2021-11-19 14:41:52'),
(49, 'enum', 'apartment', 'mode_list_show', 'block', 0, '2022-04-28 20:56:17'),
(50, 'bool', 'apartment', 'use_module_request_property', '1', 0, '2013-02-26 20:31:48'),
(51, 'hidden', 'images', 'useWatermark', '1', 0, '2022-04-14 10:40:05'),
(52, 'hidden', 'images', 'watermarkType', '2', 0, '2022-04-14 10:40:05'),
(53, 'hidden', 'images', 'watermarkContent', 'uyjoy.uz', 0, '2022-04-14 10:40:05'),
(54, 'hidden', 'images', 'maxImageWidth', '1024', 0, '2022-04-14 10:40:05'),
(55, 'hidden', 'images', 'maxImageHeight', '768', 0, '2022-04-14 10:40:05'),
(56, 'hidden', 'images', 'watermarkTextColor', '#367fa9', 0, '2022-04-14 10:40:05'),
(57, 'hidden', 'images', 'watermarkTextOpacity', '72', 0, '2022-04-14 10:40:05'),
(58, 'hidden', 'images', 'watermarkPosition', '5', 0, '2022-04-14 10:40:05'),
(59, 'hidden', 'images', 'watermarkTextSize', '48', 0, '2022-04-14 10:40:05'),
(60, 'hidden', 'images', 'watermarkFile', '', 0, '2022-04-14 10:40:05'),
(61, 'bool', 'notifier', 'module_notifier_adminNewApartment', '1', 0, '2013-02-27 00:35:11'),
(62, 'bool', 'notifier', 'module_notifier_adminApartmentNeedModerate', '1', 0, '2013-02-27 00:35:11'),
(63, 'bool', 'notifier', 'module_notifier_adminNewComplain', '1', 0, '2013-02-27 00:35:28'),
(65, 'text', 'apartment', 'countListitngmap', '12', 0, '2013-05-27 07:13:20'),
(66, 'text', 'apartment', 'countListitngtable', '20', 0, '2013-05-27 07:13:30'),
(67, 'text', 'apartment', 'countListitngblock', '10', 0, '2021-11-19 14:41:53'),
(68, 'bool', 'search', 'change_search_ajax', '1', 0, '2013-05-27 07:13:30'),
(69, 'text', 'mail', 'mail_fromName', '', 1, '2013-08-23 05:15:16'),
(70, 'bool', 'search', 'useCompactInnerSearchForm', '1', 1, '2022-04-28 20:59:57'),
(71, 'bool', 'share', 'useYandexShare', '0', 0, '2022-02-20 20:03:30'),
(72, 'bool', 'share', 'useInternalShare', '1', 0, '2022-02-20 20:03:30'),
(73, 'text', 'share', 'intenalServices', 'vk,odnoklassniki,facebook,twitter', 0, '2022-02-20 20:04:22'),
(74, 'text', 'share', 'yaShareServices', 'yazakladki,moikrug,linkedin,vkontakte,facebook,twitter,odnoklassniki', 0, '2013-12-06 03:05:12'),
(75, 'enum', 'apartment', 'apartment_periodActivityDefault', 'always', 0, '2013-12-17 05:46:42'),
(76, 'bool', 'main', 'commentNeedApproval', '1', 0, '2016-08-15 04:30:25'),
(77, 'bool', 'main', 'commentAllowForGuests', '1', 0, '2016-08-15 04:30:25'),
(78, 'bool', 'main', 'useCaptchaCommentsForRegistered', '1', 0, '2016-08-15 04:30:25'),
(79, 'bool', 'main', 'enableCommentsForApartments', '1', 0, '2016-08-15 04:30:25'),
(80, 'bool', 'main', 'enableCommentsForEntries', '1', 0, '2016-08-15 04:30:25'),
(81, 'bool', 'main', 'enableCommentsForPages', '0', 0, '2016-08-15 04:30:25'),
(82, 'bool', 'main', 'enableCommentsForFaq', '1', 0, '2021-11-19 14:41:40'),
(83, 'bool', 'osmap', 'useOSMMap', '0', 0, '2022-02-15 18:17:11'),
(84, 'text', 'osmap', 'module_apartments_osmapsCenterX', '37.620717508911184', 0, '2016-08-15 04:30:25'),
(85, 'text', 'osmap', 'module_apartments_osmapsCenterY', '55.75411314653655', 0, '2016-08-15 04:30:25'),
(86, 'text', 'osmap', 'module_apartments_osmapsZoomApartment', '15', 0, '2016-08-15 04:30:25'),
(87, 'hidden', 'main', 'module_enabled_apartmentsComplain', '1', 0, '2014-04-07 08:52:08'),
(88, 'hidden', 'main', 'module_enabled_similarads', '1', 0, '2014-04-07 08:52:09'),
(89, 'hidden', 'main', 'module_enabled_socialauth', '1', 0, '2014-04-07 08:52:10'),
(90, 'hidden', 'main', 'module_enabled_comparisonList', '1', 0, '2014-04-07 08:52:12'),
(91, 'hidden', 'main', 'module_enabled_rss', '1', 0, '2014-04-07 08:52:14'),
(92, 'hidden', 'main', 'module_enabled_seo', '0', 0, '2021-11-19 14:41:53'),
(93, 'hidden', 'main', 'module_enabled_sitemap', '1', 0, '2014-04-07 08:52:17'),
(94, 'hidden', 'main', 'module_enabled_socialposting', '1', 0, '2014-04-07 08:52:20'),
(95, 'hidden', 'main', 'module_enabled_iecsv', '0', 0, '2021-11-19 14:41:53'),
(96, 'hidden', 'main', 'module_enabled_location', '0', 0, '2021-11-19 14:41:53'),
(97, 'hidden', 'main', 'module_enabled_yandexRealty', '0', 0, '2021-11-19 14:41:53'),
(98, 'hidden', 'main', 'module_enabled_slider', '0', 0, '2021-11-19 14:41:53'),
(99, 'hidden', 'main', 'module_enabled_advertising', '0', 0, '2021-11-19 14:41:53'),
(100, 'hidden', 'main', 'module_enabled_bookingcalendar', '0', 0, '2021-11-19 14:41:53'),
(101, 'hidden', 'main', 'module_enabled_formeditor', '1', 0, '2014-04-07 08:52:23'),
(102, 'hidden', 'main', 'module_enabled_messages', '0', 0, '2021-11-19 14:41:53'),
(103, 'bool', 'main', 'useUserRegistration', '1', 0, '2014-09-04 02:30:25'),
(104, 'hidden', 'main', 'module_enabled_rbac', '1', 0, '2015-03-09 04:30:25'),
(105, 'bool', 'apartment', 'useTypeRentHour', '1', 0, '2016-08-15 04:30:25'),
(106, 'bool', 'apartment', 'useTypeRentDay', '1', 0, '2016-08-15 04:30:25'),
(107, 'bool', 'apartment', 'useTypeRentWeek', '1', 0, '2016-08-15 04:30:25'),
(108, 'bool', 'apartment', 'useTypeRentMonth', '1', 0, '2016-08-15 04:30:25'),
(109, 'bool', 'apartment', 'useTypeSale', '1', 0, '2016-08-15 04:30:25'),
(110, 'bool', 'apartment', 'useTypeRenting', '1', 0, '2022-04-28 20:56:53'),
(111, 'bool', 'apartment', 'useTypeBuy', '1', 0, '2022-04-28 20:56:57'),
(112, 'bool', 'apartment', 'useTypeChange', '1', 0, '2016-08-15 04:30:25'),
(113, 'enum', 'mail', 'mailSMTPSecure', '', 1, '2016-08-15 04:30:25'),
(114, 'hidden', 'blockip', 'delete_ip_after_days', '5', 0, '2014-04-07 08:52:23'),
(115, 'hidden', 'main', 'module_enabled_tariffPlans', '0', 0, '2021-11-19 14:41:53'),
(116, 'enum', 'main', 'user_registrationMode', 'without_confirm', 0, '2015-05-13 09:30:52'),
(117, 'bool', 'apartment', 'enableUserAdsCopy', '1', 0, '2016-08-15 04:30:25'),
(118, 'bool', 'apartment', 'notDeleteListings', '0', 0, '2016-08-15 04:30:25'),
(119, 'bool', 'seo', 'allowUserSeo', '1', 0, '2016-08-15 04:30:25'),
(120, 'hidden', 'main', 'module_enabled_seasonalprices', '0', 0, '2021-11-19 14:41:53'),
(121, 'enum', 'apartment', 'defaultApartmentType', '2', 0, '2015-09-10 12:02:03'),
(122, 'hidden', 'main', 'module_enabled_metroStations', '0', 0, '2021-11-19 14:41:53'),
(123, 'hidden', 'main', 'module_enabled_historyChanges', '0', 0, '2021-11-19 14:41:53'),
(124, 'hidden', 'currency', 'currencySource', '1', 0, '2015-11-09 10:52:23'),
(125, 'bool', 'apartment', 'allowCustomCities', '1', 0, '2016-08-15 04:30:25'),
(126, 'bool', 'seo', 'useSchemaOrgMarkup', '1', 0, '2015-11-09 10:52:23'),
(127, 'text', 'geo', 'geo_time_cache', '604800', 0, '2016-08-15 04:30:25'),
(128, 'enum', 'geo', 'geo_in_search', '1', 0, '2016-01-28 04:00:03'),
(129, 'enum', 'geo', 'geo_in_index', '1', 0, '2016-01-28 03:59:54'),
(130, 'bool', 'geo', 'geo_in_index_flag', '1', 0, '2016-01-28 03:59:54'),
(131, 'enum', 'geo', 'geo_in_ad', '3', 0, '2016-01-28 04:00:19'),
(132, 'hidden', 'main', 'module_enabled_geo', '0', 0, '2021-11-19 14:41:53'),
(133, 'bool', 'main', 'useShowInfoUseCookie', '1', 0, '2016-01-27 11:00:04'),
(134, 'text', 'osmap', 'module_apartments_osmapsZoomManyApartments', '11', 0, '2016-04-15 04:30:25'),
(135, 'text', 'ymap', 'module_apartments_ymapsZoomManyApartments', '20', 0, '2022-02-15 19:11:33'),
(136, 'text', 'gmap', 'module_apartments_gmapsZoomManyApartments', '11', 0, '2016-04-15 04:30:25'),
(137, 'text', 'gmap', 'googleMapApiKey', 'AIzaSyCnQ9sdGoaKWxqd3JT0DYJk805U435CFh4', 0, '2022-02-20 20:01:49'),
(138, 'bool', 'apartment', 'booking_half_day', '1', 1, '2016-04-15 04:30:25'),
(139, 'hidden', 'blockip', 'delete_history_changes_after_days', '90', 0, '2016-11-20 10:52:23'),
(140, 'bool', 'main', 'useReCaptcha', '0', 0, '2017-05-01 04:30:25'),
(141, 'text', 'main', 'reCaptchaKey', 'key', 0, '2017-05-01 04:30:25'),
(142, 'text', 'main', 'reCaptchaSecret', 'secret', 0, '2017-05-01 04:30:25'),
(143, 'bool', 'apartment', 'stepByStepAd', '1', 0, '2017-05-01 04:30:25'),
(144, 'bool', 'notifier', 'module_notifier_allow_replyToEmail', '1', 0, '2017-11-24 03:18:45'),
(145, 'bool', 'apartment', 'show_loan_calculator', '1', 0, '2018-10-10 04:30:25'),
(146, 'hidden', 'main', 'module_enabled_api', '0', 0, '2021-11-19 14:41:53'),
(147, 'hidden', 'main', 'module_enabled_articles', '1', 0, '2019-11-30 04:18:41'),
(148, 'hidden', 'main', 'module_enabled_reviews', '1', 0, '2019-11-30 04:18:46'),
(149, 'hidden', 'main', 'module_enabled_favorite', '1', 0, '2019-11-30 04:18:46'),
(150, 'hidden', 'images', 'thumbQuality', '75', 0, '2022-04-14 10:40:05'),
(151, 'bool', 'apartment', 'useTitleWithID', '0', 0, '2020-03-28 07:31:29'),
(152, 'bool', 'apartment', 'parentIdAll', '0', 0, '2020-03-28 08:30:56'),
(153, 'bool', 'main', 'shuffleSlider', '0', 0, '2020-03-29 08:50:19'),
(154, 'bool', 'apartment', 'descriptionUseEditor', '1', 0, '2020-03-29 08:50:19'),
(155, 'bool', 'main', 'convertYoutubeLink', '1', 0, '2020-05-30 09:46:22'),
(156, 'hidden', 'currency', 'currencySourceApiKey', '', 0, '2020-06-28 10:52:23'),
(157, 'bool', 'main', 'useLoginAdminSendEmailCode', '0', 0, '2021-01-09 12:25:23'),
(158, 'bool', 'seo', 'useSeoSearchConfigByLink', '1', 0, '2022-02-20 20:02:21'),
(159, 'bool', 'seo', 'useSeoSearchConfigBySearch', '1', 0, '2022-02-20 20:02:23'),
(160, 'bool', 'apartment', 'autoSaveEnableAdmin', '1', 0, '2021-01-09 12:25:23'),
(161, 'bool', 'apartment', 'autoSaveEnableUser', '1', 0, '2021-01-09 12:25:23'),
(162, 'text', 'apartment', 'autoSaveInterval', '15', 0, '2021-01-09 12:25:23'),
(163, 'text', 'main', 'siteCurrency', 'Сум', 0, '2022-02-15 18:04:40'),
(164, 'text', 'seo', 'siteTitle', 'UyJoy', 0, '2022-02-15 19:13:20'),
(165, 'text', 'seo', 'siteKeywords', 'объявления, аренда, снять квартиру', 0, '2021-11-19 14:41:53'),
(166, 'text', 'seo', 'siteDescription', 'Сайт по аренде и продже квартир', 0, '2021-11-19 14:41:53');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_custom_html`
--

CREATE TABLE `ore_gj_custom_html` (
  `id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `body_ru` text,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_custom_html`
--

INSERT INTO `ore_gj_custom_html` (`id`, `active`, `name`, `body_ru`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 1, 'Апи', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_entries`
--

CREATE TABLE `ore_gj_entries` (
  `id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tags` text,
  `image_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `body_ru` longtext,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `announce_ru` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_entries`
--

INSERT INTO `ore_gj_entries` (`id`, `active`, `category_id`, `tags`, `image_id`, `title_ru`, `body_ru`, `date_created`, `date_updated`, `announce_ru`) VALUES
(1, 1, 2, 'статьи, articles', 0, 'Какие вещи во время переезда ломаются чаще всего?', '<p>При переезде в новый дом или квартиру, имейте ввиду: некоторые вещи сделаны, чтобы сломаться. Когда дело доходит до переезда, нужно быть осторожным.</p>\r\n\r\n<p><br />\r\nКакие вещи чаще всего могут сломаться или разбиться при переезде?<br />\r\n<br />\r\n<strong>#1 &ndash; Электронная техника</strong><br />\r\nКомпьютеры, телевизоры, а также домашние кинотеатры зачастую становятся жертвами поломки, когда наступает время переезда. Если уронить электронику, то ее чувствительные и хрупкие компоненты могут получить серьезные повреждения<br />\r\nВозможное решение? Сохраняйте коробки и упаковочные материалы, которые изначально шли вместе с вещами. Когда придет время перевезти их в новый дом, уложите гаджеты в упаковки и коробки так, как было при покупке.<br />\r\n<br />\r\n<strong>#2 &ndash; Cпина</strong><br />\r\nБоль в спине, растянутые мышцы, переломы костей -&nbsp; физические травмы, получаемые при попытке передвинуть тот же холодильник или фортепиано, не имея специального оборудования или силы нескольких человек.<br />\r\nИспользуйте прицеп для более крупной мебели, и заранее детально изучить маршрут передвижения.<br />\r\n<br />\r\n<strong>#3 &mdash; Зеркала</strong><br />\r\nСемь лет неудач грозит тому, кто попытается перевозить зеркала самостоятельно. Это хрупкая вещь.<br />\r\nЗеркала подвержены битью еще и потому, что их рамки не могут выдержать силы удара при падении или надавливании. Поэтому не спите на подушках, когда переезжаете &mdash; обкладывайте ими зеркала и другие хрупкие вещи! В любом случае их нужно упаковывать.<br />\r\n<br />\r\n<strong>#4 &mdash; Дом</strong><br />\r\nДверные косяки, стены и полы подвержены ударам и царапинам при перемещении крупных предметов мебели.<br />\r\nЕсли вы не хотите оставить царапины в старом или новом жилище, есть один надежный способ - нанять опытных грузчиков.<br />\r\n<br />\r\n<strong>#5 - Изделия из стекла /фарфора</strong><br />\r\nИзделия из стекла, фарфора, а также посуда являются одними из самых легко бьющихся во время переезда. Эти штучные изделия чрезвычайно хрупки и могут расколоться, если их упаковывать, как селедку в бочке.<br />\r\nПоэтому используйте бумагу и пузырчатую пленку и оставляйте пространство между ними и коробкой.<br />\r\n<br />\r\n<strong>#6 &mdash; Рамочные картины</strong><br />\r\nВо время переезда картины и другие произведения искусства подвержены самым разным повреждениям, если рядом с ними положить или упаковать предметы с острыми краями.<br />\r\nВо многих случаях рамки богато украшенные, дорогие, и легко трескаются. Пытаясь плотно упаковать в машину вещи, люди ставят на картины ящики. Если так делать, то можно легко их продырявить.</p>\r\n', '2019-01-04 23:02:21', '2020-03-16 05:34:24', '<p>При переезде в новый дом или квартиру, имейте ввиду: некоторые вещи сделаны, чтобы сломаться. Когда дело доходит до переезда, нужно быть осторожным.</p>\r\n'),
(2, 1, 2, 'articles, статьи', 1, 'Наилучшие для проживания города', '<p>Чтобы найти наилучшие для проживания города, требуется провести небольшое исследование. Cобрав все данные и проведя опросы c этой целью, многие компании и организации проделали за вас большую работу.<br />\r\n<br />\r\n<strong>Наилучшие для проживания города мира</strong><br />\r\nНаходящаяся в Лондоне Консалтинговая группа Economist Intelligence Unit (EIU) составила список городов мира, наилучших для проживания и посещения.<br />\r\n<br />\r\nИзучив 40 различных показатеоей, разделенных по 5 отдельным категориям, включая стабильность, здравоохранение, культуру и окружающую среду, образование и инфраструктуру, консалтинговая группа опубликовала несколько интересных фактов.<br />\r\nВновь возглавляют список города Канады, а три канадских города вошли в первую пятерку. Бывший №1, Ванкувер, сохранил первое место, усилив свою позицию благодаря Олимпийским играм-2010, проведение которых укрепило позицию города по категориям: культура, окружающая среда и инфраструктура. Фактически весь топ-5 городов сохранился неизменным. Из городов США лучший &ndash; Питтсбург, стоящий на 29 месте в списке всех городов мира.<br />\r\n1.Ванкувер, Канада<br />\r\n2.Мельбурн, Австралия<br />\r\n3.Вена, Австрия<br />\r\n4.Торонто, Канада<br />\r\n5.Калгари, Канада</p>\r\n', '2019-01-04 23:02:49', '2020-03-16 05:34:26', '<p>Чтобы найти наилучшие для проживания города, требуется провести небольшое исследование. Cобрав все данные и проведя опросы c этой целью, многие компании и организации проделали за вас большую работу.</p>\r\n'),
(3, 1, 1, 'lego, news, новости', 3, 'В качестве отделки для лестницы в одной из квартир Манхэттена использовали 20000 блоков Lego', '<p>Обычно при поиске нового дома нужно учитывать такие вещи, как наличие встроенной посудомоечной машины или центрального кондиционирования. Однако одна из квартир на Манхэттене выделяется среди прочих своей необычностью &mdash; и это никак не связано с системами жизнеобеспечения. Лестницу в этом доме украшают красочные перила, полностью построенные из блоков Lego.</p>\r\n\r\n<div align=\"center\"><img src=\"http://architector.ua/images/articles/AlexA/pic_big/pic_1340266348.jpg\" />\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<p>Их дизайн разработан одним из официальных художников Lego в Нью-Йорке - да, такая профессия действительно существует - перила поднимаются на второй уровень квартиры. Их построили в основном из белых блоков, но&nbsp; выделяются они красочной отделкой на концах, включая большие открытые участки, придающие им очень абстрактный вид.<br />\r\nКонечно, блоками Lego можно отделать дом по-своему, если достаточно времени и терпения. Тем не менее, мы бы не советовали полагаться на пластмассовые игрушечные блоки при создании вещей, на которые планируете ставить что-то тяжелое. Более того, неудачно споткнувшись на лестнице из Lego, вы можете превратить ее в огромную кучу разъединенных блоков и разбитые мечты.</p>\r\n', '2019-01-04 23:03:16', '2020-03-16 05:34:29', '<p>Обычно при поиске нового дома нужно учитывать такие вещи, как наличие встроенной посудомоечной машины или центрального кондиционирования. Однако одна из квартир на Манхэттене выделяется среди прочих своей необычностью &mdash; и это никак не связано с системами жизнеобеспечения.</p>\r\n'),
(6, 1, 1, 'Sed ut, perspiciatis', 4, 'Где его взять?', '<p>Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или &quot;невозможных&quot; слов.</p>\r\n', '2019-01-04 20:01:42', '2020-03-16 05:34:34', '<p>Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь.</p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_entries_all_tags`
--

CREATE TABLE `ore_gj_entries_all_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `frequency` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_entries_all_tags`
--

INSERT INTO `ore_gj_entries_all_tags` (`id`, `name`, `frequency`) VALUES
(1, 'lego', 1),
(2, 'news', 1),
(3, 'новости', 1),
(4, 'articles', 2),
(5, 'статьи', 2),
(7, 'Sed ut', 1),
(8, 'perspiciatis', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_entries_category`
--

CREATE TABLE `ore_gj_entries_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `sorter` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_entries_category`
--

INSERT INTO `ore_gj_entries_category` (`id`, `name_ru`, `sorter`, `active`, `date_updated`) VALUES
(1, 'Новости', 1, 0, '2020-03-16 05:55:50'),
(2, 'Статьи', 2, 0, '2020-03-16 05:55:53');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_entries_image`
--

CREATE TABLE `ore_gj_entries_image` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_entries_image`
--

INSERT INTO `ore_gj_entries_image` (`id`, `name`, `date_created`) VALUES
(1, 'sunset-17665_640.jpg', '2020-03-16 03:08:57'),
(3, 'Lego_Color_Bricks.jpg', '2020-03-16 04:00:00'),
(4, 'aerial-view-architecture-bridges-681335.jpg', '2020-03-16 05:03:05');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_favorite`
--

CREATE TABLE `ore_gj_favorite` (
  `user_id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL DEFAULT '',
  `model_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_formdesigner`
--

CREATE TABLE `ore_gj_formdesigner` (
  `id` int(11) UNSIGNED NOT NULL,
  `sorter` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `standard_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `compare_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_i18n` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tip_ru` varchar(255) NOT NULL DEFAULT '',
  `label_ru` varchar(255) NOT NULL DEFAULT '',
  `reference_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `measure_unit` varchar(30) NOT NULL DEFAULT '',
  `view_in` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `not_hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `json_data` text,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_formdesigner`
--

INSERT INTO `ore_gj_formdesigner` (`id`, `sorter`, `field`, `type`, `standard_type`, `compare_type`, `is_i18n`, `visible`, `tip_ru`, `label_ru`, `reference_id`, `rules`, `measure_unit`, `view_in`, `not_hide`, `json_data`, `date_created`, `date_updated`) VALUES
(1, 12, 'num_of_rooms', 2, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\"]}', '2020-03-15 18:13:48', '2020-03-15 18:13:48'),
(2, 13, 'floor_all', 2, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 15:52:52'),
(4, 14, 'square', 2, 1, 0, 0, 0, 'Разделителем является \".\" (точка).', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 05:52:27'),
(5, 15, 'window_to', 2, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 15:52:52'),
(6, 17, 'berths', 2, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 15:52:52'),
(7, 6, 'address', 2, 2, 0, 1, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2018-02-26 05:35:07'),
(8, 16, 'description_near', 3, 2, 0, 1, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 15:33:35'),
(9, 11, 'description', 4, 2, 0, 1, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 15:52:51'),
(10, 10, 'references', 2, 2, 0, 0, 0, '', '', 0, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-15 20:15:46'),
(11, 18, 'note', 3, 1, 0, 0, 2, 'Заметка будет видна только Вам и администратору', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 05:52:29'),
(12, 19, 'phone', 2, 1, 0, 0, 0, 'Если вы не укажете здесь телефон, то будет показан телефон из профиля', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 05:52:33'),
(13, 20, 'land_square', 2, 1, 0, 0, 0, 'Разделителем является \".\" (точка).', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 05:52:35'),
(14, 1, 'type', 0, 2, 0, 0, 0, '', 'Тип сделки', 0, 0, '', 1, 1, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 21:35:06', '2020-03-16 05:52:37'),
(15, 8, 'price', 0, 2, 0, 0, 0, '', 'Цена', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\"]}', '2020-03-15 21:36:17', '2020-03-16 05:52:39'),
(16, 4, 'location', 0, 2, 0, 0, 0, '', 'Местоположение', 0, 0, '', 1, 1, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 18:13:48', '2020-03-16 05:52:41'),
(17, 9, 'title', 2, 1, 0, 1, 0, '', '', 0, 0, '', 1, 1, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-15 22:01:55', '2020-03-16 15:52:51'),
(18, 2, 'obj_type_id', 0, 2, 0, 0, 0, '', 'Тип недвижимости', 0, 0, '', 1, 1, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-16 15:27:27', '2020-03-16 05:52:43'),
(19, 3, 'parent_id', 0, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-16 15:49:27', '2018-03-11 06:55:45'),
(20, 5, 'metroStations', 2, 2, 0, 0, 0, '', '', 0, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', '2020-03-16 06:00:00', '2015-10-31 20:00:01'),
(21, 21, 'open_plan', 1, 0, 0, 0, 0, '', 'Свободная планировка', 11, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:46'),
(22, 22, 'room_type', 1, 0, 0, 0, 0, '', 'Тип комнат', 12, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:49'),
(23, 23, 'balcony_type', 1, 0, 0, 0, 0, '', 'Тип балкона', 13, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:51'),
(24, 24, 'wc_type', 1, 0, 0, 0, 0, '', 'Тип санузла', 14, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:53'),
(25, 25, 'floor_coat', 1, 0, 0, 0, 0, '', 'Покрытие пола', 15, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:54'),
(26, 7, 'garage_type', 1, 0, 0, 0, 0, '', 'Тип гаража', 16, 0, '', 1, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:56'),
(27, 26, 'build_year', 2, 0, 2, 0, 0, '', 'Год постройки', 0, 3, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:52:57'),
(28, 27, 'repair', 1, 0, 0, 0, 0, '', 'Ремонт', 17, 0, '', 2, 0, '{\"type\":\"\"}', NULL, '2020-03-16 05:53:00'),
(29, 28, 'object_state', 1, 0, 0, 0, 0, '', 'Состояние объекта', 18, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:53:02'),
(30, 29, 'building_type', 1, 0, 0, 0, 0, '', 'Тип здания', 19, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:53:05'),
(31, 30, 'plot_type', 1, 0, 0, 0, 0, '', 'Тип участка', 20, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:53:07'),
(32, 31, 'utilities', 7, 0, 0, 0, 0, '', 'Коммуникации', 21, 0, '', 2, 0, '{\"type\":[\"1\",\"2\",\"3\",\"4\",\"5\"]}', NULL, '2020-03-16 05:53:08');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_formdesigner_obj_type`
--

CREATE TABLE `ore_gj_formdesigner_obj_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `formdesigner_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `obj_type_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_formdesigner_obj_type`
--

INSERT INTO `ore_gj_formdesigner_obj_type` (`id`, `formdesigner_id`, `obj_type_id`) VALUES
(52, 3, 1),
(53, 3, 2),
(54, 3, 3),
(111, 2, 1),
(112, 2, 2),
(113, 2, 3),
(132, 2, 5),
(144, 2, 6),
(156, 2, 7),
(167, 1, 1),
(168, 1, 2),
(169, 1, 7),
(173, 5, 1),
(174, 5, 2),
(175, 5, 7),
(176, 6, 1),
(177, 6, 2),
(178, 6, 7),
(179, 10, 1),
(180, 10, 2),
(181, 10, 3),
(182, 10, 7),
(183, 13, 2),
(184, 13, 4),
(225, 17, 1),
(226, 17, 2),
(227, 17, 3),
(228, 17, 4),
(229, 17, 5),
(230, 17, 6),
(231, 17, 7),
(233, 14, 1),
(234, 14, 2),
(235, 14, 3),
(236, 14, 4),
(237, 14, 5),
(238, 14, 6),
(239, 14, 7),
(255, 16, 1),
(256, 16, 2),
(257, 16, 3),
(258, 16, 4),
(259, 16, 5),
(260, 16, 6),
(261, 16, 7),
(270, 18, 1),
(271, 18, 2),
(272, 18, 3),
(273, 18, 4),
(274, 18, 5),
(275, 18, 6),
(276, 18, 7),
(292, 19, 1),
(293, 19, 7),
(294, 14, 8),
(295, 18, 8),
(296, 16, 8),
(297, 26, 8),
(298, 20, 1),
(299, 20, 2),
(300, 20, 3),
(301, 20, 4),
(302, 20, 5),
(303, 20, 6),
(304, 20, 7),
(305, 20, 8),
(306, 7, 1),
(307, 7, 2),
(308, 7, 3),
(309, 7, 4),
(310, 7, 5),
(311, 7, 6),
(312, 7, 8),
(313, 15, 1),
(314, 15, 2),
(315, 15, 3),
(316, 15, 4),
(317, 15, 5),
(318, 15, 6),
(319, 15, 7),
(320, 15, 8),
(321, 17, 8),
(322, 9, 1),
(323, 9, 2),
(324, 9, 3),
(325, 9, 4),
(326, 9, 5),
(327, 9, 6),
(328, 9, 7),
(329, 9, 8),
(330, 4, 1),
(331, 4, 2),
(332, 4, 3),
(333, 4, 8),
(334, 8, 1),
(335, 8, 2),
(336, 8, 3),
(337, 8, 4),
(338, 8, 5),
(339, 8, 6),
(340, 8, 7),
(341, 8, 8),
(342, 11, 1),
(343, 11, 2),
(344, 11, 3),
(345, 11, 4),
(346, 11, 5),
(347, 11, 6),
(348, 11, 7),
(349, 11, 8),
(350, 12, 1),
(351, 12, 2),
(352, 12, 3),
(353, 12, 4),
(354, 12, 5),
(355, 12, 6),
(356, 12, 7),
(357, 12, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_images`
--

CREATE TABLE `ore_gj_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_object` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `id_owner` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_name_modified` varchar(255) NOT NULL DEFAULT '',
  `sorter` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `is_main` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_images`
--

INSERT INTO `ore_gj_images` (`id`, `id_object`, `id_owner`, `file_name`, `file_name_modified`, `sorter`, `is_main`, `date_created`, `date_updated`) VALUES
(1, 20, 2, '4642183425303f90b58a426431faffc8.jpg', 'fe8095b8c9a60603e77bd05fc3b2442d.jpg', 1, 1, '2020-03-16 16:35:08', '2022-04-14 10:40:42'),
(2, 20, 2, '98978650a82789fea10647facc9ccb31.jpg', '', 2, 0, '2020-03-16 16:35:08', '2022-03-10 08:01:31'),
(3, 20, 2, '37666ee0212634e5440b3b10bbb03405.jpg', '', 3, 0, '2020-03-16 16:35:08', '2022-03-10 08:01:31'),
(4, 21, 2, '07f5903ea83f2b6dcafaa938d78f31b2.jpg', '881d78d23dcea2e184a986b889eb4a6e.jpg', 1, 1, '2020-03-16 16:35:09', '2022-04-14 10:40:41'),
(5, 21, 2, 'b30ecde6703af338cf78351c31c244b6.jpg', '', 2, 0, '2020-03-16 16:35:09', '2022-03-10 08:01:31'),
(6, 21, 2, '2799799413c546f8cec31f4dace1bd4c.jpg', '', 3, 0, '2020-03-16 16:35:09', '2022-03-10 08:01:31'),
(7, 22, 2, 'e0c4b12b29821bc21629e4c38ea9328e.jpg', '163e8a925e50456bf81c266c6120fae8.jpg', 1, 1, '2020-03-16 16:35:09', '2022-04-14 10:40:41'),
(8, 22, 2, '33fb6904072bda6867e983bbe6a4cca2.jpg', 'ac9fb724c010c177e8ac673f0bd153bf.jpg', 2, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:01'),
(9, 22, 2, '2669632aee4e4f25ff4939965abc6df1.jpg', '591fc0c7ccefc02c04663262a11aa5f7.jpg', 3, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:01'),
(10, 22, 2, '76edb1c5af69ebb89c5451b638379194.jpg', 'fcc9f209f1b431c1ea14cbf5766e5ef5.jpg', 4, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:01'),
(11, 23, 1, '72f897efe9967830aec0423a452bac26.jpg', '17a0ef0405c8a29c5b08750dffb32354.jpg', 1, 1, '2020-03-16 16:35:09', '2022-04-14 10:40:41'),
(12, 23, 1, '1062105f6f7775759509d6837ed6b71b.jpg', '4da3e4d996936f4a97da3f00cc276572.jpg', 2, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:00'),
(13, 23, 1, '4802bffadc1c3a300deec201d641c275.jpg', '0e8a007583f59d8f15f90c02a001f205.jpg', 3, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:00'),
(14, 24, 1, '434e6f58798e9d4a76b73f6d3f42bcdd.jpg', '5c5b2b885e9f16699e93cbf07f0c2b76.jpg', 1, 1, '2020-03-16 16:35:09', '2022-04-14 10:40:41'),
(15, 24, 1, '939f629f4d329396f431c3324630acda.jpg', '25fbb1bb56cad4b407f99454528a1335.jpg', 2, 0, '2020-03-16 16:35:09', '2022-04-14 10:46:00'),
(16, 25, 2, 'aa3b58ff0e2fc028e8d923c5e4913240.jpg', '753484ec1c5303e079eeeea458fb9a23.jpg', 1, 1, '2020-03-16 16:35:09', '2022-04-14 10:40:41'),
(17, 25, 2, 'fbba2b5638379b56f07901cf811dec84.jpg', 'b5da25c0b9844923930cca64094af3b2.jpg', 2, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:25'),
(18, 25, 2, '5995731714c8418f6b543a0a19d9b542.jpg', '409d201878b952d73513f7c7aaeedaed.jpg', 3, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:25'),
(19, 25, 2, '4b32745ab9af98359d93f140df38b8d5.jpg', 'af9d4eeafa3705afe05d39afc4ba9a3c.jpg', 4, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:25'),
(20, 26, 1, '532a06605273c3a78764aef82cc2898d.jpg', '9d725f84f431e7477777e89b3cfb95b1.jpg', 1, 1, '2020-03-16 16:35:10', '2022-04-14 10:40:41'),
(21, 26, 1, '56862e86309b7f453288fe2dedd65bee.jpg', 'e27fe8f88a3bbf82bceb81af1be91ece.jpg', 2, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:24'),
(22, 26, 1, '22a6e736f74a03564c817e0c1fb6de4f.jpg', '875f3105574cf7901435c49b4eae255a.jpg', 3, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:24'),
(23, 27, 2, 'a97f838a5870da7a2d43c75f1de90106.jpg', '64c5c8fd4b85c287a48afecb9c5c5792.jpg', 1, 1, '2020-03-16 16:35:10', '2022-04-14 10:40:41'),
(24, 27, 2, '680c7d6b0899714428e5a1da0bc30fec.jpg', '0671fd8d2a10dab0f3c15f544a45accc.jpg', 2, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:24'),
(25, 27, 2, 'f95ee897b6b445cad179115eb087286d.jpg', '786e3500f35583d0484e015f0f159e4b.jpg', 3, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:24'),
(26, 27, 2, '7bfbb4d132ff8aa79d8bf01100dfcb0b.jpg', '2398c4c848e91b8b61d1727a36be141d.jpg', 4, 0, '2020-03-16 16:35:10', '2022-04-14 10:41:24'),
(27, 27, 2, '902d83f68e6e9ec372df826018575f60.jpg', '7eeb5e38d72dd2ae7ed9cb19cba65243.jpg', 5, 0, '2020-03-16 16:35:10', '2022-04-14 22:35:56'),
(28, 27, 2, '97671ea692dd5e2c7dbd0390bb0c14a9.jpg', 'de49f11251ce670ec520a6c78491ab04.jpg', 6, 0, '2020-03-16 16:35:10', '2022-04-14 22:35:56'),
(29, 27, 2, 'ab7d6d8cd9b9cc88c6c2f886ecfb0fe1.jpg', '1ee0aed6f643e90a742595a15d448acb.jpg', 7, 0, '2020-03-16 16:35:11', '2022-04-14 22:35:56'),
(30, 28, 2, 'a82782685e0124929fc283d46f6401d2.jpg', 'dba15fb9f554a8fc14ed735fee342e91.jpg', 1, 1, '2020-03-16 16:35:11', '2022-04-14 10:40:41'),
(31, 28, 2, '6f4efbcbc0092841792a0832a9f837f7.jpg', '0b12232622c4638b8beeb57dc7977251.jpg', 2, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:24'),
(32, 28, 2, 'a904431e0b549eb6ff5674e11fc3bb51.jpg', '3a575a76f0c56b2dbc71abfa04ef764d.jpg', 3, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:24'),
(33, 28, 2, 'ff0465c930b907a1902b84a59fad9908.jpg', 'e2ca6a7944ce95787e5f8fd274a35b30.jpg', 4, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:24'),
(34, 28, 2, 'e14408748c45e0a3b99e86560994259b.jpg', 'ab9a9a2193d0ce2693b1aac01ab8f854.jpg', 5, 0, '2020-03-16 16:35:11', '2022-04-14 22:35:52'),
(35, 29, 2, '53629d7d842247d6809ae4656dcd485e.jpg', '7ca5b4443f8060940657361cd28b4f9e.jpg', 1, 1, '2020-03-16 16:35:11', '2022-04-14 10:40:41'),
(36, 29, 2, 'dd2ac23e94ec6135361688bb07717d53.jpg', '0e03e95503e90f496ec0d8b668dac550.jpg', 2, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:23'),
(37, 29, 2, '169ff7438eb11fc8d550be79883c6ea8.jpg', 'a4e67122964fb46cc30a66faec6cd49a.jpg', 3, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:24'),
(38, 29, 2, 'd97fe2a7fcc6f6055c0238f054691856.jpg', 'b2cd9c64ce4ae587c1f907171cd84bb1.jpg', 4, 0, '2020-03-16 16:35:11', '2022-04-14 10:41:24'),
(42, 18, 2, 'b00b91cbee4893b9efda6a83db24ed82.jpg', '7aa7a734884f2ab35ba6a402e6f412fb.jpg', 1, 1, '2020-03-16 16:35:12', '2022-04-14 10:40:42'),
(43, 18, 2, '7239026d4d0355a577047c699f4988a8.jpg', '', 2, 0, '2020-03-16 16:35:12', '2022-03-10 08:01:31'),
(44, 18, 2, '808ee1b66405fd7e2d376c0cfc4768d2.jpg', '', 3, 0, '2020-03-16 16:35:12', '2022-03-10 08:01:31'),
(45, 18, 2, 'b5b4e28e37325ef9b4b20029aed4967a.jpg', '', 4, 0, '2020-03-16 16:35:12', '2022-03-10 08:01:31'),
(48, 30, 1, '5a9d8ca2e8677.jpeg', '6c17c7eb4b56051a8c2f100b8e1df0b5.jpeg', 3, 0, '2018-03-05 12:29:57', '2022-04-14 10:41:23'),
(49, 30, 1, '5a9d8ca3ba075.jpeg', 'e95fd244899c8d183ab7340d9552ab97.jpeg', 2, 0, '2018-03-05 12:29:57', '2022-04-14 10:41:23'),
(50, 30, 1, '5a9d8cb539dad.jpeg', '2116d4f736665be68e39ea4d6c993362.jpeg', 0, 1, '2018-03-05 12:30:13', '2022-04-14 10:40:41'),
(51, 32, 1, '5a9d8eb8685b0.jpeg', 'bf10dbc8a9f6521cb82ffa7e57d682b7.jpeg', 1, 1, '2018-03-05 12:38:50', '2022-04-14 13:56:56'),
(52, 31, 1, '5a9d8ef3d6ce0.jpeg', 'bb31760f376f042c47d500b6e389c37e.jpeg', 1, 1, '2018-03-05 12:39:49', '2022-04-14 13:56:55'),
(55, 33, 1, '5aa4f830e2c4e.jpeg', 'dbfc08afc8fcf04d37ce4d2ae2317c88.jpeg', 0, 1, '2018-03-11 03:34:41', '2022-04-14 10:40:41'),
(56, 34, 1, '5aa4fa469448b.jpg', 'de5c82e77759af21b253f1e45fef324b.jpg', 1, 1, '2018-03-11 03:43:34', '2022-04-14 10:40:42'),
(57, 35, 1, '5aa4fadc8355a.jpg', 'fe1e18bed636159c19be5a1a3f457471.jpg', 1, 1, '2018-03-11 03:46:04', '2022-04-14 10:40:42'),
(58, 47, 7, '3__6228c5993453b.jpg', 'd0108734f660e9f9cb5956021a6483ad.jpg', 1, 1, '2022-03-09 15:24:45', '2022-04-14 10:40:41'),
(59, 47, 7, '2__6228c593180e7.jpg', '097af43845b1ac5cefec70bb797561a6.jpg', 2, 0, '2022-03-09 15:24:45', '2022-04-14 10:41:23'),
(60, 47, 7, '1__6228c58a1fac7.jpg', 'eca0efe459e9fea90be30ff06a12231f.jpg', 3, 0, '2022-03-09 15:24:45', '2022-04-14 10:41:23'),
(61, 49, 8, '4__625676ee5261b.jpg', 'c4ab59e5924cd127456dd99353e317de.jpg', 1, 1, '2022-04-13 07:12:39', '2022-04-14 10:40:07'),
(62, 49, 8, '2__625676e8c6ca5.jpg', 'a15ea23ea3b00301648b6d03c570c82e.jpg', 2, 0, '2022-04-13 07:12:39', '2022-04-14 10:40:08'),
(63, 49, 8, '3__625676eaed729.jpg', 'ce3959b48aba899c200f32e298d5c021.jpg', 3, 0, '2022-04-13 07:12:39', '2022-04-14 10:40:08'),
(64, 49, 8, '1__625676e76e9fd.jpg', 'b6697e17a826f17e32213811f5522153.jpg', 4, 0, '2022-04-13 07:12:39', '2022-04-14 10:40:08');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_infopages`
--

CREATE TABLE `ore_gj_infopages` (
  `id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `widget` varchar(20) NOT NULL DEFAULT '',
  `widget_position` tinyint(1) NOT NULL DEFAULT '0',
  `widget_data` text,
  `widget_titles` text,
  `special` tinyint(4) NOT NULL DEFAULT '0',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `body_ru` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_infopages`
--

INSERT INTO `ore_gj_infopages` (`id`, `active`, `widget`, `widget_position`, `widget_data`, `widget_titles`, `special`, `title_ru`, `date_created`, `date_updated`, `body_ru`) VALUES
(1, 1, 'apartments', 2, '{\"city_id\":\"0\",\"parent_id\":\"\",\"type\":\"0\",\"obj_type_id\":\"0\",\"rooms\":\"0\",\"ot\":\"0\",\"square_min\":\"\",\"square_max\":\"\",\"floor_min\":\"\",\"floor_max\":\"\",\"garage_type\":\"\",\"open_plan\":\"\",\"room_type\":\"\",\"balcony_type\":\"\",\"wc_type\":\"\",\"floor_coat\":\"\",\"build_year\":\"\",\"repair\":\"\",\"object_state\":\"\",\"building_type\":\"\",\"plot_type\":\"\"}', '{\"apartmentsSubTitle\":{\"ru\":\"\"},\"summaryCitiesSubTitle\":{\"ru\":\"\"},\"entriesSubTitle\":{\"ru\":\"\"},\"contactformSubTitle\":{\"ru\":\"\"}}', 1, 'Добро пожаловать!', '2020-03-16 09:00:00', '2022-02-15 18:45:38', '<p>Поиск недвижимости на Уйжой</p>\r\n\r\n<p>В базе UYJOY.UZ&nbsp;вы найдёте объекты по аренде и продаже недвижимости в Узбекистане. Все представленные на сайте объекты проверены профессиональными модераторами. Для удобства вы можете загрузить мобильное приложение на iPhone и Android, а также легко искать объекты благодаря хорошо структурированному каталогу и &laquo;умному&raquo; поиску на нашем сайте. Для облегчения поиска мы реализовали систему рекомендаций похожих объявлений. Все объявления, которые Вам понравились, можно найти в личном кабинете при помощи добавления в &quot;Избранное&quot;. Проверенное жильё в Узбекистане находится на Уйжой.</p>\r\n'),
(2, 1, 'viewallonmap', 1, '', '{\"apartmentsSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"summaryCitiesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"entriesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"contactformSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"}}', 0, 'Поиск на карте', '2020-03-16 09:00:00', '2020-03-16 05:53:11', ''),
(3, 1, 'apartments', 2, '{\"country_id\":\"0\",\"region_id\":\"0\",\"city_id\":\"0\",\"metro\":\"\",\"parent_id\":\"\",\"type\":\"2\",\"obj_type_id\":\"0\",\"rooms\":\"0\",\"ot\":\"0\",\"square_min\":\"\",\"square_max\":\"\",\"floor_min\":\"\",\"floor_max\":\"\"}', '{\"apartmentsSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"summaryCitiesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"entriesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"contactformSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"}}', 0, 'Продажа', '2014-04-13 19:58:58', '2020-03-16 05:53:14', ''),
(4, 1, '', 1, '', NULL, 1, 'Пользовательское соглашение', '2020-03-15 21:09:52', '2020-03-16 05:53:33', '<p>Настоящее Соглашение определяет условия использования Пользователями материалов и сервисов сайта <a href=\"{site_domain}\">{site_title}</a>(далее&nbsp;— «Сайт»).</p>\r\n<p><strong>1.Общие условия</strong></p>\r\n<p>1.1. Использование материалов и сервисов Сайта регулируется нормами действующего законодательства Российской Федерации.</p>\r\n<p>1.2. Настоящее Соглашение является публичной офертой. Получая доступ к материалам Сайта Пользователь считается присоединившимся к настоящему Соглашению.</p>\r\n<p>1.3. Администрация Сайта вправе в любое время в одностороннем порядке изменять условия настоящего Соглашения. Такие изменения вступают в силу по истечении 3 (Трех) дней с момента размещения новой версии Соглашения на сайте. При несогласии Пользователя с внесенными изменениями он обязан отказаться от доступа к Сайту, прекратить использование материалов и сервисов Сайта.</p>\r\n<p><strong>2. Обязательства Пользователя</strong></p>\r\n<p>2.1. Пользователь соглашается не предпринимать действий, которые могут рассматриваться как нарушающие российское законодательство или нормы международного права, в том числе в сфере интеллектуальной собственности, авторских и/или смежных правах, а также любых действий, которые приводят или могут привести к нарушению нормальной работы Сайта и сервисов Сайта.</p>\r\n<p>2.2. Использование материалов Сайта без согласия правообладателей не допускается (статья 1270&nbsp;Г.К РФ). Для правомерного использования материалов Сайта необходимо заключение лицензионных договоров(получение лицензий) от Правообладателей.</p>\r\n<p>2.3. При цитировании материалов Сайта, включая охраняемые авторские произведения, ссылка на Сайт обязательна (подпункт 1 пункта 1 статьи 1274&nbsp;Г.К РФ).</p>\r\n<p>2.4. Комментарии и иные записи Пользователя на Сайте не должны вступать в противоречие с требованиями законодательства Российской Федерации и общепринятых норм морали и нравственности.</p>\r\n<p>2.5. Пользователь предупрежден о том, что Администрация Сайта не несет ответственности за посещение и использование им внешних ресурсов, ссылки на которые могут содержаться на сайте.</p>\r\n<p>2.6. Пользователь согласен с тем, что Администрация Сайта не несет ответственности и не имеет прямых или косвенных обязательств перед Пользователем в связи с любыми возможными или возникшими потерями или убытками, связанными с любым содержанием Сайта, регистрацией авторских прав и сведениями о такой регистрации, товарами или услугами, доступными на или полученными через внешние сайты или ресурсы либо иные контакты Пользователя, в которые он вступил, используя размещенную на Сайте информацию или ссылки на внешние ресурсы.</p>\r\n<p>2.7. Пользователь принимает положение о том, что все материалы и сервисы Сайта или любая их часть могут сопровождаться рекламой. Пользователь согласен с тем, что Администрация Сайта не несет какой-либо ответственности и не имеет каких-либо обязательств в связи с такой рекламой.</p>\r\n<p><strong>3. Прочие условия</strong></p>\r\n<p>3.1. Все возможные споры, вытекающие из настоящего Соглашения или связанные с ним, подлежат разрешению в соответствии с действующим законодательством Российской Федерации.</p>\r\n<p>3.2. Ничто в Соглашении не может пониматься как установление между Пользователем и Администрации Сайта агентских отношений, отношений товарищества, отношений по совместной деятельности, отношений личного найма, либо каких-то иных отношений, прямо не предусмотренных Соглашением.</p>\r\n<p>3.3. Признание судом какого-либо положения Соглашения недействительным или не подлежащим принудительному исполнению не влечет недействительности иных положений Соглашения.</p>\r\n<p>3.4. Бездействие со стороны Администрации Сайта в случае нарушения кем-либо из Пользователей положений Соглашения не лишает Администрацию Сайта права предпринять позднее соответствующие действия в защиту своих интересов и защиту авторских прав на охраняемые в соответствии с законодательством материалы Сайта.</p>\r\n<p><strong>Пользователь подтверждает, что ознакомлен со всеми пунктами настоящего Соглашения и безусловно принимает их.</strong></p>\r\n'),
(5, 1, '', 1, '', '{\"apartmentsSubTitle\":{\"ru\":\"\"},\"summaryCitiesSubTitle\":{\"ru\":\"\"},\"entriesSubTitle\":{\"ru\":\"\"},\"contactformSubTitle\":{\"ru\":\"\"}}', 0, 'Политика конфиденциальности', '2020-03-15 19:07:16', '2022-04-14 10:45:10', ''),
(6, 1, 'apartments', 1, '{\"country_id\":\"0\",\"region_id\":\"0\",\"city_id\":\"0\",\"metro\":\"\",\"parent_id\":\"\",\"type\":\"1\",\"obj_type_id\":\"0\",\"rooms\":\"0\",\"ot\":\"0\",\"square_min\":\"\",\"square_max\":\"\",\"floor_min\":\"\",\"floor_max\":\"\"}', '{\"apartmentsSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"summaryCitiesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"entriesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"contactformSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"}}', 0, 'Аренда', '2017-10-02 05:57:14', '2020-03-16 05:53:21', ''),
(7, 1, 'apartments', 2, '{\"country_id\":\"0\",\"region_id\":\"0\",\"city_id\":\"0\",\"metro\":\"\",\"parent_id\":\"\",\"type\":\"0\",\"obj_type_id\":\"6\",\"rooms\":\"0\",\"ot\":\"0\",\"square_min\":\"\",\"square_max\":\"\",\"floor_min\":\"\",\"floor_max\":\"\",\"garage_type\":\"\",\"open_plan\":\"\",\"room_type\":\"\",\"balcony_type\":\"\",\"wc_type\":\"\",\"floor_coat\":\"\",\"build_year\":\"\",\"repair\":\"\",\"object_state\":\"\",\"building_type\":\"\",\"plot_type\":\"\"}', '{\"apartmentsSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"summaryCitiesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"entriesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"contactformSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"}}', 0, 'Гостиницы', '2020-03-16 06:08:43', '2020-03-16 05:53:39', '<p>Lorem ipsum dolor sit amet, ex vis integre conceptam, vivendum adolescens cum eu, ex tota accusamus has. Perpetua disputando in quo, sea choro voluptaria honestatis no, homero scriptorem sit no. Iisque appellantur at mea, modus regione vel ex. Ut copiosae pertinacia pri, in eam vero atomorum intellegebat.</p>\r\n'),
(8, 1, 'apartments', 1, '{\"country_id\":\"0\",\"region_id\":\"0\",\"city_id\":\"0\",\"metro\":\"\",\"parent_id\":\"\",\"type\":\"0\",\"obj_type_id\":\"5\",\"rooms\":\"0\",\"ot\":\"0\",\"square_min\":\"\",\"square_max\":\"\",\"floor_min\":\"\",\"floor_max\":\"\",\"garage_type\":\"\",\"open_plan\":\"\",\"room_type\":\"\",\"balcony_type\":\"\",\"wc_type\":\"\",\"floor_coat\":\"\",\"build_year\":\"\",\"repair\":\"\",\"object_state\":\"\",\"building_type\":\"\",\"plot_type\":\"\"}', '{\"apartmentsSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"summaryCitiesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"entriesSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"},\"contactformSubTitle\":{\"en\":\"\",\"ru\":\"\",\"de\":\"\",\"es\":\"\",\"ar\":\"\"}}', 0, 'Новостройки', '2020-03-16 06:15:44', '2020-03-16 05:53:40', '<p>Lorem ipsum dolor sit amet, ex vis integre conceptam, vivendum adolescens cum eu, ex tota accusamus has. Perpetua disputando in quo, sea choro voluptaria honestatis no, homero scriptorem sit no. Iisque appellantur at mea, modus regione vel ex. Ut copiosae pertinacia pri, in eam vero atomorum intellegebat.</p>\r\n\r\n<p>Pro sint saepe ut, sed alterum sensibus instructior cu. Eum at mazim accumsan, ne cum tota clita assueverit. Mea veri mazim in, ex signiferumque vituperatoribus pri. Sea ad exerci graeco suavitate, omnis argumentum ea est, usu te dicit contentiones necessitatibus. Eos imperdiet scripserit ex, tale tantas volutpat eu mei.</p>\r\n\r\n<p>Accusamus constituto cu vix, pro molestie patrioque ex, his et ferri melius. Veri docendi has ut, eu nec sumo atqui omittam, id vel consul invenire. Ius omnesque rationibus ut, tempor detracto at pro, te sed solet euripidis. Aeterno senserit periculis est te, velit scriptorem at vel. Nisl graeco has ut, nec cu probatus suavitate. Nec te hinc etiam. Ex vidit quando gloriatur vis, est ad labores corpora intellegat.</p>\r\n\r\n<p>Audiam gloriatur vituperata mel ex, an quot epicuri est. Velit praesent evertitur ne sea, ad vide minimum ius, equidem fabellas luptatum at sit. Ferri assum oporteat quo ne, vix decore corpora detracto at. Velit nusquam in qui. Eu eum tibique deserunt facilisis, ne vim denique aliquando.</p>\r\n\r\n<p>Cibo erat quaeque est id, etiam bonorum te sit. In vim saepe quodsi, nec novum alienum menandri te. Erat nominati molestiae usu an, eu vel civibus tincidunt, admodum suavitate at pri. Ut paulo possim deleniti per, ei has augue semper electram, eu assum menandri contentiones vix.</p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_lang`
--

CREATE TABLE `ore_gj_lang` (
  `id` int(11) UNSIGNED NOT NULL,
  `isRTL` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `currency_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `main` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name_iso` varchar(20) NOT NULL DEFAULT '',
  `name_rfc3066` varchar(10) NOT NULL DEFAULT '',
  `name_ru` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sorter` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name_en` varchar(100) NOT NULL DEFAULT '',
  `admin_mail` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `flag_img` varchar(50) NOT NULL DEFAULT '',
  `name_de` varchar(100) NOT NULL DEFAULT '',
  `price_tpl_default` varchar(255) NOT NULL DEFAULT '',
  `price_tpl_from` varchar(255) NOT NULL DEFAULT '',
  `price_tpl_to` varchar(255) NOT NULL DEFAULT '',
  `dateFormat` varchar(30) NOT NULL DEFAULT 'd.m.Y H:i:s',
  `priceDecimalsPoint` varchar(1) NOT NULL DEFAULT ',',
  `priceThousandsSeparator` varchar(1) NOT NULL DEFAULT '',
  `name_es` varchar(100) NOT NULL DEFAULT '',
  `name_ar` varchar(100) NOT NULL DEFAULT '',
  `name_tr` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_lang`
--

INSERT INTO `ore_gj_lang` (`id`, `isRTL`, `currency_id`, `main`, `name_iso`, `name_rfc3066`, `name_ru`, `active`, `sorter`, `date_updated`, `name_en`, `admin_mail`, `flag_img`, `name_de`, `price_tpl_default`, `price_tpl_from`, `price_tpl_to`, `dateFormat`, `priceDecimalsPoint`, `priceThousandsSeparator`, `name_es`, `name_ar`, `name_tr`) VALUES
(1, 0, 1, 1, 'ru', 'ru-RU', 'Русский', 1, 2, '2014-08-05 07:12:52', 'Russian', 1, 'ru.png', '', '<span>{PRICE}</span> <span class=\"currency\">{CURRENCY}</span> {TYPE}', '', '', 'd.m.Y H:i:s', ',', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_lang_widget_opt`
--

CREATE TABLE `ore_gj_lang_widget_opt` (
  `id` int(11) UNSIGNED NOT NULL,
  `model_name` char(100) NOT NULL DEFAULT '',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_menu`
--

CREATE TABLE `ore_gj_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `menu_list_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parentId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `number` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `pageId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `is_blank` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `href_ru` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `special` tinyint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_menu`
--

INSERT INTO `ore_gj_menu` (`id`, `menu_list_id`, `parentId`, `number`, `pageId`, `is_blank`, `title_ru`, `href_ru`, `active`, `date_updated`, `type`, `special`) VALUES
(1, 2, 0, 4, 1, 0, 'Главная', '/site/index', 0, '2019-03-16 05:34:38', 2, 1),
(2, 2, 0, 7, 0, 0, 'Новости', '/news', 1, '2022-02-15 18:46:25', 1, 1),
(3, 2, 0, 5, 0, 0, 'Спец.предложения', '/specialoffers/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(4, 2, 7, 16, 0, 0, 'Вопросы-ответы', '/articles/main/index', 0, '2022-04-14 10:58:43', 1, 1),
(6, 2, 0, 10, 0, 0, 'Отзывы', '/reviews/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(7, 2, 0, 11, 0, 0, 'Дополнительно', '', 0, '2022-04-14 10:58:43', 0, 0),
(8, 2, 13, 1, 2, 0, 'Поиск на карте', '', 1, '2019-03-16 05:34:54', 2, 0),
(9, 2, 7, 13, 1, 0, 'Пользователи', '/users/main/search', 0, '2022-04-14 10:58:43', 1, 1),
(10, 1, 0, 1, 1, 0, 'Добавить объявление', '{baseUrl}/guestad/add', 1, '2021-11-19 14:41:53', 1, 0),
(11, 1, 0, 2, 1, 0, 'Связаться с нами', '{baseUrl}/contact-us', 1, '2021-11-19 14:41:53', 1, 0),
(12, 2, 0, 7, 0, 0, 'Статьи', '/articles', 0, '2022-02-15 18:46:35', 1, 1),
(13, 2, 0, 4, 0, 0, 'Поиск', '/quicksearch/main/mainsearch', 1, '2019-03-16 05:53:33', 0, 1),
(14, 2, 13, 2, 3, 0, 'Продажа', '', 1, '2019-03-16 05:35:09', 2, 0),
(15, 2, 13, 4, 6, 0, 'Аренда', '', 1, '2019-03-16 05:35:12', 2, 0),
(16, 2, 13, 6, 7, 0, 'Гостиницы', '', 1, '2019-03-16 05:35:13', 2, 0),
(17, 2, 13, 3, 8, 0, 'Новостройки', '', 1, '2019-03-16 05:35:17', 2, 0),
(20, 3, 0, 1, 1, 0, 'Главная', '/site/index', 0, '2019-03-16 05:35:19', 2, 1),
(21, 3, 0, 3, 1, 0, 'Добавить объявление', '{baseUrl}/guestad/add', 1, '2021-11-19 14:41:53', 1, 0),
(22, 3, 0, 2, 1, 0, 'Связаться с нами', '{baseUrl}/contact-us', 1, '2021-11-19 14:41:53', 1, 0),
(23, 4, 0, 6, 0, 0, 'Новости', '/news', 1, '2019-03-16 05:53:33', 1, 1),
(24, 4, 0, 5, 0, 0, 'Спец.предложения', '/specialoffers/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(25, 4, 28, 16, 0, 0, 'Вопросы-ответы', '/articles/main/index', 1, '2020-02-16 13:00:09', 1, 1),
(26, 4, 28, 9, 0, 0, 'Карта сайта', '/sitemap/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(27, 4, 0, 10, 0, 0, 'Отзывы', '/reviews/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(28, 4, 0, 11, 0, 0, 'Дополнительно', '', 1, '2019-03-16 05:35:35', 0, 0),
(29, 4, 32, 1, 2, 0, 'Поиск на карте', '', 1, '2019-03-16 05:35:38', 2, 0),
(30, 4, 28, 13, 1, 0, 'Пользователи', '/users/main/search', 1, '2019-03-16 05:53:33', 1, 1),
(31, 4, 0, 7, 0, 0, 'Статьи', '/articles', 1, '2019-03-16 05:53:33', 1, 1),
(32, 4, 0, 4, 0, 0, 'Поиск', '', 1, '2019-03-16 05:53:33', 0, 0),
(33, 4, 32, 2, 3, 0, 'Продажа', '', 1, '2019-03-16 05:35:45', 2, 0),
(34, 4, 32, 4, 6, 0, 'Аренда', '', 1, '2019-03-16 05:35:47', 2, 0),
(35, 4, 32, 6, 7, 0, 'Гостиницы', '', 1, '2019-03-16 05:35:50', 2, 0),
(36, 4, 32, 3, 8, 0, 'Новостройки', '', 1, '2019-03-16 05:35:53', 2, 0),
(38, 5, 0, 6, 2, 0, 'Новости', '/news', 1, '2019-03-16 05:53:33', 1, 1),
(39, 5, 0, 1, 1, 0, 'Главная', '/site/index', 0, '2019-03-16 05:35:59', 2, 1),
(40, 5, 0, 3, 3, 0, 'Добавить объявление', '{baseUrl}/guestad/add', 1, '2021-11-19 14:41:53', 1, 0),
(41, 5, 0, 2, 4, 0, 'Связаться с нами', '{baseUrl}/contact-us', 1, '2021-11-19 14:41:53', 1, 0),
(42, 5, 0, 5, 5, 0, 'Спец.предложения', '/specialoffers/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(43, 5, 0, 8, 6, 0, 'Вопросы-ответы', '/articles/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(44, 5, 0, 9, 7, 0, 'Карта сайта', '/sitemap/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(45, 5, 0, 10, 8, 0, 'Отзывы', '/reviews/main/index', 1, '2019-03-16 05:53:33', 1, 1),
(46, 3, 0, 14, 1, 0, 'Оставить заявку', '/booking/main/mainform', 0, '2019-03-16 05:54:14', 1, 1),
(47, 2, 7, 14, 5, 0, 'Политика конфиденциальности', '', 0, '2022-04-14 10:58:43', 2, 0),
(48, 4, 28, 14, 5, 0, 'Политика конфиденциальности', '', 1, '2019-03-16 05:36:16', 2, 0),
(49, 4, 28, 15, 4, 0, 'Пользовательское соглашение', '', 1, '2019-03-16 05:36:19', 2, 0),
(50, 2, 7, 15, 4, 0, 'Пользовательское соглашение', '', 0, '2022-04-14 10:58:43', 2, 0),
(51, 2, 0, 7, 8, 0, 'Избранное', '/favorites', 1, '2020-02-16 13:01:26', 1, 1),
(52, 4, 0, 6, 8, 0, 'Избранное', '/favorites', 1, '2020-02-16 13:02:23', 1, 1),
(53, 1, 0, 16, 1, 0, 'Заказать обратный звонок', '/site/callback', 1, '2019-03-16 05:54:14', 1, 1),
(54, 3, 0, 16, 1, 0, 'Заказать обратный звонок', '/site/callback', 0, '2019-03-16 05:54:14', 1, 1),
(55, 5, 0, 17, 1, 0, 'Заказать обратный звонок', '/site/callback', 1, '2019-03-16 05:54:14', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_menu_list`
--

CREATE TABLE `ore_gj_menu_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_menu_list`
--

INSERT INTO `ore_gj_menu_list` (`id`, `active`, `name_ru`, `is_system`) VALUES
(1, 1, 'Шапка - Шаблон: Atlas', 1),
(2, 1, 'Верхнее - Шаблон: Atlas', 1),
(3, 1, 'Шапка - Шаблон: Basis и Dolphin', 1),
(4, 1, 'Верхнее - Шаблон: Basis и Dolphin', 1),
(5, 1, 'Нижнее - Шаблон: Basis и Dolphin', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_news_product`
--

CREATE TABLE `ore_gj_news_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `link` varchar(255) NOT NULL DEFAULT '',
  `pubDate` timestamp NULL DEFAULT NULL,
  `author` varchar(150) NOT NULL DEFAULT '',
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_news_product`
--

INSERT INTO `ore_gj_news_product` (`id`, `title`, `description`, `link`, `pubDate`, `author`, `is_show`, `lang`) VALUES
(13, 'Open Real Estate 1.15.3', '<p>\n	The new version of CMS&nbsp;<a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		Improvements and bug fixes.</li>\n</ul>\n', 'http://open-real-estate.info/en/blog/open-real-estate-1153', '2016-01-31 09:26:30', 'open-real-estate.info', 1, 'en'),
(14, 'Settings and security tuning', '<p>\n                Before you start installing Open Real Estate CMS, it\'s strongly recommended to change the default value of the variable, responsible for users\' passwords generating. <br />\n                This step is necessary to protect the passwords in case the script is hacked/exploited.\n            </p>', 'http://open-real-estate.info/en/blog/settings-and-security-tuning', '2016-01-23 11:53:01', 'open-real-estate.info', 1, 'en'),
(15, 'Open Real Estate 1.15.2', '<p>We have released an updated version of <a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>Developers have implemented some corrections and made some improvements to the product to make it even better than before!</p>', 'http://open-real-estate.info/en/blog/open-real-estate-1152', '2016-01-13 06:42:11', 'open-real-estate.info', 1, 'en'),
(16, 'Restricting admin access to specific IP addresses', '<p>\n	In the article we&#39;ll overview one of the options to protect admin panel of your property website, based on Open Real Estate software. Specifically, we&#39;ll see how to restrict authorization in the admin panel to specific IP addresses.</p>\n', 'http://open-real-estate.info/en/blog/restricting-admin-access-to-specific-ip-addresses', '2016-01-11 05:01:31', 'open-real-estate.info', 1, 'en'),
(17, 'Machine (automated) translation in Open Real Estate CMS', '<p>\n	Machine translation is used after &quot;Translate&quot; button is clicked</p>\n<p>\n	<a href=\"http://static.monoray.net/images/open-real-estate.info/blog_listing_add_en.jpg\" rel=\"prettyPhoto\"><img src=\"http://static.monoray.net/images/open-real-estate.info/blog_listing_add_en_small.jpg\" /> </a></p>\n<p>\n	After this button is clicked, script sends a request to Google Translate with cUrl, and thwn the translated line returns. High quality of this translation is not guaranteed.</p>\n<p>\n	Recently this functionlaity stopped working.</p>\n', 'http://open-real-estate.info/en/blog/mashinnyj-perevod-v-open-real-estate-cms', '2015-12-22 01:45:12', 'open-real-estate.info', 1, 'en'),
(18, 'New Year discount for Pro and Ultimate versions!', '<p>\n	Celebrating the 4th anniversary of our product and coming Christmas and New Year holidays, we offer 20% discount for <a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">PRO</a> and <a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Ultimate</a> versions of Open Real Estate software!</p>\n<p>\n	<strong>Hurry up! Our special offer is valid till December, 30.</strong></p>\n', 'http://open-real-estate.info/en/blog/new-year-2015-discount', '2015-12-16 09:28:22', 'open-real-estate.info', 1, 'en'),
(19, 'Open Real Estate 1.15.1', '<p>\n	The new version of CMS&nbsp;<a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		numerous improvements and bug fixes.</li>\n</ul>\n', 'http://open-real-estate.info/en/blog/open-real-estate-1151', '2015-12-16 04:49:32', 'open-real-estate.info', 1, 'en'),
(20, 'Open Real Estate 1.15.0', '<p>\n	The new version of CMS&nbsp;<a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		online booking payment (available only with modules &#39;Booking calendar&#39; and &#39;Payments and paid services&#39;);</li>\n	<li>\n		new paid add-on &#39;History of changes&#39;;</li>\n	<li>\n		new paid add-on &#39;Metro stations&#39;;</li>\n	<li>\n		new add-on &#39;Materials&#39;. Now you can create content categories of your own: news, article, blog and assign categories to newly created materials (news, articles, posts);</li>\n	<li>\n		new base of countries, regions and cities for module &#39;Location&#39; from SypexGeo (https://sypexgeo.net/ru/download/) ;</li>\n	<li>\n		property on a map in print version;</li>\n	<li>\n		framework Yii is updated up to the latest version (1.1.16);</li>\n	<li>\n		numerous improvements and bug fixes.</li>\n</ul>\n', 'http://open-real-estate.info/en/blog/open-real-estate-1150', '2015-12-06 08:04:18', 'open-real-estate.info', 1, 'en'),
(22, 'Open Real Estate 1.15.3', '<p>\n	Выпущена новая версия <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		Улучшения и исправления ошибок.</li>\n</ul>\n', 'http://open-real-estate.info/ru/blog/open-real-estate-1153', '2016-01-31 09:26:30', 'open-real-estate.info', 1, 'ru'),
(23, 'Настройки и улучшение безопасности', '<p>\n                Перед установкой скрипта недвижимости Open Real Estate CMS мы рекомендуем изменить стандартное значение переменной для генерации паролей пользователей. <br />\n                Данный шаг необходим для защиты самих паролей, на случай, если приложение будет взломано.\n            </p>', 'http://open-real-estate.info/ru/blog/settings-and-security-tuning', '2016-01-23 11:53:01', 'open-real-estate.info', 1, 'ru'),
(24, 'Open Real Estate 1.15.2', '<p>Мы выпустили новую версию <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>В новой версии разработчики внесли несколько исправлений и улучшений в наш продукт, сделав его ещё лучше!</p>', 'http://open-real-estate.info/ru/blog/open-real-estate-1152', '2016-01-13 06:42:11', 'open-real-estate.info', 1, 'ru'),
(25, 'Ограничение входа в панель администратора по IP адресу', '<p>\n	В этой статье рассмотрим один из вариантов &quot;защиты админки&quot; на вашем сайте недвижимости, работающем на Open Real Estate, а именно: авторизацию в &quot;админку&quot; только с определённых IP адресов.</p>\n', 'http://open-real-estate.info/ru/blog/restricting-admin-access-to-specific-ip-addresses', '2016-01-11 05:01:31', 'open-real-estate.info', 1, 'ru'),
(26, 'Машинный перевод в Open Real Estate CMS', '<p>\n	Машинный перевод в нашем скрипте используется при клике на кнопку &quot;Перевести&quot;</p>\n<p>\n	<a href=\"http://static.monoray.net/images/open-real-estate.info/blog_listing_add_ru.jpg\" rel=\"prettyPhoto\"><img src=\"http://static.monoray.net/images/open-real-estate.info/blog_listing_add_ru_small.jpg\" /> </a></p>\n<p>\n	При этом с помощью cUrl отправляется запрос в Google Translate и возвращается строка в переводом. Вопрос качества такого перевода рассматривать не будем.</p>\n<p>\n	С недавних пор такая функция перестала работать.</p>\n', 'http://open-real-estate.info/ru/blog/mashinnyj-perevod-v-open-real-estate-cms', '2015-12-22 01:45:12', 'open-real-estate.info', 1, 'ru'),
(27, 'Новогодние скидки на Open Real Estate', '<p>\n	К четырёхлетию продукта Open Real Estate CMS и Новому Году скидка при покупке <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate PRO</a> или <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate Ultimate</a> версии <strong><span style=\"color: #ff0000;\">составит 20%</span></strong>!</p>\n<p>\n	<strong>Спешите! Акция действует с 16 по 30 декабря 2015 года.</strong></p>\n', 'http://open-real-estate.info/ru/blog/new-year-2015-discount', '2015-12-16 09:28:22', 'open-real-estate.info', 1, 'ru'),
(28, 'Open Real Estate 1.15.1', '<p>\n	Выпущена новая версия <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		многочисленные улучшения и исправления ошибок.</li>\n</ul>\n', 'http://open-real-estate.info/ru/blog/open-real-estate-1151', '2015-12-16 04:49:32', 'open-real-estate.info', 1, 'ru'),
(29, 'Open Real Estate 1.15.0', '<p>\n	Выпущена новая версия <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		оплата за бронирование ( только при наличии модулей &quot;Календарь бронирования&quot; и &quot;Платные услуги&quot; );</li>\n	<li>\n		новый платный модуль &quot;История изменений&quot;;</li>\n	<li>\n		новый платный модуль &quot;Станции метро&quot;;</li>\n	<li>\n		новый модуль &quot;Материалы&quot;. Теперь можно создавать свои собственные категории: новости, статьи, блог и т.п. Добавлять в категории созданные категории материалы ( новость, статья, запись и т.п );</li>\n	<li>\n		новая база стран, регионов и городов для модуля &quot;Местоположение&quot; от SypexGeo ( https://sypexgeo.net/ru/download/ );</li>\n	<li>\n		вывод местоположения объекта на карте в версии для печати;</li>\n	<li>\n		фреймворк Yii обновлен до последней версии ( 1.1.16 );</li>\n	<li>\n		многочисленные улучшения и исправления ошибок.</li>\n</ul>\n', 'http://open-real-estate.info/ru/blog/open-real-estate-1150', '2015-12-06 08:04:18', 'open-real-estate.info', 1, 'ru'),
(30, 'Open Business Card 1.4.0', '<p>\n	Are you looking for a simple engine (script) to build a business card website? <br />\n	Try an updated version of our CMS - <a href=\"http://monoray.net/products/51-open-business-card\" target=\"_blank\">Open Business Card</a>. <br />\n	The updated version 1.4.0 offers multilanguage support, increased speedwork, a lot of minor improvements.  <br /> <br />\n\n	<strong>And all this is absolutely free!</strong>\n</p>', 'http://open-real-estate.info/en/blog/open-business-card-140', '2016-02-05 02:15:11', 'open-real-estate.info', 1, 'en'),
(31, 'Open Business Card 1.4.0', '<p>\n	Ищите простой движок ( скрипт ) для создания сайтов-визиток? <br />\n	Попробуйте обновлённую версию нашей CMS - <a href=\"http://monoray.ru/products/51-open-business-card\" target=\"_blank\">Open Business Card</a>. <br />\n	В новой версии, 1.4.0, мы добавили поддержку мультиязычности, увеличили быстродействие, внесли множество мелких улучшений. <br /> <br />\n\n	<strong>И всё это совершенно бесплатно!</strong>\n</p>', 'http://open-real-estate.info/ru/blog/open-business-card-140', '2016-02-05 02:15:11', 'open-real-estate.info', 1, 'ru'),
(32, 'Open Real Estate 1.16.0', '<p>\n	The new version of CMS&nbsp;<a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>New and very useful functions, trendy design changes and intuitive management - that\'s what we\'ve been working on while developing version 1.16.0. We recommend checking our demo <a href=\"http://re-pro.monoray.net/en\" target=\"_blank\">right now</a>!</p>', 'http://open-real-estate.info/en/blog/open-real-estate-1160', '2016-03-22 06:11:40', 'open-real-estate.info', 1, 'en'),
(33, 'High time to buy Open Real Estate CMS!', '<p>You\'ve been thinking about Open Real Estate CMS purchase for a long time, but couldn\'t make up your mind?</p>\n<p>It\'s high time for a VERY profitable purchase!</p>', 'http://open-real-estate.info/en/blog/best-time-to-buy', '2016-03-14 04:44:34', 'open-real-estate.info', 1, 'en'),
(34, 'Open Real Estate 1.15.4', '<p>\n	The new version of CMS&nbsp;<a href=\"http://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		Improvements and bug fixes.</li>\n</ul>', 'http://open-real-estate.info/en/blog/open-real-estate-1154', '2016-02-29 02:59:23', 'open-real-estate.info', 1, 'en'),
(35, 'Open Real Estate 1.16.0', '<p>\n	Выпущена новая версия <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>Новые и очень полезные функции, трендовые изменения в дизайне и интуитивное управление - то, над чем мы поработали в версии 1.16.0. Рекомендуем проверить <a href=\"http://re-pro.monoray.net/ru\" target=\"_blank\">прямо сейчас</a>!</p>\n', 'http://open-real-estate.info/ru/blog/open-real-estate-1160', '2016-03-22 06:11:40', 'open-real-estate.info', 1, 'ru'),
(36, 'Самое время для покупки Open Real Estate', '<p>Давно думаете о покупке Open Real Estate CMS, но никак не можете решиться?</p>\n<p>Сейчас самое время для ОЧЕНЬ выгодной покупки!</p>', 'http://open-real-estate.info/ru/blog/best-time-to-buy', '2016-03-14 04:44:34', 'open-real-estate.info', 1, 'ru'),
(37, 'Open Real Estate 1.15.4', '<p>\n	Выпущена новая версия <a href=\"http://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		Улучшения и исправления ошибок.</li>\n</ul>', 'http://open-real-estate.info/ru/blog/open-real-estate-1154', '2016-02-29 02:59:23', 'open-real-estate.info', 1, 'ru'),
(38, 'Why do you need to buy \'Atlas\' theme in April?', '<p>Search engines incessantly improve and modify search results algorithms.</p>\n<p>As it often happens, there\'s no enough energy and time to keep up with all innovations in SEO and edit the site content. </p>\n<br />\n<p>However, we\'re having a very good news for you!</p>\n<p>A fail-free possibility to rank your site higher in search results (at least in Google) is to buy our \'Atlas\' theme. </p>', 'https://open-real-estate.info/en/blog/why-need-buy-atlas-theme', '2016-04-07 01:26:15', 'open-real-estate.info', 1, 'en'),
(39, 'Open Real Estate 1.16.1', '	<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.\n</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n		<li>Option to rotate listing photos after the upload;</li>\n		<li>Option to edit seasonal prices;</li>\n		<li>Error in listing view form under PHP 7 is fixed;</li>\n		<li>Paid systems PayPal and PayMaster - validity verification of payments is added;</li>\n		<li>Other improvements and minor corrections.</li>\n	</ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1161', '2016-04-06 11:47:54', 'open-real-estate.info', 1, 'en'),
(40, 'Open Real Estate 1.16.0', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>New and very useful functions, trendy design changes and intuitive management - that\'s what we\'ve been working on while developing version 1.16.0. We recommend checking our demo <a href=\"http://re-pro.monoray.net/en\" target=\"_blank\">right now</a>!</p>', 'https://open-real-estate.info/en/blog/open-real-estate-1160', '2016-03-22 06:11:40', 'open-real-estate.info', 1, 'en'),
(41, 'High time to buy Open Real Estate CMS!', '<p>You\'ve been thinking about Open Real Estate CMS purchase for a long time, but couldn\'t make up your mind?</p>\n<p>It\'s high time for a VERY profitable purchase!</p>', 'https://open-real-estate.info/en/blog/best-time-to-buy', '2016-03-14 04:44:34', 'open-real-estate.info', 1, 'en'),
(42, 'Open Real Estate 1.15.4', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		Improvements and bug fixes.</li>\n</ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1154', '2016-02-29 02:59:23', 'open-real-estate.info', 1, 'en'),
(43, 'Open Business Card 1.4.0', '<p>\n	Are you looking for a simple engine (script) to build a business card website? <br />\n	Try an updated version of our CMS - <a href=\"https://monoray.net/products/51-open-business-card\" target=\"_blank\">Open Business Card</a>. <br />\n	The updated version 1.4.0 offers multilanguage support, increased speedwork, a lot of minor improvements.  <br /> <br />\n\n	<strong>And all this is absolutely free!</strong>\n</p>', 'https://open-real-estate.info/en/blog/open-business-card-140', '2016-02-05 02:15:11', 'open-real-estate.info', 1, 'en'),
(44, 'Open Real Estate 1.15.3', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		Improvements and bug fixes.</li>\n</ul>\n', 'https://open-real-estate.info/en/blog/open-real-estate-1153', '2016-01-31 09:26:30', 'open-real-estate.info', 1, 'en'),
(45, 'Settings and security tuning', '<p>\n                Before you start installing Open Real Estate CMS, it\'s strongly recommended to change the default value of the variable, responsible for users\' passwords generating. <br />\n                This step is necessary to protect the passwords in case the script is hacked/exploited.\n            </p>', 'https://open-real-estate.info/en/blog/settings-and-security-tuning', '2016-01-23 11:53:01', 'open-real-estate.info', 1, 'en'),
(46, 'Open Real Estate 1.15.2', '<p>We have released an updated version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>Developers have implemented some corrections and made some improvements to the product to make it even better than before!</p>', 'https://open-real-estate.info/en/blog/open-real-estate-1152', '2016-01-13 06:42:11', 'open-real-estate.info', 1, 'en'),
(47, 'Restricting admin access to specific IP addresses', '<p>\n	In the article we&#39;ll overview one of the options to protect admin panel of your property website, based on Open Real Estate software. Specifically, we&#39;ll see how to restrict authorization in the admin panel to specific IP addresses.</p>\n', 'https://open-real-estate.info/en/blog/restricting-admin-access-to-specific-ip-addresses', '2016-01-11 05:01:31', 'open-real-estate.info', 1, 'en'),
(48, 'Machine (automated) translation in Open Real Estate CMS', '<p>\n	Machine translation is used after &quot;Translate&quot; button is clicked</p>\n<p>\n	<a href=\"https://open-real-estate.info/uploads/clause/blog_listing_add_en.jpg\" rel=\"prettyPhoto\"><img src=\"https://open-real-estate.info/uploads/clause/blog_listing_add_en_small.jpg\" /> </a></p>\n<p>\n	After this button is clicked, script sends a request to Google Translate with cUrl, and thwn the translated line returns. High quality of this translation is not guaranteed.</p>\n<p>\n	Recently this functionlaity stopped working.</p>\n', 'https://open-real-estate.info/en/blog/mashinnyj-perevod-v-open-real-estate-cms', '2015-12-22 01:45:12', 'open-real-estate.info', 1, 'en'),
(49, 'New Year discount for Pro and Ultimate versions!', '<p>\n	Celebrating the 4th anniversary of our product and coming Christmas and New Year holidays, we offer 20% discount for <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">PRO</a> and <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Ultimate</a> versions of Open Real Estate software!</p>\n<p>\n	<strong>Hurry up! Our special offer is valid till December, 30.</strong></p>\n', 'https://open-real-estate.info/en/blog/new-year-2015-discount', '2015-12-16 09:28:22', 'open-real-estate.info', 1, 'en'),
(50, 'Open Real Estate 1.15.1', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		numerous improvements and bug fixes.</li>\n</ul>\n', 'https://open-real-estate.info/en/blog/open-real-estate-1151', '2015-12-16 04:49:32', 'open-real-estate.info', 1, 'en'),
(51, 'Open Real Estate 1.15.0', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		online booking payment (available only with modules &#39;Booking calendar&#39; and &#39;Payments and paid services&#39;);</li>\n	<li>\n		new paid add-on &#39;History of changes&#39;;</li>\n	<li>\n		new paid add-on &#39;Metro stations&#39;;</li>\n	<li>\n		new add-on &#39;Materials&#39;. Now you can create content categories of your own: news, article, blog and assign categories to newly created materials (news, articles, posts);</li>\n	<li>\n		new base of countries, regions and cities for module &#39;Location&#39; from SypexGeo (https://sypexgeo.net/ru/download/) ;</li>\n	<li>\n		property on a map in print version;</li>\n	<li>\n		framework Yii is updated up to the latest version (1.1.16);</li>\n	<li>\n		numerous improvements and bug fixes.</li>\n</ul>\n', 'https://open-real-estate.info/en/blog/open-real-estate-1150', '2015-12-06 08:04:18', 'open-real-estate.info', 1, 'en'),
(52, 'Для чего необходимо купить тему \"Atlas\" в апреле?', '<p>Поисковые системы постоянно улучшают и меняют алгоритмы выдачи.</p>\n<p>Зачаcтую, чтобы угнаться за всеми новшествами в SEO-оптимизации и отредактировать контент сайта не остаётся ни сил, ни времени.</p>\n<br />\n<p>Однако, есть хорошая новость!</p>\n<p>Беспроигрышный вариант повысить свой сайт в выдаче, по крайней мере, в поисковой системе Google - это купить тему \"Atlas\".</p>', 'https://open-real-estate.info/ru/blog/why-need-buy-atlas-theme', '2016-04-07 01:26:15', 'open-real-estate.info', 1, 'ru'),
(53, 'Open Real Estate 1.16.1', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n		<li>Возможность переворачивать изображения к объявлениям после загрузки;</li>\n		<li>Возможность редактирования сезонных цен;</li>\n		<li>Исправлена ошибка при просмотре объявления под PHP 7;</li>\n		<li>Платёжные системы PayPal и PayMaster - добавлены проверки валидности платежа;</li>\n		<li>Другие улучшения и незначительные исправления.</li>\n	</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1161', '2016-04-06 11:47:54', 'open-real-estate.info', 1, 'ru'),
(54, 'Open Real Estate 1.16.0', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>Новые и очень полезные функции, трендовые изменения в дизайне и интуитивное управление - то, над чем мы поработали в версии 1.16.0. Рекомендуем проверить <a href=\"http://re-pro.monoray.net/ru\" target=\"_blank\">прямо сейчас</a>!</p>\n', 'https://open-real-estate.info/ru/blog/open-real-estate-1160', '2016-03-22 06:11:40', 'open-real-estate.info', 1, 'ru'),
(55, 'Самое время для покупки Open Real Estate', '<p>Давно думаете о покупке Open Real Estate CMS, но никак не можете решиться?</p>\n<p>Сейчас самое время для ОЧЕНЬ выгодной покупки!</p>', 'https://open-real-estate.info/ru/blog/best-time-to-buy', '2016-03-14 04:44:34', 'open-real-estate.info', 1, 'ru'),
(56, 'Open Real Estate 1.15.4', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		Улучшения и исправления ошибок.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1154', '2016-02-29 02:59:23', 'open-real-estate.info', 1, 'ru'),
(57, 'Open Business Card 1.4.0', '<p>\n	Ищите простой движок ( скрипт ) для создания сайтов-визиток? <br />\n	Попробуйте обновлённую версию нашей CMS - <a href=\"https://monoray.ru/products/51-open-business-card\" target=\"_blank\">Open Business Card</a>. <br />\n	В новой версии, 1.4.0, мы добавили поддержку мультиязычности, увеличили быстродействие, внесли множество мелких улучшений. <br /> <br />\n\n	<strong>И всё это совершенно бесплатно!</strong>\n</p>', 'https://open-real-estate.info/ru/blog/open-business-card-140', '2016-02-05 02:15:11', 'open-real-estate.info', 1, 'ru'),
(58, 'Open Real Estate 1.15.3', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		Улучшения и исправления ошибок.</li>\n</ul>\n', 'https://open-real-estate.info/ru/blog/open-real-estate-1153', '2016-01-31 09:26:30', 'open-real-estate.info', 1, 'ru'),
(59, 'Настройки и улучшение безопасности', '<p>\n                Перед установкой скрипта недвижимости Open Real Estate CMS мы рекомендуем изменить стандартное значение переменной для генерации паролей пользователей. <br />\n                Данный шаг необходим для защиты самих паролей, на случай, если приложение будет взломано.\n            </p>', 'https://open-real-estate.info/ru/blog/settings-and-security-tuning', '2016-01-23 11:53:01', 'open-real-estate.info', 1, 'ru'),
(60, 'Open Real Estate 1.15.2', '<p>Мы выпустили новую версию <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>В новой версии разработчики внесли несколько исправлений и улучшений в наш продукт, сделав его ещё лучше!</p>', 'https://open-real-estate.info/ru/blog/open-real-estate-1152', '2016-01-13 06:42:11', 'open-real-estate.info', 1, 'ru'),
(61, 'Ограничение входа в панель администратора по IP адресу', '<p>\n	В этой статье рассмотрим один из вариантов &quot;защиты админки&quot; на вашем сайте недвижимости, работающем на Open Real Estate, а именно: авторизацию в &quot;админку&quot; только с определённых IP адресов.</p>\n', 'https://open-real-estate.info/ru/blog/restricting-admin-access-to-specific-ip-addresses', '2016-01-11 05:01:31', 'open-real-estate.info', 1, 'ru'),
(62, 'Машинный перевод в Open Real Estate CMS', '<p>\n	Машинный перевод в нашем скрипте используется при клике на кнопку &quot;Перевести&quot;</p>\n<p>\n	<a href=\"https://open-real-estate.info/uploads/clause/blog_listing_add_ru.jpg\" rel=\"prettyPhoto\"><img src=\"https://open-real-estate.info/uploads/clause/blog_listing_add_ru_small.jpg\" /> </a></p>\n<p>\n	При этом с помощью cUrl отправляется запрос в Google Translate и возвращается строка в переводом. Вопрос качества такого перевода рассматривать не будем.</p>\n<p>\n	С недавних пор такая функция перестала работать.</p>\n', 'https://open-real-estate.info/ru/blog/mashinnyj-perevod-v-open-real-estate-cms', '2015-12-22 01:45:12', 'open-real-estate.info', 1, 'ru'),
(63, 'Новогодние скидки на Open Real Estate', '<p>\n	К четырёхлетию продукта Open Real Estate CMS и Новому Году скидка при покупке <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate PRO</a> или <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate Ultimate</a> версии <strong><span style=\"color: #ff0000;\">составит 20%</span></strong>!</p>\n<p>\n	<strong>Спешите! Акция действует с 16 по 30 декабря 2015 года.</strong></p>\n', 'https://open-real-estate.info/ru/blog/new-year-2015-discount', '2015-12-16 09:28:22', 'open-real-estate.info', 1, 'ru'),
(64, 'Open Real Estate 1.15.1', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		многочисленные улучшения и исправления ошибок.</li>\n</ul>\n', 'https://open-real-estate.info/ru/blog/open-real-estate-1151', '2015-12-16 04:49:32', 'open-real-estate.info', 1, 'ru'),
(65, 'Open Real Estate 1.15.0', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		оплата за бронирование ( только при наличии модулей &quot;Календарь бронирования&quot; и &quot;Платные услуги&quot; );</li>\n	<li>\n		новый платный модуль &quot;История изменений&quot;;</li>\n	<li>\n		новый платный модуль &quot;Станции метро&quot;;</li>\n	<li>\n		новый модуль &quot;Материалы&quot;. Теперь можно создавать свои собственные категории: новости, статьи, блог и т.п. Добавлять в категории созданные категории материалы ( новость, статья, запись и т.п );</li>\n	<li>\n		новая база стран, регионов и городов для модуля &quot;Местоположение&quot; от SypexGeo ( https://sypexgeo.net/ru/download/ );</li>\n	<li>\n		вывод местоположения объекта на карте в версии для печати;</li>\n	<li>\n		фреймворк Yii обновлен до последней версии ( 1.1.16 );</li>\n	<li>\n		многочисленные улучшения и исправления ошибок.</li>\n</ul>\n', 'https://open-real-estate.info/ru/blog/open-real-estate-1150', '2015-12-06 08:04:18', 'open-real-estate.info', 1, 'ru'),
(66, 'More features in the BASIC version', '<p>Good news!</p>\n<p>We have changed the package of our BASIC version.</p>\n<p>We added the most popular modules \"SEO\", \"Sitemap\", \"The extended form editor\".</p>', 'https://open-real-estate.info/en/blog/more-features-in-the-basic-version', '2016-07-20 01:33:56', 'open-real-estate.info', 1, 'en'),
(67, 'Open Real Estate 1.17.1', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		Improvements and bug fixes.</li>\n</ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1171', '2016-07-10 01:44:50', 'open-real-estate.info', 1, 'en'),
(68, 'Google no longer supports keyless access ', '<p>\nRecently there were some changes in the work of Google Maps. Google no longer supports keyless access - <a href=\"http://googlegeodevelopers.blogspot.ru/2016/06/building-for-scale-updates-to-google.html\" target=\"_blank\">http://googlegeodevelopers.blogspot.ru/2016/06/building-for-scale-updates-to-google.html</a>\n</p>\n\n<p>So, it\'s necessary to get API key for correct work of Google Maps - <a href=\"https://developers.google.com/maps/documentation/javascript/get-api-key\" target=\"_blank\">https://developers.google.com/maps/documentation/javascript/get-api-key</a></p> ', 'https://open-real-estate.info/en/blog/google-no-longer-supports-keyless-access', '2016-07-01 04:21:38', 'open-real-estate.info', 1, 'en'),
(69, 'Open Real Estate 1.17.0', '<p>We present you new <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate 1.17.0</a></p>\n<p>In a new version you can find improved perfomance, new features and many other useful options.</p>\n<p>What\'s new in version 1.17.0?</p>', 'https://open-real-estate.info/en/blog/open-real-estate-1170', '2016-06-28 10:33:51', 'open-real-estate.info', 1, 'en'),
(70, 'Open Business Card CMS 1.5.0', '<p>\n	The new version of CMS&nbsp;<a href=\"https://monoray.net/products/51-open-business-card\" target=\"_blank\">Open Business Card CMS</a>&nbsp;has been released.\n</p>\n<p>\n	<strong>What\'s new</strong>:\n</p>\n<ul>\n	<li>Brute force attack protection during the authorization process (display of captcha after third unsuccessful attempt);</li>\n	<li>Cookies warning;</li>\n	<li>PHPMailer is updated to the latest version (5.2.15);</li>\n	<li>Performance optimization; </li>\n	<li>Numerous improvements and bug fixes.</li>	\n</ul>', 'https://open-real-estate.info/en/blog/open-business-card-cms-150', '2016-05-22 06:29:32', 'open-real-estate.info', 1, 'en'),
(71, 'Больше функций в BASIC-версии', '<p>Отличные новости!</p>\n<p>Мы изменили сборку BASIC-версии Open Real Estate.</p>\n<p>В комплектацию добавлены самые популярные модули: \"SEO\", \"Карта сайта\" и \"Расширенный редактор форм\".</p>', 'https://open-real-estate.info/ru/blog/more-features-in-the-basic-version', '2016-07-20 01:33:56', 'open-real-estate.info', 1, 'ru'),
(72, 'Open Real Estate 1.17.1', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		Улучшения и исправления ошибок.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1171', '2016-07-10 01:44:50', 'open-real-estate.info', 1, 'ru'),
(73, 'Изменения в картах от Google - необходимо указывать ключ', '<p>С недавнего времени в Google картах произошли изменения - http://googlegeodevelopers.blogspot.ru/2016/06/building-for-scale-updates-to-google.html </p>\n\n<p>Для работы карт теперь необходимо получить ключ - https://developers.google.com/maps/documentation/javascript/get-api-key</p> ', 'https://open-real-estate.info/ru/blog/google-no-longer-supports-keyless-access', '2016-07-01 04:21:38', 'open-real-estate.info', 1, 'ru'),
(74, 'Open Real Estate 1.17.0', '<p>Представляем вашему вниманию <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate 1.17.0</a>.</p>\n<p>В новой версии улучшено быстродействие, добавлены новые функции и множество различных улучшений.</p><p>Что изменилось?</p>', 'https://open-real-estate.info/ru/blog/open-real-estate-1170', '2016-06-28 10:33:51', 'open-real-estate.info', 1, 'ru'),
(75, 'Open Business Card CMS 1.5.0', '<p>\n	Выпущена новая версия <a target=\"_blank\" href=\"https://monoray.ru/products/51-open-business-card\">Open Business Card CMS</a>.\n</p>\n<p>\n	<strong>Что нового</strong>:\n</p>\n<ul>\n	<li>Защита от перебора паролей к учётной записи при авторизации (отображение капчи после третьей неправильно попытки);</li>\n	<li>Предупреждение об использовании Cookie на сайте;</li>\n	<li>PHPMailer обновлён до последней версии (5.2.15);</li>\n	<li>Повышено быстродействие скрипта;</li>\n	<li>Многочисленные улучшения и исправления ошибок.</li>	\n</ul>', 'https://open-real-estate.info/ru/blog/open-business-card-cms-150', '2016-05-22 06:29:32', 'open-real-estate.info', 1, 'ru'),
(76, 'Open Real Estate 1.17.2', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		bug fixes.</li>\n</ul>\n', 'https://open-real-estate.info/en/blog/open-real-estate-1172', '2016-08-02 14:05:56', 'open-real-estate.info', 1, 'en'),
(77, 'Open Real Estate 1.17.2', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		исправления ошибок.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1172', '2016-08-02 14:05:56', 'open-real-estate.info', 1, 'ru'),
(78, 'Open Real Estate 1.18.0', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n                <li>RTL support (example: arabic, hebrew) in <a href=\"https://open-real-estate.info/en/open-real-estate-modules#atlas\" target=\"_blank\">\"Atlas\" theme</a> (<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">is only for paid BASIC / PRO / Ultimate versions</a> );</li>\n                <li>other minor improvements.</li>\n            </ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1180', '2016-09-18 02:27:07', 'open-real-estate.info', 1, 'en'),
(79, 'Open Real Estate 1.17.3', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		bug fixes.</li>\n</ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1173', '2016-09-12 01:14:32', 'open-real-estate.info', 1, 'en'),
(80, 'Templates for ready-to-go real estate CMS Open Real Estate', '<p><strong>150+ design themes for you to choose from.</strong></p>\n<p>Select a new design for your real estate site and give it a completely new look and feel.</p>\n<p>Any template can be integrated to your website.</p>', 'https://open-real-estate.info/en/blog/templates-for-ready-to-go-real-estate-cms-open-real-estate', '2016-08-20 02:01:29', 'open-real-estate.info', 1, 'en'),
(81, 'Open Real Estate 1.18.0', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n                <li>Поддержка RTL (например: арабский язык, иврит) в <a href=\"https://open-real-estate.info/ru/open-real-estate-modules#atlas\" target=\"_blank\">теме Atlas</a> (<a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">включено только для платных BASIC / PRO / Ultimate версий</a> );</li>\n                <li>небольшие улучшения.</li>\n            </ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1180', '2016-09-18 02:27:07', 'open-real-estate.info', 1, 'ru'),
(82, 'Open Real Estate 1.17.3', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		исправления ошибок.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1173', '2016-09-12 01:14:32', 'open-real-estate.info', 1, 'ru'),
(83, 'Шаблоны для скрипта недвижимости Open Real Estate CMS', '<p><strong>Более 150 шаблонов на ваш выбор.</strong></p>\n<p>Выберите новый дизайн для вашего сайта и придайте ему совершенно новый вид.</p>\n<p>Любой шаблон может быть интегрирован на ваш сайт.</p>', 'https://open-real-estate.info/ru/blog/templates-for-ready-to-go-real-estate-cms-open-real-estate', '2016-08-20 02:01:29', 'open-real-estate.info', 1, 'ru'),
(84, 'Open Real Estate CMS 1.18.1', '	<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.\n</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n		<li>updated  CKEditor;</li>\n		<li>optimization of  Yandex Realty module;</li>\n		<li>bugfix.</li>\n	</ul>', 'https://open-real-estate.info/en/blog/open-real-estate-1181', '2016-09-29 10:31:58', 'open-real-estate.info', 1, 'en'),
(85, 'Open Real Estate CMS 1.18.1', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n		<li>обновлённый CKEditor;</li>\n		<li>оптимизация модуля Яндекс Недвижимость;</li>\n		<li>другие исправления.</li>\n	</ul>', 'https://open-real-estate.info/ru/blog/open-real-estate-1181', '2016-09-29 10:31:58', 'open-real-estate.info', 1, 'ru'),
(86, 'Open Real Estate CMS 1.19.0: new administration panel theme and file manager', '<p>Finally you have an opportunity to test a new version of Open Real Estate CMS – script that lets you create real estate websites, web portals and listings boards.</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1190', '2016-11-22 20:58:05', 'open-real-estate.info', 1, 'en'),
(87, 'Open Real Estate CMS 1.19.0: новая тема оформления панели администратора и файловый менеджер', '<p>Встречайте обновление Open Real Estate CMS – скрипта для создания сайтов недвижимости, порталов и досок объявлений.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1190', '2016-11-22 17:58:05', 'open-real-estate.info', 1, 'ru'),
(88, 'Open Real Estate settings after the installation', '<p>So you have <a href=\"https://open-real-estate.info/en/installation-guide\" target=\"_blank\">installed</a> our <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">real estate script</a>.</p>\n<p>What should you do at first? Add listings at once? Or create users? Or maybe you should  add some additional fields for listings in the <a href=\"https://open-real-estate.info/en/module-extended-form-editor\" target=\"_blank\">\"Extended form editor\"</a>?</p>\n<p>Don\'t jump the gun.</p>', 'https://open-real-estate.info/en/blog/articles/open-real-estate-settings-after-the-installation', '2016-12-02 08:09:02', 'open-real-estate.info', 1, 'en'),
(89, 'Google News: Google to release separate mobile search index', '<p>Recently in one of the largest conferences on digital marketing Pubcon 2016 a webmaster trends analyst with Google Gary Illyes has declared surprising news: in several months the organization is launching a separate search results for mobile users.</p>', 'https://open-real-estate.info/en/blog/news/google-release-separate-mobile-search-index', '2016-11-29 02:18:27', 'open-real-estate.info', 1, 'en'),
(90, 'Настройка Open Real Estate после установки', '<p>Итак, вы <a href=\"https://open-real-estate.info/ru/installation-guide\" target=\"_blank\">установили</a> наш <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">скрипт недвижимости</a>.</p>\n<p>Что же сделать в первую очередь? Сразу добавлять объявления? Или пользователей? А может создать дополнительные поля для объявлений с помощью модуля <a href=\"https://open-real-estate.info/ru/module-extended-form-editor\" target=\"_blank\">\"Расширенный редактор форм\"</a>?</p>\n<p>Не спешите.</p>', 'https://open-real-estate.info/ru/blog/articles/open-real-estate-settings-after-the-installation', '2016-12-02 02:09:02', 'open-real-estate.info', 1, 'ru'),
(91, 'Новости от Google: ожидается запуск отдельной поисковой выдачи для мобильных устройств', '<p>Недавно на одной из крупнейших конференций по digital-маркетингу Pubcon 2016 специалист отдела качества поиска Google Гэри Илш (Gary Illyes) огласил неожиданные новости – через несколько месяцев корпорация запускает отдельную поисковую выдачу для пользователей мобильных устройств.</p>', 'https://open-real-estate.info/ru/blog/news/google-release-separate-mobile-search-index', '2016-11-28 20:18:27', 'open-real-estate.info', 1, 'ru'),
(92, 'Advantages of Open Real Estate. Part 1. Estate agent\'s website', '<p>CMS Open Real Estate is a multi functional ready-to-use solution for creation real estate websites. Our system lets you create different types of websites according to the tasks and services of a project.</p>', 'https://open-real-estate.info/en/blog/articles/advantages-of-open-real-estate-part1-estate-agents-website', '2016-12-06 08:41:08', 'open-real-estate.info', 1, 'en'),
(93, 'Возможности Open Real Estate. Часть 1. Сайт частного риелтора', '<p>CMS Open Real Estate – это многофункциональное готовое решение для создания сайтов в сфере недвижимости. Движок позволяет создавать разные типы сайтов, в зависимости от задач проекта и предлагаемых услуг.</p>', 'https://open-real-estate.info/ru/blog/articles/advantages-of-open-real-estate-part1-estate-agents-website', '2016-12-06 08:41:08', 'open-real-estate.info', 1, 'ru'),
(94, '10 content ideas for a real estate agency', '<p>The main thing on a website is content, as eventually a user visit any internet resource seeking for information (maybe except gaming). It can be just data about an organisation, for example, contact details, or product overview.</p>', 'https://open-real-estate.info/en/blog/articles/10-content-ideas-for-real-estate-agency', '2016-12-14 10:46:07', 'open-real-estate.info', 1, 'en'),
(95, 'Open Real Estate CMS 1.19.1: practice makes perfect', '<p>All the updaes of  Open Real Estate 1.19.1 are conneсted with usability improvements.</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1191', '2016-12-14 03:24:03', 'open-real-estate.info', 1, 'en'),
(96, 'New Year Sales 2017: create your real estate website with 17% discount', '<p>Incredible offer which we have never made before! Only till the 30th of December MonoRay Studio gives you 17% off on ALL our products!</p>', 'https://open-real-estate.info/en/blog/news/new-year-sales-2017', '2016-12-11 22:15:23', 'open-real-estate.info', 1, 'en'),
(97, '10 идей контента для агентства недвижимости', '<p>Самое главное на сайте – это контент, так как в конечном счете пользователь заходит практически на любой интернет-ресурс (за исключением, пожалуй, игровых) именно за информацией. Это могут быть элементарные данные фирмы, например, контакты, или сведения о продуктах компании.</p>', 'https://open-real-estate.info/ru/blog/articles/10-content-ideas-for-real-estate-agency', '2016-12-14 10:46:07', 'open-real-estate.info', 1, 'ru'),
(98, 'Open Real Estate CMS 1.19.1: совершенствуем управление сайтом', '<p>Все нововведения версии Open Real Estate 1.19.1 посвящены улучшению юзабилити.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1191', '2016-12-14 03:24:03', 'open-real-estate.info', 1, 'ru'),
(99, 'Новогодняя распродажа 2017: создайте сайт недвижимости со скидкой 17%', '<p>Таких скидок у нас еще не было! В честь нового 2017 года студия MonoRay дарит скидку 17% абсолютно на ВСЕ наши продукты</p>', 'https://open-real-estate.info/ru/blog/news/new-year-sales-2017', '2016-12-11 22:15:23', 'open-real-estate.info', 1, 'ru'),
(100, 'Open Real Estate CMS 5 year anniversary! A few words about us and 5 year summary', '<p>Dear friend, we are happy to inform us that our real estate website management system Open Real Estate and our web-studio MonoRay celebrate their 5 year anniversary! In this article we would like to provide you with our 5 year summary and tell you about the results we achieved.</p>', 'https://open-real-estate.info/en/blog/news/our-real-estate-script-celebrates-its-5-year-anniversary', '2016-12-29 02:12:00', 'open-real-estate.info', 1, 'en'),
(101, 'Responsive site, mobile version or application: what fits your project better?', '<p>Yandex research <a href=\"https://yandex.ru/company/researches/2015/ya_internet_regions_2015#ispolzovanieinternetasmobilnyxustrojjstvsmartfonoviplanshetov\" rel=\"nofollow\" target=\"_blank\">shows</a>, that the number of people who use tablets and smartphones to surf the web is increasing. A good website, first of all, takes into account the users’ needs. If you take care of you customers, content supply should be as convenient as possible. So you cannot do without content adjustment for mobile devices.</p>', 'https://open-real-estate.info/en/blog/articles/responsive-site-mobile-version-or-application-what-fits-your-project-better', '2016-12-21 06:43:48', 'open-real-estate.info', 1, 'en'),
(102, 'Open Real Estate CMS 5 лет! Немного истории и подведение итогов', '<p>Друзья, мы рады вам сообщить, что системе управления сайтом недвижимости Open Real Estate и нашей веб-студии Monoray исполнилось 5 лет! В этой статье мы хотим подвести итоги работы и поделиться результатами.</p>', 'https://open-real-estate.info/ru/blog/news/our-real-estate-script-celebrates-its-5-year-anniversary', '2016-12-28 23:12:00', 'open-real-estate.info', 1, 'ru'),
(103, 'Адаптивный сайт, мобильная версия или приложение – какой вариант подходит вашему проекту?', '<p>Исследования Яндекса <a href=\"https://yandex.ru/company/researches/2015/ya_internet_regions_2015#ispolzovanieinternetasmobilnyxustrojjstvsmartfonoviplanshetov\" rel=\"nofollow\" target=\"_blank\">показывают</a> что людей, которые пользуются смартфонами и планшетами для серфинга по сети, становится все больше. Хороший сайт в первую очередь учитывает предпочтения пользователей. Если вы заботитесь о своих клиентах, подача контента должна быть максимально удобной. А значит, вам не обойтись без адаптации содержимого сайта под мобильные устройства.</p>', 'https://open-real-estate.info/ru/blog/articles/responsive-site-mobile-version-or-application-what-fits-your-project-better', '2016-12-21 03:43:48', 'open-real-estate.info', 1, 'ru'),
(104, 'A real estate website: template or unique solution?', '<p>\n	The discussions about the best design solution for a real estate website has been led for a long time and the issue hasn’t been solved yet. What is better: a ready-to-use template or a unique design is a big debate.\n	<br />\n	We recommend you to make a choice according to the tasks your website should solve.\n</p>', 'https://open-real-estate.info/en/blog/articles/real-estate-website-template-or-unique-solution', '2017-01-13 06:04:44', 'open-real-estate.info', 1, 'en'),
(105, 'Open Real Estate CMS 1.19.2: security fix', '<p>\n	The new version of CMS <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a> has been released.\n</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		PHPMailer security fix (The critical vulnerability (CVE-2016-10033) allows an attacker to remotely execute arbitrary code in the context of the web server and compromise the target web application) <br />\n	</li>\n</ul>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1192-security-fix', '2017-01-09 08:37:41', 'open-real-estate.info', 1, 'en'),
(106, 'Дизайн сайта недвижимости: шаблон или уникальность?', '<p>\n	Дискуссии о том, какое решение использовать в дизайне сайта недвижимости – готовое шаблонное или уникальный макет, не прекращаются.\n	<br />\n	Мы рекомендуем вам делать выбор в зависимости от задач, которые должен решать сайт.\n</p>', 'https://open-real-estate.info/ru/blog/articles/real-estate-website-template-or-unique-solution', '2017-01-13 06:04:44', 'open-real-estate.info', 1, 'ru');
INSERT INTO `ore_gj_news_product` (`id`, `title`, `description`, `link`, `pubDate`, `author`, `is_show`, `lang`) VALUES
(107, 'Open Real Estate CMS 1.19.2: исправление безопасности', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a></p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n<li>\n		Исправление безопасности PHPMailer (Уязвимость позволяет удаленно выполнить код в контексте web-сервера и скомпрометировать web-приложение) <br />\n	</li>\n</ul>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1192-security-fix', '2017-01-09 05:37:41', 'open-real-estate.info', 1, 'ru'),
(108, 'Main channels of a real estate website promotion', '<p>In conditions of severe competition between real estate agencies it’s important to use as much channels for attracting clients in a site as possible. Let’s consider the most popular ones.</p>', 'https://open-real-estate.info/en/blog/articles/main-channels-of-a-real-estate-website-promotion', '2017-03-11 02:39:57', 'open-real-estate.info', 1, 'en'),
(109, 'Why does a real estate agency need a website?', '<p>When you create a real estate website or some other sites, first of all, you should take into account the aims which you want to achieve when you launch the project.  Not long ago not every agency needed its own resource, however, in the modern world if you don\'t have a website you loose a great deal of financially reliable customers.</p>', 'https://open-real-estate.info/en/blog/articles/why-does-real-estate-agency-need-website', '2017-02-22 08:12:22', 'open-real-estate.info', 1, 'en'),
(110, 'Tips: how to improve objects search form in a real estate website', '<p>One way or another, the main objective of a user in a real estate portal is to find a property to sell or rent, so the base of object exists in the most of real estate agency websites. To simplify the search for potential clients it\'s important to make this process convenient.</p>', 'https://open-real-estate.info/en/blog/articles/how-improve-objects-search-form-in-real-estate-website', '2017-02-15 02:08:18', 'open-real-estate.info', 1, 'en'),
(111, 'Basic recommendation for a website promotion', '<p>The work on the website is not only its creation. If you want to get income from a corporate portal you should constantly attract customers.</p>', 'https://open-real-estate.info/en/blog/articles/basic-recommendation-website-promotion', '2017-02-08 02:20:45', 'open-real-estate.info', 1, 'en'),
(112, 'An unusual way of Open Real Estate script usage', '<p>In this article you will find out how to create a ready to use site for selling wines from a real estate site based on Open Real Estate CMS.</p>\n<p>You can also try to make your own site on selling cars, yachts, mobiles etc in the similar way.</p>', 'https://open-real-estate.info/en/blog/articles/unusual-way-open-real-estate-script-usage', '2017-02-02 17:43:59', 'open-real-estate.info', 1, 'en'),
(113, 'Open Real Estate 1.19.3', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>\n	<strong>What&#39;s new</strong>:</p>\n<ul>\n	<li>\n		bug fixes.</li>\n</ul>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1193', '2017-01-24 05:58:13', 'open-real-estate.info', 1, 'en'),
(114, 'Основные каналы продвижения сайта недвижимости', '<p>В условиях довольно жесткой конкуренции между агентствами недвижимости важно использовать максимум каналов для привлечения аудитории на сайт. Рассмотрим подробнее самые популярные из них</p>', 'https://open-real-estate.info/ru/blog/articles/main-channels-of-a-real-estate-website-promotion', '2017-03-11 02:39:57', 'open-real-estate.info', 1, 'ru'),
(115, 'Зачем сайт агентству недвижимости?', '<p>При создании сайта недвижимости, как и любого другого, прежде всего, стоит руководствоваться теми целями, которых вы хотите достичь, запуская проект. Еще недавно далеко не каждое агентство испытывало необходимость в создании собственного ресурса, однако современные реалии таковы, что отсутствие сайта – это потеря огромной части активной платежеспособной аудитории.</p>', 'https://open-real-estate.info/ru/blog/articles/why-does-real-estate-agency-need-website', '2017-02-22 08:12:22', 'open-real-estate.info', 1, 'ru'),
(116, 'Советы: реализация формы поиска объектов на сайте недвижимости', '<p>Как ни крути, зачастую основная цель посетителя портала недвижимости – найти жилье для продажи или аренды, поэтому база объектов присутствует на сайтах большинства агентств. Чтобы потенциальные клиенты легко могли подобрать для себя подходящий вариант из каталога, важно организовать удобный поиск по сайту.</p>', 'https://open-real-estate.info/ru/blog/articles/how-improve-objects-search-form-in-real-estate-website', '2017-02-15 02:08:18', 'open-real-estate.info', 1, 'ru'),
(117, 'Базовые рекомендации для продвижения сайта', '<p>Работа над сайтом не заканчивается его созданием. Чтобы корпоративный ресурс приносил доход, необходимо активно заниматься привлечением трафика.</p>', 'https://open-real-estate.info/ru/blog/articles/basic-recommendation-website-promotion', '2017-02-08 02:20:45', 'open-real-estate.info', 1, 'ru'),
(118, 'Необычный способ применения скрипта агентства недвижимости Open Real Estate', '<p>Из этой статьи вы узнаете как из готового сайта недвижимости, на основе Open Real Estate CMS, сделать готовый сайт по продаже вина.</p>\n<p>По аналогии можно попробовать реализовать сайт по продаже автомобилей, яхт, телефонов и т.п.</p>', 'https://open-real-estate.info/ru/blog/articles/unusual-way-open-real-estate-script-usage', '2017-02-02 17:43:59', 'open-real-estate.info', 1, 'ru'),
(119, 'Open Real Estate 1.19.3', '<p>\n	Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>\n	<strong>Что нового</strong>:</p>\n<ul>\n	<li>\n		исправление ошибок.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1193', '2017-01-24 05:58:13', 'open-real-estate.info', 1, 'ru'),
(120, 'Baden-Baden: New Yandex algorithm of identifying text spam', '<p><strong>The article will be interesting for people who are promoting their resource in Russia.</strong></p>\n\n<p>On the 23rd of March 2017 Yandex has announced the introduction of a new algorithm on identifying pages with the excessive use of key words. New algorithm is called Baden-Baden.</p>', 'https://open-real-estate.info/en/blog/news/baden-baden-algorithm-from-yandex', '2017-04-14 04:35:09', 'open-real-estate.info', 1, 'en'),
(121, 'Instagram for real estate agencies: useful tips', '<p>Instagram is becoming more popular year by year. It is used by celebrities, businessmen and a lot of successful people, a lot of users are stuck there for 24 hours a day. Taking into account this trend there are several advice on how to create and what to add in your real estate account in Instagram.</p>', 'https://open-real-estate.info/en/blog/articles/instagram-for-real-estate-agencies', '2017-03-26 01:28:55', 'open-real-estate.info', 1, 'en'),
(122, 'An unusual way of Open Real Estate script usage', '<p>In this article you will find out how to create a ready to use site for selling wines from a real estate site based on Open Real Estate CMS.</p>\n<p>You can also try to make your own site on selling cars, yachts, mobiles etc in the similar way.</p>', 'https://open-real-estate.info/en/blog/instructions/unusual-way-open-real-estate-script-usage', '2017-02-02 17:43:59', 'open-real-estate.info', 1, 'en'),
(123, 'Open Real Estate settings after the installation', '<p>So you have <a href=\"https://open-real-estate.info/en/installation-guide\" target=\"_blank\">installed</a> our <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">real estate script</a>.</p>\n<p>What should you do at first? Add listings at once? Or create users? Or maybe you should  add some additional fields for listings in the <a href=\"https://open-real-estate.info/en/module-extended-form-editor\" target=\"_blank\">\"Extended form editor\"</a>?</p>\n<p>Don\'t jump the gun.</p>', 'https://open-real-estate.info/en/blog/instructions/open-real-estate-settings-after-the-installation', '2016-12-02 05:09:02', 'open-real-estate.info', 1, 'en'),
(124, 'Баден-Баден: новый алгоритм определения текстового спама Яндекса', '<p>23 марта 2017 года Яндекс анонсировал введение нового алгоритма по определению страниц с переизбытком ключевых слов. Новый алгоритм называется Баден-Баден.<p>', 'https://open-real-estate.info/ru/blog/news/baden-baden-algorithm-from-yandex', '2017-04-14 04:35:09', 'open-real-estate.info', 1, 'ru'),
(125, 'Instagram для агентства недвижимости: полезные советы', '<p>Instagram набирает популярность с каждым годом. Им активно пользуются знаменитости, успешные бизнесмены, многие пользователи «не вылезают» оттуда круглые сутки. С учетом этой тенденции вот несколько советов о том, как оформить и вести аккаунт агентства недвижимости в Instagram.</p>', 'https://open-real-estate.info/ru/blog/articles/instagram-for-real-estate-agencies', '2017-03-26 01:28:55', 'open-real-estate.info', 1, 'ru'),
(126, 'Необычный способ применения скрипта агентства недвижимости Open Real Estate', '<p>Из этой статьи вы узнаете как из готового сайта недвижимости, на основе Open Real Estate CMS, сделать готовый сайт по продаже вина.</p>\n<p>По аналогии можно попробовать реализовать сайт по продаже автомобилей, яхт, телефонов и т.п.</p>', 'https://open-real-estate.info/ru/blog/instructions/unusual-way-open-real-estate-script-usage', '2017-02-02 17:43:59', 'open-real-estate.info', 1, 'ru'),
(127, 'Настройка Open Real Estate после установки', '<p>Итак, вы <a href=\"https://open-real-estate.info/ru/installation-guide\" target=\"_blank\">установили</a> наш <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">скрипт недвижимости</a>.</p>\n<p>Что же сделать в первую очередь? Сразу добавлять объявления? Или пользователей? А может создать дополнительные поля для объявлений с помощью модуля <a href=\"https://open-real-estate.info/ru/module-extended-form-editor\" target=\"_blank\">\"Расширенный редактор форм\"</a>?</p>\n<p>Не спешите.</p>', 'https://open-real-estate.info/ru/blog/instructions/open-real-estate-settings-after-the-installation', '2016-12-02 05:09:02', 'open-real-estate.info', 1, 'ru'),
(128, 'How to keep a client on your real estate website if object search did not give any positive results', '<p>If a client doesn\'t find in your agency database a property that has all the necessary parameters, they usually get to the page “No listings yet”, “The objects haven’t been found” or “The are no search results for…” In this article we will tell you the ways of keeping a user in a site, even if at the moment there are no objects they want..</p>', 'https://open-real-estate.info/en/blog/articles/how-to-keep-a-client', '2017-04-24 21:17:33', 'open-real-estate.info', 1, 'en'),
(129, 'Как задержать клиента на сайте недвижимости, если поиск по объектам не дал результатов', '<p>Если клиент не находит в базе вашего агентства недвижимости по нужным ему параметрам, он обычно попадает на страницу «Объектов не найдено», «Список объявлений пуст» или «Поиск не дал результатов». В этой статье мы рассмотрим несколько способов задержать посетителя на сайте, даже если нужного объекта на данный момент нет в базе агентства.</p>', 'https://open-real-estate.info/ru/blog/articles/how-to-keep-a-client', '2017-04-24 18:17:33', 'open-real-estate.info', 1, 'ru'),
(130, 'Ways of monetization of a real estate website', '', 'https://open-real-estate.info/en/blog/articles/ways-of-monetization', '2017-05-21 02:50:40', 'open-real-estate.info', 1, 'en'),
(131, 'Open Real Estate Update 1.20.0', '<p>A new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a> was released.</p><p>Learn more about new functions following the link:</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1200', '2017-05-15 01:15:51', 'open-real-estate.info', 1, 'en'),
(132, 'Are landing pages useful in a real estate field?', '<p>Real estate is a highly competitive field, that is why it is very important to use all the possible ways for promotion and advertisement to increase sales. No doubt, one of the ways for attracting clients is creating landing pages for different industry specific requests.</p>', 'https://open-real-estate.info/en/blog/articles/landing-pages-in-a-real-estate-field', '2017-05-04 04:19:10', 'open-real-estate.info', 1, 'en'),
(133, 'Способы монетизации сайта недвижимости', '<p>Конечная цель любого ресурса – прямые продажи или, что касается имиджевых сайтов и промо-страниц, влияние на их увеличение. Сайт, созданный с ориентацией на потребности и интересы пользователя, может приносить хороший доход. Однако для достижения долгосрочных результатов требуется время и усилия на раскрутку. Рассмотрим несколько способов монетизации портала недвижимости.</p>', 'https://open-real-estate.info/ru/blog/articles/ways-of-monetization', '2017-05-21 02:50:40', 'open-real-estate.info', 1, 'ru'),
(134, 'Обновление Open Real Estate 1.20.0', '<p>Выпущена новая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p><p>Узнайте о нововведениях по ссылке:</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1200', '2017-05-15 01:15:51', 'open-real-estate.info', 1, 'ru'),
(135, 'Полезны ли landing page в сфере недвижимости?', '<p>Недвижимость – это высококонкурентная тематика, поэтому для увеличения продаж очень важно испробовать все возможные способы продвижения и рекламы. Безусловно, одним из способов привлечения клиентов является создание лендингов под различные тематические запросы.</p>', 'https://open-real-estate.info/ru/blog/articles/landing-pages-in-a-real-estate-field', '2017-05-04 04:19:10', 'open-real-estate.info', 1, 'ru'),
(136, 'How building owners attract customers: a range of residential complex sites', '<p>Let\'s get straight to the point without many words. In our today\'s article there are site samples with interesting details which can be taken home for your own project. Yes, get an idea and adjust it to the needs of your own project, not copy it. Let\'s start!</p>', 'https://open-real-estate.info/en/blog/articles/how-building-owners-attract-customers-a-range-of-residential-complex-sites', '2017-08-28 21:29:57', 'open-real-estate.info', 1, 'en'),
(137, 'Building owner’s website', '<p>Flat choice depends on a building owner and making a solution about purchase takes long time, which sometimes lasts up to 6 month. A lot of factors have an impact on a buyer’s opinion.</p>', 'https://open-real-estate.info/en/blog/articles/building-owners-website', '2017-08-20 21:36:28', 'open-real-estate.info', 1, 'en'),
(138, 'The main principles of efficient homepage', '<p>Potential customers often start getting acquainted with your business in your homepage. Just imagine, a user estimates the site in 1/20th of a second!</p>', 'https://open-real-estate.info/en/blog/articles/main-principles-of-efficient-homepage', '2017-08-11 20:58:24', 'open-real-estate.info', 1, 'en'),
(139, 'Advantages of Open Real Estate. Part 2. Estate agency website', '<p>In the series of articles about Open Real Estate advantages we’re describing the advantages of particular features of our software. This time we are going to tell you about the set of functions which will be useful for an agency website.</p>', 'https://open-real-estate.info/en/blog/articles/advantages-of-open-real-estate-part2-estate-agency-website', '2017-08-03 03:25:46', 'open-real-estate.info', 1, 'en'),
(140, 'Create a Real Estate website with discounts up to 30%!', '<p>We announce summer bargain week! Discount on all versions on Open Real Estate CMS only for 5 days!</p>', 'https://open-real-estate.info/en/blog/news/discounts-up-to-30', '2017-07-24 23:40:07', 'open-real-estate.info', 1, 'en'),
(141, 'How to create a proper real estate listing', '<p>Real estate listing is one of the most important elements in a real estate website. It includes a detailed description of the object, its peculiarities and characteristics. Let\'s see what elements and characteristics must be in a listing to provide a client detailed information about the property they would like to rent or purchase.</p>', 'https://open-real-estate.info/en/blog/articles/how-to-create-proper-real-estate-listing', '2017-07-04 22:58:29', 'open-real-estate.info', 1, 'en'),
(142, 'Tips on preparing objects for a photoshoot', '<p>Listings about buying, selling and renting real estate are much more efficient when there are attached photos of objects. According to statistics listings with photos are seen 60% more often, so an agency is more likely to find a potential buyer. However, photos must be high quality, otherwise you may have counterproductive results.</p>', 'https://open-real-estate.info/en/blog/articles/tips-on-preparing-objects', '2017-06-22 23:13:17', 'open-real-estate.info', 1, 'en'),
(143, '20 selling features for a real estate website', '<p>There are a lot of tools of the trade you will use to increase the sales! Check, if you don’t use one of the ways described here – it high time to start using it as well. Test different solutions and make changes, implement something new and increase sales.</p>', 'https://open-real-estate.info/en/blog/articles/20-selling-features', '2017-06-14 03:37:41', 'open-real-estate.info', 1, 'en'),
(144, 'Google news: warning about an increase in spammy links', '<p>A search engine reminds that links purchase doesn’t longer work and makes a detrimental impact on the positions of your resource in search results.</p>', 'https://open-real-estate.info/en/blog/news/warning-about-spammy-inks', '2017-06-06 23:04:13', 'open-real-estate.info', 1, 'en'),
(145, 'Open Real Estate 1.20.1', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1201', '2017-06-03 05:59:08', 'open-real-estate.info', 1, 'en'),
(146, 'Как застройщики привлекают клиентов: подборка сайтов жилых комплексов', '<p>Без лишних слов – к делу. В сегодняшней статье – примеры сайтов с интересными деталями, которые можно взять на вооружение для собственного проекта. Да, взять на вооружение и адаптировать под свой проект – а не делать под копирку. Погнали!</p>', 'https://open-real-estate.info/ru/blog/articles/how-building-owners-attract-customers-a-range-of-residential-complex-sites', '2017-08-28 21:29:57', 'open-real-estate.info', 1, 'ru'),
(147, 'Позиционирование сайта застройщика', '<p>Выбор квартиры от застройщика и принятие решения о покупке занимает долгий срок, который иногда затягивается до 6 месяцев. На мнение покупателя влияет множество факторов, он пытается оценить свои риски, качество строительства, степень доверия к застройщику.</p>', 'https://open-real-estate.info/ru/blog/articles/building-owners-website', '2017-08-20 21:36:28', 'open-real-estate.info', 1, 'ru'),
(148, 'Принципы эффективной главной страницы', '<p>Потенциальные клиенты часто начинают знакомство с вашим бизнесом с главной страницы сайта. Только представьте – посетитель оценивает сайт и формирует о нем первое впечатление за 1/20 секунды!</p>', 'https://open-real-estate.info/ru/blog/articles/main-principles-of-efficient-homepage', '2017-08-11 20:58:24', 'open-real-estate.info', 1, 'ru'),
(149, 'Возможности Open Real Estate. Часть 2. Сайт агентства недвижимости', '<p>В серии материалов о возможностях Open Real Estate мы рассказываем об использовании определенного функционала нашего продукта в зависимости от целей и задач ресурса. На этот раз речь пойдет о популярном наборе опций, которые будут востребованы для сайта агентства.</p>', 'https://open-real-estate.info/ru/blog/articles/advantages-of-open-real-estate-part2-estate-agency-website', '2017-08-03 03:25:46', 'open-real-estate.info', 1, 'ru'),
(150, 'Сайт недвижимости на Open Real Estate со скидкой до 30%! ', '<p>Открываем неделю жарких летних скидок! Специальная цена на все версии Open Real Estate только в течение 5 дней!</p>', 'https://open-real-estate.info/ru/blog/news/discounts-up-to-30', '2017-07-24 23:40:07', 'open-real-estate.info', 1, 'ru'),
(151, 'Создаем грамотную карточку объекта недвижимости', '<p>Карточка объекта – один из самых важных элементов на сайте агентства недвижимости. Она содержит детальное описание объекта, его особенности и характеристики. Рассмотрим, какие элементы и характеристики должны быть в карточке, чтобы пользователь мог получить полную информацию об интересующем его жилье, которое он собирается снять или приобрести.</p>', 'https://open-real-estate.info/ru/blog/articles/how-to-create-proper-real-estate-listing', '2017-07-04 22:58:29', 'open-real-estate.info', 1, 'ru'),
(152, 'Советы по подготовке фотографий для объектов недвижимости', '<p>Объявления о купле-продаже или аренде недвижимости гораздо эффективнее, когда дополняются фотографиями объектов. По статистике, объявления с фото просматриваются на 60% чаще, соответственно, у агентства гораздо больше шансов найти своего покупателя. Однако снимки обязательно должны быть качественными, в ином случае вы рискуете получить противоположный результат.</p>', 'https://open-real-estate.info/ru/blog/articles/tips-on-preparing-objects', '2017-06-22 23:13:17', 'open-real-estate.info', 1, 'ru'),
(153, '20 продающих «фишек» для сайта недвижимости', '<p>Каких только инструментов не испробуешь, чтобы увеличить продажи! Проверьте, если какого-то из описанных нами способов на вашем сайте еще нет – действуйте. Тестируйте различные решения и вносите изменения, внедряйте новое и повышайте продажи.</p>', 'https://open-real-estate.info/ru/blog/articles/20-selling-features', '2017-06-14 03:37:41', 'open-real-estate.info', 1, 'ru'),
(154, 'Новости от Google: предупреждение о росте числа спамных ссылок', '<p>Очередное напоминание от поисковых систем о том, что закупка ссылок больше не работает и негативно влияет на позиции вашего ресурса.</p>', 'https://open-real-estate.info/ru/blog/news/warning-about-spammy-inks', '2017-06-06 23:04:13', 'open-real-estate.info', 1, 'ru'),
(155, 'Open Real Estate 1.20.1', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1201', '2017-06-03 02:59:08', 'open-real-estate.info', 1, 'ru'),
(156, 'Open Real Estate 1.21.0', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1210', '2017-09-05 03:38:28', 'open-real-estate.info', 1, 'en'),
(157, '10 ways of finding a client on the Internet for a realtor', '<p>E-trading platforms are changing standard are gradually changing standard ways of searching for customers in real estate field. Nowadays calls, advertisement in traditional mass media are going out of date and give way to new Internet opportunities.</p>', 'https://open-real-estate.info/en/blog/articles/10-ways-of-finding-a-client-on-the-internet-for-a-realtor', '2017-09-05 03:00:15', 'open-real-estate.info', 1, 'en'),
(158, 'Open Real Estate 1.21.0', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1210', '2017-09-05 03:38:28', 'open-real-estate.info', 1, 'ru'),
(159, '10 способов риелтору найти клиентов в интернете', '<p>Электронные площадки постепенно приходят на смену стандартным способам поиска клиентов в сфере недвижимости. Обзвон, реклама в традиционных СМИ постепенно отходят на второй план и уступают место возможностям интернета.</p>', 'https://open-real-estate.info/ru/blog/articles/10-ways-of-finding-a-client-on-the-internet-for-a-realtor', '2017-09-05 03:00:15', 'open-real-estate.info', 1, 'ru'),
(160, '13 video formats for a realtor’s or agency’s Youtube channel', '<p>We have already mentioned earlier that your own youtube channel will make you different from your rivals. Everybody makes photos of the objects, however, videos are shot not in every agency. That’s why it is insensible to lose such an opportunity to attract the audience’s attention, which according to the specialists’ predictions will become one of the most popular in 2018. We suggest using some video content formats which can be created for your own Youtube channel.</p>', 'https://open-real-estate.info/en/blog/articles/13-video-formats-for-a-realtor', '2018-02-14 03:32:09', 'open-real-estate.info', 1, 'en'),
(161, 'Open Real Estate prices decrease! Open Real Estate PRO only for 0,029 BTC*!', '<p>Cryptocurrecny drops, while our discounts are growing up!</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-prices-decrease', '2018-01-19 05:59:39', 'open-real-estate.info', 1, 'en'),
(162, 'How to optimize the real estate website for search systems', '<p>Real estate is highly competitive industry, that’s why to promote your business  online you need to use as many channels as possible, including organic results. In this article we will tell you about the peculiarities of site optimization and how to compete with popular aggregators.</p>', 'https://open-real-estate.info/en/blog/articles/how-to-optimize-real-estate-website', '2018-01-11 03:17:11', 'open-real-estate.info', 1, 'en'),
(163, 'The team of developers of Open Real Estate congratulates you with Happy New year!', '<p style=\"color: #ff0000;\"><strong>Dear friends!</strong></p><p>Only 3 days left until the New year, we are glad to join New Year greetings!</p>\n<p>We wish you success in all your beginnings, breakthroughs and new heights in business, love, health, balance and happiness!\nWe wish your projects development, increase of traffic, high conversions and more sales.</p>', 'https://open-real-estate.info/en/blog/news/happy-new-year-2018', '2017-12-28 06:21:28', 'open-real-estate.info', 1, 'en'),
(164, 'New Year Sale 2018: ready CMS for real estate website with 18% discount', '<p>MonoRay Studio wishes you Merry Christmas and a Happy new year and gives presents to everybody. Hurry up to purchase our software with an unbelievable 18% discount only from the 12th to the 27th of December 2017!</p>\n<table><tr><td class=\"ore-column-buttons\"><a class=\"download download-buy-offline\" href=\"https://open-real-estate.info/en/contact-us\" target=\"_blank\">Order</a></td><td class=\"ore-column-buttons\"><a class=\"download download-buy-online\" href=\"https://open-real-estate.info/en/buy-2\"  target=\"_blank\">Buy online</a></td></tr></table>', 'https://open-real-estate.info/en/blog/news/new-year-sale-2018', '2017-12-12 04:54:29', 'open-real-estate.info', 1, 'en'),
(165, 'Open Real Estate 1.22.2', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1222', '2017-11-21 07:24:27', 'open-real-estate.info', 1, 'en'),
(166, 'Open Real Estate 1.22.1', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1221', '2017-11-03 06:55:45', 'open-real-estate.info', 1, 'en'),
(167, '10 most important elements for a real estate website', '<p>We will tell you about 10 essential elements which should be present in every modern real estate website.</p>', 'https://open-real-estate.info/en/blog/articles/10-elements-for-real-estate-website', '2017-10-31 02:39:44', 'open-real-estate.info', 1, 'en'),
(168, 'How to promote landing pages', '<p>Landing page is a target page, its main task is to inspire a user to complete a particular step: buy, subscribe, fill in an application form. Usually such pages are created to attract advertising traffic, when you promote a particular product or a service.</p>', 'https://open-real-estate.info/en/blog/articles/how-to-promote-landing-pages', '2017-10-25 07:32:21', 'open-real-estate.info', 1, 'en'),
(169, 'Open Real Estate 1.22.0', '<p>A new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a> was released.</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-1220', '2017-10-24 01:50:38', 'open-real-estate.info', 1, 'en'),
(170, 'How to sell property with video', '<p>Video content has become a popular way for business promotion long ago, that’s why it will be a drawback not to use this channel for selling real estate. Moreover, video opportunities in this field are even greater comparing to photos and especially text description.</p>\n\n<p>So why does an agency need a video for selling objects?</p>', 'https://open-real-estate.info/en/blog/articles/how-to-sell-property-with-video', '2017-10-12 02:15:22', 'open-real-estate.info', 1, 'en'),
(171, 'New Yandex algorithm “Korolev”', '<p>Yandex presented new range algorithm “Korolev” on August 22, which is based on the neuronet principles.</p>', 'https://open-real-estate.info/en/blog/news/yandex-algorithm-korolev', '2017-09-30 05:49:02', 'open-real-estate.info', 1, 'en'),
(172, 'Principles of efficient SMM in real estate', '<p>Social networking services are so quickly developing nowadays as they can even become a replacement for a website. In any group or community it is possible to put your goods and services, place application form and write a private message</p>', 'https://open-real-estate.info/en/blog/articles/efficient-smm-in-real-estate', '2017-09-28 00:17:51', 'open-real-estate.info', 1, 'en'),
(173, '5 reasons to start sending newsletters for a real estate agency or a realtor', '<p>High quality newsletters may become very efficient for both agents and private realtors. There are some reasons why</p>', 'https://open-real-estate.info/en/blog/articles/5-reasons-to-start-sending-newsletters', '2017-09-18 07:24:01', 'open-real-estate.info', 1, 'en'),
(174, 'Open Real Estate CMS 1.21.1', '<p>\n	The new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1211', '2017-09-17 02:33:25', 'open-real-estate.info', 1, 'en'),
(175, '13 форматов видео для Youtube-канала риелтора или агентства', '<p>Мы уже писали о том, что наличие Youtube-канала выгодно выделит вас среди конкурентов. Фото своих объектов делают все, а видео снимают далеко не в каждом агентстве. Поэтому будет неразумно упустить из виду этот популярный канал для привлечения внимания аудитории, который по прогнозам специалистов по продвижению станет одним из самых популярных в 2018 году. Предлагаем несколько форматов видеоконтента, который можно создавать для собственного Youtube-канала.</p>', 'https://open-real-estate.info/ru/blog/articles/13-video-formats-for-a-realtor', '2018-02-14 03:32:09', 'open-real-estate.info', 1, 'ru'),
(176, 'Обвал цен Open Real Estate! Open Real Estate PRO всего за 0,0257 BTC*!', '<p>Криптовалюта падает в цене, а наши скидки только растут!</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-prices-decrease', '2018-01-19 05:59:39', 'open-real-estate.info', 1, 'ru'),
(177, 'Как оптимизировать сайт недвижимости для поисковых систем', '<p>Недвижимость – это высококонкурентная тематика, поэтому для продвижения своего бизнеса в сети нужно использовать максимум возможных каналов, в том числе привлекать трафик из органической выдачи поисковых систем. В этой статье мы расскажем об особенностях оптимизации сайтов недвижимости и о том, как можно конкурировать с популярными агрегаторами.</p>', 'https://open-real-estate.info/ru/blog/articles/how-to-optimize-real-estate-website', '2018-01-11 03:17:11', 'open-real-estate.info', 1, 'ru'),
(178, 'Команда разработчиков Open Real Estate поздравляет с Новым годом! ', '<p style=\"color: #ff0000;\"><strong>Дорогие друзья!</strong></p><p>Осталось всего 3 дня до Нового года, и мы рады присоединиться к веренице поздравлений!</p>\n<p>Желаем вам успехов в делах, карьерных взлетов, стремительных прорывов и новых высот в бизнесе, любви, здоровья, гармонии и безграничного счастья!</p>', 'https://open-real-estate.info/ru/blog/news/happy-new-year-2018', '2017-12-28 06:21:28', 'open-real-estate.info', 1, 'ru'),
(179, 'Новогодняя распродажа 2018: готовый скрипт сайта недвижимости со скидкой 18%', '<p>Студия MonoRay поздравляет Вас с наступающим 2018 годом и дарит всем Новогодние подарки, только с 12 по 27 декабря 2017 года успейте приобрести наш продукт Open Real Estate CMS с небывалой скидкой 18%!</p>\n<table><tr><td class=\"ore-column-buttons\"><a class=\"download download-buy-offline\" href=\"https://open-real-estate.info/ru/contact-us\" target=\"_blank\">Оставить заявку</a></td><td class=\"ore-column-buttons\"><a class=\"download download-buy-online\" href=\"https://open-real-estate.info/ru/buy-2\"  target=\"_blank\">Купить онлайн</a></td></tr></table>', 'https://open-real-estate.info/ru/blog/news/new-year-sale-2018', '2017-12-12 04:54:29', 'open-real-estate.info', 1, 'ru'),
(180, 'Open Real Estate 1.22.2', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1222', '2017-11-21 07:24:27', 'open-real-estate.info', 1, 'ru'),
(181, 'Open Real Estate 1.22.1', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1221', '2017-11-03 06:55:45', 'open-real-estate.info', 1, 'ru'),
(182, '10 важнейших элементов для сайта по продаже недвижимости', '<p>В этой статье мы рассмотрим 10 важнейших элементов, которые должны присутствовать на любом современном сайте по продаже недвижимости.</p>', 'https://open-real-estate.info/ru/blog/articles/10-elements-for-real-estate-website', '2017-10-31 02:39:44', 'open-real-estate.info', 1, 'ru'),
(183, 'Как продвигать лэндинги', '<p>Landing page – это целевая страница, основная задача которой побудить пользователя совершить определенное действие – купить, подписаться, заполнить заявку. Обычно такие страницы создаются для привлечения рекламного трафика, когда вы продвигаете определенный продукт или услугу.</p> ', 'https://open-real-estate.info/ru/blog/articles/how-to-promote-landing-pages', '2017-10-25 07:32:21', 'open-real-estate.info', 1, 'ru'),
(184, 'Open Real Estate 1.22.0', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-1220', '2017-10-24 01:50:38', 'open-real-estate.info', 1, 'ru'),
(185, 'Как продавать недвижимость при помощи видео', '<p>Видео-контент давно стал популярным способом продвижения бизнеса, поэтому не задействовать этот канал для продажи недвижимости будет упущением. Тем более, что возможности видео в этой сфере гораздо больше по сравнению с фотосъемкой и, тем более, текстовым описанием объектов.</p>\n\n<p>Итак, зачем агентству нужно видео для продажи объектов?</p>', 'https://open-real-estate.info/ru/blog/articles/how-to-sell-property-with-video', '2017-10-12 02:15:22', 'open-real-estate.info', 1, 'ru'),
(186, 'Новый алгоритм Яндекса «Королёв»', '<p>22 августа Яндекс представил новый алгоритм ранжирования «Королёв», который основывается на принципах нейросетей.</p>', 'https://open-real-estate.info/ru/blog/news/yandex-algorithm-korolev', '2017-09-30 05:49:02', 'open-real-estate.info', 1, 'ru'),
(187, 'Принципы эффективного SMM в недвижимости', '<p>Социальные сети настолько активно развиваются, что вполне могут служить даже заменой сайту. В любой группе можно разместить товары, форму заявки, возможность написать личные сообщения</p>', 'https://open-real-estate.info/ru/blog/articles/efficient-smm-in-real-estate', '2017-09-28 00:17:51', 'open-real-estate.info', 1, 'ru'),
(188, '5 причин для агентства или риелтора вести рассылку', '<p>Качественная рассылка может оказаться очень действенной как для агентств, так и для частных риелторов. И вот почему</p>', 'https://open-real-estate.info/ru/blog/articles/5-reasons-to-start-sending-newsletters', '2017-09-18 07:24:01', 'open-real-estate.info', 1, 'ru'),
(189, 'Open Real Estate CMS 1.21.1', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1211', '2017-09-16 23:33:25', 'open-real-estate.info', 1, 'ru'),
(190, 'Open Real Estate 1.23.0', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1230', '2018-03-13 02:03:28', 'open-real-estate.info', 1, 'en'),
(191, 'Help system configuring \"Property types\"', '	<p>\nThe functionality of convenient addition of rooms in hotels has appeared in the new Open Real Estate version. An additional tab \"Rooms\" was developed in the editing form of hotels. The owner of an object can see all hotel rooms and add them as well in this tab in a tabular style.\n	</p>', 'https://open-real-estate.info/en/blog/instructions/configuring-property-types', '2018-03-13 00:31:51', 'open-real-estate.info', 1, 'en'),
(192, 'Open Real Estate 1.23.0', '<p>\n	Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1230', '2018-03-13 02:03:28', 'open-real-estate.info', 1, 'ru'),
(193, 'Настройка справочника \"Тип недвижимости\"', '	<p>\nВ новой версии Open Real Estate появилась возможность удобного добавления номеров в гостиницы. В форме редактирования гостиниц появилась дополнительная вкладка номера. В данной вкладке в табличном виде владелец объекта может видеть все номера гостиницы а также добавлять их.\n	</p>', 'https://open-real-estate.info/ru/blog/instructions/configuring-property-types', '2018-03-12 21:31:51', 'open-real-estate.info', 1, 'ru'),
(194, 'Open Real Estate 1.23.1', '<p>\nThe new version of CMS&nbsp;<a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>&nbsp;has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1231', '2018-03-27 02:36:14', 'open-real-estate.info', 1, 'en'),
(195, 'Open Real Estate 1.23.1', '<p>\nВыпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1231', '2018-03-26 23:36:14', 'open-real-estate.info', 1, 'ru'),
(196, 'Series of popular questions about our web software', '<p><strong>May I make changes in a product myself?</strong></p><p>Sure, Open Real Estate CMS has the open source code! If you have necessary skills in programming, you can customize the product at its own discretion.</p>', 'https://open-real-estate.info/en/blog/articles/series-of-popular-questions-about-our-web-software', '2018-04-23 05:30:00', 'open-real-estate.info', 1, 'en'),
(197, 'Ready-to-use Real Estate CMS with discounts up to 20%!', '<p>We announce spring bargain week! Discount on Open Real Estate CMS only for 7 days!</p>', 'https://open-real-estate.info/en/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-20', '2018-04-17 02:56:26', 'open-real-estate.info', 1, 'en'),
(198, 'Work with real estate in social networks', '<p>Social media for business is a mean of quick communication between a company and a customer, way of detecting the needs of potential buyers, increasing their knowledge about the company occupation and increasing loyalty to the brand.</p>', 'https://open-real-estate.info/en/blog/articles/work-with-real-estate-in-social-networks', '2018-04-10 12:05:12', 'open-real-estate.info', 1, 'en'),
(199, 'Серия популярных вопросов о нашем движке', '<p><strong>Могу ли я самостоятельно вносить изменения в продукт?</strong></p><p>Да, у Open Real Estate CMS открытый исходный код, и если вы обладаете необходимыми навыками в программировании, можете дорабатывать продукт на свое усмотрение.</p>', 'https://open-real-estate.info/ru/blog/articles/series-of-popular-questions-about-our-web-software', '2018-04-23 05:30:00', 'open-real-estate.info', 1, 'ru'),
(200, 'Готовый скрипт недвижимости Open Real Estate CMS со скидкой до 20%!', '<p>Открываем неделю жарких весенних скидок! Специальная цена на Open Real Estate только в течение 7 дней!</p>', 'https://open-real-estate.info/ru/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-20', '2018-04-17 02:56:26', 'open-real-estate.info', 1, 'ru'),
(201, 'Работа с недвижимостью в социальных сетях', '<p>Социальные медиа для бизнеса – это средство оперативной коммуникации между компанией и клиентом, способ выявления потребностей потенциальных покупателей, увеличения их осведомленности о деятельности фирмы и повышения лояльности к бренду.</p>', 'https://open-real-estate.info/ru/blog/articles/work-with-real-estate-in-social-networks', '2018-04-10 09:05:12', 'open-real-estate.info', 1, 'ru'),
(202, 'Importing of listings on the website in Yandex.Realty xml format', '<p>The module of listings importing in Yandex.Realty xml format on your website is available for the version 1.25.0 and higher.</p>', 'https://open-real-estate.info/en/blog/news/import-listings-on-website-in-yandex-realty-xml-format', '2018-06-14 06:07:11', 'open-real-estate.info', 1, 'en'),
(203, 'Theme “Basis” and Open Real Estate 1.24.0', '<p>The new version of CMS <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate</a> has been released. The main innovation of this version is theme <a href=\"https://demo-pro.open-real-estate.info?template=basis\" target=\"_blank\">“Basis”</a>. <a href=\"https://demo-pro.open-real-estate.info/?template=basis\" target=\"_blank\">“Basis”</a> has a design unique developed specially for our software.  It built using Bootstrap-3 front-end framework and answers to the modern demands.</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1240', '2018-06-07 22:04:18', 'open-real-estate.info', 1, 'en'),
(204, 'XML-загрузка объявлений на сайт в формате Яндекс.Недвижимость', '<p>Для версий 1.25.0 и выше доступен модуль загрузки объявлений в формате Яндекс.Недвижимости на ваш сайт.</p>', 'https://open-real-estate.info/ru/blog/news/import-listings-on-website-in-yandex-realty-xml-format', '2018-06-14 06:07:11', 'open-real-estate.info', 1, 'ru'),
(205, 'Тема \"Basis\" и Open Real Estate 1.24.0', '<p>Выпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>. Основным новшеством этой версии стала тема оформления <a href=\"https://demo-pro.open-real-estate.info/ru?template=basis\" target=\"_blank\">\"Basis\"</a>. <a href=\"https://demo-pro.open-real-estate.info/ru?template=basis\" target=\"_blank\">\"Basis\"</a> обладает уникальным дизайном, разработанным специально для нашего продукта, и построена с использованием frontend-фреймворка Bootstrap-3, благодаря чему удовлетворяет всем современным требованиям.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1240', '2018-06-07 22:04:18', 'open-real-estate.info', 1, 'ru'),
(206, 'Open Real Estate 1.25.1', '<p>\nThe new version of readymade php script Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1251', '2018-07-08 06:57:04', 'open-real-estate.info', 1, 'en'),
(207, 'Open Real Estate and the new bright theme Basis with a discount until 1 July!', '<p>\nThe latest version Open Real Estate 1.25.0 has been released with a refresh template \"Basis\". This theme can truly be called as stylish, up-to-date and functional. Beyond that this version of the system includes new widgets on the main screen, listings importing in Yandex.Realty format. Here the software is now, hot out of the oven — is cheaper for the first buyers!\n</p>', 'https://open-real-estate.info/en/blog/news/summer-sale', '2018-06-22 05:09:44', 'open-real-estate.info', 1, 'en'),
(208, 'Open Real Estate 1.25.1', '<p>\nВыпущена новая версия движка для агентства недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1251', '2018-07-08 06:57:04', 'open-real-estate.info', 1, 'ru'),
(209, 'Open Real Estate и новая яркая тема Basis ― со скидкой до 1 июля!', '<p>\nМы выпустили новую версию Open Real Estate 1.25 с адаптивным шаблоном \"Basis\" ― стильным, современным и функциональным. Помимо этого, последняя версия системы включает новые виджеты на главном экране, импорт объявлений в формате Яндекс недвижимость. Горячий «прямо из печки» движок — дешевле для первых покупателей!\n</p>', 'https://open-real-estate.info/ru/blog/news/summer-sale', '2018-06-22 02:09:44', 'open-real-estate.info', 1, 'ru'),
(210, 'Open Real Estate 1.25.2', '<p>\nThe new version of readymade php script Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1252', '2018-08-14 22:11:55', 'open-real-estate.info', 1, 'en'),
(211, 'Open Real Estate 1.25.2', '<p>\nВыпущена новая версия движка для агентства недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1252', '2018-08-14 22:11:55', 'open-real-estate.info', 1, 'ru'),
(212, 'Open Real Estate 1.25.3', '<p>\nThe new version of realty php script Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1253', '2018-08-24 08:50:09', 'open-real-estate.info', 1, 'en'),
(213, 'Open Real Estate 1.25.3', '<p>\nВыпущена новая версия готового скрипта недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1253', '2018-08-24 05:50:09', 'open-real-estate.info', 1, 'ru'),
(214, 'Open Real Estate 1.25.4', '<p>\nWe corrected minor errors and also error during the website work under PHP 7.2 in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1254', '2018-09-13 00:41:08', 'open-real-estate.info', 1, 'en'),
(215, 'Open Real Estate 1.25.4', '<p>\nВ новой версии мы исправили незначительные ошибки, а также ошибку при работе сайта под PHP 7.2.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1254', '2018-09-12 21:41:08', 'open-real-estate.info', 1, 'ru'),
(216, 'Open Real Estate 1.25.6', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1256', '2018-10-13 09:58:19', 'open-real-estate.info', 1, 'en'),
(217, 'Open Real Estate 1.25.5', '<p>\nThe new version of realty php script Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1255', '2018-10-06 00:23:32', 'open-real-estate.info', 1, 'en'),
(218, 'Open Real Estate 1.25.6', '<p>\nВ новой версии мы исправили незначительные ошибки\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1256', '2018-10-13 06:58:19', 'open-real-estate.info', 1, 'ru'),
(219, 'Open Real Estate 1.25.5', '<p>\nВыпущена новая версия готового скрипта недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1255', '2018-10-05 21:23:32', 'open-real-estate.info', 1, 'ru'),
(220, 'Customizing Themes \"Atlas\" and \"Basis\"', '<ul>\n<li>How to change the name of the site;</li>\n<li>Change the logo in the Theme \"Atlas\";</li>\n<li>How to change links in the top menu for the Atlas template;</li>\n<li>How to change links in the top menu for the template Basis;</li>\n<li>Change the bottom of the site (footer) in the Atlas template;</li>\n<li>Change the bottom of the site (footer) in the Theme \"Basis\";</li>\n<li>View listing: how to remove the text \"Is it your listing? Would you like to rent out a property quicker? apply paid services\" in Atlas and Basis Themes.</li>\n</ul>', 'https://open-real-estate.info/en/blog/instructions/customizing-themes-atlas-basis-open-real-estate', '2018-11-20 00:57:52', 'open-real-estate.info', 1, 'en'),
(221, 'Settings the Theme “Basis” ', '<p>In this article we will consider how to change logo, customize marker on the contact map, remove the side menu, swap columns.</p>', 'https://open-real-estate.info/en/blog/instructions/setting-theme-basis', '2018-10-24 22:03:15', 'open-real-estate.info', 1, 'en');
INSERT INTO `ore_gj_news_product` (`id`, `title`, `description`, `link`, `pubDate`, `author`, `is_show`, `lang`) VALUES
(222, 'Настройка тем оформления Atlas и Basis', '<ul>\n<li>Как поменять название сайта;</li>\n<li>Смена логотипа в теме Atlas;</li>\n<li>Как изменить ссылки в верхнем меню для шаблона Atlas;</li>\n<li>Как изменить ссылки в верхнем меню для шаблона Basis;</li>\n<li>Изменение нижней части сайта (футера) в шаблоне Atlas;</li>\n<li>Изменение нижней части сайта (футера) в теме оформления Basis;</li>\n<li>Просмотр объявления: как удалить текст \"Это Ваше объявление? Хотите продать быстрее? Попробуйте применить платные услуги\" в темах Atlas и Basis.</li>\n</ul>', 'https://open-real-estate.info/ru/blog/instructions/customizing-themes-atlas-basis-open-real-estate', '2018-11-19 18:57:52', 'open-real-estate.info', 1, 'ru'),
(223, 'Настройки темы Basis', '<p>В этой статье мы рассмотрим как изменить логотип, настроить метку на карте контактов, убрать боковое меню, поменять колонки местами.</p>', 'https://open-real-estate.info/ru/blog/instructions/setting-theme-basis', '2018-10-24 19:03:15', 'open-real-estate.info', 1, 'ru'),
(224, 'The team of developers of Open Real Estate congratulates you with Happy New Year!', '<p>The team of developers of Open Real Estate congratulates you with Happy New Year!The MonoRay team congratulates you with Happy New Year! </p>\n', 'https://open-real-estate.info/en/blog/news/happy-new-year-2019', '2018-12-28 23:33:19', 'open-real-estate.info', 1, 'en'),
(225, 'Settings the Theme “Basis”, Part 2', '<p>In this article we will consider the directory structure of the Theme Basis, settings of the home page and several widgets.</p>', 'https://open-real-estate.info/en/blog/instructions/setting-theme-basis-part2', '2018-12-27 00:36:04', 'open-real-estate.info', 1, 'en'),
(226, 'Команда разработчиков Open Real Estate поздравляет с Новым годом!', '<p>Команда разработчиков Open Real Estate поздравляет всех с наступающим Новым годом! \nКоллектив MonoRay поздравляет всех с наступающим Новым годом! </p>\n', 'https://open-real-estate.info/ru/blog/news/happy-new-year-2019', '2018-12-28 23:33:19', 'open-real-estate.info', 1, 'ru'),
(227, 'Настройка темы Basis, часть 2', '<p>В этой статье мы рассмотрим структуру директорий темы Basis, настройки главной страницы и нескольких виджетов.</p>', 'https://open-real-estate.info/ru/blog/instructions/setting-theme-basis-part2', '2018-12-27 00:36:04', 'open-real-estate.info', 1, 'ru'),
(228, 'Ready-to-use Real Estate CMS with discounts up to 25%!', '<p>Only from 9th-26th of January you can purchase Open Real Estate CMS with a great discount</p> \n', 'https://open-real-estate.info/en/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-25-january-2019', '2019-01-09 03:02:45', 'open-real-estate.info', 1, 'en'),
(229, 'Open Real Estate 1.27.0', '<p>\nThe new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate CMS</a> has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1270', '2019-01-07 02:01:22', 'open-real-estate.info', 1, 'en'),
(230, 'Готовый скрипт недвижимости Open Real Estate CMS со скидкой до 25%!', '<p>Только с 9 до 26 января Open Real Estate CMS можно приобрести с хорошей скидкой</p>\n', 'https://open-real-estate.info/ru/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-25-january-2019', '2019-01-09 00:02:45', 'open-real-estate.info', 1, 'ru'),
(231, 'Open Real Estate 1.27.0', '<p>\nВыпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1270', '2019-01-06 23:01:22', 'open-real-estate.info', 1, 'ru'),
(232, 'Open Real Estate 1.28.1', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1281', '2019-01-20 00:04:06', 'open-real-estate.info', 1, 'en'),
(233, 'Open Real Estate 1.28.0', '<p>\nThe new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate CMS</a> has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1280', '2019-01-16 09:27:47', 'open-real-estate.info', 1, 'en'),
(234, 'Open Real Estate 1.28.1', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1281', '2019-01-19 21:04:06', 'open-real-estate.info', 1, 'ru'),
(235, 'Open Real Estate 1.28.0', '<p>\nВыпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1280', '2019-01-16 06:27:47', 'open-real-estate.info', 1, 'ru'),
(236, 'Open Real Estate 1.28.2', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1282', '2019-01-31 02:06:51', 'open-real-estate.info', 1, 'en'),
(237, 'Open Real Estate 1.28.2', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1282', '2019-01-30 23:06:51', 'open-real-estate.info', 1, 'ru'),
(238, 'Open Real Estate 1.28.3', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1283', '2019-02-08 07:36:13', 'open-real-estate.info', 1, 'en'),
(239, 'Open Real Estate 1.28.3', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1283', '2019-02-08 07:36:13', 'open-real-estate.info', 1, 'ru'),
(240, 'The preview of the new design for Open Real Estate', '<p>In the near future we will release a new responsive design for CMS Open Real Estate.</p>', 'https://open-real-estate.info/en/blog/news/preview-of-the-new-design', '2019-06-24 07:18:43', 'open-real-estate.info', 1, 'en'),
(241, 'Open Real Estate 1.29.2', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1292', '2019-06-06 10:54:16', 'open-real-estate.info', 1, 'en'),
(242, 'Open Real Estate 1.29.1', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1291', '2019-05-10 11:31:15', 'open-real-estate.info', 1, 'en'),
(243, 'Create a page and display the listing widget in Open Real Estate using the code Yii', '<p>Today we’ll learn how easy to create a new page and add a listing widget with specific criteria. To do this, we need the Notepad ++ editor or any other code editor with utf-8 without bom encoding support. If you want to make all the improvements locally, then you will need a local web server, the Open Server is well suited for this - https://ospanel.io/\nIf you work with files on a hosting, then it is convenient to use FileZilla FTP client - https://filezilla-project.org/</p>\n', 'https://open-real-estate.info/en/blog/instructions/create-a-page-and-display-the-listing-widget-using-the-code-yii', '2019-04-29 10:58:21', 'open-real-estate.info', 1, 'en'),
(244, 'Spring discounts Open Real Estate!', '<p>From April 24 to 29 Open Real Estate CMS can be purchased with a discount <strong>30%</strong></p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-spring-discounts', '2019-04-24 01:13:18', 'open-real-estate.info', 1, 'en'),
(245, 'Open Real Estate 1.29.0', '<p>\nThe new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate CMS</a> has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1290', '2019-03-17 01:29:20', 'open-real-estate.info', 1, 'en'),
(246, 'Анонс нового дизайна для Open Real Estate', '<p>В ближайшее время выйдет новый адаптивный дизайн для CMS Open Real Estate.</p>\n', 'https://open-real-estate.info/ru/blog/news/preview-of-the-new-design', '2019-06-24 07:18:43', 'open-real-estate.info', 1, 'ru'),
(247, 'Open Real Estate 1.29.2', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1292', '2019-06-06 10:54:16', 'open-real-estate.info', 1, 'ru'),
(248, 'Open Real Estate 1.29.1', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1291', '2019-05-10 11:31:15', 'open-real-estate.info', 1, 'ru'),
(249, 'Создание страницы и вывод виджета объявлений в Open Real Estate', '<p>Сегодня мы узнаем, как просто создать новую страницу и добавить туда виджет объявлений с определенными критериями. Для этого нам потребуется редактор notepad++ или любой другой редактор кода с поддержкой кодировки \"UTF-8 без BOM\". Если вы хотите делать все доработки локально, то понадобится локальный веб-сервер, для этого хорошо подходит <a href=\"https://ospanel.io/ \">Open Server</a>.\nЕсли вы работаете с файлами на хостинге, то удобно использовать FTP клиент <a href=\"https://filezilla-project.org/\">FileZilla</a> </p>\n<p>Также вам понадобиться любая версия <a href=\"https://open-real-estate.info/ru/download-open-real-estate\">CMS Open Real Estate</a>\n</p>', 'https://open-real-estate.info/ru/blog/instructions/create-a-page-and-display-the-listing-widget-using-the-code-yii', '2019-04-29 10:58:21', 'open-real-estate.info', 1, 'ru'),
(250, 'Весенние скидки на Open Real Estate!', '<p>Только с 24 до 29 апреля Open Real Estate CMS можно приобрести со скидкой <strong>30%</strong></p>\n', 'https://open-real-estate.info/ru/blog/news/open-real-estate-spring-discounts', '2019-04-24 01:13:18', 'open-real-estate.info', 1, 'ru'),
(251, 'Open Real Estate 1.29.0', '<p>\nВыпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1290', '2019-03-16 22:29:20', 'open-real-estate.info', 1, 'ru'),
(252, 'Dolphin theme setting', '<p>A new design theme Dolphin for Open Real Estate CMS released in 2019. The theme based on the CSS framework Bootstrap 3. It is adaptive and looks good as on a smartphone so on a wide monitor. There is support for RTL languages. The theme stands out of other ones some functions and we will discuss it below.</p>', 'https://open-real-estate.info/en/blog/instructions/dolphin-theme-setting', '2020-02-27 01:47:12', 'open-real-estate.info', 1, 'en'),
(253, 'Black Friday: discounts up to 50%', '<p> Discounts on all editions:<br/>\n<br/>\nOpen Real Estate Basic  -50%<br/> \nOpen Real Estate PRO  -40% <br/>\nOpen Real Estate Ultimate  -30% </p>\n<p>Don\'t miss your chance — launch the website with Open Real Estate for half the price!</p>\n<p>Discounts aren\'t cumulative with other special offers.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-black-friday-2019-discounts', '2019-11-29 02:59:24', 'open-real-estate.info', 1, 'en'),
(254, 'Open Real Estate 1.30.3', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1303', '2019-11-08 08:40:30', 'open-real-estate.info', 1, 'en'),
(255, 'Open Real Estate 1.30.2 - Improvements for system security', '<p>\nImprovements for system security made in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1302', '2019-09-12 04:30:16', 'open-real-estate.info', 1, 'en'),
(256, 'Open Real Estate 1.30.1', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1301', '2019-08-30 12:06:49', 'open-real-estate.info', 1, 'en'),
(257, 'The Dolphin theme in Open Real Estate Pro now!', '<p>We are pleased to inform you that a new <a href=\"https://demo-pro.open-real-estate.info/en?template=dolphin\">Dolphin theme</a> is in the Pro version!\nBuying Open real Estate Pro, you can choose any designs of the 4 to use: Classic, Atlas, Basis or Dolphin!</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-pro-dolphin', '2019-08-19 02:44:48', 'open-real-estate.info', 1, 'en'),
(258, 'Version 1.30.0 and the new theme “Dolphin”', '<p>We are glad to announce a new unique design for CMS Open Real Estate – <a href=\"https://demo-pro.open-real-estate.info/ru?template=dolphin\" target=\"_blank\">this theme is “Dolphin”</a>. It looks great on modern widescreen monitors and mobile devices.</p>\n', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1300-dolphin', '2019-08-07 04:38:26', 'open-real-estate.info', 1, 'en'),
(259, 'Open Real Estate 1.29.3', '<p>\nThe new version of <a href=\"https://open-real-estate.info/en/download-open-real-estate\" target=\"_blank\">Open Real Estate CMS</a> has been released.</p>\n<p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1293', '2019-07-26 13:23:32', 'open-real-estate.info', 1, 'en'),
(260, 'Настройка темы Dolphin', '<p>В 2019 году вышла новая тема оформления для Open Real Estate CMS под названием Dolphin. Тема базируется на css framework Bootstrap 3. Она адаптивная, хорошо выглядит как на смартфоне, так и на широком мониторе. Присутствует поддержка RTL языков. Тема отличается некоторыми особенностями о которых мы поговорим ниже.</p>', 'https://open-real-estate.info/ru/blog/instructions/dolphin-theme-setting', '2020-02-27 01:47:12', 'open-real-estate.info', 1, 'ru'),
(261, 'Чёрная Пятница: скидки до 50%', '<p>Только 2 дня, 29-30 ноября 2019 г. Горящая распродажа Open Real Estate!</p>\n<p> Скидки на ВСЕ редакции:<br/>\n<br/>\nOpen Real Estate Basic  -50%<br/> \nOpen Real Estate PRO  -40% <br/>\nOpen Real Estate Ultimate  -30% </p>\n<p>Не упусти шанс — запусти сайт на Open Real Estate вдвое дешевле!</p>\n<p>Скидки не суммируются с другими акциями.</p>\n', 'https://open-real-estate.info/ru/blog/news/open-real-estate-black-friday-2019-discounts', '2019-11-29 02:59:24', 'open-real-estate.info', 1, 'ru'),
(262, 'Open Real Estate 1.30.3', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1303', '2019-11-08 08:40:30', 'open-real-estate.info', 1, 'ru'),
(263, 'Open Real Estate 1.30.2. Исправления для безопасности системы', '<p>\nВ новой версии внесены исправления для безопасности системы.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1302', '2019-09-12 04:30:16', 'open-real-estate.info', 1, 'ru'),
(264, 'Open Real Estate 1.30.1', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1301', '2019-08-30 12:06:49', 'open-real-estate.info', 1, 'ru'),
(265, 'Тема оформления \"Dolphin\" теперь и в Open Real Estate Pro', '<p>Мы включили нашу новую <a href=\"https://demo-pro.open-real-estate.info/ru?template=dolphin\">тему оформления \"Dolphin\"</a> в состав Pro-версии Open real Estate!\nПриобретая Open real Estate Pro, вы можете выбрать какой из 4 дизайнов сайта использовать: Classic, Atlas, Basis или Dolphin!</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-pro-dolphin', '2019-08-19 02:44:48', 'open-real-estate.info', 1, 'ru'),
(266, 'Версия 1.30.0 и новая тема оформления “Dolphin”', '<p>Рады сообщить Вам о выходе нового уникального дизайна для CMS Open Real Estate - <a href=\"https://demo-pro.open-real-estate.info/ru?template=dolphin\" target=\"_blank\">тема оформления “Dolphin”</a>. Тема отлично выглядит на современных широкоформатных мониторах и мобильных устройствах.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1300-dolphin', '2019-08-07 04:38:26', 'open-real-estate.info', 1, 'ru'),
(267, 'Open Real Estate 1.29.3', '<p>\nВыпущена новая версия готового сайта недвижимости <a href=\"https://open-real-estate.info/ru/download-open-real-estate\" target=\"_blank\">Open Real Estate</a>.</p>\n<p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1293', '2019-07-26 10:23:32', 'open-real-estate.info', 1, 'ru'),
(268, 'Open Real Estate 1.32.0', '<p>Now Atlas design theme is added in the Free version some improvements</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1320', '2020-04-05 08:35:54', 'open-real-estate.info', 1, 'en'),
(269, 'Open Real Estate 1.32.0', '<p>В новой версии мы добавили тема \"Атлас\" и несколько полезных изменений.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1320', '2020-04-05 08:35:54', 'open-real-estate.info', 1, 'ru'),
(270, 'Open Real Estate 1.32.1', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1321', '2020-04-17 00:49:11', 'open-real-estate.info', 1, 'en'),
(271, 'New features in Open Real Estate CMS', '<p> In new version of Open Real Estate 1.32.0 appeared the additional settings and functions. </p>\n<ul>\n<li>changes with the display of listings ID;</li>\n<li>in the settings for \"Located in\" properties of the listings;</li>\n<li>URL search is changed;</li>\n<li>a new feature is the capability to make disable the visual editor for the \"Description\" field;</li>\n<li>the slider settings are modified.</li>\n</ul>\n<p>More details are in the full news version.</p>', 'https://open-real-estate.info/en/blog/news/new-features-in-open-real-estate-cms', '2020-04-08 05:20:01', 'open-real-estate.info', 1, 'en'),
(272, 'Open Real Estate 1.32.1', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1321', '2020-04-17 00:49:11', 'open-real-estate.info', 1, 'ru'),
(273, 'Новые функции в Open Real Estate CMS', '<p>В новой версии Open Real Estate 1.32.0 появились дополнительные настройки и функции.</p>\n<ul>\n<li>изменения касающиеся вывода ID объявления;</li>\n<li>перемены в настройках свойств \"Находится в\" у объявлений;</li>\n<li>изменился также URL поиск;</li>\n<li>новая функция - возможность отключать визуальный редактор для поля \"Описание\";</li>\n<li>изменена настройка слайдера.</li>\n</ul>\n<p>Подробнее в полной новости.</p>', 'https://open-real-estate.info/ru/blog/news/new-features-in-open-real-estate-cms', '2020-04-08 02:20:01', 'open-real-estate.info', 1, 'ru'),
(274, '11.11 - 20.11  Great discount days', '', 'https://open-real-estate.info/en/blog/news/open-real-estate-grea-discount-days-11-11-2020', '2020-11-11 01:17:43', 'open-real-estate.info', 1, 'en'),
(275, 'Open Real Estate 1.33.0', '<p> In new version of Open Real Estate 1.32.0 appeared the additional settings and functions. </p>\n<ul>\n<li>settings for the Best listings widget;</li>\n<li>the capability to download images appeared for \"Information Pages\" in Popular Destinations widget;</li>\n<li>on the video tab, it\'s enough to specify the youtube URL for video addition.</li>\n</ul>\n<p>More details are in the full news version.</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1330', '2020-07-14 08:34:36', 'open-real-estate.info', 1, 'en'),
(276, 'Open Real Estate CMS 1.32.2', '<p>\nWe corrected minor errors in the new version.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1322', '2020-05-06 09:25:48', 'open-real-estate.info', 1, 'en'),
(277, 'Большие дни скидок 11.11 - 20.11', '', 'https://open-real-estate.info/ru/blog/news/open-real-estate-grea-discount-days-11-11-2020', '2020-11-11 01:17:43', 'open-real-estate.info', 1, 'ru'),
(278, 'Open Real Estate 1.33.0', '<p>В новой версии Open Real Estate 1.33.0 появились дополнительные настройки и функции.</p>\n<ul>\n<li>настройки для виджета \"Лучшие варианты\";</li>\n<li>для виджета \"Популярные направления\" появилась возможность загрузки картинок для \"Информационных страниц\";</li>\n<li>на вкладке видео, достаточно указать url youtube видео для добавления.</li>\n</ul>\n<p>Подробнее в полной новости.</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1330', '2020-07-14 08:34:36', 'open-real-estate.info', 1, 'ru'),
(279, 'Open Real Estate CMS 1.32.2', '<p>\nВ новой версии мы исправили незначительные ошибки.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1322', '2020-05-06 09:25:48', 'open-real-estate.info', 1, 'ru'),
(280, 'Happy Holidays!', '<p>To our clients and friends, we at Monoray extend our best wishes for a joyous holiday season and a prosperous new year. </p>\n<p>Our team wishing you all the best! May all the dreams for the coming year be fulfilled. Happiness, Prosperity, and Success!</p>\n<p><strong>Merry Christmas and Happy New Year to everyone!</strong></p>', 'https://open-real-estate.info/en/blog/news/happy-new-year-2021', '2020-12-24 04:17:46', 'open-real-estate.info', 1, 'en'),
(281, 'С наступающим Новым Годом и Рождеством!', '<p>Наша команда поздравляет Вас с наступающими праздниками!</p>\n<p>Пусть этот Новый год откроет яркие перспективы, а усилия непременно приведут Вас к достижению поставленных целей. Счастья, процветания и успехов! </p>\n<p><strong>Наилучшие пожелания в Новом году!</strong></p>\n', 'https://open-real-estate.info/ru/blog/news/happy-new-year-2021', '2020-12-24 04:17:46', 'open-real-estate.info', 1, 'ru'),
(282, 'Open Real Estate 1.35.0', '<p>\nThe new version of Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1350', '2021-08-30 06:52:35', 'open-real-estate.info', 1, 'en'),
(283, 'Open Real Estate 1.34.0', '<p>\nThe new version of Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1340', '2021-01-12 05:55:56', 'open-real-estate.info', 1, 'en'),
(284, 'Open Real Estate 1.35.0', '<p>\nВыпущена новая версия движка недвижимости Open Real Estate.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1350', '2021-08-30 06:52:35', 'open-real-estate.info', 1, 'ru'),
(285, 'Open Real Estate 1.34.0', '<p>\nВыпущена новая версия движка недвижимости Open Real Estate.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1340', '2021-01-12 05:55:56', 'open-real-estate.info', 1, 'ru'),
(286, 'Ready-to-use Real Estate CMS with discounts up to 15%!', '<p>February only you can purchase Open Real Estate CMS with a great discount</p> \n', 'https://open-real-estate.info/en/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-15', '2022-02-01 07:34:06', 'open-real-estate.info', 1, 'en'),
(287, 'Open Real Estate 1.36.0', '<p>\nThe new version of Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1360', '2021-11-19 18:36:41', 'open-real-estate.info', 1, 'en'),
(288, 'Open Real Estate 1.35.1', '<p>\nThe new version of Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1351', '2021-09-11 11:33:32', 'open-real-estate.info', 1, 'en'),
(289, 'Готовый скрипт недвижимости Open Real Estate CMS со скидкой до 15%!', '<p>Только в феврале Open Real Estate CMS можно приобрести с хорошей скидкой</p>', 'https://open-real-estate.info/ru/blog/news/ready-to-use-real-estate-cms-with-discounts-up-to-15', '2022-02-01 07:34:06', 'open-real-estate.info', 1, 'ru'),
(290, 'Open Real Estate 1.36.0', '<p>\nВыпущена новая версия движка недвижимости Open Real Estate.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1360', '2021-11-19 18:36:41', 'open-real-estate.info', 1, 'ru'),
(291, 'Open Real Estate 1.35.1', '<p>\nВыпущена новая версия скрипта недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1351', '2021-09-11 11:33:32', 'open-real-estate.info', 1, 'ru'),
(292, 'Open Real Estate 1.36.1', '<p>\nThe new version of Open Real Estate CMS has been released.\n</p>', 'https://open-real-estate.info/en/blog/news/open-real-estate-cms-1361', '2022-09-08 14:17:36', 'open-real-estate.info', 1, 'en'),
(293, 'Open Real Estate 1.36.1', '<p>\nВыпущена новая версия скрипта недвижимости Open Real Estate CMS.\n</p>', 'https://open-real-estate.info/ru/blog/news/open-real-estate-cms-1361', '2022-09-08 14:17:36', 'open-real-estate.info', 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_notifier`
--

CREATE TABLE `ore_gj_notifier` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `event` varchar(50) NOT NULL DEFAULT '',
  `onlyAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `subject_ru` varchar(255) NOT NULL DEFAULT '',
  `subject_admin_ru` varchar(255) NOT NULL DEFAULT '',
  `body_ru` text,
  `body_admin_ru` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_notifier`
--

INSERT INTO `ore_gj_notifier` (`id`, `status`, `event`, `onlyAdmin`, `subject_ru`, `subject_admin_ru`, `body_ru`, `body_admin_ru`) VALUES
(1, 3, 'onNewBooking', 1, 'Новая заявка', 'Новая заявка', '<p>Новая заявка.<br />\r\n<br />\r\n№ объявления: {apartment_id} (<a href=\"{fullhost}/property/{apartment_id}\">{fullhost}/property/{apartment_id}</a>).<br />\r\nИмя пользователя: {username}.<br />\r\nEmail: {useremail}.<br />\r\nТелефон: {phone}.<br />\r\nДата заезда: {date_start}.<br />\r\nВремя заезда: {time_inVal}.<br />\r\nДата выезда: {date_end}.<br />\r\nВремя выезда: {time_outVal}.<br />\r\nВремя выезда: {time_outVal}.<br />\r\nКоличество гостей: {num_guest}.<br />\r\nКомментарий: {comment}</p>\r\n', '<p>Новая заявка.<br />\r\n<br />\r\n№ объявления: {apartment_id} (<a href=\"{fullhost}/property/{apartment_id}\">{fullhost}/property/{apartment_id}</a>).<br />\r\nEmail владельца объявления: {ownerEmail}<br />\r\n<br />\r\nИмя пользователя: {username}.<br />\r\nEmail: {useremail}.<br />\r\nТелефон: {phone}.<br />\r\nДата заезда: {date_start}.<br />\r\nВремя заезда: {time_inVal}.<br />\r\nДата выезда: {date_end}.<br />\r\nВремя выезда: {time_outVal}.<br />\r\nКоличество гостей: {num_guest}.<br />\r\nКомментарий: {comment}</p>\r\n'),
(2, 3, 'onNewUser_with_confirm', 0, 'Регистрация пользователя', 'Регистрация пользователя', '<p>\r\n	Добро пожаловать на {fullhost} !</p>\r\n<p>\r\n	Ваш логин: {email}<br />\r\n	Ваш пароль: {password}</p>\r\n<p>\r\n	Перед тем, как начать пользоваться сайтом<br />\r\n	Вы должны активировать свой аккаунт<br />\r\n	Ссылка на активацию аккаунта: {activateLink}</p>\r\n<p>\r\n	Вы можете зайти в личный кабинет через ссылку: {fullhost}/site/login</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	Новый пользователь {username} {email} зарегистрирован.</p>\r\n<p>\r\n	Вы можете просматривать и управлять пользователями через ссылку: {fullhost}/users/backend/main/admin</p>\r\n'),
(3, 3, 'onNewUser_without_confirm', 0, 'Регистрация пользователя', 'Регистрация пользователя', '<p>\r\n	Добро пожаловать на {fullhost} !</p>\r\n<p>\r\n	Ваш логин: {email}<br />\r\n	Ваш пароль: {password}</p>\r\n<p>\r\n	Вы можете зайти в личный кабинет через ссылку: {fullhost}/site/login</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	Новый пользователь {username} {email} зарегистрирован.</p>\r\n<p>\r\n	Вы можете просматривать и управлять пользователями через ссылку: {fullhost}/users/backend/main/admin</p>\r\n'),
(4, 1, 'onNewContactform', 1, 'Новое сообщение (форма контактов)', 'Новое сообщение (форма контактов)', '', '<p>\r\n	Вам отправлено новое сообщение от {name} ({email}, {phone}).</p>\r\n<p>\r\n	Текст сообщения: {body}</p>\r\n'),
(5, 1, 'onOfflinePayment', 1, 'Новый платеж через банк.', 'Новый платеж через банк.', '', '<p>\r\n	Новый платеж через банк на сумму {amount} {currency_charcode}</p>\r\n'),
(6, 3, 'onRequestProperty', 0, 'Запрос к объявлению с сайта', 'Запрос к объявлению с сайта', '<p>\r\n	Здравствуйте, {ownerName}!<br />\r\n	<br />\r\n	Это письмо было отправлено через контактную форму на сайте {fullhost}<br />\r\n	От пользователя: {senderName}<br />\r\n	По поводу Вашего объявления {apartmentUrl}<br />\r\n	Email отправителя: {senderEmail}<br />\r\n	Сообщение: {body}</p>\r\n', '<p>\r\n	Здравствуйте, администратор!<br />\r\n	<br />\r\n	Это письмо было отправлено через контактную форму на сайте {fullhost}<br />\r\n	От пользователя: {senderName}<br />\r\n	По поводу объявления: {apartmentUrl}<br />\r\n	Email отправителя: {senderEmail}<br />\r\n	Сообщение: {body}</p>\r\n<p>\r\n	Имя владельца: {ownerName}<br />\r\n	Email владельца: {ownerEmail}</p>'),
(7, 1, 'onNewComment', 1, 'Добавлен новый комментарий', 'Добавлен новый комментарий', '<p>\r\n	Добавлен новый комментарий к вашему объявлению {ad_url}. От: {user_name} ({user_email}), рейтинг: {rating}. Комментарий: {body}</p>', '<p>\r\n	Добавлен новый комментарий. От: {user_name} ({user_email}), рейтинг: {rating}. Комментарий: {body}</p>\r\n'),
(8, 1, 'onNewApartment', 1, 'Добавлено новое объявление', 'Добавлено новое объявление', '', '<p>\r\n	Добавлено новое объявление ( ID объявления {id} ).</p>\r\n<p>\r\n	Вы можете посмотреть на {url}</p>\r\n'),
(9, 1, 'onNewComplain', 1, 'Добавлена новая жалоба', 'Добавлена новая жалоба', '', '<p>\r\n	Добавлена новая жалоба. От {name} ({email}).</p>\r\n<p>\r\n	Текст жалобы: {body}</p>\r\n'),
(11, 2, 'onRecoveryPassword', 0, 'Востановление пароля', '', '<p>\r\n	Вы получили это письмо потому, что вы (либо кто-то, выдающий себя за вас) попросили выслать новый пароль к вашей учётной записи на сайте {fullhost}.</p>\r\n<p>\r\n	Новый пароль: {temprecoverpassword}</p>\r\n<p>\r\n	Прежде чем использовать новый пароль, вы должны его активировать. Для этого перейдите по ссылке: {recoverPasswordLink}</p>\r\n<p>\r\n	Вы можете зайти в личный кабинет через ссылку: {fullhost}</p>\r\n', ''),
(12, 1, 'onNewReview', 1, 'Был добавлен новый отзыв.', 'The new review was added.', '', '<p>Был добавлен новый отзыв.</p> \r\n<p>От {name}.</p> \r\n<p>Сообщение: {body}</p>\r\n<p>Вы можете посмотреть на  {fullhost}/reviews/backend/main/admin</p>'),
(13, 2, 'onNewAgent', 0, 'Новый агент', '', '<p>\r\n	Пользователь {username} ( email: {email}, телефон: {phone} ) указал, что является агентом Вашего агентства. Вы можете подтвердить или удалить пользователя в личном кабинете {fullhost}.</p>\r\n', ''),
(14, 2, 'onNewPrivateMessage', 0, 'Новое личное сообщение', '', '<p>Здравствуйте, {username}.</p>\r\n<p>Вам пришло новое личное сообщение.</p>\r\n<div>Текст сообщения: {messageEmailSend}</div>\r\n<p>Чтобы ответить на данное сообщение войдите в свой аккаунт: {url}</p>\r\n', ''),
(15, 1, 'onNewSimpleBookingForRent', 1, 'Новая заявка', 'Новая заявка', '<p>\r\n	Новая заявка на бронь.<br />Имя пользователя: {username}.<br />Email: {useremail}.<br />Телефон: {phone}.<br />Тип: {type}.<br />Дата заезда: {date_start}.<br />Время заезда {time_inVal}.<br />Дата выезда:  {date_end}.<br />Время выезда {time_outVal}.<br />Комментарий: {comment}</p>\r\n', '<p>\r\n	Новая заявка на бронь.<br />Имя пользователя: {username}.<br />Email: {useremail}.<br />Телефон: {phone}.<br />Тип: {type}.<br />Дата заезда: {date_start}.<br />Время заезда {time_inVal}.<br />Дата выезда:  {date_end}.<br />Время выезда {time_outVal}.<br />Комментарий: {comment}</p>\r\n'),
(16, 1, 'onNewSimpleBookingForBuy', 1, 'Новая заявка на продажу', 'Новая заявка', '<p>\r\n	Новая заявка на бронь.<br />Имя пользователя: {username}.<br />Email: {useremail}.<br />Телефон: {phone}.<br />Тип: {type}.<br />Комментарий: {comment}</p>\r\n', '<p>\r\n	Новая заявка на бронь.<br />Имя пользователя: {username}.<br />Email: {useremail}.<br />Телефон: {phone}.<br />Тип: {type}.<br />Комментарий: {comment}</p>\r\n'),
(17, 2, 'onBookingNeedPay', 0, 'Необходимо оплатить бронь', '', '<p>Здравствуйте, {username}!</p>\r\n\r\n<p>Вы подавали заявку на бронирование недвижимости {apartmentUrl} c {date_start} по {date_end}. Чтобы забронировать эти дни необходимо оплатить {amount} {currency}.</p>\r\n\r\n{calcForMail}\r\n<p>{comment_admin}</p>\r\n\r\n<p>Сделать это можно в личном кабинете {fullhost}</p>\r\n', ''),
(18, 2, 'onBookingChangeStatus', 0, 'Изменился статус бронирования', 'Изменился статус бронирования', '<p>Изменился статус бронирования {apartmentUrl}</p>\r\n', ''),
(19, 2, 'onBookingConfirm', 0, 'Заявка на бронирование подтверждена', '<p>Здравствуйте, {username}!</p> Ваша заявка на бронирование недвижимости {apartmentUrl} подтверждена', '<p>Здравствуйте, {username}</p>\r\n\r\n<p>Заявка на бронирование подтверждена {apartmentUrl}</p>\r\n', ''),
(20, 1, 'onNewCity', 1, 'Добавлен новый город', 'Добавлен новый город', '', '<p>Пользователи добавили город &quot;{name}&quot; на сайт.</p>\r\n\r\n<p>Пожалуйста активируйте его</p>\r\n'),
(21, 1, 'onApartmentNeedModerate', 1, 'Объявление изменено', 'Объявление изменено', '', '<p>Объявление изменено ( ID объявления {id} ) и ожидает модерации.</p>\r\n\r\n<p>Вы можете посмотреть на {url}</p>\r\n'),
(22, 1, 'onNewLoginFormCode', 1, '', 'Код для входа в панель администратора', NULL, '<p>Код: {code}</p> '),
(23, 1, 'onNewCallBackForm', 1, '', 'Заказ на обратный звонок', NULL, '<p>Был заказан обратный звонок.</p> \r\n<p>Телефон {phone}.</p>\r\n<p>Имя {name}.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_object_image`
--

CREATE TABLE `ore_gj_object_image` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_object_image`
--

INSERT INTO `ore_gj_object_image` (`id`, `name`, `model_id`, `model_name`, `date_created`) VALUES
(5, 'moscow-3550477-1280.jpg', 524901, 'City', '2019-07-29 06:22:52'),
(6, 'yoshkar-ola-3636941-1280.jpg', 466806, 'City', '2019-07-29 06:23:08'),
(8, 'empire-state-building-1081929-1280.jpg', 5128581, 'City', '2019-07-29 06:25:33'),
(10, 'los-angeles-1598750-1280.jpg', 5368361, 'City', '2019-07-29 06:37:25');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_reviews`
--

CREATE TABLE `ore_gj_reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_ip` varchar(60) NOT NULL DEFAULT '',
  `user_ip_ip2_long` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `body` text,
  `email` varchar(100) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `sorter` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_search_form`
--

CREATE TABLE `ore_gj_search_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `page` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `compare_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `obj_type_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(100) NOT NULL DEFAULT '',
  `sorter` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `formdesigner_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_search_form`
--

INSERT INTO `ore_gj_search_form` (`id`, `page`, `status`, `compare_type`, `obj_type_id`, `field`, `sorter`, `formdesigner_id`) VALUES
(133, 1, 1, 0, 1, 'location', 3, 0),
(134, 1, 1, 0, 1, 'ap_type', 4, 0),
(135, 1, 1, 0, 1, 'obj_type', 5, 0),
(136, 1, 1, 0, 1, 'price', 6, 0),
(137, 1, 1, 0, 1, 'square', 7, 0),
(138, 1, 1, 0, 1, 'rooms', 8, 0),
(139, 1, 1, 0, 1, 'floor', 9, 0),
(140, 1, 1, 0, 1, 'term', 10, 0),
(141, 1, 1, 0, 1, 'by_id', 11, 0),
(142, 1, 1, 0, 1, 'owner_type', 12, 0),
(143, 1, 1, 0, 1, 'with_photo', 13, 0),
(144, 1, 1, 0, 2, 'location', 3, 0),
(145, 1, 1, 0, 2, 'ap_type', 4, 0),
(146, 1, 1, 0, 2, 'obj_type', 5, 0),
(147, 1, 1, 0, 2, 'price', 6, 0),
(148, 1, 1, 0, 2, 'square', 7, 0),
(149, 1, 1, 0, 2, 'rooms', 8, 0),
(150, 1, 1, 0, 2, 'floor', 9, 0),
(151, 1, 1, 0, 2, 'term', 10, 0),
(152, 1, 1, 0, 2, 'by_id', 11, 0),
(153, 1, 1, 0, 2, 'owner_type', 12, 0),
(154, 1, 1, 0, 2, 'with_photo', 13, 0),
(155, 1, 1, 0, 3, 'location', 3, 0),
(156, 1, 1, 0, 3, 'ap_type', 4, 0),
(157, 1, 1, 0, 3, 'obj_type', 5, 0),
(158, 1, 1, 0, 3, 'price', 6, 0),
(159, 1, 1, 0, 3, 'square', 7, 0),
(160, 1, 1, 0, 3, 'floor', 8, 0),
(161, 1, 1, 0, 3, 'term', 9, 0),
(162, 1, 1, 0, 3, 'by_id', 10, 0),
(163, 1, 1, 0, 3, 'owner_type', 11, 0),
(164, 1, 1, 0, 3, 'with_photo', 12, 0),
(165, 1, 1, 0, 4, 'location', 3, 0),
(166, 1, 1, 0, 4, 'ap_type', 4, 0),
(167, 1, 1, 0, 4, 'obj_type', 5, 0),
(168, 1, 1, 0, 4, 'price', 6, 0),
(169, 1, 1, 0, 4, 'land_square', 7, 0),
(170, 1, 1, 0, 4, 'term', 8, 0),
(171, 1, 1, 0, 4, 'by_id', 9, 0),
(172, 1, 1, 0, 4, 'owner_type', 10, 0),
(173, 1, 1, 0, 4, 'with_photo', 11, 0),
(174, 1, 1, 0, 5, 'location', 3, 0),
(175, 1, 1, 0, 5, 'ap_type', 4, 0),
(176, 1, 1, 0, 5, 'obj_type', 5, 0),
(177, 1, 1, 0, 5, 'price', 6, 0),
(178, 1, 1, 0, 5, 'term', 7, 0),
(179, 1, 1, 0, 5, 'by_id', 8, 0),
(180, 1, 1, 0, 5, 'with_photo', 9, 0),
(197, 1, 1, 0, 6, 'location', 3, 0),
(198, 1, 1, 0, 6, 'ap_type', 4, 0),
(199, 1, 1, 0, 6, 'obj_type', 5, 0),
(200, 1, 1, 0, 6, 'price', 6, 0),
(201, 1, 1, 0, 6, 'term', 7, 0),
(202, 1, 1, 0, 6, 'by_id', 8, 0),
(203, 1, 1, 0, 6, 'with_photo', 9, 0),
(204, 1, 1, 0, 7, 'location', 3, 0),
(205, 1, 1, 0, 7, 'ap_type', 4, 0),
(206, 1, 1, 0, 7, 'obj_type', 5, 0),
(207, 1, 1, 0, 7, 'booking', 6, 0),
(208, 1, 1, 0, 7, 'price', 7, 0),
(209, 1, 1, 0, 7, 'square', 8, 0),
(210, 1, 1, 0, 7, 'term', 9, 0),
(211, 1, 1, 0, 7, 'by_id', 10, 0),
(212, 1, 1, 0, 7, 'with_photo', 11, 0),
(213, 1, 1, 0, 8, 'location', 3, 0),
(214, 1, 1, 0, 8, 'ap_type', 4, 0),
(215, 1, 1, 0, 8, 'obj_type', 5, 0),
(217, 1, 1, 0, 8, 'price', 7, 0),
(218, 1, 1, 0, 8, 'square', 8, 0),
(219, 1, 1, 0, 8, 'term', 9, 0),
(220, 1, 1, 0, 8, 'by_id', 10, 0),
(221, 1, 1, 0, 8, 'with_photo', 11, 0),
(234, 1, 1, 0, 0, 'location', 3, 0),
(235, 1, 1, 0, 0, 'ap_type', 4, 0),
(236, 1, 1, 0, 0, 'obj_type', 5, 0),
(237, 1, 1, 0, 0, 'price', 6, 0),
(238, 1, 1, 0, 0, 'square', 7, 0),
(239, 1, 1, 0, 0, 'rooms', 8, 0),
(240, 1, 1, 0, 0, 'floor', 9, 0),
(241, 1, 1, 0, 0, 'term', 10, 0),
(242, 1, 1, 0, 0, 'by_id', 11, 0),
(243, 1, 1, 0, 0, 'owner_type', 12, 0),
(244, 1, 1, 0, 0, 'with_photo', 13, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_search_form_field_param`
--

CREATE TABLE `ore_gj_search_form_field_param` (
  `field` varchar(100) NOT NULL,
  `json_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ore_gj_search_form_field_param`
--

INSERT INTO `ore_gj_search_form_field_param` (`field`, `json_data`) VALUES
('booking', '{\"type_deals\":[\"1\"]}');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_seo_friendly_url_history`
--

CREATE TABLE `ore_gj_seo_friendly_url_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `model_name` varchar(30) NOT NULL DEFAULT '',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_ru` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_seo_friendly_url_history`
--

INSERT INTO `ore_gj_seo_friendly_url_history` (`id`, `model_name`, `model_id`, `date_created`, `date_updated`, `url_ru`) VALUES
(1, 'Apartment', 29, '2017-09-13 06:01:17', '2019-03-16 00:59:51', '3-komn-kv-v-minutnoj-dostupnosti-do-mpaveleckaja'),
(2, 'Apartment', 28, '2017-09-13 06:01:17', '2019-03-16 00:59:51', '1-komn-kv-metro-arbatskaja-bolshoj-afanasevskij-pereulok-10'),
(3, 'Apartment', 27, '2017-09-13 06:01:17', '2019-03-16 00:59:51', '2-komn-kv-rjadom-s-m-prospekt-mira'),
(4, 'Apartment', 26, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'kvartira-ul-bolshaja-poljanka-d-28'),
(5, 'Apartment', 25, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'odnokomnatnaja-kvartira-na-novom-arbate'),
(6, 'Apartment', 24, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'dacha-posutochno-v-badeevo'),
(7, 'Apartment', 23, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'dacha-v-pos-stolbovaja'),
(8, 'Apartment', 22, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'dom-na-rublevskom-shosse'),
(9, 'Apartment', 21, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'odnokomnatnaja-kvartira-pskovskaja-ulica'),
(10, 'Apartment', 20, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'chelobitevskoe-shosse'),
(11, 'Apartment', 19, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'dom-na-ul-trubeckaja'),
(12, 'Apartment', 18, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'kvartira-na-ul-aviamotornaja'),
(13, 'Entries', 3, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'v-kachestve-otdelki-dlja-lestnicy-v-odnoj-iz-kvartir-manhettena-ispolzovali-20000-blokov-lego'),
(14, 'Entries', 2, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'nauluchshie-dlja-prozhivanija-goroda'),
(15, 'Entries', 1, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'kakie-veshchi-vo-vremja-pereezda-lomajutsja-chashche-vsego'),
(16, 'Article', 5, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'luchshie-goroda-dlja-holostjakov'),
(17, 'Article', 6, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'nailuchshie-goroda-dlja-semi'),
(18, 'InfoPages', 3, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'prodazha'),
(19, 'InfoPages', 2, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'poisk-na-karte'),
(20, 'InfoPages', 4, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'polzovatelskoe-soglashenie'),
(21, 'InfoPages', 5, '2017-09-13 06:01:17', '2019-03-16 00:59:51', 'politika-konfidencialnosti'),
(22, 'InfoPages', 6, '2017-10-02 08:59:28', '2019-03-16 00:59:51', 'arenda'),
(23, 'InfoPages', 7, '2018-03-11 06:08:43', '2019-03-16 00:59:51', 'gostinicy'),
(24, 'InfoPages', 8, '2018-03-11 06:15:44', '2019-03-16 00:59:51', 'novostrojki'),
(25, 'Apartment', 30, '2018-03-11 06:15:44', '2019-03-16 00:59:51', 'sunset_hotel'),
(26, 'Apartment', 31, '2018-03-11 06:15:44', '2019-03-16 00:59:51', 'junior_suite'),
(27, 'Apartment', 32, '2018-03-11 06:15:44', '2019-03-16 00:59:51', 'lyuks'),
(28, 'Apartment', 33, '2018-03-11 06:15:44', '2019-03-16 00:59:51', 'zhiloj-kompleks-mkr-sportivnyj'),
(29, 'Apartment', 34, '2018-03-11 06:15:44', '2019-03-16 00:59:51', '2-komnatnaya'),
(30, 'Apartment', 35, '2018-03-11 06:15:44', '2019-03-16 00:59:51', '3-komnatnaya');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_seo_friendly_url_search`
--

CREATE TABLE `ore_gj_seo_friendly_url_search` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL DEFAULT '',
  `canonical_url` varchar(255) NOT NULL DEFAULT '',
  `is_noindex` tinyint(1) NOT NULL DEFAULT '0',
  `title_ru` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `title_de` varchar(255) NOT NULL DEFAULT '',
  `title_es` varchar(255) NOT NULL DEFAULT '',
  `title_ar` varchar(255) NOT NULL DEFAULT '',
  `title_tr` varchar(255) NOT NULL DEFAULT '',
  `title_uk` varchar(255) NOT NULL DEFAULT '',
  `description_ru` varchar(255) NOT NULL DEFAULT '',
  `description_en` varchar(255) NOT NULL DEFAULT '',
  `description_de` varchar(255) NOT NULL DEFAULT '',
  `description_es` varchar(255) NOT NULL DEFAULT '',
  `description_ar` varchar(255) NOT NULL DEFAULT '',
  `description_tr` varchar(255) NOT NULL DEFAULT '',
  `description_uk` varchar(255) NOT NULL DEFAULT '',
  `keywords_ru` varchar(255) NOT NULL DEFAULT '',
  `keywords_en` varchar(255) NOT NULL DEFAULT '',
  `keywords_de` varchar(255) NOT NULL DEFAULT '',
  `keywords_es` varchar(255) NOT NULL DEFAULT '',
  `keywords_ar` varchar(255) NOT NULL DEFAULT '',
  `keywords_tr` varchar(255) NOT NULL DEFAULT '',
  `keywords_uk` varchar(255) NOT NULL DEFAULT '',
  `h1_ru` varchar(255) NOT NULL DEFAULT '',
  `h1_uk` varchar(255) NOT NULL DEFAULT '',
  `h1_en` varchar(255) NOT NULL DEFAULT '',
  `h1_de` varchar(255) NOT NULL DEFAULT '',
  `h1_es` varchar(255) NOT NULL DEFAULT '',
  `h1_ar` varchar(255) NOT NULL DEFAULT '',
  `h1_tr` varchar(255) NOT NULL DEFAULT '',
  `body_ru` text,
  `body_uk` text,
  `body_en` text,
  `body_de` text,
  `body_es` text,
  `body_ar` text,
  `body_tr` text,
  `json_data` text,
  `geo_coverage` tinyint(2) NOT NULL DEFAULT '0',
  `ap_type` varchar(6) NOT NULL DEFAULT '0',
  `obj_type_id` int(4) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_service`
--

CREATE TABLE `ore_gj_service` (
  `id` int(11) UNSIGNED NOT NULL,
  `page` text,
  `is_offline` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_service`
--

INSERT INTO `ore_gj_service` (`id`, `page`, `is_offline`, `allow_ip`) VALUES
(1, '<p>Closed for maintenance</p>', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_sitemap_config`
--

CREATE TABLE `ore_gj_sitemap_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `body_ru` longtext,
  `body_en` longtext,
  `body_de` longtext,
  `body_es` longtext,
  `body_ar` longtext,
  `body_tr` longtext,
  `config_json` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_sitemap_config`
--

INSERT INTO `ore_gj_sitemap_config` (`id`, `body_ru`, `body_en`, `body_de`, `body_es`, `body_ar`, `body_tr`, `config_json`) VALUES
(1, '', '', '', '', '', '', '{\"removed_urls\":[]}');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_socialauth`
--

CREATE TABLE `ore_gj_socialauth` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('bool','text') NOT NULL DEFAULT 'text',
  `section` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_socialauth`
--

INSERT INTO `ore_gj_socialauth` (`id`, `type`, `section`, `name`, `value`, `date_updated`) VALUES
(1, 'bool', 'google_oauth', 'useGoogleOauth', '0', '2022-03-09 12:28:31'),
(2, 'text', 'google_oauth', 'googleOauthClientId', '1020373070-0fk0ekd87qeku420n3993qhsf9lsuhr2.apps.googleusercontent.com', '2022-02-15 18:08:51'),
(3, 'text', 'google_oauth', 'googleOauthClientSecret', 'QJX5SKyuzRsuvDtJSm0F3l63', '2022-02-15 18:08:27'),
(4, 'bool', 'twitter', 'useTwitter', '0', '2012-06-30 12:31:28'),
(5, 'text', 'twitter', 'twitterKey', '', '2012-06-30 12:31:28'),
(6, 'text', 'twitter', 'twitterSecret', '', '2012-06-30 12:31:28'),
(7, 'bool', 'facebook', 'useFacebook', '1', '2022-03-09 12:22:39'),
(8, 'text', 'facebook', 'facebookClientId', '567204884432325', '2022-03-09 12:23:32'),
(9, 'text', 'facebook', 'facebookClientSecret', '9a3544751f77362866bc4c5cfa34df19', '2022-03-09 12:24:23'),
(10, 'bool', 'vkontakte', 'useVkontakte', '1', '2022-02-15 18:09:37'),
(11, 'text', 'vkontakte', 'vkontakteClientId', '7930236', '2022-02-15 18:09:21'),
(12, 'text', 'vkontakte', 'vkontakteClientSecret', 'cd43db3dcd43db3dcd43db3d76cd3ada41ccd43cd43db3dac5dc360f65e9e54cd3f540f', '2022-02-15 18:09:36'),
(13, 'bool', 'mailru', 'useMailruOAuth', '0', '2012-06-30 12:31:28'),
(14, 'text', 'mailru', 'mailruClientId', '', '2012-06-30 12:31:28'),
(15, 'text', 'mailru', 'mailruClientSecret', '', '2012-06-30 12:31:28');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_themes`
--

CREATE TABLE `ore_gj_themes` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  `additional_view` tinyint(4) NOT NULL DEFAULT '0',
  `color_theme` varchar(100) NOT NULL DEFAULT '',
  `bg_image` varchar(100) NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `json_data` longtext,
  `dataModel` varchar(100) NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_themes`
--

INSERT INTO `ore_gj_themes` (`id`, `title`, `additional_view`, `color_theme`, `bg_image`, `is_default`, `json_data`, `dataModel`, `date_updated`) VALUES
(2, 'atlas', 1, '', '', 1, '', '', '2022-04-28 21:04:31');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_translate_message`
--

CREATE TABLE `ore_gj_translate_message` (
  `id` int(11) UNSIGNED NOT NULL,
  `category` varchar(150) NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `translation_ru` text,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_translate_message`
--

INSERT INTO `ore_gj_translate_message` (`id`, `category`, `status`, `message`, `translation_ru`, `date_updated`) VALUES
(1, 'common', 0, 'CMS Open Real Estate', 'Open Real Estate CMS ', '2019-03-16 06:12:09'),
(2, 'common', 0, 'Fields with <span class=\"required\">*</span> are required.', 'Поля, отмеченные <span class=\"required\">*</span>, являются обязательными для заполнения.', '2019-03-16 06:12:14'),
(3, 'common', 0, 'Create', 'Создать', '2019-03-16 05:37:45'),
(4, 'common', 0, 'Save', 'Сохранить', '2019-03-16 05:37:46'),
(5, 'common', 0, 'Add', 'Добавить', '2019-03-16 05:37:47'),
(6, 'common', 0, 'Send', 'Отправить', '2019-03-16 06:12:28'),
(7, 'common', 0, 'The requested page does not exist.', 'Запрашиваемая Вами страница не существует.', '2019-03-16 06:12:31'),
(8, 'common', 0, 'References', 'Справочники', '2019-03-16 06:12:33'),
(9, 'common', 0, 'Uploader', 'Добавить фотографии', '2019-03-16 06:12:38'),
(10, 'common', 0, 'Upload images', 'Выбор фотографий', '2019-03-16 06:12:42'),
(11, 'common', 0, 'Load', 'Загрузить', '2019-03-16 06:12:44'),
(12, 'common', 0, 'An image with this name has been already chosen.', 'Изображение с таким именем уже было выбрано', '2019-03-16 06:12:48'),
(13, 'common', 0, 'Incorrect image type', 'Неверный формат изображения', '2019-03-16 06:12:52'),
(14, 'common', 0, 'This gallery is empty.', 'Галлерея фотографий пуста.', '2019-03-16 06:12:55'),
(15, 'common', 0, 'E-mail', 'Адрес электронной почты', '2019-03-16 06:12:59'),
(16, 'common', 0, 'Russian', 'Русский', '2019-03-16 06:13:02'),
(17, 'common', 0, 'English', 'Английский', '2019-03-16 05:38:10'),
(18, 'common', 0, 'or', 'или', '2019-03-16 05:38:11'),
(19, 'common', 0, 'Users', 'Управление пользователями', '2019-03-16 06:13:11'),
(20, 'common', 0, 'Content is loading ...', 'Загрузка содержимого...', '2019-03-16 06:13:13'),
(21, 'common', 0, 'Apartment search', 'Поиск недвижимости', '2019-03-16 05:38:16'),
(22, 'common', 0, 'Search', 'Найти', '2019-03-16 05:38:19'),
(23, 'common', 0, 'Inactive', 'Неактивно', '2019-03-16 06:13:22'),
(24, 'common', 0, 'Active', 'Активно', '2019-03-16 05:38:22'),
(25, 'common', 0, 'Deactivate', 'Деактивировать', '2019-03-16 06:13:27'),
(26, 'common', 0, 'Activate', 'Активировать', '2019-03-16 05:38:28'),
(27, 'common', 0, 'Search on map by metro station', 'Поиск на карте по станции метро', '2019-03-16 06:13:35'),
(28, 'common', 0, 'Home', 'Главная', '2019-03-16 06:13:39'),
(29, 'common', 0, 'Control panel', 'Личный кабинет', '2019-03-16 06:13:43'),
(30, 'common', 0, 'Login', 'Войти', '2019-03-16 05:38:35'),
(31, 'common', 0, 'Logout', 'Выйти', '2019-03-16 06:13:51'),
(32, 'common', 0, 'Already used our services? Please fill out the following form with your login credentials', 'Уже пользовались нашими услугами? Пожалуйста, заполните форму для входа на сайт', '2019-03-16 06:13:53'),
(33, 'common', 0, 'Remember me next time', 'Запомнить меня', '2019-03-16 06:13:56'),
(34, 'common', 0, 'Password', 'Пароль', '2019-03-16 05:38:44'),
(35, 'common', 0, 'Administration', 'Администрирование', '2019-03-16 05:38:45'),
(36, 'common', 0, 'Site language', 'Язык сайта', '2019-03-16 06:14:05'),
(37, 'common', 0, 'Status', 'Статус', '2019-03-16 05:38:48'),
(38, 'common', 0, 'Go to main page', 'Перейти на главную страницу', '2019-03-16 06:14:09'),
(39, 'common', 0, 'select', 'выбрать', '2019-03-16 06:14:12'),
(40, 'common', 0, 'Number of rooms', 'Количество комнат', '2019-03-16 06:14:14'),
(41, 'common', 0, 'All', 'Все', '2019-03-16 05:38:57'),
(42, 'common', 0, 'Price up to', 'Плата до', '2019-03-16 06:14:22'),
(43, 'common', 0, 'From', 'С', '2019-03-16 06:14:26'),
(44, 'common', 0, 'to', 'по', '2019-03-16 06:14:30'),
(45, 'common', 0, 'Incorrect username or password.', 'Неверное имя пользователя или пароль.', '2019-03-16 06:14:33'),
(46, 'common', 0, 'Reserve apartment', 'Оставить заявку', '2019-03-16 06:14:35'),
(47, 'common', 0, 'Your phone number', 'Ваш номер телефона', '2019-03-16 05:39:08'),
(48, 'common', 0, 'Phone number', 'Номер телефона', '2019-03-16 05:39:11'),
(49, 'common', 0, 'Special offers', 'Специальные предложения', '2019-03-16 05:39:13'),
(50, 'common', 0, 'Special offer!', 'Спецпредложение!', '2019-03-16 06:14:48'),
(51, 'common', 0, 'Is avaliable', 'Доступно', '2019-03-16 06:14:51'),
(52, 'common', 0, 'Contact us', 'Связаться с нами', '2019-03-16 06:14:55'),
(53, 'common', 0, 'Special offer', 'Специальное предложение', '2019-03-16 06:14:59'),
(54, 'common', 0, 'Forgot password?', 'Забыли пароль?', '2019-03-16 06:15:02'),
(55, 'common', 0, 'Recover password', 'Восстановление пароля', '2019-03-16 05:39:25'),
(56, 'common', 0, 'Recover', 'Восстановить', '2019-03-16 06:15:09'),
(57, 'common', 0, 'Email', 'Email', '2019-03-16 05:39:31'),
(58, 'common', 0, 'User does not exist', 'Пользователь с таким email не существует', '2019-03-16 06:15:16'),
(59, 'common', 0, 'Reference \"Check-in\"', '\"Время заезда\"', '2019-03-16 06:15:20'),
(60, 'common', 0, 'Reference \"Check-out\"', '\"Время выезда\"', '2019-03-16 06:15:22'),
(61, 'common', 0, 'I want', 'Я хочу', '2019-03-16 06:15:26'),
(62, 'common', 0, 'rent apartment', 'арендовать недвижимость', '2019-03-16 06:15:29'),
(63, 'common', 0, 'buy apartment', 'купить недвижимость', '2019-03-16 06:15:34'),
(64, 'common', 0, 'Loading ...', 'Загрузка ...', '2019-03-16 05:39:47'),
(65, 'common', 0, 'Floor', 'Этаж', '2019-03-16 06:15:40'),
(66, 'common', 0, 'Flat on floor', 'Квартира на этаже', '2019-03-16 06:15:43'),
(67, 'common', 0, 'Apartment square to', 'Площадь до', '2019-03-16 06:15:46'),
(68, 'common', 0, 'Square range', 'Диапазон площади', '2019-03-16 06:15:48'),
(69, 'common', 0, 'Floor range', 'Диапазон этажей', '2019-03-16 06:15:52'),
(70, 'common', 0, 'Rooms range', 'Диапазон комнат', '2019-03-16 06:15:55'),
(71, 'common', 0, 'Price range', 'Диапазон цены', '2019-03-16 05:39:58'),
(72, 'common', 0, 'More options', 'Больше параметров', '2019-03-16 05:40:01'),
(73, 'common', 0, 'Less options', 'Меньше параметров', '2019-03-16 06:16:06'),
(74, 'common', 0, 'Registration', 'Регистрация', '2019-03-16 06:16:08'),
(75, 'common', 0, 'Join now', 'Зарегистрироваться', '2019-03-16 06:16:11'),
(76, 'common', 0, 'Login (email)', 'Логин (email)', '2019-03-16 06:16:14'),
(77, 'common', 0, 'Verify Code', 'Проверочный код', '2019-03-16 05:40:14'),
(78, 'common', 0, 'Activate account', 'Активация аккаунта', '2019-03-16 06:16:19'),
(79, 'common', 0, 'Your status account already is active', 'Ваш аккаунт уже активирован', '2019-03-16 06:16:22'),
(80, 'common', 0, 'User not exists', 'Пользователя не существует', '2019-03-16 06:16:25'),
(81, 'common', 0, 'Your account successfully activated', 'Ваш аккаунт успешно активирован', '2019-03-16 06:16:28'),
(82, 'common', 0, 'You were successfully registered. The letter for account activation has been sent on {useremail}', 'Вы успешно зарегистрировались. Письмо для активации аккаунта было отправлено на {useremail}', '2019-03-16 06:16:31'),
(83, 'common', 0, 'Error. Repeat attempt later', 'Ошибка. Повторите попытку позже', '2019-03-16 06:16:36'),
(84, 'common', 0, 'Your account not active. The reasons: you not followed the link in the letter which has been sent at registration. Or administrator deactivate your account', 'Ваш аккаунт не активен. Причины: вы не перешли по ссылке в письме, которое было отправлено при регистрации. Либо администратор сайта деактивировал ваш аккаунт', '2019-03-16 06:16:40'),
(85, 'common', 0, 'rent by the day', 'аренда посуточно', '2019-03-16 06:16:44'),
(86, 'common', 0, 'rent by the hour', 'аренда почасово', '2019-03-16 06:16:46'),
(87, 'common', 0, 'rent by the month', 'аренда помесячно', '2019-03-16 06:16:49'),
(88, 'common', 0, 'rent by the week', 'аренда понедельно', '2019-03-16 06:16:52'),
(89, 'common', 0, 'sale', 'продажа', '2019-03-16 06:16:55'),
(90, 'common', 0, 'Payment to', 'Цена до', '2019-03-16 06:16:59'),
(91, 'common', 0, 'Fee up to', 'Плата до', '2019-03-16 06:17:03'),
(92, 'common', 0, 'City', 'Город', '2019-03-16 06:17:08'),
(93, 'common', 0, 'With selected', 'С отмеченными', '2019-03-16 06:17:10'),
(94, 'common', 0, 'Do', 'Выполнить', '2019-03-16 06:17:12'),
(95, 'common', 0, 'Are you sure?', 'Вы уверены?', '2019-03-16 06:17:15'),
(96, 'common', 0, 'Property type', 'Тип недвижимости', '2019-03-16 06:17:18'),
(97, 'common', 0, 'Please select', 'Пожалуйста выберите', '2019-03-16 06:17:20'),
(98, 'common', 0, 'Delete', 'Удалить', '2019-03-16 06:17:22'),
(99, 'common', 0, 'There are new product news', 'Появились новые новости о продукте', '2019-03-16 06:17:25'),
(100, 'common', 0, '{n} news', '{n} новость|{n} новости|{n} новостей', '2019-03-16 06:17:27'),
(101, 'module_adminpass', 0, 'Change admin password', 'Пароль администратора', '2019-03-16 06:17:32'),
(102, 'module_adminpass', 0, 'Current administrator password', 'Текущий пароль администратора', '2019-03-16 06:17:35'),
(103, 'module_adminpass', 0, 'Wrong admin password! Try again.', 'Неверный пароль администратора! Попробуйте снова', '2019-03-16 06:17:38'),
(104, 'module_apartmentCity', 0, 'Manage apartment city', 'Управление городами', '2019-03-16 06:17:42'),
(105, 'module_apartmentCity', 0, 'Add city', 'Добавить город', '2019-03-16 06:17:44'),
(106, 'module_apartmentCity', 0, 'Edit city', 'Редактирование города', '2019-03-16 06:17:48'),
(107, 'module_apartmentCity', 0, 'Name', 'Название', '2019-03-16 06:17:50'),
(108, 'module_apartmentObjType', 0, 'Manage apartment object types', 'Управление типами недвижимости', '2019-03-16 06:17:54'),
(109, 'module_apartmentObjType', 0, 'Add object type', 'Добавить тип недвижимости', '2019-03-16 06:17:58'),
(110, 'module_apartmentObjType', 0, 'Name', 'Название', '2019-03-16 06:18:03'),
(111, 'module_apartmentObjType', 0, 'Edit object type', 'Редактирование типа недвижимости', '2019-03-16 06:18:07'),
(112, 'module_apartmentObjType', 0, 'Apartment object types', 'Типы недвижимости', '2019-03-16 06:18:09'),
(113, 'module_apartments', 0, 'Apartments list', 'Список объявлений', '2019-03-16 06:18:12'),
(114, 'module_apartments', 0, '{n} bedroom|{n} bedrooms|{n} bedrooms', '{n} комната|{n} комнаты|{n} комнат', '2019-03-16 06:18:14'),
(115, 'module_apartments', 0, '{n} floor of {total} total', '{n} этаж {total} этажного дома', '2019-03-16 06:18:18'),
(116, 'module_apartments', 0, 'Total square', 'Общая площадь', '2019-03-16 06:18:20'),
(117, 'module_apartments', 0, 'total square', 'общая площадь', '2019-03-16 06:18:24'),
(118, 'module_apartments', 0, 'Manage apartments', 'Управление объявлениями', '2019-03-16 06:18:28'),
(119, 'module_apartments', 0, 'Delete apartment', 'Удалить объявление', '2019-03-16 06:18:31'),
(120, 'module_apartments', 0, 'ID', '№', '2019-03-16 06:18:33'),
(121, 'module_apartments', 0, 'Apartment title', 'Название', '2019-03-16 06:18:36'),
(122, 'module_apartments', 0, 'Status', 'Статус', '2019-03-16 06:18:39'),
(123, 'module_apartments', 0, 'Deactivate', 'Отключить', '2019-03-16 06:18:43'),
(124, 'module_apartments', 0, 'Activate', 'Включить', '2019-03-16 06:18:47'),
(125, 'module_apartments', 0, 'Price', 'Цена', '2019-03-16 06:18:49'),
(126, 'module_apartments', 0, 'Number of rooms', 'Количество комнат', '2019-03-16 06:18:52'),
(127, 'module_apartments', 0, 'Number of berths', 'Количество спальных мест', '2019-03-16 06:18:56'),
(128, 'module_apartments', 0, 'Square', 'Площадь', '2019-03-16 06:18:58'),
(129, 'module_apartments', 0, 'Floor', 'Этаж', '2019-03-16 06:19:00'),
(130, 'module_apartments', 0, 'Total number of floors', 'Этажей всего', '2019-03-16 06:19:03'),
(131, 'module_apartments', 0, 'Window to', 'Окна выходят', '2019-03-16 06:19:08'),
(132, 'module_apartments', 0, 'Metro station', 'Станция метро', '2019-03-16 06:19:10'),
(133, 'module_apartments', 0, 'Update apartment', 'Редактирование объявления', '2019-03-16 06:19:14'),
(134, 'module_apartments', 0, 'Active', 'Активно', '2019-03-16 06:19:18'),
(135, 'module_apartments', 0, 'Inactive', 'Неактивно', '2019-03-16 06:19:21'),
(136, 'module_apartments', 0, 'Special offer', 'Специальное предложение', '2019-03-16 06:19:23'),
(137, 'module_apartments', 0, 'Apartment ID', 'Уникальный номер объявления', '2019-03-16 06:19:28'),
(138, 'module_apartments', 0, 'Add apartment', 'Добавление объявления', '2019-03-16 06:19:31'),
(139, 'module_apartments', 0, 'Apartments list is empty.', 'Список объявлений пуст.', '2019-03-16 06:19:34'),
(140, 'module_apartments', 0, 'Price from', 'Цена', '2019-03-16 06:19:37'),
(141, 'module_apartments', 0, 'Description', 'Описание', '2019-03-16 06:19:41'),
(142, 'module_apartments', 0, 'Near', 'Что рядом', '2019-03-16 06:19:45'),
(143, 'module_apartments', 0, 'Metro', 'Станция метро', '2019-03-16 06:19:48'),
(144, 'module_apartments', 0, 'Address', 'Адрес', '2019-03-16 06:19:50'),
(145, 'module_apartments', 0, 'berths', 'спальные места', '2019-03-16 06:19:53'),
(146, 'module_apartments', 0, 'Booking', 'Бронирование', '2019-03-16 06:19:57'),
(147, 'module_apartments', 0, 'Is free from', 'действует с', '2019-03-16 06:20:00'),
(148, 'module_apartments', 0, 'to', 'по', '2019-03-16 06:20:04'),
(149, 'module_apartments', 0, 'Type', 'Тип сделки', '2019-03-16 06:20:07'),
(150, 'module_apartments', 0, 'All', 'Все', '2019-03-16 06:20:09'),
(151, 'module_apartments', 0, 'Sale price', 'Продажа', '2019-03-16 06:20:13'),
(152, 'module_apartments', 0, 'Price per hour', 'за час', '2019-03-16 06:20:16'),
(153, 'module_apartments', 0, 'Price per day', 'за сутки', '2019-03-16 06:20:20'),
(154, 'module_apartments', 0, 'Price per week', 'за неделю', '2019-03-16 06:20:24'),
(155, 'module_apartments', 0, 'Price per month', 'в месяц', '2019-03-16 06:20:28'),
(156, 'module_apartments', 0, '(press and hold SHIFT button for multiply select)', '(нажмите и удерживайте SHIFT для множественного выбора)', '2019-03-16 06:20:31'),
(157, 'module_apartments', 0, 'Nearest metro stations', 'Ближайшие станции метро', '2019-03-16 06:20:34'),
(158, 'module_apartments', 0, 'Object type', 'Тип недвижимости', '2019-03-16 06:20:36'),
(159, 'module_apartments', 0, 'All object', 'Везде', '2019-03-16 06:20:38'),
(160, 'module_apartments', 0, 'type_view_1', 'сдается в аренду', '2019-03-16 06:20:41'),
(161, 'module_apartments', 0, 'type_view_2', 'продаётся', '2019-03-16 06:20:45'),
(162, 'module_apartments', 0, 'City', 'Город', '2019-03-16 06:20:50'),
(163, 'module_articles', 0, 'Q&As', 'Вопросы-ответы', '2019-03-16 06:20:52'),
(164, 'module_articles', 0, 'Title / Question', 'Заголовок / Вопрос', '2019-03-16 06:20:56'),
(165, 'module_articles', 0, 'Body / Answer', 'Текст / Ответ', '2019-03-16 06:20:59'),
(166, 'module_articles', 0, 'Last updated on', 'Дата изменения', '2019-03-16 06:21:02'),
(167, 'module_articles', 0, 'FAQ', 'Вопросы-ответы', '2019-03-16 06:21:05'),
(168, 'module_articles', 0, 'Ok', 'Да', '2019-03-16 06:21:07'),
(169, 'module_articles', 0, 'Add FAQ', 'Добавить вопрос-ответ', '2019-03-16 06:21:09'),
(170, 'module_articles', 0, 'Update FAQ', 'Редактирование вопроса-ответа', '2019-03-16 06:21:12'),
(171, 'module_articles', 0, 'Language', 'Язык', '2019-03-16 06:21:14'),
(172, 'module_articles', 0, 'Status', 'Статус', '2019-03-16 06:21:17'),
(173, 'module_articles', 0, 'Read more &raquo;', 'Читать далее &raquo;', '2019-03-16 06:21:19'),
(174, 'module_articles', 0, 'Delete FAQ', 'Удалить вопрос-ответ', '2019-03-16 06:21:21'),
(175, 'module_booking', 0, 'Check-in date', 'Дата заезда', '2019-03-16 06:21:24'),
(176, 'module_booking', 0, 'Check-out date', 'Дата выезда', '2019-03-16 06:21:27'),
(177, 'module_booking', 0, 'Check-in time', 'Время заезда', '2019-03-16 06:21:30'),
(178, 'module_booking', 0, 'Check-out time', 'Время выезда', '2019-03-16 06:21:33'),
(179, 'module_booking', 0, 'Comment', 'Комментарий', '2019-03-16 06:21:36'),
(180, 'module_booking', 0, 'Your name', 'Ваше имя', '2019-03-16 06:21:40'),
(181, 'module_booking', 0, 'Wrong check-in date', 'Неверная дата заезда', '2019-03-16 06:21:44'),
(182, 'module_booking', 0, 'Wrong check-out date', 'Неверная дата выезда', '2019-03-16 06:21:48'),
(183, 'module_booking', 0, 'User with such e-mail already registered. Please <a title=\"Login\" href=\"{n}\">login</a> and try again.', 'Пользователь с таким адресом электронной почты уже существует. Пожалуйста, <a title=\"Войти\" href=\"{n}\">войдите в систему</a> и попробуйте снова.', '2019-03-16 10:36:48'),
(184, 'module_booking', 0, 'Status', 'Статус', '2019-03-16 06:21:54'),
(185, 'module_booking', 0, 'User e-mail', 'E-mail пользователя', '2019-03-16 06:21:56'),
(186, 'module_booking', 0, 'Creation date', 'Дата создания', '2019-03-16 06:21:59'),
(187, 'module_booking', 0, 'Apartment ID', '№ объявления', '2019-03-16 06:22:03'),
(188, 'module_booking', 0, 'User name', 'Имя пользователя', '2019-03-16 06:22:06'),
(189, 'module_comments', 0, 'Comments', 'Комментарии', '2019-03-16 06:22:10'),
(190, 'module_comments', 0, 'Comment', 'Комментарий', '2019-03-16 06:22:12'),
(191, 'module_comments', 0, 'Rate', 'Оценка', '2019-03-16 06:22:15'),
(192, 'module_comments', 0, 'Status', 'Статус', '2019-03-16 06:22:19'),
(193, 'module_comments', 0, 'Creation date', 'Дата создания', '2019-03-16 06:22:21'),
(194, 'module_comments', 0, 'Name', 'Имя', '2019-03-16 06:22:23'),
(195, 'module_comments', 0, 'Email', 'Email', '2019-03-16 06:22:27'),
(196, 'module_comments', 0, 'Apartment', 'Квартира', '2019-03-16 06:22:30'),
(197, 'module_comments', 0, 'Apartment_id', '№ объявления', '2019-03-16 06:22:33'),
(198, 'module_comments', 0, 'says about', 'сказал о', '2019-03-16 06:22:36'),
(199, 'module_comments', 0, 'Pending approval', 'Ожидает подтверждения', '2019-03-16 06:22:40'),
(200, 'module_comments', 0, 'Approve', 'Подтвердить', '2019-03-16 06:22:43'),
(201, 'module_comments', 0, 'Update', 'Редактировать', '2019-03-16 06:22:45'),
(202, 'module_comments', 0, 'Update Comment #{id}', 'Редактирование комментария #{id}', '2019-03-16 06:22:49'),
(203, 'module_comments', 0, 'Leave a Comment', 'Оставьте свой комментарий', '2019-03-16 06:22:52'),
(204, 'module_comments', 0, 'Thank you for your comment. Your comment will be posted once it is approved.', 'Благодарим за ваш комментарий. Ваш комментарий появится после подтверждения администрацией сайта.', '2019-03-16 06:22:55'),
(205, 'module_comments', 0, 'There are no comments', 'Список комментариев пуст', '2019-03-16 06:22:57'),
(206, 'module_configuration', 0, 'Settings', 'Настройки', '2019-03-16 06:22:59'),
(207, 'module_configuration', 0, 'Name', 'Название', '2019-03-16 06:23:02'),
(208, 'module_configuration', 0, 'Value', 'Значение', '2019-03-16 06:23:05'),
(209, 'module_configuration', 0, 'Manage settings', 'Управление настройками', '2019-03-16 06:23:09'),
(210, 'module_configuration', 0, 'Update param \"{name}\"', 'Изменение параметра \"{name}\"', '2019-03-16 06:23:13'),
(211, 'module_configuration', 0, 'main', 'Главные', '2019-03-16 06:23:15'),
(212, 'module_configuration', 0, 'gmap', 'Карты Google', '2019-03-16 06:23:18'),
(213, 'module_configuration', 0, 'ymap', 'Карты Yandex', '2019-03-16 06:23:23'),
(214, 'module_configuration', 0, 'cache', 'Кеширование', '2019-03-16 06:23:27'),
(215, 'module_configuration', 0, 'search', 'Поиск', '2019-03-16 06:23:29'),
(216, 'module_configuration', 0, 'notifier', 'Уведомления', '2019-03-16 06:23:33'),
(217, 'module_configuration', 0, 'apartment', 'Объявления', '2019-03-16 06:23:36'),
(218, 'module_configuration', 0, 'slider', '\"Ползунки\" в поиске', '2019-03-16 06:23:41'),
(219, 'module_contactform', 0, 'Contact Us', 'Свяжитесь с нами', '2019-03-16 06:23:44'),
(220, 'module_contactform', 0, 'Name', 'Имя', '2019-03-16 06:23:47'),
(221, 'module_contactform', 0, 'Email', 'Email', '2019-03-16 06:23:51'),
(222, 'module_contactform', 0, 'Subject', 'Тема', '2019-03-16 06:23:56'),
(223, 'module_contactform', 0, 'Body', 'Сообщение', '2019-03-16 06:24:00'),
(224, 'module_contactform', 0, 'Verification Code', 'Код подтверждения', '2019-03-16 06:24:03'),
(225, 'module_contactform', 0, 'Phone', 'Телефон', '2019-03-16 06:24:06'),
(226, 'module_contactform', 0, 'Address', 'Адрес', '2019-03-16 06:24:08'),
(227, 'module_contactform', 0, 'Skype', 'Skype', '2019-03-16 00:59:50'),
(228, 'module_contactform', 0, 'ICQ', 'ICQ', '2019-03-16 00:59:50'),
(229, 'module_contactform', 0, 'You can fill out the form below to contact us.', 'Вы можете заполнить форму ниже для связи с нами.', '2019-03-16 06:24:16'),
(230, 'module_contactform', 0, 'Send message', 'Отправить сообщение', '2019-03-16 06:24:20'),
(231, 'module_payment', 0, 'Payment', 'Оплата', '2019-03-16 06:24:25'),
(232, 'module_payment', 0, 'Payment System Settings', 'Настройки платежной системы', '2019-03-16 06:24:29'),
(233, 'module_payment', 0, 'Payments', 'Управление платежами', '2019-03-16 06:24:33'),
(234, 'module_payment', 0, 'Wait for payment', 'Ожидается оплата', '2019-03-16 06:24:36'),
(235, 'module_payment', 0, 'Payment complete', 'Оплата произведена', '2019-03-16 06:24:39'),
(236, 'module_payment', 0, 'Payment declined', 'Платеж отменен', '2019-03-16 06:24:44'),
(237, 'module_payment', 0, 'Amount', 'Сумма', '2019-03-16 06:24:47'),
(238, 'module_payment', 0, 'Payment date', 'Дата платежа', '2019-03-16 06:24:50'),
(239, 'module_payment', 0, 'Booking #', 'Бронь #', '2019-03-16 06:24:52'),
(240, 'module_payment', 0, 'Login', 'Логин', '2019-03-16 06:24:54'),
(241, 'module_payment', 0, 'Password1', 'Пароль1', '2019-03-16 00:59:50'),
(242, 'module_payment', 0, 'Password2', 'Пароль2', '2019-03-16 06:25:00'),
(243, 'module_payment', 0, 'Currency', 'Валюта продавца', '2019-03-16 06:25:02'),
(244, 'module_payment', 0, 'Mode', 'Режим', '2019-03-16 06:25:04'),
(245, 'module_payment', 0, 'Status', 'Статус', '2019-03-16 06:25:09'),
(246, 'module_payment', 0, 'Pending', 'В обработке', '2019-03-16 06:25:13'),
(247, 'module_payment', 0, 'Active', 'Включено', '2019-03-16 06:25:15'),
(248, 'module_payment', 0, 'Inactive', 'Отключено', '2019-03-16 06:25:17'),
(249, 'module_payment', 0, 'Real mode', 'Рабочий режим', '2019-03-16 06:25:22'),
(250, 'module_payment', 0, 'Test mode', 'Тестовый режим', '2019-03-16 06:25:25'),
(251, 'module_quicksearch', 0, 'Number of rooms', 'Количество комнат', '2019-03-16 06:25:27'),
(252, 'module_quicksearch', 0, 'Sorting by price', 'Сортировать по цене', '2019-03-16 06:25:30'),
(253, 'module_referencecategories', 0, 'Manage reference categories', 'Управление категориями справочников', '2019-03-16 06:25:35'),
(254, 'module_referencecategories', 0, 'Add reference category', 'Добавить категорию', '2019-03-16 06:25:39'),
(255, 'module_referencecategories', 0, 'Add category', 'Добавление категории', '2019-03-16 06:25:42'),
(256, 'module_referencecategories', 0, 'Edit category:', 'Редактирование категории:', '2019-03-16 06:25:46'),
(257, 'module_referencecategories', 0, 'Delete category', 'Удалить категорию', '2019-03-16 06:25:50'),
(258, 'module_referencecategories', 0, 'Category', 'Категории', '2019-03-16 06:25:53'),
(259, 'module_referencecategories', 0, 'Display style', 'Стиль для отображения', '2019-03-16 06:25:57'),
(260, 'module_referencecategories', 0, '1 column', 'Одна колонка', '2019-03-16 06:26:00'),
(261, 'module_referencecategories', 0, '2 columns', 'Две колонки', '2019-03-16 06:26:04'),
(262, 'module_referencecategories', 0, '3 columns', 'Три колонки', '2019-03-16 06:26:06'),
(263, 'module_referencecategories', 0, 'Categories of references', 'Категории справочников', '2019-03-16 06:26:08'),
(264, 'module_referencevalues', 0, 'Create reference value', 'Создание значения справочника', '2019-03-16 06:26:12'),
(265, 'module_referencevalues', 0, 'Category', 'Категория', '2019-03-16 06:26:16'),
(266, 'module_referencevalues', 0, 'Manage reference values', 'Управление значениями справочников', '2019-03-16 06:26:21'),
(267, 'module_referencevalues', 0, 'Reference', 'Справочники', '2019-03-16 06:26:25'),
(268, 'module_referencevalues', 0, 'Update reference', 'Обновление значения справочника', '2019-03-16 06:26:28'),
(269, 'module_referencevalues', 0, 'Delete reference value', 'Удалить значение справочника', '2019-03-16 06:26:30'),
(270, 'module_referencevalues', 0, 'Reference category', 'Категория справочника', '2019-03-16 06:26:34'),
(271, 'module_referencevalues', 0, 'Values of references', 'Значения справочников', '2019-03-16 06:26:38'),
(272, 'module_referencevalues', 0, 'Create value', 'Создание значения', '2019-03-16 06:26:40'),
(273, 'module_referencevalues', 0, 'For sale', 'Продажа', '2019-03-16 06:26:44'),
(274, 'module_referencevalues', 0, 'For rent', 'Аренда', '2019-03-16 06:26:47'),
(275, 'module_similarads', 0, 'Similar ads', 'Похожие объявления', '2019-03-16 06:26:52'),
(276, 'module_sitemap', 0, 'Site map', 'Карта сайта', '2019-03-16 06:26:54'),
(277, 'module_sitemap', 0, 'index_page', 'Главная страница', '2019-03-16 06:26:56'),
(278, 'module_sitemap', 0, 'contact_form', 'Связаться с нами', '2019-03-16 06:26:59'),
(279, 'module_sitemap', 0, 'booking_form', 'Оставить заявку', '2019-03-16 06:27:02'),
(280, 'module_sitemap', 0, 'quick_search', 'Поиск', '2019-03-16 06:27:07'),
(281, 'module_sitemap', 0, 'special_offers', 'Специальные предложения', '2019-03-16 06:27:10'),
(282, 'module_sitemap', 0, 'section_article', 'Вопросы-ответы', '2019-03-16 06:27:13'),
(283, 'module_sitemap', 0, 'section_news', 'Новости', '2019-03-16 06:27:15'),
(284, 'module_sitemap', 0, 'section_infopage', 'Дополнительно', '2019-03-16 06:27:17'),
(285, 'module_slider', 0, 'Manage slider', 'Управление слайдером', '2019-03-16 06:27:22'),
(286, 'module_slider', 0, 'The file was larger than {size}MB. Please upload a smaller file.', 'Размер файла больше, чем {size} Mb. Пожалуйста, загрузите файл меньшего размера.', '2019-03-16 06:27:26'),
(287, 'module_slider', 0, 'Add image', 'Добавить изображение', '2019-03-16 06:27:29'),
(288, 'module_slider', 0, 'Image title', 'Заголовок изображения', '2019-03-16 06:27:32'),
(289, 'module_slider', 0, 'Image url', 'Ссылка изображения', '2019-03-16 06:27:36'),
(290, 'module_slider', 0, 'Date updated', 'Дата изменения', '2019-03-16 06:27:38'),
(291, 'module_slider', 0, 'Image succesfullty added to slider.', 'Изображение успешно добавлено в слайдер', '2019-03-16 06:27:40'),
(292, 'module_slider', 0, 'Supported file: {supportExt}.', 'Поддерживаемый тип файлов: {supportExt}.', '2019-03-16 06:27:43'),
(293, 'module_slider', 0, 'Image', 'Изображение', '2019-03-16 06:27:45'),
(294, 'module_slider', 0, 'Use Philips Ambilight effect', 'Использовать эффект \"Philips Ambilight\"', '2019-03-16 06:27:48'),
(295, 'module_slider', 0, 'This option is only available if PHP is compiled with bundled support for GD library, becouse use imagefilter php function.', 'Эта опция доступна, только если РНР скомпилирован со встроенной поддержкой библиотеки GD, так как используется PHP функция imagefilter.', '2019-03-16 06:27:52'),
(296, 'module_specialoffers', 0, 'Special offer', 'Специальное предложение', '2019-03-16 06:27:56'),
(297, 'module_specialoffers', 0, 'Special offers', 'Специальные предложения', '2019-03-16 06:28:00'),
(298, 'module_usercpanel', 0, 'Control panel', 'Личный кабинет', '2019-03-16 06:28:03'),
(299, 'module_usercpanel', 0, 'Change', 'Изменить', '2019-03-16 06:35:59'),
(300, 'module_usercpanel', 0, 'Your details successfully changed.', 'Ваше данные успешно изменены.', '2019-03-16 06:36:00'),
(301, 'module_usercpanel', 0, 'Change your password', 'Изменить пароль', '2019-03-16 06:36:00'),
(302, 'module_usercpanel', 0, 'Your password successfully changed.', 'Ваш пароль успешно изменен.', '2019-03-16 06:36:00'),
(303, 'module_usercpanel', 0, 'Enter new password', 'Введите новый пароль', '2019-03-16 06:36:00'),
(304, 'module_usercpanel', 0, 'Repeat password', 'Повторите пароль', '2019-03-16 06:36:01'),
(305, 'module_usercpanel', 0, 'Your name', 'Ваше имя', '2019-03-16 06:36:01'),
(306, 'module_usercpanel', 0, 'Passwords are not equivalent! Try again.', 'Пароли не совпадают! Повторите ввод.', '2019-03-16 06:36:01'),
(307, 'module_usercpanel', 0, 'Password too short! Minimum allowed length is 6 chars.', 'Пароль слишком короткий! Минимальная длина пароля - 6 символов.', '2019-03-16 06:36:01'),
(308, 'module_usercpanel', 0, 'Your e-mail', 'Ваш адрес электронной почты', '2019-03-16 06:36:02'),
(309, 'module_users', 0, 'Add user', 'Добавить пользователя', '2019-03-16 06:36:02'),
(310, 'module_users', 0, 'E-mail', 'E-mail', '2019-03-16 06:36:02'),
(311, 'module_users', 0, 'User name', 'Имя пользователя', '2019-03-16 06:36:02'),
(312, 'module_users', 0, 'Password', 'Пароль', '2019-03-16 06:36:02'),
(313, 'module_users', 0, 'Edit user', 'Редактировать пользователя', '2019-03-16 06:36:03'),
(314, 'module_users', 0, 'Delete user', 'Удалить пользователя', '2019-03-16 06:36:03'),
(315, 'module_users', 0, 'Status', 'Статус', '2019-03-16 06:36:03'),
(316, 'module_users', 0, 'Active', 'Активный', '2019-03-16 06:36:03'),
(317, 'module_users', 0, 'Inactive', 'Неактивный', '2019-03-16 06:36:03'),
(318, 'module_windowto', 0, 'Manage reference (window to..)', 'Управление справочником (\"окна выходят на..\")', '2019-03-16 06:36:04'),
(319, 'module_windowto', 0, 'Manage reference', 'Управление справочником', '2019-03-16 06:36:04'),
(320, 'module_windowto', 0, 'Add value', 'Добавление значения', '2019-03-16 06:36:04'),
(321, 'module_windowto', 0, 'Value', 'Значение', '2019-03-16 06:36:04'),
(322, 'module_windowto', 0, 'Update value', 'Редактирование значения', '2019-03-16 06:36:04'),
(323, 'module_windowto', 0, 'Delete value', 'Удалить значение', '2019-03-16 06:36:05'),
(324, 'module_windowto', 0, 'Reference \"View:\"', 'Справочник \"Окна выходят\"', '2019-03-16 06:36:05'),
(325, 'module_apartments', 0, 'title', '', '2019-03-16 00:59:50'),
(326, 'module_translateMessage', 0, 'Manage lang messages', 'Управление переводами', '2019-03-16 06:36:05'),
(327, 'module_translateMessage', 0, 'Manage langs', 'Управление переводами', '2019-03-16 06:36:05'),
(328, 'module_translateMessage', 0, 'Edit lang message:', 'Редактирование перевода', '2019-03-16 06:36:05'),
(329, 'module_translateMessage', 0, 'Add message', 'Добавить перевод', '2019-03-16 06:36:06'),
(330, 'common', 0, 'Manage langs', 'Управление переводами', '2019-03-16 06:36:06'),
(331, 'module_apartments', 0, 'window to', 'Окна', '2019-03-16 06:36:06'),
(332, 'common', 0, 'Manage news', 'Управление новостями', '2019-03-16 06:36:06'),
(333, 'common', 0, 'Manage FAQ', 'Управление вопросами-ответами', '2019-03-16 06:36:07'),
(334, 'common', 0, 'Change admin password', 'Пароль администратора', '2019-03-16 06:36:07'),
(335, 'common', 0, 'Settings', 'Настройки', '2019-03-16 06:36:07'),
(336, 'common', 0, 'Import / Export', 'Импорт / Экспорт ', '2019-03-16 06:36:07'),
(337, 'common', 0, 'Manage slider', 'Управление слайдером', '2019-03-16 06:36:08'),
(338, 'common', 0, 'News product', 'Новости продукта', '2019-03-16 06:36:08'),
(339, 'common', 0, 'Add ad', 'Добавить объявление', '2019-03-16 06:36:08'),
(340, 'common', 0, 'Search in section', 'Искать в разделе', '2019-03-16 06:36:08'),
(341, 'module_currency', 0, 'Manage currency', 'Управление валютой', '2019-03-16 06:36:08'),
(342, 'module_currency', 0, 'AUD_translate', 'Австралийский доллар', '2019-03-16 06:36:09'),
(343, 'module_currency', 0, 'AZN_translate', 'Азербайджанский манат', '2019-03-16 06:36:09'),
(344, 'module_currency', 0, 'GBP_translate', 'Фунт стерлингов Соединенного королевства', '2019-03-16 06:36:09'),
(345, 'module_currency', 0, 'AMD_translate', 'Армянских драмов', '2019-03-16 06:36:09'),
(346, 'module_currency', 0, 'BYR_translate', 'Белорусских рублей', '2019-03-16 06:36:10'),
(347, 'module_currency', 0, 'BGN_translate', 'Болгарский лев', '2019-03-16 06:36:10'),
(348, 'module_currency', 0, 'BRL_translate', 'Бразильский реал', '2019-03-16 06:36:10'),
(349, 'module_currency', 0, 'HUF_translate', 'Венгерских форинтов', '2019-03-16 06:36:10'),
(350, 'module_currency', 0, 'DKK_translate', 'Датских крон', '2019-03-16 06:36:10'),
(351, 'module_currency', 0, 'USD_translate', '$', '2019-03-16 00:59:50'),
(352, 'module_currency', 0, 'EUR_translate', 'Евро', '2019-03-16 06:36:11'),
(353, 'module_currency', 0, 'INR_translate', 'Индийских рупий', '2019-03-16 06:36:11'),
(354, 'module_currency', 0, 'KZT_translate', 'Казахских тенге', '2019-03-16 06:36:11'),
(355, 'module_currency', 0, 'CAD_translate', 'Канадский доллар', '2019-03-16 06:36:11'),
(356, 'module_currency', 0, 'KGS_translate', 'Киргизских сомов', '2019-03-16 06:36:12'),
(357, 'module_currency', 0, 'CNY_translate', 'Китайских юаней', '2019-03-16 06:36:12'),
(358, 'module_currency', 0, 'LVL_translate', 'Латвийский лат', '2019-03-16 06:36:12'),
(359, 'module_currency', 0, 'LTL_translate', 'Литовский лит', '2019-03-16 06:36:12'),
(360, 'module_currency', 0, 'MDL_translate', 'Молдавских леев', '2019-03-16 06:36:12'),
(361, 'module_currency', 0, 'NOK_translate', 'Норвежских крон', '2019-03-16 06:36:13'),
(362, 'module_currency', 0, 'PLN_translate', 'Польских злотых', '2019-03-16 06:36:13'),
(363, 'module_currency', 0, 'RON_translate', 'Новых румынских леев', '2019-03-16 06:36:13'),
(364, 'module_currency', 0, 'XDR_translate', 'Специальные права заимствования (Special Drawing Rights, SDR)', '2019-03-16 06:36:13'),
(365, 'module_currency', 0, 'SGD_translate', 'Сингапурский доллар', '2019-03-16 06:36:13'),
(366, 'module_currency', 0, 'TJS_translate', 'Таджикских сомони', '2019-03-16 06:36:14'),
(367, 'module_currency', 0, 'TRY_translate', 'Турецкая лира', '2019-03-16 06:36:14'),
(368, 'module_currency', 0, 'TMT_translate', 'Новый туркменский манат', '2019-03-16 06:36:14'),
(369, 'module_currency', 0, 'UZS_translate', 'Узбекских сумов', '2019-03-16 06:36:14'),
(370, 'module_currency', 0, 'UAH_translate', 'Украинских гривен', '2019-03-16 06:36:14'),
(371, 'module_currency', 0, 'CZK_translate', 'Чешских крон', '2019-03-16 06:36:15'),
(372, 'module_currency', 0, 'SEK_translate', 'Шведских крон', '2019-03-16 06:36:15'),
(373, 'module_currency', 0, 'CHF_translate', 'Швейцарский франк', '2019-03-16 06:36:15'),
(374, 'module_currency', 0, 'ZAR_translate', 'Южноафриканских рэндов', '2019-03-16 06:36:15'),
(375, 'module_currency', 0, 'KRW_translate', 'Вон Республики Корея', '2019-03-16 06:36:15'),
(376, 'module_currency', 0, 'JPY_translate', 'Японских иен', '2019-03-16 06:36:16'),
(377, 'module_currency', 0, 'RUB_translate', 'руб.', '2019-03-16 06:36:16'),
(378, 'module_lang', 0, 'Manage lang', 'Управление языками', '2019-03-16 06:36:16'),
(379, 'module_lang', 0, 'Update lang', 'Обновление языка', '2019-03-16 06:36:16'),
(380, 'module_lang', 0, 'Create new lang', 'Добавить новый язык', '2019-03-16 06:36:17'),
(381, 'module_lang', 0, 'Name ISO', 'Код языка ISO 639-1', '2019-03-16 06:36:17'),
(382, 'common', 0, 'Currency', 'Валюта', '2019-03-16 06:36:17'),
(383, 'common', 0, 'Listings', 'Объявления', '2019-03-16 06:36:17'),
(384, 'common', 0, 'List your property', 'Добавить объявление', '2019-03-16 06:36:18'),
(385, 'common', 0, 'Comments', 'Комментарии', '2019-03-16 06:36:18'),
(386, 'common', 0, 'Categories of references', 'Управление категориями', '2019-03-16 06:36:18'),
(387, 'common', 0, 'Values of references', 'Значения справочников', '2019-03-16 06:36:18'),
(388, 'common', 0, 'Reference (window to..)', 'Справочник \"Окна выходят..\"', '2019-03-16 06:36:18'),
(389, 'common', 0, 'Payments', 'Платежи', '2019-03-16 06:36:19'),
(390, 'common', 0, 'Payment systems', 'Платёжные системы', '2019-03-16 06:36:19'),
(391, 'common', 0, 'Content', 'Наполнение', '2019-03-16 06:36:19'),
(392, 'common', 0, 'News', 'Новости', '2019-03-16 06:36:19'),
(393, 'common', 0, 'Top menu items', 'Управление меню', '2019-03-16 06:36:19'),
(394, 'common', 0, 'Modules', 'Модули', '2019-03-16 06:36:20'),
(395, 'common', 0, 'Slide-show on the Home page', 'Слайдер', '2019-03-16 06:36:20'),
(396, 'common', 0, 'Translations', 'Управление переводами', '2019-03-16 06:36:20'),
(397, 'common', 0, 'Reference \"Property types\"', '\"Тип недвижимости\"', '2019-03-16 06:36:20'),
(398, 'common', 0, 'Reference \"City/Cities\"', 'Справочник \"Город\"', '2019-03-16 06:36:20'),
(399, 'common', 0, 'Log out', 'Выход', '2019-03-16 06:36:21'),
(400, 'common', 0, 'Sections', 'Разделы', '2019-03-16 06:36:21'),
(401, 'common', 0, 'Menu', 'Меню', '2019-03-16 06:36:21'),
(402, 'common', 0, 'Change', 'Изменить', '2019-03-16 06:36:21'),
(403, 'module_translateMessage', 0, 'category', 'Категория', '2019-03-16 06:36:21'),
(404, 'common', 0, 'Language', 'Язык', '2019-03-16 06:36:22'),
(405, 'common', 0, 'Last updated on', 'Дата изменения', '2019-03-16 06:36:22'),
(406, 'common', 0, 'Languages', 'Управление языками', '2019-03-16 06:36:22'),
(407, 'common', 0, 'Languages and currency', 'Языки и валюта', '2019-03-16 06:36:22'),
(408, 'common', 0, 'Currencies', 'Валюта', '2019-03-16 06:36:23'),
(409, 'module_booking', 0, 'Email', 'E-mail', '2019-03-16 06:36:23'),
(410, 'common', 0, 'Awaiting moderation', 'Ожидает модерации', '2019-03-16 06:36:23'),
(411, 'common', 0, 'administrator', 'Администратор', '2019-03-16 06:36:23'),
(412, 'common', 0, 'Name', 'Заголовок', '2019-03-16 06:36:23'),
(413, 'module_menumanager', 0, 'Add menu item', 'Добавить пункт меню', '2019-03-16 06:36:24'),
(414, 'module_menumanager', 0, 'Manage menu items', 'Управление пунктами меню', '2019-03-16 06:36:24'),
(415, 'common', 0, 'Move an item down', 'Переместить элемент ниже', '2019-03-16 06:36:24'),
(416, 'common', 0, 'Move an item up', 'Переместить элемент выше', '2019-03-16 06:36:24'),
(417, 'common', 0, 'Are you sure you want to delete this item?', 'Вы действительно хотите удалить этот элемент?', '2019-03-16 06:36:25'),
(418, 'common', 0, 'Close', 'Закрыть', '2019-03-16 06:36:25'),
(419, 'module_configuration', 0, 'Enter the required value', 'Введите требуемое значение', '2019-03-16 06:36:25'),
(420, 'common', 0, 'Other', 'Другое', '2019-03-16 06:36:25'),
(421, 'common', 0, 'News about Open Real Estate CMS', 'Новости продукта', '2019-03-16 06:36:25'),
(422, 'common', 0, 'Seo settings', 'Настройки SEO', '2019-03-16 06:36:26'),
(423, 'module_seo', 0, 'siteName', 'UyJoy', '2019-03-16 00:59:50'),
(424, 'module_seo', 0, 'siteKeywords', 'продажа недвижимости', '2019-03-16 00:59:50'),
(425, 'module_seo', 0, 'siteDescription', 'UyJoy-продажа недвижимости', '2019-03-16 00:59:50'),
(426, 'module_seo', 0, 'Update date', 'Дата обновления', '2019-03-16 06:36:26'),
(427, 'module_seo', 0, 'Name', 'Название', '2019-03-16 06:36:27'),
(428, 'module_seo', 0, 'Value', 'Значение', '2019-03-16 06:36:27'),
(429, 'module_seo', 0, 'Manage SEO settings', 'Управление настройками SEO', '2019-03-16 06:36:27'),
(430, 'module_seo', 0, 'Edit value', 'Редактировать значение', '2019-03-16 06:36:27'),
(431, 'module_lang', 0, 'Manage langs', 'Управление языками', '2019-03-16 06:36:27'),
(432, 'module_lang', 0, 'Add lang', 'Добавить язык', '2019-03-16 06:36:28'),
(433, 'module_lang', 0, 'Name Iso', 'Код языка ISO 639-1', '2019-03-16 06:36:28'),
(434, 'module_lang', 0, 'Activity', 'Активность', '2019-03-16 06:36:28'),
(435, 'module_lang', 0, 'Copy lang from', 'Скопировать данные из', '2019-03-16 06:36:28'),
(436, 'module_configuration', 0, 'Section', 'Раздел', '2019-03-16 06:36:28'),
(437, 'module_configuration', 0, 'Setting', 'Настройка', '2019-03-16 06:36:29'),
(438, 'module_currency', 0, 'Nominal', 'Номинал', '2019-03-16 06:36:29'),
(439, 'module_currency', 0, 'Value', 'Значение', '2019-03-16 06:36:29'),
(440, 'module_currency', 0, 'Is Default', 'По умолчанию', '2019-03-16 06:36:29'),
(441, 'common', 0, 'Date updated', 'Дата обновления', '2019-03-16 06:36:29'),
(442, 'module_currency', 0, 'Set the default currency', 'Установить валюту по умолчанию', '2019-03-16 06:36:30'),
(443, 'module_currency', 0, 'Enter the required value', 'Введите требуемое значение', '2019-03-16 06:36:30'),
(444, 'module_currency', 0, 'This is the default currency', 'Эта валюта по умолчанию', '2019-03-16 06:36:30'),
(445, 'module_currency', 0, 'Convert the data in this currency?', 'Конвертировать данные по курсу в эту валюту?', '2019-03-16 06:36:30'),
(446, 'module_currency', 0, 'Set default', 'Установить по умолчанию', '2019-03-16 06:36:30'),
(447, 'common', 0, 'Currency', 'Валюта', '2019-03-16 06:36:31'),
(448, 'common', 0, 'Users', 'Пользователи', '2019-03-16 06:36:31'),
(449, 'module_booking', 0, 'Status', 'Статус', '2019-03-16 06:36:31'),
(450, 'common', 0, 'Additional info', 'Дополнительно', '2019-03-16 06:36:31'),
(451, 'module_apartments', 0, 'What is near?', 'Что находится рядом?', '2019-03-16 06:36:31'),
(452, 'common', 0, 'select city', 'Выберите город', '2019-03-16 06:36:32'),
(453, 'common', 0, 'check all', 'Выбрать все', '2019-03-16 06:36:32'),
(454, 'common', 0, '# of # selected', 'выбрано # из # доступных', '2019-03-16 06:39:40'),
(455, 'common', 0, '4 and more', '4 и более', '2019-03-16 06:36:32'),
(456, 'module_apartments', 0, 'Status (owner)', 'Статус (владелец)', '2019-03-16 06:36:32'),
(457, 'module_apartments', 0, 'Owner', 'Владелец', '2019-03-16 06:36:33'),
(458, 'module_menumanager', 0, 'Manage of the top menu', 'Управление пунктами меню', '2019-03-16 06:36:33'),
(459, 'module_menumanager', 0, 'Add item', 'Добавить пункт меню', '2019-03-16 06:36:33'),
(460, 'module_menumanager', 0, 'Update', 'Редактирование', '2019-03-16 06:36:33'),
(461, 'module_menumanager', 0, 'Delete item', 'Удалить пункт меню', '2019-03-16 06:36:33'),
(462, 'module_menumanager', 0, 'The page with the text in the drop-down list', 'Страница с текстом в выпадающем списке ', '2019-03-16 06:36:34'),
(463, 'module_menumanager', 0, 'Reference in the drop-down list (set manually)', 'Ссылка в выпадающем списке (задается вручную)', '2019-03-16 06:36:34'),
(464, 'module_menumanager', 0, 'The drop-down list', 'Выпадающий список', '2019-03-16 06:36:34'),
(465, 'module_menumanager', 0, 'A page with text', 'Страница с текстом', '2019-03-16 06:36:34'),
(466, 'module_menumanager', 0, 'Simple link (set manually)', 'Простая ссылка (задается вручную)', '2019-03-16 06:36:35'),
(467, 'module_menumanager', 0, 'Display the bottom of the page', 'Отобразить снизу страницы', '2019-03-16 06:36:35'),
(468, 'module_menumanager', 0, 'The text on the page', 'Текст на странице', '2019-03-16 06:36:35'),
(469, 'module_menumanager', 0, 'Page Title', 'Заголовок страницы', '2019-03-16 06:36:35'),
(470, 'module_menumanager', 0, 'The drop-down list to contain', 'Выпадающий список для размещения в нем', '2019-03-16 06:36:35'),
(471, 'module_menumanager', 0, 'Link', 'Ссылка', '2019-03-16 06:36:36'),
(472, 'module_menumanager', 0, 'Type of link', 'Тип ссылки', '2019-03-16 06:36:36'),
(473, 'module_menumanager', 0, 'Text links', 'Текст ссылки', '2019-03-16 06:36:36'),
(474, 'module_menumanager', 0, 'Not selected', 'Не выбрано', '2019-03-16 06:36:36'),
(475, 'common', 0, 'No', 'Нет', '2019-03-16 06:36:36'),
(476, 'common', 0, 'Listing', 'Список объявлений', '2019-03-16 06:36:37'),
(477, 'common', 0, 'Search for listings on the map', 'Поиск объявлений на карте', '2019-03-16 06:36:37'),
(478, 'common', 0, 'The form of the section \"Contact Us\"', 'Форма \"Контакты\"', '2019-03-16 06:36:37'),
(479, 'module_menumanager', 0, 'Management section', 'Управление разделом', '2019-03-16 06:36:37'),
(480, 'common', 0, 'Translate', 'Перевести', '2019-03-16 06:36:37'),
(481, 'common', 0, 'Copy to all languages', 'Скопировать во все языки', '2019-03-16 06:36:38'),
(482, 'module_apartments', 0, 'Price will be saved (converted) in the default currency on the site', 'Цена будет сохранена (конвертирована) в валюту по умолчанию на сайте', '2019-03-16 06:36:38'),
(483, 'module_userads', 0, 'Status (owner)', 'Статус (владелец)', '2019-03-16 06:36:38'),
(484, 'module_userads', 0, 'Owner', 'Владелец', '2019-03-16 06:36:38'),
(485, 'module_configuration', 0, 'cachingTime', 'Время кеширования объектов (в секундах)', '2019-03-16 06:36:39'),
(486, 'module_configuration', 0, 'shortCashingTime', 'Время кеширования сложных объектов (в секундах)', '2019-03-16 06:36:39'),
(487, 'module_configuration', 0, 'commentNeedApproval', 'Одобрение администратором комментариев', '2019-03-16 06:36:39'),
(488, 'module_configuration', 0, 'module_articles_itemsPerPage', 'Элементов на страницу в разделе \"Вопросы-Ответы\"', '2019-03-16 06:36:39'),
(489, 'module_configuration', 0, 'module_articles_truncateAfterWords', 'Обрезать текст статьи и добавлять ссылку \"Читать далее\" после ... слов (0 - не обрезать)', '2019-03-16 06:36:40'),
(490, 'module_configuration', 0, 'module_usercpanel_bookingsPerPage', 'Заказов на страницу в личном кабинете пользователя', '2019-03-16 06:36:40'),
(491, 'module_configuration', 0, 'adminEmail', 'E-mail администратора', '2019-03-16 06:36:40'),
(492, 'module_configuration', 0, 'adminPhone', 'Контактный телефон', '2019-03-16 06:36:40'),
(493, 'module_configuration', 0, 'adminSkype', 'Skype', '2019-03-16 00:59:50'),
(494, 'module_configuration', 0, 'adminICQ', 'ICQ', '2019-03-16 00:59:50'),
(495, 'module_configuration', 0, 'adminAddress', 'Адрес', '2019-03-16 06:36:41'),
(496, 'module_configuration', 0, 'moduleEntries_entriesPerPage', 'Записей на страницу в разделе \"Материалы\"', '2019-03-16 06:36:41'),
(497, 'module_configuration', 0, 'moduleApartments_maxRooms', 'Максимальное количество комнат для объявления', '2019-03-16 06:36:41'),
(498, 'module_configuration', 0, 'moduleApartments_maxFloor', 'Максимальное количество этажей для объявления', '2019-03-16 06:36:41'),
(499, 'module_configuration', 0, 'module_apartments_gmapsCenterX', 'Центровать карту по умолчанию, долгота (X)', '2019-03-16 06:36:42'),
(500, 'module_configuration', 0, 'module_apartments_gmapsCenterY', 'Центровать карту по умолчанию, широта (Y)', '2019-03-16 06:36:42'),
(501, 'module_configuration', 0, 'module_apartments_gmapsZoomCity', 'Уровень zoom для просмотра карты города', '2019-03-16 06:36:42'),
(502, 'module_configuration', 0, 'module_apartments_gmapsZoomApartment', 'Уровень zoom для просмотра объявления', '2019-03-16 06:36:42'),
(503, 'module_configuration', 0, 'module_apartment_gmapBounds', 'Координаты для поиска адреса', '2019-03-16 06:36:43'),
(504, 'module_configuration', 0, 'useGoogleMap', 'Использовать модуль карт на сайте?', '2019-03-16 06:36:43'),
(505, 'module_configuration', 0, 'adminPaginationPageSize', 'Панель управления: количество элементов для табличного отображения', '2019-03-16 06:36:43'),
(506, 'module_configuration', 0, 'module_notifier_adminNewComment', 'Посылать администратору письмо при новых комментариях?', '2019-03-16 06:36:43'),
(507, 'module_configuration', 0, 'module_notifier_adminNewBooking', 'Посылать администратору письмо при новых заявках на бронь?', '2019-03-16 06:36:43'),
(508, 'module_configuration', 0, 'module_notifier_userPaymentSuccess', 'Посылать пользователю письмо при успешной оплате брони?', '2019-03-16 06:36:44'),
(509, 'module_configuration', 0, 'module_notifier_userNewUser', 'Посылать пользователю письмо при регистрации? (Эта настройка будет работать, только если подтверждение регистрации отключено)', '2019-03-16 06:36:44'),
(510, 'module_configuration', 0, 'module_notifier_adminNewUser', 'Посылать администратору письмо при создании нового пользователя?', '2019-03-16 06:36:44'),
(511, 'module_configuration', 0, 'module_notifier_adminNewContactform', 'Посылать администратору письмо при отправке сообщения через форму обратной связи?', '2019-03-16 06:36:44'),
(512, 'module_configuration', 0, 'useYandexMap', 'Использовать модуль карт Yandex на сайте?', '2019-03-16 06:36:44'),
(513, 'module_configuration', 0, 'module_apartments_ymapsCenterX', 'Центровать карту по умолчанию, долгота (X)', '2019-03-16 06:36:45'),
(514, 'module_configuration', 0, 'module_apartments_ymapsCenterY', 'Центровать карту по умолчанию, широта (Y)', '2019-03-16 06:36:45'),
(515, 'module_configuration', 0, 'module_apartments_ymapsZoomCity', 'Уровень zoom для просмотра карты города', '2019-03-16 06:36:45'),
(516, 'module_configuration', 0, 'module_apartments_ymapsZoomApartment', 'Уровень zoom для просмотра объявления', '2019-03-16 06:36:45'),
(517, 'module_configuration', 0, 'module_apartments_ymapsKey', 'Яндекс.Карты API key', '2019-03-16 06:36:46'),
(518, 'module_configuration', 0, 'module_apartments_ymapsSpanX', 'Область поиска адреса, долгота (X)', '2019-03-16 06:36:46'),
(519, 'module_configuration', 0, 'module_apartments_ymapsSpanY', 'Область поиска адреса, широта (Y)', '2019-03-16 06:36:46'),
(520, 'module_configuration', 0, 'usePriceSlider', 'Использовать \"ползунок\" в поиске для поля \"Цена\"', '2019-03-16 06:36:46'),
(521, 'module_configuration', 0, 'useSquareSlider', 'Использовать \"ползунок\" в поиске для поля \"Площадь\"', '2019-03-16 06:36:47'),
(522, 'module_configuration', 0, 'useFloorSlider', 'Использовать \"ползунок\" в поиске для поля \"Этаж\"', '2019-03-16 06:36:47'),
(523, 'module_configuration', 0, 'useRoomSlider', 'Использовать \"ползунок\" в поиске для поля \"Количество комнат\"', '2019-03-16 06:36:47'),
(524, 'module_configuration', 0, 'usePrettyPrice', 'Использовать сокращения \"млн.\" или \"тыс.\" при выводе цены', '2019-03-16 06:36:47'),
(525, 'module_configuration', 0, 'useUserads', 'Возможность добавления объявлений пользователями', '2019-03-16 06:36:48'),
(526, 'module_configuration', 0, 'useUseradsModeration', 'Модерация объявлений от пользователей', '2019-03-16 06:36:48'),
(527, 'module_configuration', 0, 'module_notifier_adminNewBooking', 'Посылать администратору письмо при бронировании из просмотра объявления?', '2019-03-16 06:36:48'),
(528, 'module_configuration', 0, 'module_notifier_ownerNewBooking', 'Посылать владельцу письмо при бронировании из просмотра объявления?', '2019-03-16 06:36:48'),
(529, 'module_configuration', 0, 'useReferenceLinkInView', 'Ссылки на справочники при просмотре объявления', '2019-03-16 06:36:48'),
(530, 'common', 0, 'Site service', 'Обслуживание сайта', '2019-03-16 06:36:49'),
(531, 'common', 0, '{label} cannot be blank for {lang}.', 'Необходимо заполнить поле {label} для языка {lang}.', '2019-03-16 06:36:49'),
(532, 'module_configuration', 0, 'defaultCity', 'Город по умолчанию, для позиционирования на карте', '2019-03-16 06:36:49'),
(533, 'module_paysystem', 0, 'robokassa', 'Robokassa', '2019-03-16 00:59:50'),
(534, 'module_paysystem', 0, 'offline', 'Платеж через банк', '2019-03-16 06:36:50'),
(535, 'module_payment', 0, 'Password 1', 'Пароль 1', '2019-03-16 06:36:50'),
(536, 'module_payment', 0, 'Password 2', 'Пароль 2', '2019-03-16 06:36:50'),
(537, 'module_payment', 0, 'Description of the system', 'Описание системы', '2019-03-16 06:36:50'),
(538, 'module_payment', 0, 'Available payment methods', 'Предлагаемая валюта платежа', '2019-03-16 06:36:50'),
(539, 'module_payment', 0, 'Awaiting confirmation of receipt', 'Ожидается подтверждение о получении', '2019-03-16 06:36:51'),
(540, 'module_payment', 0, 'Confirm payment', 'Подтверждение оплаты', '2019-03-16 06:36:51'),
(541, 'module_payment', 0, 'Method of payment', 'Форма оплаты', '2019-03-16 06:36:51'),
(542, 'module_paidservices', 0, 'Manage paid services', 'Платные услуги', '2019-03-16 06:36:51'),
(543, 'module_paidservices', 0, 'Price', 'Цена', '2019-03-16 06:36:51'),
(544, 'module_paidservices', 0, 'Duration of the day', 'Срок действия в днях', '2019-03-16 06:36:52');
INSERT INTO `ore_gj_translate_message` (`id`, `category`, `status`, `message`, `translation_ru`, `date_updated`) VALUES
(545, 'common', 0, 'Paid service', 'Платная услуга', '2019-03-16 06:36:52'),
(546, 'common', 0, 'Will be used for listings', 'Будет использоваться для объявления', '2019-03-16 06:36:52'),
(547, 'common', 0, 'The service will be active', 'Услуга будет активной', '2019-03-16 06:36:52'),
(548, 'common', 0, 'Cost of service', 'Стоимость услуги', '2019-03-16 06:36:53'),
(549, 'module_payment', 0, 'Thank you! Notification of your payment sent to the administrator.', 'Спасибо! Уведомление о платеже отправлено администратору.', '2019-03-16 06:36:53'),
(550, 'common', 0, 'Paid Service', 'Платная услуга', '2019-03-16 06:36:53'),
(551, 'module_paysystem', 0, 'offline_description', 'Чтобы оплатить бронь Вы должны перечислить указанную выше сумму по следующим реквизитам:\r\nРасчетный счет: ________, БИК:_____, ОКАТО______ ...\r\n\r\nПосле того, как Вы отправите указанную сумму по данным реквизитам, нажмите кнопку \"Продолжить\".\r\nАдминистратор получит уведомление о платеже и бронь будет подтверждена после получения денег.', '2019-03-16 06:36:53'),
(552, 'module_paysystem', 0, 'robokassa_description', '<p><span>ROBOKASSA — это сервис, позволяющий произвести оплату с помощью&nbsp;</span><a href=\"http://robokassa.ru/ru/Creditcards.aspx\">банковских карт</a><span>, в любой&nbsp;</span><a href=\"http://robokassa.ru/ru/Currencies.aspx\">электронной валюте</a><span>, с помощью сервисов&nbsp;</span><a href=\"http://robokassa.ru/ru/Sms.aspx\">мобильная коммерция</a><span>&nbsp;(МТС и Билайн), платежи через&nbsp;</span><a href=\"http://robokassa.ru/ru/E-invoicing.aspx\">интернет-банк</a><span>&nbsp;ведущих Банков РФ, платежи через банкоматы, через&nbsp;</span><a href=\"http://robokassa.ru/ru/Terminals.aspx\">терминалы мгновенной оплаты</a><span>, через систему денежных переводов&nbsp;</span><a href=\"http://www.contact-sys.com/\" target=\"_blank\">Contact</a><span>, а также с помощью&nbsp;</span><a href=\"http://robokassa.ru/ru/iRobokassa.aspx\">приложения для iPhone</a><span>.</span></p>', '2019-03-16 06:36:54'),
(553, 'module_payment', 0, 'Payment is canceled', 'Платеж отменен', '2019-03-16 06:36:54'),
(554, 'module_payment', 0, 'Payment successfully held', 'Платёж успешно завершён', '2019-03-16 06:36:54'),
(555, 'module_paidservices', 0, 'Paid service special offer', 'Пометить как спец. предложение', '2019-03-16 06:36:54'),
(556, 'common', 0, 'Pay with', 'Оплатить с помощью', '2019-03-16 06:36:55'),
(557, 'module_apartments', 0, 'Views', 'Просмотров', '2019-03-16 06:36:55'),
(558, 'module_apartments', 0, 'views_all', 'Всего просмотров', '2019-03-16 06:36:55'),
(559, 'module_apartments', 0, 'views_today', 'Просмотров за сегодня', '2019-03-16 06:36:55'),
(563, 'module_service', 0, 'Page', 'Страница', '2019-03-16 06:36:56'),
(564, 'module_service', 0, 'Closed_maintenance', 'Закрыт на обслуживание', '2019-03-16 06:36:56'),
(565, 'module_service', 0, 'Allow_ip', 'Открыт для IP', '2019-03-16 06:36:56'),
(566, 'module_service', 0, 'Through_comma', 'Через запятую', '2019-03-16 06:36:56'),
(567, 'common', 0, 'Proceed', 'Продолжить', '2019-03-16 06:36:56'),
(568, 'common', 0, 'User', 'Пользователь', '2019-03-16 06:36:57'),
(569, 'module_paidservices', 0, 'Name', 'Название', '2019-03-16 06:36:57'),
(570, 'common', 0, 'Yes', 'Да', '2019-03-16 06:36:57'),
(571, 'module_configuration', 0, 'useShowUserInfo', 'Использовать отображение информации о пользователе', '2019-03-16 06:36:57'),
(572, 'module_configuration', 0, 'useSliderSimilarAds', 'Использовать отображение похожих объявлений', '2019-03-16 06:36:57'),
(573, 'module_configuration', 0, 'Fill a field', 'Заполните поле', '2019-03-16 06:36:58'),
(574, 'module_apartments', 0, 'Owner phone', 'Телефон владельца', '2019-03-16 06:36:58'),
(575, 'module_apartments', 0, 'Show', 'Показать', '2019-03-16 06:36:58'),
(576, 'common', 0, '{label} is too short for {lang} (minimum is {min} characters).', '{label} слишком короткий для языка {lang} (Минимум: {min} симв.).', '2019-03-16 06:36:58'),
(577, 'common', 0, '{label} is too long for {lang} (maximum is {max} characters).', '{label} слишком длинный для языка {lang} (Максимум: {max} симв.).', '2019-03-16 06:36:59'),
(578, 'common', 0, '{label} is of the wrong length for {lang} (should be {length} characters).', '{label} неверной длины для языка {lang} (Должен быть {length} симв.).', '2019-03-16 06:36:59'),
(579, 'common', 0, 'Listing (random)', 'Список объявлений (случайные)', '2019-03-16 06:36:59'),
(580, 'common', 0, 'Cancel', 'Отмена', '2019-03-16 06:36:59'),
(581, 'common', 0, 'Request for confirmation', 'Запрос на подтверждение', '2019-03-16 06:36:59'),
(582, 'module_referencecategories', 0, 'Reference name', 'Название категории', '2019-03-16 06:37:00'),
(583, 'module_referencevalues', 0, 'Reference value', 'Значение', '2019-03-16 06:37:03'),
(584, 'module_bookingcalendar', 0, 'The periods of booking apartment', 'Периоды броней', '2019-03-16 06:37:03'),
(585, 'module_bookingcalendar', 0, 'Fill fields', 'Заполните поля', '2019-03-16 06:37:03'),
(586, 'module_bookingcalendar', 0, 'Edit', 'Изменить', '2019-03-16 06:37:03'),
(587, 'module_bookingcalendar', 0, 'From', 'С', '2019-03-16 06:37:04'),
(588, 'module_bookingcalendar', 0, 'To', 'По', '2019-03-16 06:37:04'),
(589, 'module_bookingcalendar', 0, 'Status', 'Статус', '2019-03-16 06:37:04'),
(590, 'module_bookingcalendar', 0, 'from', 'с', '2019-03-16 06:37:04'),
(591, 'module_bookingcalendar', 0, 'to', 'по', '2019-03-16 06:37:05'),
(592, 'module_bookingcalendar', 0, 'Reserved', 'Забронировано', '2019-03-16 06:37:05'),
(593, 'module_bookingcalendar', 0, 'Free', 'Свободно', '2019-03-16 06:37:05'),
(594, 'module_bookingcalendar', 0, 'Access denied', 'Доступ запрещён', '2019-03-16 06:37:05'),
(595, 'module_bookingcalendar', 0, 'Delete error', 'Ошибка при удалении', '2019-03-16 06:37:05'),
(598, 'module_bookingcalendar', 0, 'Are you sure?', 'Вы уверены?', '2019-03-16 06:37:06'),
(599, 'module_bookingcalendar', 0, 'Periods of free / reserved apartment', 'Периоды свободного/сданного жилья', '2019-03-16 06:37:06'),
(600, 'module_bookingcalendar', 0, 'You chose dates in the range of which there are busy days', 'Вы выбрали даты, в интервале которых есть занятые дни', '2019-03-16 06:37:06'),
(601, 'module_apartmentCity', 0, 'help_apartmentCity_backend_main_admin', 'Города будут доступны для поиска только при наличии в них объявлений.', '2019-03-16 06:37:06'),
(602, 'common', 0, 'Default', 'По умолчанию', '2019-03-16 06:37:06'),
(603, 'module_configuration', 0, 'dateFormat', 'Формат даты на сайте', '2019-03-16 06:37:07'),
(604, 'common', 0, 'Advertising banners', 'Рекламный модуль', '2019-03-16 06:37:07'),
(605, 'common', 0, 'Name of Payment system', 'Способ оплаты', '2019-03-16 06:37:07'),
(606, 'common', 0, 'Amount', 'Сумма', '2019-03-16 06:37:07'),
(607, 'common', 0, 'Date created', 'Дата создания', '2019-03-16 06:37:08'),
(608, 'module_payment', 0, 'Name', 'Имя', '2019-03-16 06:37:08'),
(609, 'module_payment', 0, 'Description', 'Описание', '2019-03-16 06:37:08'),
(610, 'module_payment', 0, 'Payment System Settings saved successfully.', 'Настройки платежной системы успешно сохранены.', '2019-03-16 06:37:08'),
(611, 'module_lang', 0, 'Administrator e-mail', 'E-mail администратору', '2019-03-16 06:37:09'),
(612, 'module_socialauth', 0, 'Login with', 'Войти при помощи', '2019-03-16 06:37:09'),
(614, 'module_socialauth', 0, 'During export account data may be generate random email and password. Please change it.', 'Во время входа на сайт через сторонние сервисы Ваши email и пароль могли быть сгенерированы случайным образом, пожалуйста смените их.', '2019-03-16 06:37:09'),
(615, 'module_socialauth', 0, 'Please change your email and password!', 'Пожалуйста, смените свой email и пароль!', '2019-03-16 06:37:09'),
(616, 'module_socialauth', 0, 'Your account not active. Administrator deactivate your account.', 'Ваш аккаунт не активен. Администратор сайта деактивировал ваш аккаунт.', '2019-03-16 06:37:13'),
(617, 'module_socialauth', 0, 'vkontakte_label', 'Вконтакте', '2019-03-16 06:37:13'),
(618, 'module_socialauth', 0, 'google_label', 'Google', '2019-03-16 00:59:50'),
(619, 'module_socialauth', 0, 'facebook_label', 'Facebook', '2019-03-16 06:37:13'),
(620, 'module_socialauth', 0, 'linkedin_label', 'LinkedIn', '2019-03-16 06:37:13'),
(621, 'module_socialauth', 0, 'twitter_label', 'Twitter', '2019-03-16 06:37:14'),
(622, 'module_socialauth', 0, 'Undefined service name: {service}.', 'Авторизация с помощью {service} не поддерживается.', '2019-03-16 06:37:14'),
(623, 'module_socialauth', 0, 'Invalid response http code: {code}.', 'Неверный ответ от сервера авторизации: {code}.', '2019-03-16 06:37:14'),
(624, 'module_socialauth', 0, 'Invalid response format.', 'Сервер авторизации вернул данные в неправильном формате.', '2019-03-16 06:37:14'),
(625, 'module_socialauth', 0, 'Unable to complete the authentication because the required data was not received by {provider}.', 'Невозможно завершить авторизацию пользователя, потому что {provider} не передает необходимую информацию.', '2019-03-16 06:37:14'),
(626, 'module_socialauth', 0, 'Unable to complete the request because the user was not authenticated.', 'Невозможно выполнить защищенный запрос, потому что пользователь не был авторизован.', '2019-03-16 06:37:15'),
(627, 'module_socialauth', 0, 'Client_id', 'Client ID', '2019-03-16 06:37:15'),
(628, 'module_socialauth', 0, 'Client_secret', 'Client secret', '2019-03-16 00:59:50'),
(629, 'module_socialauth', 0, 'Key', 'Key', '2019-03-16 00:59:50'),
(630, 'module_socialauth', 0, 'Secret', 'Secret', '2019-03-16 00:59:50'),
(631, 'module_socialauth', 0, 'Section', 'Раздел', '2019-03-16 06:37:16'),
(632, 'module_socialauth', 0, 'Setting', 'Настройка', '2019-03-16 06:37:16'),
(633, 'module_socialauth', 0, 'Enter the required value', 'Введите требуемое значение', '2019-03-16 06:37:16'),
(634, 'module_socialauth', 0, 'Authentication services', 'Сервисы авторизации', '2019-03-16 06:37:17'),
(635, 'module_socialauth', 0, 'Name', 'Название', '2019-03-16 06:37:17'),
(636, 'module_socialauth', 0, 'Value', 'Значение', '2019-03-16 06:37:17'),
(637, 'module_socialauth', 0, 'Manage social settings', 'Управление сервисами авторизации', '2019-03-16 06:37:17'),
(638, 'module_socialauth', 0, 'Update param \"{name}\"', 'Изменение параметра \"{name}\"', '2019-03-16 06:37:17'),
(639, 'module_socialauth', 0, 'google_oauth', 'Google', '2019-03-16 00:59:50'),
(640, 'module_socialauth', 0, 'twitter', 'Twitter', '2019-03-16 00:59:50'),
(641, 'module_socialauth', 0, 'facebook', 'Facebook', '2019-03-16 00:59:50'),
(642, 'module_socialauth', 0, 'vkontakte', 'Вконтакте', '2019-03-16 06:37:18'),
(643, 'module_socialauth', 0, 'useGoogleOauth', 'Использовать авторизацию Google', '2019-03-16 06:37:18'),
(644, 'module_socialauth', 0, 'googleOauthClientId', 'Client ID', '2019-03-16 06:37:19'),
(645, 'module_socialauth', 0, 'googleOauthClientSecret', 'Client secret', '2019-03-16 00:59:50'),
(646, 'module_socialauth', 0, 'useTwitter', 'Использовать авторизацию Twitter', '2019-03-16 06:37:19'),
(647, 'module_socialauth', 0, 'twitterKey', 'Key', '2019-03-16 00:59:50'),
(648, 'module_socialauth', 0, 'twitterSecret', 'Secret', '2019-03-16 00:59:50'),
(649, 'module_socialauth', 0, 'useFacebook', 'Использовать авторизацию Facebook', '2019-03-16 06:37:20'),
(650, 'module_socialauth', 0, 'facebookClientId', 'Client ID', '2019-03-16 06:37:20'),
(651, 'module_socialauth', 0, 'facebookClientSecret', 'Client secret', '2019-03-16 00:59:50'),
(652, 'module_socialauth', 0, 'useVkontakte', 'Использовать авторизацию Вконтакте', '2019-03-16 06:37:21'),
(653, 'module_socialauth', 0, 'vkontakteClientId', 'Client ID', '2019-03-16 06:37:21'),
(654, 'module_socialauth', 0, 'vkontakteClientSecret', 'Client secret', '2019-03-16 00:59:50'),
(655, 'common', 0, 'Social settings', 'Сервисы авторизации', '2019-03-16 06:37:21'),
(656, 'module_socialauth', 0, 'Go to link for register Google application - {link}', 'Для регистрации приложения в Google пройдите по ссылке - {link}', '2019-03-16 06:37:21'),
(657, 'module_socialauth', 0, 'Go to link for register Twitter application - {link}', 'Для регистрации приложения в Twitter пройдите по ссылке - {link}', '2019-03-16 06:37:22'),
(658, 'module_socialauth', 0, 'Go to link for register Facebook application - {link}', 'Для регистрации приложения в Facebook пройдите по ссылке - {link}', '2019-03-16 06:37:22'),
(659, 'module_socialauth', 0, 'Go to link for register VK.com application - {link}', 'Для регистрации приложения в Вконтакте пройдите по ссылке - {link}', '2019-03-16 06:37:22'),
(660, 'module_slider', 0, 'Delete image', 'Удалить изображение', '2019-03-16 06:37:22'),
(661, 'module_slider', 0, 'Edit image', 'Редактировать изображение', '2019-03-16 06:37:23'),
(662, 'common', 0, 'Note:', 'Примечание:', '2019-03-16 06:37:23'),
(663, 'module_advertising', 0, 'Image', 'Изображение', '2019-03-16 06:37:23'),
(664, 'module_advertising', 0, 'HTML code', 'HTML код', '2019-03-16 06:37:23'),
(665, 'module_advertising', 0, 'Top-left', 'Верх-лево', '2019-03-16 06:37:23'),
(666, 'module_advertising', 0, 'Top-right', 'Верх-право', '2019-03-16 06:37:24'),
(667, 'module_advertising', 0, 'Top-center', 'Верх-центр', '2019-03-16 06:37:24'),
(668, 'module_advertising', 0, 'Bottom-left', 'Низ-лево', '2019-03-16 06:37:24'),
(669, 'module_advertising', 0, 'Bottom-right', 'Низ-право', '2019-03-16 06:37:24'),
(670, 'module_advertising', 0, 'Bottom-center', 'Низ-центр', '2019-03-16 06:37:24'),
(671, 'module_advertising', 0, '(press and hold SHIFT button for multiply select)', '(нажмите и удерживайте SHIFT для множественного выбора)', '2019-03-16 06:37:25'),
(672, 'module_advertising', 0, 'Supported file: {supportExt}.', 'Поддерживаемый тип файлов: {supportExt}.', '2019-03-16 06:37:25'),
(673, 'module_advertising', 0, 'You really want to remove the chosen block?', 'Вы действительно хотите удалить выбранный блок?', '2019-03-16 06:37:25'),
(674, 'module_advertising', 0, 'Edit', 'Редактировать', '2019-03-16 06:37:25'),
(675, 'module_advertising', 0, 'Management of advertizing blocks', 'Управление рекламными блоками', '2019-03-16 06:37:25'),
(676, 'module_advertising', 0, 'Edit block', 'Редактировать блок', '2019-03-16 06:37:26'),
(677, 'module_advertising', 0, 'Add block', 'Добавить блок', '2019-03-16 06:37:26'),
(678, 'module_advertising', 0, 'Main page', 'Главная страница', '2019-03-16 06:37:26'),
(679, 'module_advertising', 0, 'View listing', 'Просмотр объявления', '2019-03-16 06:37:26'),
(680, 'module_advertising', 0, 'Search results', 'Результаты поиска', '2019-03-16 06:37:26'),
(681, 'module_advertising', 0, 'Contact us', 'Связаться с нами', '2019-03-16 06:37:27'),
(682, 'module_advertising', 0, 'Special offers', 'Специальные предложения', '2019-03-16 06:37:27'),
(683, 'module_advertising', 0, 'News', 'Новости', '2019-03-16 06:37:27'),
(684, 'module_advertising', 0, 'News -> view', 'Новости -> просмотр', '2019-03-16 06:37:27'),
(685, 'module_advertising', 0, 'Articles', 'FAQ', '2019-03-16 06:37:27'),
(686, 'module_advertising', 0, 'Articles -> view', 'FAQ -> просмотр', '2019-03-16 06:37:28'),
(687, 'module_advertising', 0, 'Login page', 'Страница авторизации', '2019-03-16 06:37:28'),
(688, 'module_advertising', 0, 'Registration page', 'Страница регистрации', '2019-03-16 06:37:28'),
(689, 'module_advertising', 0, 'Recovery password page', 'Страница восстановления пароля', '2019-03-16 06:37:28'),
(690, 'module_advertising', 0, 'I want place', 'Я хочу разместить', '2019-03-16 06:37:28'),
(691, 'module_advertising', 0, 'Position', 'Позиция', '2019-03-16 06:37:29'),
(692, 'module_advertising', 0, 'Pages', 'Страницы', '2019-03-16 06:37:29'),
(693, 'module_advertising', 0, 'File', 'Файл', '2019-03-16 06:37:29'),
(694, 'module_advertising', 0, 'Text/HTML code', 'Текст/HTML код', '2019-03-16 06:37:29'),
(695, 'module_advertising', 0, 'URL', 'Ссылка', '2019-03-16 06:37:29'),
(696, 'module_advertising', 0, 'Alternative text', 'Альтернативный текст', '2019-03-16 06:37:30'),
(697, 'module_advertising', 0, 'Active', 'Активно', '2019-03-16 06:37:30'),
(698, 'module_currency', 0, 'Exchange rate', 'Курс валюты', '2019-03-16 06:37:30'),
(699, 'module_currency', 0, 'Short name', 'Сокращенное наименование', '2019-03-16 06:37:30'),
(700, 'module_translateMessage', 0, 'String constant (defined in code)', 'Строковая константа (задается в коде)', '2019-03-16 06:37:30'),
(701, 'module_translateMessage', 0, 'Constant value (translation)', 'Значение константы (перевод)', '2019-03-16 06:37:31'),
(702, 'module_translateMessage', 0, 'Translated', 'Переведено', '2019-03-16 06:37:31'),
(703, 'module_translateMessage', 0, 'Not translated', 'Не переведено', '2019-03-16 06:37:31'),
(704, 'module_paidservices', 0, 'Description', 'Описание', '2019-03-16 06:37:31'),
(705, 'module_paidservices', 0, 'Update paid service', 'Обновление платной услуги', '2019-03-16 06:37:31'),
(706, 'module_seo', 0, 'Management of compliance of URL, title, description and keywords', 'Управление соответствием URL, title, description и keywords', '2019-03-16 06:37:32'),
(707, 'module_seo', 0, 'Are you sure you want to delete this compliance?', 'Вы уверены что хотите удалить выбранное соответствие?', '2019-03-16 06:37:32'),
(708, 'module_seo', 0, 'Add compliance', 'Добавить соответствие', '2019-03-16 06:37:32'),
(709, 'module_seo', 0, 'URL', 'URL', '2019-03-16 00:59:50'),
(710, 'module_seo', 0, 'Title', 'Заголовок', '2019-03-16 06:37:32'),
(711, 'module_seo', 0, 'Description', 'Описание', '2019-03-16 06:37:33'),
(712, 'module_seo', 0, 'Keywords', 'Ключевые слова', '2019-03-16 06:37:33'),
(713, 'module_seo', 0, 'Date Updated', 'Дата обновления', '2019-03-16 06:37:33'),
(714, 'module_seo', 0, 'Edit compliance', 'Редактировать соответствие', '2019-03-16 06:37:33'),
(715, 'module_seo', 0, 'help_seo_backend_main_admin', 'Добавлять URL нужно без полного адреса сайта (он всё равно вырезается в коде), без указания языкового префикса (en, ru), спереди обязательно должен быть обратный слеш, например \"/news\" или \"/news/12\", \"/property/25\".', '2019-03-16 06:37:34'),
(716, 'module_configuration', 0, 'round_price', 'Округление отображения цены с точностью до N десятичных знаков', '2019-03-16 06:37:34'),
(717, 'module_contactform', 0, 'Thanks_for_message', 'Спасибо за обращение! Мы ответим Вам как можно быстрее.', '2019-03-16 06:37:34'),
(718, 'module_contactform', 0, 'Error_send', 'Сообщение не было отправлено! Исправьте, пожалуйста, ошибки и повторите снова.', '2019-03-16 06:37:34'),
(719, 'module_apartments', 0, 'apartments_main_index_propertyNotAvailable', 'Объявление недоступно.', '2019-03-16 06:37:35'),
(720, 'module_apartmentObjType', 0, 'backend_apartmentObjType_main_admin_NoDeleteLastElement', 'Удалить последний тип нельзя по причине необходимости данного поля в каждом объявлении.', '2019-03-16 06:37:35'),
(721, 'module_apartments', 0, 'validateFloorMoreTotal', 'Текущий этаж не может быть больше, чем количество этажей в доме.', '2019-03-16 06:37:35'),
(722, 'module_apartments', 0, 'million', 'млн.', '2019-03-16 06:37:35'),
(723, 'module_apartments', 0, 'thousand', 'тыс.', '2019-03-16 06:37:35'),
(724, 'module_menumanager', 0, 'backend_menumanager_main_admin_noDeleteSystemItem', 'Данный пункт меню является системным, и его нельзя удалить. Но вы можете отключить его в столбце \"Включено\".', '2019-03-16 06:37:36'),
(725, 'module_quicksearch', 0, 'Sorting by date created', 'Сортировать по дате создания', '2019-03-16 06:37:36'),
(726, 'module_usercpanel', 0, 'Change contact info', 'Изменить контактную информацию', '2019-03-16 06:37:36'),
(727, 'module_paidservices', 0, 'Sorting by date created', 'Сортировать по дате создания', '2019-03-16 06:37:36'),
(728, 'common', 0, 'Error', 'Ошибка', '2019-03-16 06:37:37'),
(729, 'module_notifier', 0, 'message_not_send', 'Письмо не было отправлено', '2019-03-16 06:37:37'),
(730, 'module_configuration', 0, 'mailUseSMTP', 'Использовать отправку почты через SMTP сервер', '2019-03-16 06:37:37'),
(731, 'module_configuration', 0, 'mailSMTPHost', 'Адрес SMTP сервера', '2019-03-16 06:37:37'),
(732, 'module_configuration', 0, 'mailSMTPPort', 'Порт SMTP сервера', '2019-03-16 06:37:37'),
(733, 'module_configuration', 0, 'mailSMTPLogin', 'Имя пользователя SMTP', '2019-03-16 06:37:37'),
(734, 'module_configuration', 0, 'mailSMTPPass', 'Пароль пользователя SMTP', '2019-03-16 06:37:38'),
(735, 'module_configuration', 0, 'mail', 'Почта', '2019-03-16 06:37:38'),
(736, 'module_payment', 0, 'PayPal email', 'PayPal Email', '2019-03-16 06:37:38'),
(737, 'module_payment', 0, 'Please_wait_payment', 'Пожалуйста ждите. Происходит перенаправление на PayPal для оплаты.', '2019-03-16 06:37:38'),
(738, 'module_usercpanel', 0, 'Additional info', 'Дополнительно', '2019-03-16 06:37:38'),
(739, 'module_payment', 0, 'Pay Now', 'Заплатить сейчас', '2019-03-16 06:37:39'),
(740, 'module_payment', 0, 'Status (owner)', 'Статус (владелец)', '2019-03-16 06:37:39'),
(741, 'module_payment', 0, 'Owner', 'Владелец', '2019-03-16 06:37:39'),
(742, 'module_payment', 0, 'Payment pending', 'Платеж ожидается', '2019-03-16 06:37:39'),
(743, 'module_booking', 0, 'Booking price', 'Стоимость брони', '2019-03-16 06:37:39'),
(744, 'module_lang', 0, 'do_not_copy', 'Не копировать', '2019-03-16 06:37:40'),
(745, 'common', 0, 'Allow javascript in your browser for comfortable use site.', 'Разрешите JavaScript в вашем браузере для комфортного использования сайта.', '2019-03-16 06:37:40'),
(746, 'common', 0, 'Operations', 'Операции', '2019-03-16 06:37:40'),
(747, 'bootstrap', 0, 'Next', 'Следующая', '2019-03-16 06:37:40'),
(748, 'bootstrap', 0, 'Previous', 'Предыдущая', '2019-03-16 06:37:41'),
(749, 'bootstrap', 0, 'First', 'Первая', '2019-03-16 06:37:41'),
(750, 'bootstrap', 0, 'Last', 'Последняя', '2019-03-16 06:37:41'),
(751, 'module_lang', 0, 'Enter a value for this language', 'Введите значение для данного языка', '2019-03-16 06:37:41'),
(752, 'module_lang', 0, 'Error translate', 'Ошибка перевода', '2019-03-16 06:37:41'),
(753, 'module_lang', 0, 'Success translate', 'Успешный перевод', '2019-03-16 06:37:42'),
(754, 'module_lang', 0, 'Success copy', 'Успешно скопировано', '2019-03-16 06:37:42'),
(755, 'common', 0, 'Sorry, this action is not allowed on the demo server.', 'Извините, данное действие запрещено на демонстрационном сервере.', '2019-03-16 06:37:42'),
(756, 'module_configuration', 0, 'siteCurrency', 'Валюта сайта', '2019-03-16 06:37:42'),
(757, 'module_booking', 0, 'Already have site account? Please <a title=\"Login\" href=\"{n}\">login</a>', 'Уже есть аккаунт? Пожалуйста, <a title=\"Login\" href=\"{n}\">авторизируйтесь</a>', '2019-03-16 10:37:54'),
(758, 'common', 0, 'floors', 'этажей', '2019-03-16 06:37:43'),
(759, 'module_apartments', 0, 'After pressing the button \"Create\", you will be able to load photos for the listing and to mark the property on the map.', 'После нажатия на кнопку \"Создать\" Вы сможете добавить изображения и отметить объект на карте', '2019-03-16 06:37:43'),
(760, 'app', 0, 'Load default configuration for ', 'Load default configuration for ', '2019-03-16 00:59:50'),
(761, 'app', 0, 'Do you load default configuration for <strong>xxxxx</strong>?<br />Actuall settings will be lost!', 'Do you load default configuration for <strong>xxxxx</strong>?<br />Actuall settings will be lost!', '2019-03-16 06:37:43'),
(762, 'module_configuration', 0, 'Update {name}', 'Редактирование {name}', '2019-03-16 06:37:44'),
(763, 'module_payment', 0, 'Result URL: ', 'Result URL: ', '2019-03-16 00:59:50'),
(764, 'module_payment', 0, 'Success URL: ', 'Success URL: ', '2019-03-16 00:59:50'),
(765, 'module_payment', 0, 'Fail URL: ', 'Fail URL: ', '2019-03-16 00:59:50'),
(766, 'module_lang', 0, 'Such a language already exists.', 'Такой язык уже существует', '2019-03-16 06:37:44'),
(767, 'module_socialauth', 0, 'Update {name}', 'Редактирование {name}', '2019-03-16 06:37:45'),
(768, 'common', 0, 'floor', 'этаж', '2019-03-16 06:37:45'),
(769, 'common', 0, 'Ok', 'Да', '2019-03-16 06:37:45'),
(770, 'module_apartments', 0, 'After pressing the button \"Create\", you will be able to load photos for the listing and to mark the property on the map.', 'После нажатия на кнопку \"Создать\" Вы можете загрузить фотографии и указать местоположение недвижимости на карте', '2019-03-16 06:37:45'),
(771, 'module_lang', 0, 'Flag icon', 'Флаг', '2019-03-16 06:37:46'),
(772, 'module_lang', 0, 'help upload icon', 'Вы можете загрузить свои иконки флагов в директорию flag_dir, и они будут доступны для выбора', '2019-03-16 06:37:46'),
(773, 'common', 0, 'from', 'с', '2019-03-16 06:37:46'),
(774, 'module_paidservices', 0, 'To apply a paid service for the listing, it should be active.', 'Чтобы применить платную услугу, объявление должно быть активно.', '2019-03-16 06:37:46'),
(775, 'common', 0, 'Hidden in demo mode', 'Скрыто в демонстрационном режиме', '2019-03-16 06:37:46'),
(776, 'common', 0, 'site_square', 'м<sup>2</sup>', '2019-03-16 06:37:47'),
(777, 'module_booking', 0, 'Operation successfully complete. Your order will be reviewed by administrator.', 'Операция успешно выполнена. Ваша заявка будет рассмотрена Администратором.', '2019-03-16 06:37:47'),
(778, 'common', 0, 'Log in as user', 'Войти пользователем', '2019-03-16 06:37:47'),
(779, 'common', 0, 'or', 'или', '2019-03-16 06:37:47'),
(780, 'common', 0, 'log in as administrator', 'войти администратором', '2019-03-16 06:37:48'),
(781, 'module_apartments', 0, '{n} rooms', '{n} комната|{n} комнаты|{n} комнат', '2019-03-16 06:37:48'),
(782, 'module_configuration', 0, 'mode_list_show', 'Вывод объявлений по умолчанию', '2019-03-16 06:37:48'),
(783, 'module_rss', 0, 'rss_subscribe', 'RSS подписка', '2019-03-16 06:37:48'),
(784, 'module_rss', 0, 'listings_from', 'Объявления с сайта ', '2019-03-16 06:40:29'),
(785, 'module_rss', 0, 'description_rss_from', 'Отображены новые объявления по заданным Вами критериям', '2019-03-16 06:40:29'),
(786, 'module_apartmentObjType', 0, 'The file was larger than {size}MB. Please upload a smaller file.', 'Размер файла больше, чем {size} Mb. Пожалуйста, загрузите файл меньшего размера.', '2019-03-16 06:40:29'),
(787, 'module_apartmentObjType', 0, 'Supported file: {supportExt}.', 'Поддерживаемый тип файлов: {supportExt}.', '2019-03-16 06:40:29'),
(788, 'module_apartmentObjType', 0, 'icon_file_maps', 'Иконка для Google Maps и Яндекс Карт', '2019-03-16 06:40:29'),
(789, 'module_apartmentObjType', 0, 'current_icon', 'Текущая иконка', '2019-03-16 06:40:30'),
(790, 'common', 0, 'Filter', 'Фильтр', '2019-03-16 06:40:30'),
(791, 'module_apartments', 0, 'request_for_property', 'Послать сообщение', '2019-03-16 06:40:30'),
(792, 'module_apartments', 0, 'send_request', 'Отправить', '2019-03-16 06:40:31'),
(793, 'module_apartments', 0, 'user_request_name', 'Имя', '2019-03-16 06:40:31'),
(794, 'module_apartments', 0, 'user_request_email', 'Email', '2019-03-16 08:00:59'),
(795, 'module_apartments', 0, 'user_request_phone', 'Телефон', '2019-03-16 08:01:00'),
(796, 'module_apartments', 0, 'user_request_message', 'Сообщение', '2019-03-16 08:01:00'),
(797, 'module_apartments', 0, 'user_request_ver_code', 'Код подтверждения', '2019-03-16 08:01:00'),
(798, 'module_apartments', 0, 'Error_send_request', 'Запрос не был отправлен! Исправьте, пожалуйста, ошибки и повторите снова.', '2019-03-16 08:01:00'),
(799, 'module_apartments', 0, 'Thanks_for_request', 'Спасибо за запрос! Владелец объявления ответит Вам как можно быстрее.', '2019-03-16 08:01:01'),
(800, 'module_notifier', 0, 'copy_request_for_property_from', 'Копия запроса к объявлению с сайта', '2019-03-16 08:01:01'),
(801, 'module_notifier', 0, 'request_for_property_from', 'Запрос к объявлению с сайта', '2019-03-16 08:01:01'),
(802, 'module_notifier', 0, 'additional_info_for_user', 'Пользователь, который написал Вам письмо, не узнает Ваш электронный адрес до тех пор, пока Вы не ответите на это письмо. Мы не гарантируем, что пользователь правильно указал свой электронный адрес, телефон и имя.', '2019-03-16 08:01:01'),
(803, 'module_configuration', 0, 'use_module_request_property', 'При просмотре объявления пользователь может отправить письмо на личный Email владельцу объявления', '2019-03-16 08:01:02'),
(804, 'module_payment', 0, 'Paid service #{id} ({name}) with the price {price}', 'Платная услуга №{id} ({name}) на сумму {price}', '2019-03-16 10:38:15'),
(805, 'module_comments', 0, 'Remove the rate', 'Отменить оценку', '2019-03-16 08:01:02'),
(806, 'module_contactform', 0, 'My status', 'Мой статус', '2019-03-16 08:01:02'),
(807, 'common', 0, 'Page not found.', 'Страница не найдена.', '2019-03-16 08:01:03'),
(808, 'module_slider', 0, 'Link', 'Ссылка', '2019-03-16 08:01:03'),
(809, 'common', 0, 'Print version', 'Версия для печати', '2019-03-16 08:01:03'),
(810, 'module_notifier', 0, 'Activating a new password', 'Activating a new password', '2019-03-16 08:01:03'),
(811, 'module_notifier', 0, 'recover_pass_first_help', 'Вы получили это письмо потому, что вы (либо кто-то, выдающий себя за вас) попросили выслать новый пароль к вашей учётной записи на сайте ::fullhost.', '2019-03-16 08:01:04'),
(812, 'common', 0, 'recover_pass_form_help', 'Введите ваш e-mail, на который будет выслана информация для восстановления пароля', '2019-03-16 08:01:04'),
(813, 'common', 0, 'recover_pass_temp_send', 'Новый пароль был создан, проверьте почтовый ящик, чтобы узнать как его активировать', '2019-03-16 08:01:04'),
(814, 'common', 0, 'Password successfully changed', 'Пароль успешно изменён.', '2019-03-16 08:01:04'),
(815, 'common', 0, 'Images', 'Изображения', '2019-03-16 08:01:05'),
(816, 'common', 0, 'useWatermark', 'Использовать водяной знак для фотографий объектов', '2019-03-16 08:01:05'),
(817, 'common', 0, 'maxImageWidth', 'Максимальная ширина фотографий объекта', '2019-03-16 08:01:05'),
(818, 'common', 0, 'maxImageHeight', 'Максимальная высота фотографий объекта', '2019-03-16 08:01:06'),
(819, 'common', 0, 'Image', 'Изображение', '2019-03-16 08:01:06'),
(820, 'common', 0, 'Text', 'Текст', '2019-03-16 08:01:06'),
(821, 'common', 0, 'watermarkType', 'Тип водяного знака', '2019-03-16 08:01:06'),
(822, 'common', 0, 'Preview', 'Предпросмотр', '2019-03-16 08:01:07'),
(823, 'common', 0, 'watermarkFile', 'Файл водяного знака', '2019-03-16 08:01:07'),
(824, 'common', 0, 'watermarkContent', 'Текст водяного знака', '2019-03-16 08:01:07'),
(825, 'common', 0, 'watermarkTextColor', 'Цвет текста', '2019-03-16 08:01:07'),
(826, 'common', 0, 'watermarkTextOpacity', 'Прозрачность', '2019-03-16 08:01:07'),
(827, 'common', 0, 'watermarkTextSize', 'Размер шрифта', '2019-03-16 08:01:08'),
(828, 'common', 0, 'watermarkPosition', 'Положение водяного знака', '2019-03-16 08:01:08'),
(829, 'common', 0, 'Invalid format of text color', 'Неверный формат для цвета текста', '2019-03-16 08:01:08'),
(830, 'module_users', 0, 'admin_change_pass_user_help', 'Если вы хотите поменять пароль, дважды введите новый. Или оставьте поля пустыми.', '2019-03-16 08:01:08'),
(831, 'module_configuration', 0, 'module_notifier_adminNewApartment', 'Посылать администратору письмо при создании нового объявления (если включена опция \"Модерация объявлений от пользователей\")?', '2019-03-16 08:01:09'),
(832, 'common', 0, 'Complains', 'Жалобы', '2019-03-16 08:02:47'),
(833, 'module_apartmentsComplain', 0, 'Complains', 'Жалобы', '2019-03-16 08:02:48'),
(834, 'module_apartmentsComplain', 0, 'Reasons of complain', 'Причины жалоб', '2019-03-16 08:02:49'),
(835, 'module_apartmentsComplain', 0, 'Add reasons of complain', 'Добавить причину жалобы', '2019-03-16 08:02:51'),
(836, 'module_apartmentsComplain', 0, 'Name', 'Имя', '2019-03-16 08:02:53'),
(837, 'module_apartmentsComplain', 0, 'Edit reasons of complain', 'Редактирование причины жалобы', '2019-03-16 08:02:54'),
(838, 'module_apartmentsComplain', 0, 'do_complain', 'Пожаловаться', '2019-03-16 08:02:56'),
(839, 'module_apartmentsComplain', 0, 'Send complain', 'Отправить жалобу', '2019-03-16 08:02:59'),
(840, 'module_apartmentsComplain', 0, 'Cause of complaint', 'Причина жалобы', '2019-03-16 08:03:01'),
(841, 'module_apartmentsComplain', 0, 'Body', 'Обоснование', '2019-03-16 08:03:03'),
(842, 'module_apartmentsComplain', 0, 'Creation date', 'Дата создания', '2019-03-16 08:03:05'),
(843, 'module_apartmentsComplain', 0, 'Thanks_for_complain', 'Спасибо за жалобу', '2019-03-16 08:03:07'),
(844, 'module_configuration', 0, 'module_notifier_adminNewComplain', 'Посылать администратору письмо при добавлении новой жалобы на объявление?', '2019-03-16 08:03:10'),
(845, 'module_apartmentsComplain', 0, 'your_already_post_complain', 'Вы уже жаловались на это объявление.', '2019-03-16 08:03:12'),
(846, 'module_apartmentsComplain', 0, 'Email', 'Email', '2019-03-16 08:03:14'),
(847, 'module_apartmentsComplain', 0, 'Apartment_id', '№ объявления', '2019-03-16 08:03:16'),
(848, 'module_apartmentsComplain', 0, 'Verification Code', 'Код подтверждения', '2019-03-16 08:03:18'),
(849, 'common', 0, 'Upload files', 'Загрузите файлы', '2019-03-16 08:03:19'),
(850, 'common', 0, 'Drop files here to upload', 'Перетащите файлы сюда для загрузки', '2019-03-16 08:03:21'),
(852, 'module_apartments', 0, 'is_price_poa', 'Цена по требованию', '2019-03-16 08:03:22'),
(853, 'common', 0, '{label} cannot be blank.', 'Необходимо заполнить поле {label}.', '2019-03-16 08:03:24'),
(854, 'common', 0, 'price_from', 'от', '2019-03-16 08:03:25'),
(855, 'common', 0, 'price_to', 'до', '2019-03-16 08:03:27'),
(856, 'common', 0, 'Activity', 'Неактивно', '2019-03-16 08:03:28'),
(857, 'common', 0, 'Loading content...', 'Загрузка содержимого...', '2019-03-16 08:03:31'),
(858, 'common', 0, 'Owner additional info', 'Дополнительно', '2019-03-16 08:03:32'),
(859, 'module_userads', 0, 'Awaiting moderation', 'Ожидает модерации', '2019-03-16 08:03:34'),
(860, 'module_userads', 0, 'Active', 'Активность', '2019-03-16 08:03:35'),
(861, 'common', 0, 'Q&As', 'Вопросы-ответы', '2019-03-16 08:03:36'),
(862, 'common', 0, 'Authentication services', 'Сервисы авторизации', '2019-03-16 08:03:38'),
(863, 'common', 0, 'Manage payments', 'Управление платежами', '2019-03-16 08:03:39'),
(864, 'common', 0, 'User managment', 'Управление пользователями', '2019-03-16 08:03:40'),
(865, 'common', 0, 'Manage settings', 'Управление настройками', '2019-03-16 08:03:42'),
(866, 'module_socialauth', 0, 'Social settings', 'Сервисы авторизации', '2019-03-16 08:03:44'),
(867, 'common', 0, 'Any', 'Любое', '2019-03-16 08:03:46'),
(868, 'common', 0, 'uncheck all', 'Очистить', '2019-03-16 08:03:47'),
(869, 'common', 0, 'quick search', 'Быстрый поиск', '2019-03-16 08:03:50'),
(870, 'common', 0, 'enter initial letters', 'Введите первые буквы названия', '2019-03-16 08:03:51'),
(871, 'common', 0, 'Paid services', 'Платные услуги', '2019-03-16 08:03:52'),
(872, 'module_apartments', 0, 'Rent a', 'Сниму', '2019-03-16 08:03:54'),
(873, 'module_apartments', 0, 'Buy a', 'Куплю', '2019-03-16 08:03:56'),
(874, 'module_apartments', 0, 'Exchange', 'Обменяю', '2019-03-16 08:03:57'),
(875, 'common', 0, '{n} day', '{n} день|{n} дня|{n} дней', '2019-03-16 08:03:58'),
(876, 'module_apartments', 0, 'Exchange to', 'Обменяю на', '2019-03-16 08:03:59'),
(877, 'module_payment', 0, 'Manage payments', 'Управление платежами', '2019-03-16 08:04:02'),
(878, 'module_configuration', 0, 'images', 'Изображения', '2019-03-16 08:04:03'),
(879, 'module_configuration', 0, 'seo', 'SEO', '2019-03-16 00:59:50'),
(880, 'module_apartments', 0, 'Are you sure you want to delete this apartment?', 'Вы действительно хотите удалить это объявление?', '2019-03-16 08:04:06'),
(881, 'module_apartments', 0, 'all_member_listings', 'Все объявления', '2019-03-16 08:04:07'),
(882, 'module_apartments', 0, 'member_listings', 'Просмотреть все объявления пользователя', '2019-03-16 08:04:09'),
(883, 'module_apartments', 0, 'all_by_filter', 'Все объявления по фильтру', '2019-03-16 08:04:10'),
(884, 'module_configuration', 0, 'urlExtension', 'Расширение для ЧПУ \".html\"', '2019-03-16 08:04:11'),
(886, 'module_apartments', 0, 'Rent', 'Сдам', '2019-03-16 08:04:13'),
(887, 'module_apartments', 0, 'Sale', 'Продам', '2019-03-16 08:04:15'),
(888, 'module_booking', 0, 'Booking apartment', 'Бронирование', '2019-03-16 08:04:17'),
(889, 'common', 0, 'Update param \"{name}\"', 'Изменение параметра \"{name}\"', '2019-03-16 08:04:19'),
(890, 'module_apartments', 0, 'Want rent property to smb', 'Сдать', '2019-03-16 08:04:20'),
(891, 'module_apartments', 0, 'Want sale', 'Продать', '2019-03-16 08:04:22'),
(892, 'module_apartments', 0, 'Want rent property form smb', 'Снять', '2019-03-16 08:04:25'),
(893, 'module_apartments', 0, 'Want buy', 'Купить', '2019-03-16 08:04:27'),
(894, 'module_apartments', 0, 'Want exchange', 'Обменять', '2019-03-16 08:04:29'),
(895, 'module_booking', 0, 'Operation successfully complete. Your order will be reviewed by owner.', 'Операция успешно выполнена. Ваша заявка будет рассмотрена Владельцем.', '2019-03-16 08:04:31'),
(896, 'common', 0, 'Watermark file can\'t be empty.', 'Файл водяного знака не может быть пустым.', '2019-03-16 08:04:34'),
(897, 'common', 0, 'Photo gallery is empty.', 'Фото галерея пуста.', '2019-03-16 08:04:36'),
(898, 'common', 0, 'Photos for listing', 'Фотографии объекта', '2019-03-16 08:04:37'),
(899, 'common', 0, 'Characters left', 'Осталось символов', '2019-03-16 08:04:38'),
(900, 'common', 0, 'Main photo', 'Главное фото', '2019-03-16 08:04:41'),
(901, 'common', 0, 'Set as main photo', 'Сделать главной', '2019-03-16 08:04:42'),
(902, 'common', 0, '{file} has invalid extension. Only {extensions} are allowed.', '{file} имеет некорректное расширение. Допустимы только следующие расширения: {extensions}', '2019-03-16 08:04:44'),
(903, 'common', 0, '{file} is too large, maximum file size is {sizeLimit}.', '{file} слишком велик. Максимальный допустимый размер файла: {sizeLimit}', '2019-03-16 08:04:45'),
(904, 'common', 0, '{file} is too small, minimum file size is {minSizeLimit}.', '{file} слишком мал. Минимальный допустимый размер файла: {minSizeLimit}', '2019-03-16 08:04:46'),
(905, 'common', 0, '{file} is empty, please select files again without it.', 'Файл {file} пустой. Пожалуйста, повторите выбор без этого файла.', '2019-03-16 08:04:48'),
(906, 'common', 0, 'The files are being uploaded, if you leave now the upload will be cancelled.', 'В данный момент происходит загрузка файлов. Если вы сейчас покините страницу, то загрузка будет прервана.', '2019-03-16 08:20:10'),
(907, 'module_images', 0, 'Comment', 'Комментарий', '2019-03-16 08:20:17'),
(908, 'common', 0, 'General', 'Основные', '2019-03-16 08:20:22'),
(909, 'common', 0, 'Addition', 'Дополнительно', '2019-03-16 08:20:27'),
(910, 'common', 0, 'Map', 'Карта', '2019-03-16 08:20:29'),
(911, 'common', 0, 'You can change the order of photos, holding and dragging the left area of the block.', 'Вы можете изменять порядок фото, удерживая и перетаскивая их за левый край блока.', '2019-03-16 08:20:31'),
(912, 'common', 0, 'Click on the map to set the location of an object or move an existing marker.', 'Кликните на карте чтобы установить местоположение объекта или переместите существующий маркер.', '2019-03-16 08:20:33'),
(913, 'common', 0, 'Edit', 'Редактировать', '2019-03-16 08:20:39'),
(914, 'module_configuration', 0, 'priceThousandsSeparator', 'Разделитель в цене для тысячных', '2019-03-16 08:20:40'),
(915, 'module_configuration', 0, 'priceDecimalsPoint', 'Разделитель в цене дробной части', '2019-03-16 08:20:41'),
(916, 'common', 0, 'balance', 'Баланс', '2019-03-16 08:20:45'),
(917, 'common', 0, 'Add funds to account', 'Пополнить баланс', '2019-03-16 08:20:49'),
(918, 'common', 0, 'Add amount of', 'Добавить сумму', '2019-03-16 08:20:54'),
(919, 'common', 0, 'Please specify the amount of the payment', 'Пожалуйста, укажите сумму платежа', '2019-03-16 08:20:58'),
(920, 'module_paidservices', 0, 'Error! You must upload the image for the ad.', 'Пожалуйста загрузите фото для объявления.', '2019-03-16 08:21:02'),
(921, 'common', 0, 'Apply a paid service to the listing', 'Применить платную услугу к объявлению.', '2019-03-16 08:21:06'),
(922, 'common', 0, 'Reference \"View:\"', '\"Окна выходят\"', '2019-03-16 08:21:12'),
(923, 'common', 0, 'Current paid services', 'Действующие платные услуги', '2019-03-16 08:21:14'),
(924, 'common', 0, 'Friendly URL and SEO settings', 'Редактирование ЧПУ и SEO', '2019-03-16 08:21:17'),
(925, 'common', 0, 'It is allowed to use the characters \"-a-zA-Z0-9_+.\" without spaces', 'Разрешается использовать знаки  \"-a-zA-Z0-9_+.\" без пробелов', '2019-03-16 08:21:19'),
(926, 'common', 0, 'is valid till', 'действует до', '2019-03-16 08:21:27'),
(927, 'common', 0, 'Apply', 'Применить', '2019-03-16 08:21:30'),
(928, 'common', 0, 'Paid service successfully added', 'Платная услуга успешно добавлена', '2019-03-16 08:21:37'),
(929, 'module_lang', 0, 'Active', 'Активность', '2019-03-16 08:21:44'),
(930, 'module_articles', 0, 'Manage FAQ', 'Управление Вопросами-Ответами', '2019-03-16 08:21:48'),
(931, 'module_paidservices', 0, 'Add a paid service', 'Добавить платную услугу', '2019-03-16 08:21:52'),
(932, 'common', 0, 'Set a marker by address', 'Установить маркер по адресу', '2019-03-16 08:21:56'),
(933, 'common', 0, 'Please enter address', 'Пожалуйста введите адрес', '2019-03-16 08:22:03'),
(934, 'module_iecsv', 0, 'selectedImportUser', 'Выберите пользователя (от имени которого будут добавлены объявления)', '2019-03-16 08:22:05'),
(935, 'module_iecsv', 0, 'Please select user (owner listings).', 'Пожалуйста, выберите пользователя от имени которого будут добавлены объявления', '2019-03-16 08:22:06'),
(936, 'module_iecsv', 0, 'Import / Export', 'Импорт / Экспорт', '2019-03-16 08:22:10'),
(937, 'module_iecsv', 0, 'Export', 'Экспорт', '2019-03-16 08:22:14'),
(938, 'module_iecsv', 0, 'You can export your listings into a .csv file. Exported fields are listed below.', 'Вы можете экспортировать свои объявления в файл формата .csv. Экспортируемые поля указаны ниже.', '2019-03-16 08:22:16'),
(939, 'module_iecsv', 0, 'Help / Documentation of use this option', 'Помощь / документация по использованию данной опции', '2019-03-16 08:22:19'),
(940, 'module_iecsv', 0, 'Import', 'Импорт', '2019-03-16 08:22:26'),
(941, 'module_iecsv', 0, 'Fields_import_export', 'Тип объявления | Тип цены | Тип недвижимости | Местоположение | Цена по требованию | Цена | Цена до | Количество комнат | Этаж | Всего этажей | Площадь | Количество спальных мест | Заголовок | Описание | Что рядом | Адрес | Ванная | Безопасность | Комфорт | Кухня | Работа | Развлечения | Услуги | Условия | Фото | Широта | Долгота', '2019-03-16 08:22:31'),
(942, 'module_iecsv', 0, '2 variants of listings export are available.', 'Возможны два варианта экспорта. В первом случае все данные экспортируются в csv файл, а фотографии экспортируются путем вставки в csv файл ссылки на эту фотографию. Во втором случае создается архив .zip, в котором хранится csv файл c информацией и названиями фотографий. Фотографии, в свою очередь, находятся в этом же архиве. Таким образом вы получаете автономный вариант ваших объявлений. Во втором случае процесс может занять значительный период времени в зависимости от числа фотографий.', '2019-03-16 08:22:35'),
(943, 'module_iecsv', 0, 'You can populate your database importing a csv file with properties. You can also import listings with photos: create an archive of .zip structure described for ‘Export‘ operation.', 'Вы можете пополнить базу своих объявлений путем импорта из csv файла. Также вы можете импортировать объявления вместе с фотографиями, если создадите архив формата .zip структуры, описанной для операции экспорта.', '2019-03-16 08:22:38'),
(944, 'module_iecsv', 0, 'Import from *.csv, *.zip:', 'Импортировать из *.csv, *zip:', '2019-03-16 08:22:43'),
(945, 'module_iecsv', 0, 'Supported file *.csv encoding is UTF-8 without BOM.', 'Поддерживаемая кодировка файла *.csv - UTF-8 без BOM.', '2019-03-16 08:22:44'),
(946, 'module_iecsv', 0, 'The file is exported to the UTP-8 without BOM charset.', 'Файл экспортируется в кодировке UTF-8 без BOM.', '2019-03-16 08:22:48'),
(947, 'module_iecsv', 0, 'Separators are \";\".', 'Разделителем является \";\" (точка с запятой).', '2019-03-16 08:22:53'),
(948, 'module_iecsv', 0, 'Select', 'Выбрать', '2019-03-16 08:22:59'),
(949, 'module_iecsv', 0, 'ID', 'ID', '2019-03-16 08:23:00'),
(950, 'module_iecsv', 0, 'Export to .zip file with photos included', 'Экспортировать в формат .zip со всеми фотографиями', '2019-03-16 08:23:05'),
(951, 'module_iecsv', 0, 'Please select ads for export.', 'Пожалуйста, выберите объявления для экспорта.', '2019-03-16 08:23:10'),
(952, 'module_iecsv', 0, 'title', 'Заголовок', '2019-03-16 08:23:17'),
(953, 'module_iecsv', 0, 'The file was larger than {size}. Please upload a smaller file.', 'Размер файла больше, чем {size}. Пожалуйста, выберите файл меньшим размером.', '2019-03-16 08:23:20'),
(954, 'module_iecsv', 0, 'Please select a *.csv or *.zip file for import. Max size of file is {size}.', 'Пожалуйста, выберите файл *.csv или *.zip для импорта. Максимальный размер файла {size}', '2019-03-16 08:23:24'),
(955, 'module_iecsv', 0, 'Listings are imported. You can edit and activate.', 'Объявления импортированы. Вы можете их отредактировать и активировать.', '2019-03-16 08:23:25'),
(956, 'module_iecsv', 0, 'Please select ads for import.', 'Пожалуйста, выберите объявления для импорта.', '2019-03-16 08:23:28'),
(957, 'module_iecsv', 0, 'Error parsing csv file. Please try again later.', 'Ошибка интерпретатора csv. Попробуйте повторить позже.', '2019-03-16 08:23:34'),
(958, 'module_apartments', 0, 'video_file', 'Файл видео', '2019-03-16 08:23:40'),
(959, 'module_apartments', 0, 'video_html', 'Код с Youtube', '2019-03-16 08:23:42'),
(960, 'common', 0, 'Videos for listing', 'Видео', '2019-03-16 00:59:50'),
(961, 'common', 0, 'You can upload a video or code.', 'Вы можете загрузить видео файл либо указать код с Youtube.', '2019-03-16 08:23:49'),
(962, 'module_apartments', 0, 'Supported file: {supportExt}.', 'Поддерживаемый тип файлов: {supportExt}.', '2019-03-16 08:23:57'),
(963, 'module_apartments', 0, 'videoMaxSite: {size}.', 'Максимальный размер видео файла {size}.', '2019-03-16 08:23:59'),
(964, 'module_apartments', 0, 'incorrect_youtube_code', 'Некорректный код с Youtube.', '2019-03-16 08:24:06'),
(965, 'module_apartments', 0, 'not_create_folder_to_save', 'Не была создана папка для сохранения.', '2019-03-16 08:24:09'),
(966, 'common', 0, 'The forms designer', 'Редактор форм', '2019-03-16 08:24:11'),
(967, 'module_formdesigner', 0, 'Field', 'Поле', '2019-03-16 08:24:13'),
(968, 'module_formdesigner', 0, 'Visibility', 'Видимость', '2019-03-16 08:24:18'),
(969, 'common', 0, 'Configure', 'Настроить', '2019-03-16 08:24:22'),
(970, 'module_configuration', 0, 'countListitngmap', 'Количество объявлений в режиме \"Карта\"', '2019-03-16 08:24:25'),
(971, 'module_configuration', 0, 'countListitngtable', 'Количество объявлений в режиме \"Таблица\"', '2019-03-16 08:24:33'),
(972, 'module_configuration', 0, 'countListitngblock', 'Количество объявлений в режиме \"Блоки\"', '2019-03-16 08:24:36'),
(973, 'common', 0, 'Not specified_f', 'Не указана', '2019-03-16 08:24:38'),
(974, 'common', 0, 'Not specified_m', 'Не указан', '2019-03-16 08:24:43'),
(975, 'common', 0, 'City', 'Город', '2019-03-16 08:24:47'),
(976, 'common', 0, 'Country', 'Страна', '2019-03-16 08:24:49'),
(977, 'common', 0, 'Region', 'Регион', '2019-03-16 08:24:50'),
(978, 'common', 0, 'Name', 'Название', '2019-03-16 08:24:53'),
(979, 'common', 0, 'select country', 'Выберите страну', '2019-03-16 08:24:57'),
(980, 'common', 0, 'select region', 'Выберите регион', '2019-03-16 08:24:58'),
(981, 'common', 0, 'Location module', 'Модуль местоположения', '2019-03-16 08:25:01'),
(982, 'common', 0, 'Cities', 'Города', '2019-03-16 08:25:06'),
(983, 'common', 0, 'Countries', 'Страны', '2019-03-16 08:25:12'),
(984, 'common', 0, 'Regions', 'Регионы', '2019-03-16 08:25:18'),
(985, 'module_location', 0, 'Manage countries', 'Управление странами', '2019-03-16 08:25:23'),
(986, 'module_location', 0, 'Manage regions', 'Управление регионами', '2019-03-16 08:25:29'),
(987, 'module_location', 0, 'Manage cities', 'Управление городами', '2019-03-16 08:25:31'),
(988, 'module_location', 0, 'Add country', 'Добавить страну', '2019-03-16 08:25:38'),
(989, 'module_location', 0, 'Add region', 'Добавить регион', '2019-03-16 08:25:43'),
(990, 'module_location', 0, 'Add city', 'Добавить город', '2019-03-16 08:25:45'),
(991, 'module_location', 0, 'Edit country', 'Редактировать страну', '2019-03-16 08:25:46'),
(992, 'module_location', 0, 'Edit region', 'Редактировать регион', '2019-03-16 08:25:48'),
(993, 'module_location', 0, 'Edit city', 'Редактировать город', '2019-03-16 08:25:50'),
(994, 'common', 0, 'Go back to search results', 'Вернуться к результатам поиска', '2019-03-16 08:25:55'),
(995, 'common', 0, '{n} listings', '{n} объявление|{n} объявления|{n} объявлений', '2019-03-16 08:26:00'),
(996, 'module_configuration', 0, 'change_search_ajax', 'Изменение кнопки поиска при выборе параметров', '2019-03-16 08:26:03'),
(997, 'common', 0, 'Move to the beginning of the list', 'Переместить в начало списка', '2019-03-16 08:26:04'),
(998, 'common', 0, 'Move to end of list', 'Переместить в конец списка', '2019-03-16 08:26:07'),
(999, 'module_apartments', 0, 'Note', 'Заметка', '2019-03-16 08:26:12'),
(1000, 'module_apartments', 0, 'total square: {n}', 'общая площадь: {n}', '2019-03-16 08:26:13'),
(1001, 'module_socialauth', 0, 'You can not add listings till you specify your valid email.', 'Вы не сможете добавить объявление пока не укажите свой действующий адрес электронной почты.', '2019-03-16 08:26:19'),
(1002, 'module_socialauth', 0, 'You can not add listings till you specify your phone number.', 'Вы не сможете добавить объявление пока не укажите свой номер телефона.', '2019-03-16 08:26:20'),
(1003, 'module_apartments', 0, 'ownerUsername', 'Имя владельца', '2019-03-16 08:26:23'),
(1004, 'module_configuration', 0, 'mail_fromName', 'Отправить почту от имени (если не задано, то отправляется от имени администратора)', '2019-03-16 08:26:29'),
(1005, 'module_apartments', 0, 'Owner email', 'Email владельца', '2019-03-16 08:26:36'),
(1006, 'module_formdesigner', 0, 'Tip', 'Подсказка', '2019-03-16 08:26:37'),
(1007, 'module_formdesigner', 0, 'Settings for the field', 'Настройки для поля', '2019-03-16 08:26:39'),
(1008, 'module_formdesigner', 0, 'Show for property types', 'Показывать для типов недвижимости', '2019-03-16 08:26:42'),
(1009, 'module_apartments', 0, 'The file was larger than {size}MB. Please upload a smaller file.', 'Размер файла больше, чем {size} Mb. Пожалуйста, загрузите файл меньшего размера.', '2019-03-16 08:26:44'),
(1010, 'common', 0, 'Panorama', 'Панорама', '2019-03-16 00:59:50');
INSERT INTO `ore_gj_translate_message` (`id`, `category`, `status`, `message`, `translation_ru`, `date_updated`) VALUES
(1011, 'common', 0, 'A wide angle panorama-image or a ready SWF file of the panorama', 'Широкоформатный файл-изображение панорамы или готовый SWF-файл панорамы', '2019-03-16 08:26:52'),
(1012, 'module_configuration', 0, 'useCompactInnerSearchForm', 'Использовать компактную поисковую форму на внутренних страницах сайта', '2019-03-16 08:26:55'),
(1013, 'common', 0, 'Apartment ID', '№ объявления', '2019-03-16 08:27:02'),
(1014, 'module_advertising', 0, 'Views', 'Просмотры', '2019-03-16 08:27:05'),
(1015, 'module_advertising', 0, 'Clicks', 'Клики', '2019-03-16 08:27:08'),
(1016, 'module_apartments', 0, 'Land square', 'Площадь земельного участка', '2019-03-16 08:27:10'),
(1017, 'module_apartments', 0, 'land square', 'площадь земельного участка', '2019-03-16 08:27:15'),
(1018, 'module_apartments', 0, 'land square: {n}', 'площадь земельного участка: {n}', '2019-03-16 08:27:21'),
(1019, 'common', 0, 'site_land_square', 'соток', '2019-03-16 00:59:50'),
(1020, 'module_configuration', 0, 'useTypeSale', 'Возможность добавления объявлений  с типом \"Продам\"', '2019-03-16 08:27:25'),
(1021, 'module_configuration', 0, 'useTypeRenting', 'Возможность добавления объявлений  с типом \"Сниму\"', '2019-03-16 08:27:29'),
(1022, 'module_configuration', 0, 'useTypeBuy', 'Возможность добавления объявлений  с типом \"Куплю\"', '2019-03-16 08:27:35'),
(1023, 'module_configuration', 0, 'useTypeChange', 'Возможность добавления объявлений  с типом \"Обменяю\"', '2019-03-16 08:27:41'),
(1024, 'module_socialauth', 0, 'useMailruOAuth', 'Использовать авторизацию Mail.ru', '2019-03-16 08:27:42'),
(1025, 'module_socialauth', 0, 'mailruClientId', 'ID', '2019-03-16 08:27:44'),
(1026, 'module_socialauth', 0, 'mailruClientSecret', 'Client secret', '2019-03-16 00:59:50'),
(1027, 'module_socialauth', 0, 'mailru_label', 'Мой.мир', '2019-03-16 08:27:51'),
(1028, 'module_socialauth', 0, 'mailru', 'Мой.мир', '2019-03-16 08:27:52'),
(1029, 'module_comparisonList', 0, 'Add to a comparison list ', 'Добавить к сравнению', '2019-03-16 08:27:56'),
(1030, 'module_comparisonList', 0, 'In the comparison list', 'В списке сравнения', '2019-03-16 08:28:00'),
(1031, 'module_comparisonList', 0, 'max_limit', 'Максимум: {n} объявлений', '2019-03-16 08:28:01'),
(1032, 'module_comparisonList', 0, 'Comparison list', 'Список сравнения', '2019-03-16 08:28:04'),
(1033, 'module_currency', 0, 'moduleAdminHelp', 'Вы не можете деактивировать валюту, установленную по умолчанию для активного языка. Деактивировать язык можно в разделе {link}', '2019-03-16 08:28:10'),
(1034, 'module_lang', 0, 'moduleAdminHelp', 'Вы не можете активировать язык, имеющий неактивную валюту по умолчанию. Активировать валюту можно в разделе {link}', '2019-03-16 08:28:15'),
(1035, 'module_configuration', 0, 'share', 'Поделиться', '2019-03-16 08:28:17'),
(1036, 'module_configuration', 0, 'useYandexShare', 'Использовать сервис Yandex.Share', '2019-03-16 08:28:24'),
(1037, 'module_configuration', 0, 'useInternalShare', 'Использовать встроенную функцию сайта', '2019-03-16 08:28:25'),
(1038, 'module_configuration', 0, 'intenalServices', 'Кнопки встроенной функции сайта (сервисы перечисляются без пробелов через запятую)', '2019-03-16 08:28:31'),
(1039, 'module_configuration', 0, 'yaShareServices', 'Кнопки сервиса Yandex.Share (сервисы перечисляются без пробелов через запятую)', '2019-03-16 08:28:35'),
(1040, 'common', 0, 'Collapse search', 'Свернуть поиск', '2019-03-16 08:28:37'),
(1041, 'common', 0, 'Type', 'Тип', '2019-03-16 08:28:39'),
(1042, 'module_formeditor', 0, 'Add field', 'Добавить поле', '2019-03-16 08:28:40'),
(1043, 'module_formeditor', 0, 'Edit search form', 'Редактирование формы поиска', '2019-03-16 08:28:45'),
(1044, 'module_formdesigner', 0, 'Measure unit', 'Единица измерения', '2019-03-16 08:28:51'),
(1045, 'module_formeditor', 0, 'type reference', 'Справочник', '2019-03-16 08:28:55'),
(1046, 'module_formeditor', 0, 'type text', 'Текстовое поле', '2019-03-16 08:29:01'),
(1047, 'module_formeditor', 0, 'type text area', 'Большое текстовое поле', '2019-03-16 08:29:03'),
(1048, 'module_formeditor', 0, 'type INT', 'Числовое поле', '2019-03-16 08:29:05'),
(1049, 'module_formeditor', 0, 'value no required', 'Значение не обязательное', '2019-03-16 08:29:06'),
(1050, 'module_formeditor', 0, 'value required', 'Значение обязательное', '2019-03-16 08:29:13'),
(1051, 'module_formeditor', 0, 'value required and must be numerical', 'Значение обязательное и должно быть числом', '2019-03-16 08:29:20'),
(1052, 'module_formeditor', 0, 'value must be numerical', 'Значение должно быть числом', '2019-03-16 08:29:21'),
(1053, 'module_formeditor', 0, 'Display in general.', 'Отображать в основной вкладке', '2019-03-16 08:29:27'),
(1054, 'module_formeditor', 0, 'Display in extended.', 'Отображать в дополнительной вкладке', '2019-03-16 08:29:33'),
(1055, 'module_formeditor', 0, 'For search', 'Для поиска', '2019-03-16 08:29:39'),
(1056, 'module_formeditor', 0, 'category', 'Категория', '2019-03-16 08:29:45'),
(1057, 'module_formeditor', 0, 'compare equal', 'Поле должно быть равно', '2019-03-16 08:29:51'),
(1058, 'module_formeditor', 0, 'compare like', 'Поле должно содержать часть', '2019-03-16 08:29:52'),
(1059, 'module_formeditor', 0, 'compare from', 'Поле должно быть больше или равно', '2019-03-16 08:29:54'),
(1060, 'module_formeditor', 0, 'compare to', 'Поле должно быть меньше или равно', '2019-03-16 08:29:55'),
(1061, 'common', 0, 'Search by chislo1', 'число от', '2019-03-16 08:29:57'),
(1062, 'module_formeditor', 0, 'The new field is successfully created.', 'Новое поле успешно создано.', '2019-03-16 08:30:01'),
(1063, 'module_formeditor', 0, 'Such comparison is possible only for numeric fields', 'Такое сравнение возможно только для числового поля', '2019-03-16 08:30:06'),
(1064, 'common', 0, 'Search by spravochnik1', 'справочник', '2019-03-16 08:30:11'),
(1065, 'common', 0, 'Default search', 'Поиск по умолчанию', '2019-03-16 08:30:14'),
(1066, 'module_formeditor', 0, 'Edit search form help', 'Выберите тип недвижимости. Перетащите с помощью мышки поля из правой колонки в левую, по которым вы хотели бы сделать поиск. Вы также можете перенести из левой колонки в правую, те поля которые не должны быть в форме поиска для данного типа недвижимости. После этого нажмите кнопку \"Сохранить\".', '2019-03-16 08:30:20'),
(1067, 'common', 0, 'Success', 'Информация успешно сохранена', '2019-03-16 08:30:26'),
(1069, 'module_formeditor', 0, 'Update field', 'Редактирование поля', '2019-03-16 08:30:32'),
(1071, 'common', 0, 'The listing is succesfullty added and is awaiting moderation', 'Объявление успешно добавлено и ожидает модерации', '2019-03-16 08:30:36'),
(1072, 'common', 0, 'The listing is succesfullty added', 'Объявление успешно добавлено', '2019-03-16 08:30:37'),
(1073, 'module_formeditor', 0, 'Category for the \"Forms Editor\"', 'Категория для редактора форм', '2019-03-16 08:30:44'),
(1074, 'module_formeditor', 0, 'Usual category', 'Обычная категория', '2019-03-16 08:30:47'),
(1075, 'module_formdesigner', 0, 'Type', 'Тип', '2019-03-16 08:30:49'),
(1076, 'module_formdesigner', 0, 'Reference', 'Справочник', '2019-03-16 08:30:55'),
(1077, 'module_formdesigner', 0, 'Validation rules for a field', 'Правила проверки поля', '2019-03-16 08:30:57'),
(1078, 'module_formdesigner', 0, 'Display in', 'Отображение', '2019-03-16 08:31:00'),
(1079, 'module_formdesigner', 0, 'Comparison in the search', 'Сравнение в поиске', '2019-03-16 08:31:01'),
(1080, 'module_formdesigner', 0, 'Label', 'Название', '2019-03-16 08:31:04'),
(1081, 'module_formeditor', 0, 'Add field help', 'Добавленные новые поля не участвуют в экспорте / импорте объявлений.', '2019-03-16 08:31:10'),
(1083, 'module_apartments', 0, 'Period of listing\'s activity', 'Срок активности объявления', '2019-03-16 08:31:16'),
(1084, 'module_apartments', 0, 'a week', 'неделя', '2019-03-16 08:31:23'),
(1085, 'module_apartments', 0, 'a month', 'месяц', '2019-03-16 08:31:27'),
(1086, 'module_apartments', 0, '3 months', '3 месяца', '2019-03-16 08:31:35'),
(1087, 'module_apartments', 0, '6 months', '6 месяцев', '2019-03-16 08:31:40'),
(1088, 'module_apartments', 0, 'a year', 'год', '2019-03-16 08:31:45'),
(1089, 'module_apartments', 0, 'always', 'всегда', '2019-03-16 08:31:50'),
(1090, 'common', 0, 'The listing will be active till {DATE}', 'Объявление будет активно до {DATE}', '2019-03-16 08:31:52'),
(1091, 'module_configuration', 0, 'apartment_periodActivityDefault', 'Срок активности объявления по умолчанию', '2019-03-16 08:31:59'),
(1092, 'module_apartments', 0, 'Display block', 'Отображать блоками', '2019-03-16 08:32:02'),
(1093, 'module_apartments', 0, 'Display table', 'Отображать таблицей', '2019-03-16 08:32:03'),
(1094, 'module_apartments', 0, 'Display with a map', 'Отображать с картой', '2019-03-16 08:32:08'),
(1095, 'module_formeditor', 0, 'The name of a field in a table', 'Название поля в таблице', '2019-03-16 08:32:16'),
(1096, 'module_comments', 0, 'Thank you for your comment.', 'Благодарим за ваш комментарий.', '2019-03-16 08:32:22'),
(1097, 'module_comments', 0, 'commentNotFound', 'Комментарий не найден, или у Вас недостаточно прав для удаления.', '2019-03-16 08:32:24'),
(1098, 'module_comments', 0, 'Reply', 'Ответить', '2019-03-16 08:32:25'),
(1099, 'module_configuration', 0, 'commentAllowForGuests', 'Разрешить добавление комментариев незарегистрированными пользователями?', '2019-03-16 08:32:31'),
(1100, 'module_configuration', 0, 'useCaptchaCommentsForRegistered', 'Использовать капчу при добавлении комментария зарегистрированным пользователем?', '2019-03-16 08:32:37'),
(1101, 'module_configuration', 0, 'enableCommentsForApartments', 'Разрешить добавлять комментарии к объявлениям?', '2019-03-16 08:32:40'),
(1102, 'module_configuration', 0, 'enableCommentsForEntries', 'Разрешить добавлять комментарии к материалам?', '2019-03-16 08:32:42'),
(1103, 'module_configuration', 0, 'enableCommentsForPages', 'Разрешить добавлять комментарии к страницам сайта?', '2019-03-16 08:32:43'),
(1104, 'module_configuration', 0, 'enableCommentsForFaq', 'Разрешить добавлять комментарии к \"Вопросам-ответам\"?', '2019-03-16 08:32:49'),
(1105, 'module_configuration', 0, 'osmap', 'OpenStreetMap', '2019-03-16 00:59:50'),
(1106, 'module_configuration', 0, 'useOSMMap', 'Использовать модуль карт OpenStreetMap?', '2019-03-16 08:32:55'),
(1107, 'module_configuration', 0, 'module_apartments_osmapsCenterX', 'Центровать карту по умолчанию, долгота (X)', '2019-03-16 08:32:59'),
(1108, 'module_configuration', 0, 'module_apartments_osmapsCenterY', 'Центровать карту по умолчанию, широта (Y)', '2019-03-16 08:33:04'),
(1109, 'module_configuration', 0, 'module_apartments_osmapsZoomCity', 'Уровень zoom для просмотра карты города', '2019-03-16 08:33:08'),
(1110, 'module_configuration', 0, 'module_apartments_osmapsZoomApartment', 'Уровень zoom для просмотра объявления', '2019-03-16 08:33:14'),
(1111, 'common', 0, 'Info pages', 'Информационные страницы', '2019-03-16 08:33:20'),
(1112, 'module_infopages', 0, 'Manage infopages', 'Управление информационными страницами', '2019-03-16 08:33:25'),
(1113, 'module_infopages', 0, 'Add infopage', 'Добавить страницу', '2019-03-16 08:33:31'),
(1114, 'module_infopages', 0, 'Page title', 'Заголовок', '2019-03-16 08:33:33'),
(1115, 'module_infopages', 0, 'Page body', 'Содержимое страницы', '2019-03-16 08:33:37'),
(1116, 'module_infopages', 0, 'Creation date', 'Дата создания', '2019-03-16 08:33:38'),
(1117, 'module_infopages', 0, 'Edit infopage', 'Редактировать страницу', '2019-03-16 08:33:42'),
(1118, 'module_infopages', 0, 'Delete infopage', 'Удалить страницу', '2019-03-16 08:33:43'),
(1119, 'module_menumanager', 0, 'Parent element', 'Родительский элемент', '2019-03-16 08:33:51'),
(1120, 'module_menumanager', 0, 'Position', 'Позиция', '2019-03-16 08:33:53'),
(1121, 'module_menumanager', 0, 'pageId', 'Страница', '2019-03-16 08:33:57'),
(1122, 'module_menumanager', 0, 'Nothing', 'Ничего', '2019-03-16 08:33:58'),
(1123, 'module_menumanager', 0, 'Info pages', 'Информационные страницы', '2019-03-16 08:34:00'),
(1124, 'module_menumanager', 0, 'Editing of this section is not allowed', 'Невозможно редактировать данный раздел', '2019-03-16 08:34:02'),
(1125, 'module_menumanager', 0, 'The parent node wasn\'t created. Please try again later.', 'Родительский узел не был создан, повторите попытку позже.', '2019-03-16 08:34:05'),
(1126, 'module_menumanager', 0, 'Enter the name of the menu item', 'Введите название пункта меню', '2019-03-16 08:34:07'),
(1127, 'module_menumanager', 0, 'Dou you really want to rename menu item', 'Вы действительно хотите переименовать пункт меню', '2019-03-16 08:34:08'),
(1128, 'module_menumanager', 0, 'in', 'в', '2019-03-16 08:34:16'),
(1129, 'module_menumanager', 0, 'Rename menu item', 'Переименовать пункт меню', '2019-03-16 08:34:23'),
(1130, 'module_menumanager', 0, 'Do you really want to remove the menu item', 'Вы действительно хотите удалить пункт меню', '2019-03-16 08:34:25'),
(1131, 'module_menumanager', 0, 'and all its descendants?', 'и всех его потомков?', '2019-03-16 08:34:28'),
(1132, 'module_menumanager', 0, 'Delete a menu item', 'Удалить пункт меню', '2019-03-16 08:34:34'),
(1133, 'module_menumanager', 0, 'Create inside', 'Создать внутри', '2019-03-16 08:34:39'),
(1134, 'common', 0, 'Rename', 'Переименовать', '2019-03-16 08:34:46'),
(1135, 'module_menumanager', 0, 'Delete', 'Удалить', '2019-03-16 08:34:51'),
(1136, 'module_menumanager', 0, 'Edit', 'Редактировать', '2019-03-16 08:34:53'),
(1137, 'module_menumanager', 0, 'Move around menu items is not allowed', 'Нельзя переместить в этот пункт меню', '2019-03-16 08:34:59'),
(1138, 'module_infopages', 0, 'help_infopages_backend_main_admin', 'В этой секции Вы можете добавлять страницы, которые в дальнейшем можно либо разместить в меню, либо указывать ссылки в содержимом другой страницы.', '2019-03-16 08:35:03'),
(1139, 'module_menumanager', 0, 'help_menumanager_backend_main_admin', 'На наименовании пункта меню кликните правой клавишей мыши и увидите контекстное меню с доступными действиями. Максимум можно добавить 3 уровня. Есть возможность  зажать левую клавишу мыши и перемещать элементы меню вверх и вниз.', '2019-03-16 08:35:07'),
(1140, 'module_menumanager', 0, 'Main menu', 'Главное меню', '2019-03-16 08:35:10'),
(1141, 'common', 0, 'Search by description or address', 'Поиск по описанию или адресу', '2019-03-16 08:35:17'),
(1142, 'common', 0, 'Minimum {min} characters.', 'Минимум {min} символов', '2019-03-16 08:35:20'),
(1143, 'common', 0, 'Search by term', 'Поиск по ключевым словам', '2019-03-16 08:35:26'),
(1144, 'module_socialauth', 0, 'Go to link for register Mail.ru application - {link}', 'Для регистрации приложения в Mail.ru пройдите по ссылке - {link}', '2019-03-16 08:35:32'),
(1145, 'module_socialposting', 0, 'Configure the services of automatic posting', 'Настройки сервисов автопостинга', '2019-03-16 08:35:36'),
(1146, 'module_socialposting', 0, 'Allow the application to post notes - {link}', 'Разрешить приложению публиковать записи - {link}', '2019-03-16 08:35:39'),
(1147, 'module_socialposting', 0, 'Go to link for register VK.com application - {link}', 'Для регистрации приложения в Вконтакте пройдите по ссылке - {link}', '2019-03-16 08:35:43'),
(1148, 'module_socialposting', 0, 'Get a Token for VK.com - {link}', 'Получить Token для Vkontakte - {link}', '2019-03-16 08:35:48'),
(1149, 'module_socialposting', 0, 'Section', 'Раздел', '2019-03-16 08:35:50'),
(1150, 'module_socialposting', 0, 'twitter', 'Twitter', '2019-03-16 00:59:50'),
(1151, 'module_socialposting', 0, 'vkontakte', 'Вконтакте', '2019-03-16 08:35:57'),
(1152, 'module_socialposting', 0, 'Setting', 'Настройка', '2019-03-16 08:35:59'),
(1153, 'module_socialposting', 0, 'Value', 'Значение', '2019-03-16 08:36:01'),
(1154, 'module_socialposting', 0, 'useTwitter', 'Использовать автопостинг Twitter', '2019-03-16 08:36:04'),
(1155, 'module_socialposting', 0, 'twitterApiKey', 'API key', '2019-03-16 00:59:50'),
(1156, 'module_socialposting', 0, 'twitterApiSecret', 'API secret', '2019-03-16 00:59:50'),
(1157, 'module_socialposting', 0, 'twitterTokenKey', 'Access token', '2019-03-16 00:59:50'),
(1158, 'module_socialposting', 0, 'twitterTokenSecret', 'Access token secret', '2019-03-16 00:59:50'),
(1159, 'module_socialposting', 0, 'useVkontakte', 'Использовать автопостинг Вконтакте', '2019-03-16 08:36:25'),
(1160, 'module_socialposting', 0, 'vkontakteApplicationId', 'Идентификатор приложения', '2019-03-16 08:36:31'),
(1161, 'module_socialposting', 0, 'vkontakteToken', 'Token', '2019-03-16 00:59:50'),
(1162, 'module_socialposting', 0, 'vkontakteUserId', 'ID пользователя (группы указывается с \"-\")', '2019-03-16 08:36:37'),
(1163, 'module_socialposting', 0, 'Enter the required value', 'Введите требуемое значение', '2019-03-16 08:36:38'),
(1164, 'module_socialposting', 0, 'Services of automatic posting', 'Сервисы автопостинга', '2019-03-16 08:36:45'),
(1165, 'module_socialposting', 0, 'Go to link for register Twitter application - {link}', 'Для регистрации приложения в Twitter пройдите по ссылке - {link}', '2019-03-16 08:36:50'),
(1166, 'module_socialposting', 0, 'Update {name}', 'Редактирование {name}', '2019-03-16 08:36:57'),
(1167, 'module_socialposting', 0, 'Update param \"{name}\"', 'Изменение параметра \"{name}\"', '2019-03-16 08:37:04'),
(1168, 'module_socialposting', 0, 'Update param \"{name}\"', 'Изменение параметра \"{name}\"', '2019-03-16 08:37:09'),
(1169, 'common', 0, 'Listing provided by', 'Объявление опубликовал', '2019-03-16 08:37:13'),
(1170, 'common', 0, 'Show phone', 'Показать телефон', '2019-03-16 08:37:16'),
(1171, 'module_reviews', 0, 'Reviews', 'Отзывы', '2019-03-16 08:37:18'),
(1172, 'module_reviews', 0, 'Reviews_management', 'Управление отзывами', '2019-03-16 08:37:22'),
(1173, 'module_reviews', 0, 'Add_feedback', 'Добавить отзыв', '2019-03-16 08:37:25'),
(1174, 'module_reviews', 0, 'Name', 'Имя', '2019-03-16 08:37:29'),
(1175, 'module_reviews', 0, 'Body', 'Сообщение', '2019-03-16 08:37:33'),
(1176, 'module_reviews', 0, 'Date created', 'Дата добавления', '2019-03-16 08:37:39'),
(1177, 'module_reviews', 0, 'Last updated on', 'Дата изменения', '2019-03-16 08:37:40'),
(1178, 'module_reviews', 0, 'Edit_review', 'Редактировать отзыв', '2019-03-16 08:37:44'),
(1179, 'module_reviews', 0, 'Delete_review', 'Удалить отзыв', '2019-03-16 08:37:49'),
(1180, 'module_reviews', 0, 'View_review', 'Просмотр отзыва', '2019-03-16 08:37:53'),
(1181, 'module_reviews', 0, 'Review list is empty', 'Список отзывов пуст', '2019-03-16 08:37:55'),
(1182, 'module_reviews', 0, 'success_send', 'Отзыв успешно отправлен и будет доступен после модерации.', '2019-03-16 08:37:58'),
(1183, 'module_reviews', 0, 'failed_send', 'Отзыв не был отправлен! Исправьте, пожалуйста, ошибки и повторите снова.', '2019-03-16 08:38:05'),
(1184, 'module_reviews', 0, 'success_send_not_moderation', 'Отзыв успешно отправлен.', '2019-03-16 08:38:06'),
(1185, 'common', 0, 'Mail editor', 'Редактор писем', '2019-03-16 08:38:11'),
(1186, 'module_notifier', 0, 'Mail template for users', 'Шаблон письма для пользователя', '2019-03-16 08:38:17'),
(1187, 'common', 0, 'Subject', 'Тема', '2019-03-16 08:38:19'),
(1188, 'common', 0, 'Body', 'Сообщение', '2019-03-16 08:38:24'),
(1189, 'module_notifier', 0, 'Mail template for admin', 'Шаблон письма для администратора', '2019-03-16 08:38:30'),
(1190, 'common', 0, 'Private person', 'Частное лицо', '2019-03-16 08:38:31'),
(1191, 'common', 0, 'Company', 'Агентство', '2019-03-16 08:38:33'),
(1192, 'common', 0, 'Agent', 'Агент', '2019-03-16 08:38:40'),
(1193, 'module_usercpanel', 0, 'Booking', 'Бронирование', '2019-03-16 08:38:45'),
(1194, 'module_booking', 0, 'Status confirm', 'Подтверждено', '2019-03-16 08:38:51'),
(1195, 'module_booking', 0, 'Status not confirm', 'Не подтверждено', '2019-03-16 08:38:57'),
(1196, 'module_booking', 0, 'Status new', 'Новый', '2019-03-16 08:39:04'),
(1197, 'module_booking', 0, 'Status view', 'Просмотрено', '2019-03-16 08:39:12'),
(1198, 'module_booking', 0, 'booking_table_to_calendar', 'При изменении статуса на \"Подтверждено\" выбранные даты бронирования автоматически будут занесены в \"Календарь бронирования\".', '2019-03-16 08:39:14'),
(1199, 'common', 0, 'Upload file', 'Загрузить файл', '2019-03-16 08:39:19'),
(1200, 'common', 0, 'My listings', 'Мои объявления', '2019-03-16 08:39:25'),
(1201, 'common', 0, 'by username', 'по имени', '2019-03-16 08:39:32'),
(1202, 'common', 0, 'by date of registration', 'по дате регистрации', '2019-03-16 08:39:34'),
(1203, 'common', 0, 'Private persons', 'Частные лица', '2019-03-16 08:39:36'),
(1204, 'common', 0, 'Agents', 'Агенты', '2019-03-16 08:39:39'),
(1205, 'common', 0, 'Agency', 'Агентства недвижимости', '2019-03-16 08:39:44'),
(1206, 'common', 0, 'My data', 'Мои данные', '2019-03-16 08:39:45'),
(1207, 'module_usercpanel', 0, 'My payments', 'Мои платежи', '2019-03-16 08:39:47'),
(1208, 'common', 0, 'My balance', 'Мой баланс', '2019-03-16 08:39:48'),
(1209, 'module_usercpanel', 0, 'Booking applications', 'Заявки на бронь', '2019-03-16 08:39:54'),
(1210, 'common', 0, 'On the balance', 'На балансе', '2019-03-16 08:40:00'),
(1211, 'module_usercpanel', 0, 'Replenish the balance', 'Пополнить баланс', '2019-03-16 08:40:01'),
(1212, 'common', 0, 'Please refill the balance', 'Пополните баланс', '2019-03-16 08:40:02'),
(1213, 'common', 0, 'No information', 'Не указано', '2019-03-16 08:40:04'),
(1214, 'common', 0, 'Manage modules', 'Управление модулями', '2019-03-16 08:40:11'),
(1215, 'common', 0, 'Module is disabled', 'Модуль отключен', '2019-03-16 08:40:15'),
(1216, 'common', 0, 'Enable', 'Включить', '2019-03-16 08:40:16'),
(1217, 'common', 0, 'Disable', 'Отключить', '2019-03-16 08:40:19'),
(1218, 'common', 0, 'module_name_apartmentsComplain', 'Модуль \"Жалобы\"', '2019-03-16 08:40:22'),
(1219, 'common', 0, 'module_description_apartmentsComplain', 'Данный модуль позволяет принимать от пользователей жалобы на объявления (повторы, спам, недостоверная информация и т.д.)', '2019-03-16 08:40:27'),
(1220, 'common', 0, 'module_name_similarads', 'Модуль \"Похожие объявления\"', '2019-03-16 08:40:34'),
(1221, 'common', 0, 'module_description_similarads', 'При просмотре объекта недвижимости предлагает на этой же странице несколько похожих объектов (если они есть).', '2019-03-16 08:40:38'),
(1222, 'common', 0, 'module_name_socialauth', 'Модуль \"Авторизация через соц.сети\"', '2019-03-16 08:40:40'),
(1223, 'common', 0, 'module_description_socialauth', 'Позволяет войти на сайт без регистрации, воспользовавшись существующим профилем в соц.сетях.', '2019-03-16 08:40:41'),
(1224, 'common', 0, 'module_name_comparisonList', 'Модуль \"Список сравнения\"', '2019-03-16 08:40:47'),
(1225, 'common', 0, 'module_description_comparisonList', 'Позволяет добавлять объекты в список сравнения, для дальнейшего более детального анализа отличий объявлений.', '2019-03-16 08:40:53'),
(1226, 'common', 0, 'module_name_rss', 'Модуль \"RSS feed\"', '2019-03-16 08:40:58'),
(1227, 'common', 0, 'module_description_rss', 'Модуль позволяет отслеживать все объявления, удовлетворящие заданным критериям поиска, с помощию подписки на RSS feed.', '2019-03-16 08:41:02'),
(1228, 'common', 0, 'module_name_seo', 'Модуль \"SEO\"', '2019-03-16 08:41:05'),
(1229, 'common', 0, 'module_description_seo', 'Данный модуль предоставляет расширенный функционал по поисковой оптимизации Вашего сайта. Возможность задавать: URL, метатег title, метатег keywords, метатег description для объявлений, новостей и других разделов сайта', '2019-03-16 08:41:09'),
(1230, 'common', 0, 'module_name_sitemap', 'Модуль \"Карта сайта\"', '2019-03-16 08:41:17'),
(1231, 'common', 0, 'module_description_sitemap', 'Этот модуль позволит:<br/>\r\n- отобразить ссылки на все разделы Вашего сайта в одном месте<br/>\r\n- создаст xml-версию специально для поисковых роботов', '2019-03-16 08:41:24'),
(1232, 'common', 0, 'module_name_socialposting', 'Модуль \"Передача объявлений в соц.сети\"', '2019-03-16 08:41:25'),
(1233, 'common', 0, 'module_description_socialposting', 'Модуль позволяет в автоматическом режиме дублировать все новые объявления в различные соц.сети', '2019-03-16 08:41:31'),
(1234, 'common', 0, 'module_name_iecsv', 'Модуль \"Импорт/экспорт объявлений\"', '2019-03-16 08:41:37'),
(1235, 'common', 0, 'module_description_iecsv', 'Благодаря этому модулю вы сможете:<br/>\r\n- загружать объявления в csv-формате<br/>\r\n- выгружать объявления в csv-формате<br/>\r\nЭто позволит:<br/>\r\n- взаимодействовать с другими базами данных объектов недвижимости<br/>\r\n- делать резервные копии базы объявлений', '2019-03-16 08:41:40'),
(1236, 'common', 0, 'module_name_location', 'Модуль \"Местоположение\"', '2019-03-16 08:41:44'),
(1237, 'common', 0, 'module_description_location', 'С этим модулем появится возможность указать не только город, в котором расположен объект, но и регион и страну. Соответствующим образом изменится и форма поиска, что позволит проще и быстрее искать объявления.', '2019-03-16 08:41:47'),
(1238, 'common', 0, 'Module is not installed', 'Модуль не установлен', '2019-03-16 08:41:53'),
(1239, 'common', 0, 'Buy module', 'Купить модуль', '2019-03-16 08:42:00'),
(1240, 'common', 0, 'module_name_yandexRealty', 'Модуль \"Яндекс.Недвижимость\"', '2019-03-16 08:42:04'),
(1241, 'common', 0, 'module_description_yandexRealty', 'Данное расширение позволит передавать объявления с сайта в одну из самых больших и посещаемых баз данных недвижимости по России.', '2019-03-16 08:42:10'),
(1242, 'common', 0, 'module_name_slider', 'Модуль \"Управление галереей\"', '2019-03-16 08:42:18'),
(1243, 'common', 0, 'module_description_slider', 'Модуль управления галереей на главной странице. Позволяет управлять галереей на главной странице сайта буквально парой щелчков \"мышкой\". Благодаря этому модулю Вы сможете:<br/>\r\n- управлять изображениями галереи из панели администратора<br/>\r\n- устанавливать заголовки для изображений<br/>\r\n- устанавливать ссылки для изображений', '2019-03-16 08:42:22'),
(1244, 'common', 0, 'module_name_advertising', 'Модуль \"Реклама\"', '2019-03-16 08:42:26'),
(1245, 'common', 0, 'module_description_advertising', 'С помощью этого модуля Вы сможете легко размещать на сайте рекламные блоки. Для каждого блока Вы можете выбрать: нужное положение и страницы для отображения', '2019-03-16 08:42:31'),
(1246, 'common', 0, 'module_name_bookingcalendar', 'Модуль \"Календарь бронирования\"', '2019-03-16 08:42:38'),
(1247, 'common', 0, 'module_description_bookingcalendar', 'Этот модуль позволяет:<br/>\r\n- указывать периоды свободного/сданного жилья<br/>\r\n- отображать на странице объявления календарь с наглядной информацией о доступности объекта', '2019-03-16 08:42:43'),
(1248, 'common', 0, 'module_name_formeditor', 'Модуль \"Расширенный редактор форм\"', '2019-03-16 08:42:45'),
(1249, 'common', 0, 'module_description_formeditor', 'С этим модулем появится возможность:<br/>\r\n- добавлять новые поля<br/>\r\n- редактировать поля<br/>\r\n- добавлять новые поля в поиск', '2019-03-16 08:42:49'),
(1250, 'common', 0, 'Module is enabled', 'Модуль включен', '2019-03-16 08:42:53'),
(1251, 'module_usercpanel', 0, 'My agents', 'Мои агенты', '2019-03-16 08:42:58'),
(1252, 'module_usercpanel', 0, 'Register as', 'Зарегистрирован как', '2019-03-16 08:42:59'),
(1253, 'module_usercpanel', 0, 'Registered', 'Зарегистрирован', '2019-03-16 08:43:01'),
(1254, 'common', 0, 'No user', 'Нет пользователей', '2019-03-16 08:43:05'),
(1255, 'common', 0, 'Agency name', 'Агентство', '2019-03-16 08:43:12'),
(1256, 'common', 0, 'This user \"{name}\" is not your agent anymore', 'Пользователь {name} больше не является вашим агентом.', '2019-03-16 08:43:16'),
(1257, 'module_notifier', 0, 'The variables are available in this template', 'Переменные доступные в этом шаблоне', '2019-03-16 08:43:23'),
(1258, 'module_infopages', 0, 'Bottom', 'Снизу', '2019-03-16 08:43:28'),
(1259, 'module_infopages', 0, 'Top', 'Сверху', '2019-03-16 08:43:31'),
(1260, 'module_infopages', 0, 'Widget', 'Виджет', '2019-03-16 00:59:50'),
(1261, 'module_infopages', 0, 'Widget\'s position', 'Позиция виджета', '2019-03-16 08:43:38'),
(1262, 'module_infopages', 0, 'Filter for listings\' list', 'Фильтр для списка объявлений', '2019-03-16 08:43:41'),
(1263, 'module_users', 0, 'Waiting for acknowledge', 'Ожидает подтверждения', '2019-03-16 08:43:46'),
(1264, 'module_users', 0, 'Confirmed', 'Подтвержден', '2019-03-16 08:43:53'),
(1265, 'common', 0, 'of', 'из', '2019-03-16 08:43:55'),
(1266, 'module_seo', 0, 'Direct url', 'Прямой URL', '2019-03-16 08:44:01'),
(1267, 'common', 0, 'It is allowed to use the characters \"-a-zA-Z0-9_+\" without spaces', 'Разрешается использовать символы \"-a-zA-Z0-9_+\" без пробелов', '2019-03-16 08:44:07'),
(1268, 'module_seo', 0, 'This url already exists', 'Такой URL уже существует', '2019-03-16 08:44:09'),
(1269, 'module_seo', 0, 'The same URL for different languages', 'Одинаковый URL для разных языков', '2019-03-16 08:44:14'),
(1270, 'module_notifier', 0, 'New message (contact form)', 'Новое сообщение (форма контактов)', '2019-03-16 08:44:15'),
(1271, 'module_notifier', 0, 'New message from ::name (::email ::phone). Message text: ::body', 'Вам отправлено новое сообщение от ::name (::email ::phone). Текст сообщения: ::body', '2019-03-16 08:44:21'),
(1272, 'module_notifier', 0, 'New payment through a bank.', 'Новый платеж через банк.', '2019-03-16 08:44:27'),
(1273, 'module_notifier', 0, 'New payment through a bank in the amount of ::amount ::currency_charcode', 'Новый платеж через банк на сумму ::amount ::currency_charcode', '2019-03-16 08:44:29'),
(1274, 'module_notifier', 0, 'New complain added.', 'Добавлена новая жалоба.', '2019-03-16 08:44:33'),
(1275, 'module_notifier', 0, 'New complain was added. From ::name (::email). Complain text: ::body', 'Добавлена новая жалоба. От ::name (::email). Текст жалобы: ::body', '2019-03-16 08:44:40'),
(1276, 'module_notifier', 0, 'You can view it at', 'Вы можете посмотреть на', '2019-03-16 08:44:46'),
(1277, 'module_notifier', 0, 'Message for the listing\'s owner №', 'Сообщение владельцу объявления №', '2019-03-16 08:44:49'),
(1278, 'module_apartments', 0, 'Booking apartment', 'Бронирование недвижимости', '2019-03-16 08:44:50'),
(1279, 'module_menumanager', 0, 'is_blank', 'Открывать в новом окне браузера', '2019-03-16 08:44:51'),
(1280, 'common', 0, 'Manage themes', 'Управление темами', '2019-03-16 08:44:56'),
(1281, 'module_themes', 0, 'Manage themes', 'Управление темами', '2019-03-16 08:44:58'),
(1282, 'module_themes', 0, 'title', 'Название темы', '2019-03-16 08:45:00'),
(1283, 'module_themes', 0, 'Is Default', 'По умолчанию', '2019-03-16 08:45:01'),
(1284, 'common', 0, 'Go up', 'Наверх', '2019-03-16 08:45:03'),
(1285, 'common', 0, 'Type of listing', 'Тип объявления', '2019-03-16 08:45:07'),
(1286, 'common', 0, 'Cookies are disabled', 'Cookies запрещены', '2019-03-16 08:45:11'),
(1287, 'common', 0, 'Please, enable cookies in your browser', 'Пожалуйста, разрешите Cookies в вашем браузере.', '2019-03-16 08:45:17'),
(1288, 'module_payment', 0, 'The payment is successfully completed. The paid service has been activated.', 'Платёж успешно завершён. Платная услуга активирована.', '2019-03-16 08:45:20'),
(1289, 'module_configuration', 0, 'useUserRegistration', 'Разрешить регистрацию пользователей', '2019-03-16 08:45:27'),
(1290, 'common', 0, 'Please tell the seller that you have found this listing here {n}', 'Пожалуйста, скажите продавцу, что вы нашли это объявление на сайте {n}', '2019-03-16 08:45:29'),
(1291, 'module_messages', 0, 'Messages', 'Сообщения', '2019-03-16 08:45:30'),
(1292, 'module_messages', 0, 'Mailing messages', 'Массовая рассылка', '2019-03-16 08:45:31'),
(1293, 'common', 0, 'module_name_messages', 'Модуль \"Внутренняя переписка\"', '2019-03-16 08:45:33'),
(1294, 'common', 0, 'module_description_messages', 'С помощью этого модуля Вы сможете рассылать пользователям личные сообщения. Пользователи могут вести внутреннюю переписку друг с другом.', '2019-03-16 08:45:39'),
(1295, 'module_messages', 0, 'My mailbox', 'Мои сообщения', '2019-03-16 08:45:45'),
(1296, 'module_messages', 0, 'no_messages', 'Нет сообщений', '2019-03-16 08:45:47'),
(1297, 'common', 0, 'Mailing messages', 'Массовая рассылка', '2019-03-16 08:45:53'),
(1298, 'module_messages', 0, 'ID', '№', '2019-03-16 08:45:57'),
(1299, 'module_messages', 0, 'Sender ID', 'Отправитель', '2019-03-16 08:45:58'),
(1300, 'module_messages', 0, 'Recipient ID', 'Получатель', '2019-03-16 08:46:01'),
(1301, 'module_messages', 0, 'Message', 'Сообщение', '2019-03-16 08:46:06'),
(1302, 'module_messages', 0, 'Read', 'Читать', '2019-03-16 08:46:13'),
(1303, 'module_messages', 0, 'Sending date', 'Дата отправки', '2019-03-16 08:46:17'),
(1304, 'module_messages', 0, 'Reading date', 'Дата прочтения', '2019-03-16 08:46:23'),
(1305, 'module_messages', 0, 'Attach file', 'Приложить файл', '2019-03-16 08:46:27'),
(1306, 'module_messages', 0, 'Status', 'Статус', '2019-03-16 08:46:32'),
(1307, 'module_messages', 0, 'Files', 'Файлы', '2019-03-16 08:46:38'),
(1308, 'module_messages', 0, 'fromListingId', '№ объявления', '2019-03-16 08:46:42'),
(1309, 'module_messages', 0, 'Supported file: {supportExt}.', 'Поддерживаемый тип файлов: {supportExt}', '2019-03-16 08:46:43'),
(1310, 'module_messages', 0, 'Max file size: {fileMaxSize}.', 'Максимальный размер файла: {fileMaxSize}', '2019-03-16 08:46:48'),
(1311, 'module_messages', 0, 'The selected file has already been added!', 'Выбранный файл уже был добавлен', '2019-03-16 08:46:56'),
(1312, 'module_messages', 0, 'Unsupported file type!', 'Неподдерживаемый тип файла', '2019-03-16 08:46:58'),
(1313, 'module_messages', 0, 'You have {n} unread messages', 'У вас {n} непрочитанных писем', '2019-03-16 08:47:05'),
(1314, 'module_messages', 0, 'userType', 'Тип', '2019-03-16 08:47:09'),
(1315, 'module_messages', 0, 'withListings', 'С объявлениями', '2019-03-16 08:47:11'),
(1316, 'module_messages', 0, 'countryListing', 'Объявления в стране', '2019-03-16 08:47:15'),
(1317, 'module_messages', 0, 'regionListing', 'Объявления в регионе', '2019-03-16 08:47:16'),
(1318, 'module_messages', 0, 'cityListing', 'Объявления в городе', '2019-03-16 08:47:19'),
(1319, 'module_messages', 0, 'Message sent to the users', 'Сообщение было отправлено', '2019-03-16 08:47:21'),
(1320, 'module_messages', 0, 'User', 'Пользователь', '2019-03-16 08:47:28'),
(1321, 'module_messages', 0, 'Administrator', 'Администратор', '2019-03-16 08:47:33'),
(1322, 'module_messages', 0, 'View', 'Смотреть', '2019-03-16 08:47:34'),
(1323, 'module_messages', 0, 'Delete', 'Удалить', '2019-03-16 08:47:38'),
(1324, 'module_messages', 0, 'Are you sure?', 'Вы уверены?', '2019-03-16 08:47:44'),
(1325, 'module_messages', 0, 'new_message', 'Новое сообщение', '2019-03-16 08:47:45'),
(1326, 'module_messages', 0, 'All messages', 'Все сообщения', '2019-03-16 08:47:49'),
(1327, 'module_messages', 0, 'History messages with user', 'История сообщений с пользователем', '2019-03-16 08:47:53'),
(1328, 'module_messages', 0, 'mes', 'Сообщение', '2019-03-16 08:47:58'),
(1329, 'module_messages', 0, 'Send', 'Отправить', '2019-03-16 08:47:59'),
(1330, 'module_messages', 0, 'New message', 'Новое сообщение', '2019-03-16 08:48:06'),
(1331, 'module_messages', 0, 'Message sent to the user', 'Сообщение было отправлено', '2019-03-16 08:48:13'),
(1332, 'module_messages', 0, 'I am', 'Я', '2019-03-16 08:48:19'),
(1333, 'module_messages', 0, 'user_phone', 'Номер телефона', '2019-03-16 08:48:26'),
(1334, 'module_messages', 0, 'Send message', 'Послать сообщение', '2019-03-16 08:48:27'),
(1335, 'module_messages', 0, 'max_newsletter_limit', 'Максимум: {n} пользователей', '2019-03-16 08:48:28'),
(1336, 'module_messages', 0, 'Hello {username}', 'Здравствуйте, {username}', '2019-03-16 08:48:31'),
(1337, 'module_messages', 0, 'message_macros_help', 'Используйте макрос {username} чтобы подставить имя пользователя', '2019-03-16 08:48:37'),
(1338, 'module_messages', 0, 'check_users_send', 'Выберите пользователя', '2019-03-16 08:48:41'),
(1339, 'module_clients', 0, 'Clients', 'Клиенты', '2019-03-16 08:48:42'),
(1340, 'module_clients', 0, 'Manage clients', 'Управление клиентами', '2019-03-16 08:48:43'),
(1341, 'module_clients', 0, 'Add client', 'Добавить клиента', '2019-03-16 08:48:50'),
(1342, 'module_clients', 0, 'Live with our help', 'Заселился с нашей помощью', '2019-03-16 08:48:57'),
(1343, 'module_clients', 0, 'Accommodating', 'Заселяем', '2019-03-16 08:49:02'),
(1344, 'module_clients', 0, 'Independently', 'Заселился самостоятельно', '2019-03-16 08:49:08'),
(1345, 'module_clients', 0, 'Ignore', 'Игнорируемый', '2019-03-16 08:49:13'),
(1346, 'module_clients', 0, 'Fio', 'Ф.И.О', '2019-03-16 08:49:20'),
(1347, 'module_clients', 0, 'ID', '№', '2019-03-16 08:49:28'),
(1348, 'module_clients', 0, 'State', 'Статус', '2019-03-16 08:49:33'),
(1349, 'module_clients', 0, 'Contract_number', 'Номер договора', '2019-03-16 08:49:40'),
(1350, 'module_clients', 0, 'Phone', 'Телефон', '2019-03-16 08:49:45'),
(1351, 'module_clients', 0, 'Additional_phone', 'Дополнительный телефон', '2019-03-16 08:49:47'),
(1352, 'module_clients', 0, 'Acts', 'Документы', '2019-03-16 08:49:54'),
(1353, 'module_clients', 0, 'Additional_info', 'Дополнительная информация', '2019-03-16 08:49:58'),
(1354, 'module_clients', 0, 'View client', 'Просмотреть данные клиента', '2019-03-16 08:50:01'),
(1355, 'module_clients', 0, 'Delete client', 'Удалить клиента', '2019-03-16 08:50:05'),
(1356, 'module_clients', 0, 'Update client', 'Редактировать данные клиента', '2019-03-16 08:50:13'),
(1357, 'module_clients', 0, 'Client ID', 'Номер клиента', '2019-03-16 08:50:14'),
(1358, 'module_clients', 0, 'Second_name', 'Фамилия', '2019-03-16 08:50:19'),
(1359, 'module_clients', 0, 'Middle_name', 'Отчество', '2019-03-16 08:50:24'),
(1360, 'module_clients', 0, 'First_name', 'Имя', '2019-03-16 08:50:27'),
(1361, 'module_clients', 0, 'Birthdate', 'Дата рождения', '2019-03-16 08:50:34'),
(1362, 'common', 0, 'Only with photo', 'Только с фото', '2019-03-16 08:50:36'),
(1363, 'common', 0, 'Listing from', 'Объявление от', '2019-03-16 08:50:37'),
(1364, 'module_payment', 0, 'MERCHANT_ID', 'Идентификатор сайта в платёжной системе', '2019-03-16 08:50:44'),
(1365, 'module_configuration', 0, 'useJQuerySimpleCaptcha', 'Использовать капчу JQuerySimpleCaptcha', '2019-03-16 08:50:47'),
(1366, 'common', 0, 'jquerySimpleCaptchaIntroText', 'Пожалуйста, нажмите на <strong class=\"captchaText\"></strong>', '2019-03-16 08:50:50'),
(1367, 'module_users', 0, 'RoleAdmin', 'Администратор', '2019-03-16 08:50:56'),
(1368, 'module_users', 0, 'RoleModerator', 'Модератор', '2019-03-16 08:51:03'),
(1369, 'module_users', 0, 'RoleRegistered', 'Зарегистрированный пользователь', '2019-03-16 08:51:07'),
(1370, 'module_users', 0, 'Role', 'Роль', '2019-03-16 08:51:12'),
(1371, 'module_users', 0, 'Incorrect user role', 'Некорректная роль', '2019-03-16 08:51:16'),
(1372, 'module_users', 0, 'Select role', 'Выберите роль', '2019-03-16 08:51:17'),
(1373, 'common', 0, 'log in as moderator', 'войти модератором', '2019-03-16 08:51:24'),
(1374, 'common', 0, 'module_name_rbac', 'Модуль \"Контроль доступа на основе ролей\"', '2019-03-16 08:51:26'),
(1375, 'common', 0, 'module_description_rbac', 'Простой, но мощный способ централизованного контроля доступа.\r\n\r\nМодуль позволяет добавлять модераторов.', '2019-03-16 08:51:32'),
(1376, 'module_configuration', 0, 'useTypeRentHour', 'Возможность добавления объявлений  с типом \"Сдам\" -> \"почасово\"', '2019-03-16 08:51:38'),
(1377, 'module_configuration', 0, 'useTypeRentDay', 'Возможность добавления объявлений  с типом \"Сдам\" -> \"посуточно\"', '2019-03-16 08:51:40'),
(1378, 'module_configuration', 0, 'useTypeRentWeek', 'Возможность добавления объявлений  с типом \"Сдам\" -> \"понедельно\"', '2019-03-16 08:51:47'),
(1379, 'module_configuration', 0, 'useTypeRentMonth', 'Возможность добавления объявлений  с типом \"Сдам\" -> \"помесячно\"', '2019-03-16 08:51:49'),
(1380, 'common', 0, 'module_name_tariffPlans', 'Модуль \"Тарифные планы\"', '2019-03-16 08:51:56'),
(1381, 'common', 0, 'module_description_tariffPlans', 'Модуль позволяет задавать стоимость услуг добавления объявлений или просмотр контактных данных владельцев с ограничением срока действия или без него.\r\n\r\nПри включении модуля по умолчанию всем пользователям присваивается тарифный план \"Бесплатный\"', '2019-03-16 08:52:02'),
(1382, 'common', 0, 'Tariff Plans', 'Тарифные планы', '2019-03-16 08:52:03'),
(1383, 'module_tariffPlans', 0, 'Manage tariff plans', 'Управление тарифными планами', '2019-03-16 08:52:08'),
(1384, 'module_tariffPlans', 0, 'Add tariff plan', 'Добавить тарифный план', '2019-03-16 08:52:11'),
(1385, 'module_tariffPlans', 0, 'Price', 'Стоимость', '2019-03-16 08:52:15'),
(1386, 'module_tariffPlans', 0, 'Duration', 'Срок действия', '2019-03-16 08:52:19'),
(1387, 'module_tariffPlans', 0, 'days', 'дней', '2019-03-16 08:52:26'),
(1388, 'module_tariffPlans', 0, 'Are you sure you want to delete this item? All user tariffs will also be deleted!', 'Вы действительно хотите удалить выбранный тарифный план? Все объявления пользователей с выбранным тарифом станут неактивными.', '2019-03-16 08:52:27'),
(1389, 'module_tariffPlans', 0, 'Name', 'Название тарифного плана', '2019-03-16 08:52:34'),
(1390, 'module_tariffPlans', 0, 'Description', 'Описание тарифного плана', '2019-03-16 08:52:39'),
(1391, 'module_tariffPlans', 0, 'Limit_objects', 'Максимум объявлений', '2019-03-16 08:52:40'),
(1392, 'module_tariffPlans', 0, 'Limit_photos', 'Максимум фотографий к объявлениям', '2019-03-16 08:52:45'),
(1393, 'module_tariffPlans', 0, 'Status', 'Статус', '2019-03-16 08:52:48'),
(1394, 'module_tariffPlans', 0, 'If null or 0 then unlimited', 'Без ограничений, если значение \"пусто\" или \"0\"', '2019-03-16 08:52:54'),
(1395, 'module_tariffPlans', 0, 'If null or 0 then free', 'Бесплатно, если значение \"пусто\" или 0', '2019-03-16 08:53:02'),
(1396, 'module_tariffPlans', 0, 'Show_address', 'Показывать поле \"адрес\" в объявлениях', '2019-03-16 08:53:07'),
(1397, 'module_tariffPlans', 0, 'Show_phones', 'Показывать телефоны владельцев объявлений', '2019-03-16 08:53:08'),
(1398, 'module_tariffPlans', 0, 'Browse ads', 'Просмотр объявлений', '2019-03-16 08:53:10'),
(1399, 'module_tariffPlans', 0, 'Adding ads', 'Добавление объявлений', '2019-03-16 08:53:17'),
(1400, 'module_tariffPlans', 0, 'Price is free', 'Бесплатно', '2019-03-16 08:53:21'),
(1401, 'module_tariffPlans', 0, 'Unlimited', 'Без ограничений', '2019-03-16 08:53:23'),
(1402, 'module_tariffPlans', 0, 'Edit tariff plan', 'Редактирование тарифного плана', '2019-03-16 08:53:24'),
(1403, 'module_tariffPlans', 0, 'Duration and price', 'Срок действия и стоимость', '2019-03-16 08:53:26'),
(1404, 'module_tariffPlans', 0, 'Apply a tariff plan to the user', 'Добавить тарифный план пользователю', '2019-03-16 08:53:33'),
(1405, 'common', 0, 'Tariff plan successfully added', 'Тарифный план успешно добавлен', '2019-03-16 08:53:35'),
(1406, 'module_tariffPlans', 0, 'Tariff_id', 'Тарифный план', '2019-03-16 08:53:42'),
(1407, 'common', 0, 'unlimited', 'неограниченно', '2019-03-16 08:53:45'),
(1408, 'module_tariffPlans', 0, 'Your current tariff plan', 'Ваш текущий тарифный план', '2019-03-16 08:53:51'),
(1409, 'common', 0, 'Date of completion', 'Действует до', '2019-03-16 08:53:52'),
(1410, 'common', 0, 'Change tariff plan', 'Сменить тарифный план', '2019-03-16 08:53:57'),
(1411, 'module_tariffPlans', 0, 'Exhausted the limit of {limit} active ads, deactivate other ads or <a href=\"{link}\">change tariff plan</a>', 'Исчерпан лимит в {limit} активных объявлений, деактивируйте другие объявления, либо <a href=\"{link}\">смените тарифный план</a>', '2019-03-16 08:54:04'),
(1412, 'module_tariffPlans', 0, 'You are trying to download more than {num} pictures ( your tariff limit )', 'Вы пытаетесь загрузить больше, чем {num} фотографий ( ограничение на Вашем тарифном плане ).', '2019-03-16 08:54:12'),
(1413, 'module_tariffPlans', 0, 'Please <a href=\"{n}\">change the tariff plan</a> to view', 'Пожалуйста, <a href=\"{n}\">смените тариф</a> для просмотра', '2019-03-16 08:54:17'),
(1414, 'module_tariffPlans', 0, 'Please <a href=\"{n}\">login</a> to view', 'Пожалуйста, <a href=\"{n}\">войдите в систему</a> для просмотра', '2019-03-16 08:54:24'),
(1415, 'module_tariffPlans', 0, 'Are you sure you want to change the tariff plan?', 'Вы действительно хотите сменить тарифный план?', '2019-03-16 08:54:30'),
(1416, 'module_tariffPlans', 0, 'help_buy_tariff_plan', 'При переходе на другой тарифный план оставшиеся дни действия текущего плана не сохраняются. ', '2019-03-16 08:54:34'),
(1417, 'module_tariffPlans', 0, 'help_buy_tariff_plan2', 'Денежные средства за оставшиеся дни тарифного плана не возвращаются.', '2019-03-16 08:54:42'),
(1418, 'module_paidservices', 0, 'Amount', 'Стоимость', '2019-03-16 08:54:47'),
(1419, 'module_paidservices', 0, 'Status', 'Статус', '2019-03-16 08:54:50'),
(1420, 'module_paidservices', 0, 'Payment date', 'Дата платежа', '2019-03-16 08:54:55'),
(1421, 'module_paidservices', 0, 'Booking #', 'Бронирование #', '2019-03-16 08:55:02'),
(1422, 'module_paidservices', 0, 'Method of payment', 'Способ оплаты', '2019-03-16 08:55:08'),
(1423, 'module_tariffPlans', 0, 'Selected tariff plan is free. Please contact the site administrator for transit to this tariff.', 'Выбранный тарифный план бесплатен. Свяжитесь с администрацией сайта для перехода на данный тариф.', '2019-03-16 08:55:12'),
(1424, 'module_tariffPlans', 0, 'Purchase tariff plan', 'Покупка тарифного плана', '2019-03-16 08:55:19'),
(1425, 'module_configuration', 0, 'mailSMTPSecure', 'Способ шифрования SMTP', '2019-03-16 08:55:20'),
(1426, 'module_socialposting', 0, 'vkontakteFromGroup', 'Публикация от имени группы', '2019-03-16 08:55:25'),
(1427, 'module_advertising', 0, 'Javascript code', 'Javascript код', '2019-03-16 08:55:28'),
(1428, 'module_blockIp', 0, 'Add the IP address to the list of blocked', 'Добавить IP в чёрный список', '2019-03-16 08:55:31'),
(1429, 'module_blockIp', 0, 'Ip was success added', 'IP успешно добавлен', '2019-03-16 08:55:34'),
(1430, 'module_blockIp', 0, 'Ip was already exists', 'Данный IP уже есть в чёрном списке', '2019-03-16 08:55:37'),
(1432, 'module_blockIp', 0, 'Enter Ip', 'Введите IP', '2019-03-16 08:55:42'),
(1433, 'module_blockIp', 0, 'User IP', 'IP', '2019-03-16 00:59:50'),
(1434, 'common', 0, 'Blockip', 'Черный список IP', '2019-03-16 08:55:54'),
(1435, 'module_blockIp', 0, 'Add blockIp', 'Добавить IP в чёрный список', '2019-03-16 08:56:01'),
(1436, 'module_blockIp', 0, 'Manage blockIp', 'Управление чёрным списком', '2019-03-16 08:56:03'),
(1437, 'module_blockIp', 0, 'IP', 'IP', '2019-03-16 00:59:50'),
(1438, 'module_blockIp', 0, 'Ip_long', 'Ip ( long )', '2019-03-16 00:59:50'),
(1439, 'module_blockIp', 0, 'Update blockIp', 'Редактировать', '2019-03-16 08:56:19'),
(1440, 'module_blockIp', 0, 'Delete blockIp', 'Удалить', '2019-03-16 08:56:24'),
(1441, 'module_blockIp', 0, 'help_admin', 'Посетители с IP-адресом, находящимся в \"Чёрном списке\", не могут регистрироваться, бронировать, оставлять жалобы, писать сообщения через \"Связаться с нами\", а так же оставлять отзывы и комментарии на сайте.', '2019-03-16 08:56:31'),
(1442, 'module_blockIp', 0, 'Added IP are automatically deleted', 'Добавленные IP автоматически удаляются через', '2019-03-16 08:56:33'),
(1443, 'module_blockIp', 0, 'days', 'дней', '2019-03-16 08:56:36'),
(1444, 'module_users', 0, 'Restore password for {email}?', 'Восстановить пароль для {email}?', '2019-03-16 08:56:37'),
(1445, 'module_notifier', 0, 'A new password has been created and sent to {email}.', 'Новый пароль был создан и отправлен на {email}.', '2019-03-16 08:56:38'),
(1446, 'common', 0, 'Registration date', 'Дата регистрации', '2019-03-16 08:56:40'),
(1447, 'common', 0, 'The last date the user logged in to the system', 'Дата последнего входа пользователя на сайт', '2019-03-16 08:56:46'),
(1448, 'common', 0, 'Last IP address', 'Последний IP адрес', '2019-03-16 08:56:50'),
(1449, 'common', 0, 'Change the owner of the listings', 'Сменить владельца объявлений', '2019-03-16 08:56:55'),
(1450, 'module_apartments', 0, 'futureOwner', 'Будущий владелец объявления', '2019-03-16 08:57:00'),
(1451, 'module_apartments', 0, 'futureApartments', 'Объявление/объявления', '2019-03-16 08:57:05'),
(1452, 'module_apartments', 0, 'Choose a user', 'Выберите пользователя', '2019-03-16 08:57:09'),
(1453, 'module_partments', 0, 'Choose a apartments', 'Выберите объявление/объявления', '2019-03-16 08:57:13'),
(1454, 'module_configuration', 0, 'user_registrationMode', 'Регистрация пользователей на сайте', '2019-03-16 08:57:20'),
(1455, 'module_users', 0, 'With confirmation by email', 'с подтверждением email', '2019-03-16 08:57:28'),
(1456, 'module_users', 0, 'Without confirmation by email', 'без подтверждения email', '2019-03-16 08:57:35'),
(1457, 'common', 0, 'You were successfully registered.', 'Вы успешно зарегистрировались.', '2019-03-16 08:57:39'),
(1458, 'module_usercpanel', 0, 'Password', 'Пароль', '2019-03-16 08:57:40'),
(1459, 'module_apartments', 0, 'Set the owner of the listing', 'Назначить владельца объявления ', '2019-03-16 08:57:46'),
(1460, 'module_themes', 0, 'Edit theme', 'Редактировать тему', '2019-03-16 09:32:59'),
(1461, 'module_themes', 0, 'Color theme', 'Цветовая тема', '2019-03-16 09:33:06'),
(1462, 'module_themes', 0, 'The file was less than {size}MB. Please upload a larger file.', 'Файл был меньше, чем {size} МБ. Пожалуйста, загрузите файл большего размера.', '2019-03-16 09:33:11'),
(1463, 'module_themes', 0, 'Image successfully added', 'Изображение успешно добавлено.', '2019-03-16 09:33:13'),
(1464, 'module_themes', 0, 'Image successfully deleted', 'Изображение успешно удалено.', '2019-03-16 09:33:19'),
(1465, 'module_themes', 0, 'Background image', 'Фоновое изображение', '2019-03-16 09:33:23'),
(1466, 'common', 0, 'Enter agency name', 'Введите название агентства', '2019-03-16 09:33:31'),
(1467, 'module_formeditor', 0, 'type text area with wysiwyg', 'Большое текстовое поле с wysiwyg', '2019-03-16 09:33:34'),
(1468, 'module_currency', 0, 'Add currency', 'Добавить валюту', '2019-03-16 09:33:38'),
(1469, 'common', 0, 'It is allowed to use the characters \"A-Z\" without spaces', 'Можно использовать только символы \"A-Z\", без пробелов', '2019-03-16 09:33:43'),
(1470, 'common', 0, 'The field should correspond {link}', 'Поле должно соответствовать {link}', '2019-03-16 09:33:46'),
(1471, 'module_currency', 0, 'Not parse', 'Не парсить', '2019-03-16 09:33:48'),
(1472, 'module_currency', 0, 'Update currency', 'Редактирование валюты', '2019-03-16 09:33:54'),
(1473, 'module_currency', 0, 'Delete currency', 'Удалить валюту', '2019-03-16 09:33:59');
INSERT INTO `ore_gj_translate_message` (`id`, `category`, `status`, `message`, `translation_ru`, `date_updated`) VALUES
(1474, 'module_currency', 0, 'You can not delete an active currency!', 'Нельзя удалить активную валюту!', '2019-03-16 09:34:01'),
(1475, 'common', 0, 'I agree with', 'Регистрируясь на сайте, я соглашаюсь с', '2019-03-16 09:34:04'),
(1476, 'common', 0, 'You must agree', 'Вы должны подтвердить своё согласие с', '2019-03-16 09:34:10'),
(1477, 'common', 0, 'with User agreement', 'Пользовательским соглашением', '2019-03-16 09:34:13'),
(1478, 'common', 0, 'Clone', 'Клонировать', '2019-03-16 00:59:50'),
(1479, 'module_configuration', 0, 'enableUserAdsCopy', 'Разрешить пользователям клонировать объявления', '2019-03-16 09:34:26'),
(1480, 'common', 0, 'Copy of', 'Копия', '2019-03-16 09:34:30'),
(1481, 'module_configuration', 0, 'notDeleteListings', 'Не удалять объявления', '2019-03-16 09:34:35'),
(1482, 'module_apartments', 0, 'Restore', 'Восстановить', '2019-03-16 09:34:36'),
(1483, 'module_apartments', 0, 'Listing is deleted', 'Объявление не актуально', '2019-03-16 09:34:38'),
(1484, 'common', 0, 'Deleted', 'Удалено', '2019-03-16 09:34:44'),
(1485, 'module_apartments', 0, 'Status (deleted)', 'Статус (удалено)', '2019-03-16 09:34:45'),
(1486, 'module_payment', 0, 'Please_wait_payment_W1', 'Пожалуйста ждите. Происходит перенаправление на W1 для оплаты.', '2019-03-16 09:34:49'),
(1487, 'common', 0, 'Booking', 'Бронирование', '2019-03-16 09:34:52'),
(1488, 'common', 0, 'Booking from', 'Свободно с', '2019-03-16 09:34:56'),
(1489, 'module_payment', 0, 'Please_wait_payment_Liqpay', 'Пожалуйста ждите. Происходит перенаправление на Liqpay для оплаты.', '2019-03-16 09:35:01'),
(1490, 'module_apartments', 0, 'trillion', 'трлн.', '2019-03-16 09:35:04'),
(1491, 'module_apartments', 0, 'billion', 'млрд.', '2019-03-16 09:35:07'),
(1492, 'module_formeditor', 0, 'type multyselect', 'Поле со множественным выбором', '2019-03-16 09:35:14'),
(1493, 'Chosen.main', 0, 'No results match', 'Нет подходящих результатов', '2019-03-16 09:35:16'),
(1494, 'module_location', 0, 'Add multiple cities help', 'Введите список городов, по одному в каждой строке. Если установлен русский язык, для других языков названия будут преобразованы в транслит. Не забудьте отредактировать переводы после добавления.', '2019-03-16 09:35:21'),
(1495, 'module_apartmentCity', 0, 'Add multiple cities', 'Добавить несколько городов', '2019-03-16 09:35:24'),
(1496, 'module_apartmentCity', 0, 'Add multiple cities help', 'Введите список городов, по одному в каждой строке. Если установлен русский язык, для других языков названия будут преобразованы в транслит. Не забудьте отредактировать переводы после добавления.', '2019-03-16 09:35:27'),
(1497, 'module_location', 0, 'Add multiple cities', 'Добавить несколько городов', '2019-03-16 09:35:30'),
(1498, 'module_referencevalues', 0, 'Create multiple reference values', 'Добавить несколько значений', '2019-03-16 09:35:31'),
(1499, 'module_referencevalues', 0, 'Add multiple reference values help', 'Введите список значений справочников, по одному в каждой строке. Если установлен русский язык, для других языков названия будут преобразованы в транслит. Не забудьте отредактировать переводы после добавления.', '2019-03-16 09:35:34'),
(1500, 'module_configuration', 0, 'allowUserSeo', 'Разрешить пользователю задавать настройки SЕО для объявлений', '2019-03-16 09:35:38'),
(1501, 'common', 0, 'module_name_seasonalprices', 'Модуль \"Сезонные цены\"', '2019-03-16 09:35:40'),
(1502, 'common', 0, 'module_description_seasonalprices', 'Модуль позволяет задавать различные цены для разных сезонов. Вы также сможете указывать длительность сезона или устанавливать индивидуальные цены для каждого месяца.', '2019-03-16 09:35:45'),
(1503, 'module_seasonalprices', 0, 'seasonalprices_help_full', 'Вы можете указать различные цены для разных сезонов (например, для обычного, высокого и пикового сезонов).', '2019-03-16 09:35:52'),
(1504, 'module_seasonalprices', 0, 'Name', 'Наименование сезона', '2019-03-16 09:35:57'),
(1505, 'module_seasonalprices', 0, 'Price', 'Цена', '2019-03-16 09:36:01'),
(1506, 'module_seasonalprices', 0, 'From', 'От', '2019-03-16 09:36:04'),
(1507, 'module_seasonalprices', 0, 'To', 'До', '2019-03-16 09:36:10'),
(1508, 'module_seasonalprices', 0, 'Min_rental_period', 'Минимальный срок аренды', '2019-03-16 09:36:15'),
(1509, 'module_seasonalprices', 0, 'Fill fields', 'Заполните обязательные поля', '2019-03-16 09:36:18'),
(1510, 'module_seasonalprices', 0, 'No_prices', 'Цены не указаны', '2019-03-16 09:36:24'),
(1511, 'module_apartments', 0, 'a hour', 'час', '2019-03-16 09:36:31'),
(1512, 'module_apartments', 0, 'a day', 'день', '2019-03-16 09:36:34'),
(1514, 'module_seasonalprices', 0, 'Access denied', 'Доступ запрещён', '2019-03-16 09:36:39'),
(1516, 'module_seasonalprices', 0, 'Price_type', 'Цена за ( месяц, час, неделя, сутки )\r\n', '2019-03-16 09:36:44'),
(1517, 'module_seasonalprices', 0, 'Wrong format of field {attribute}', 'Неправильный формат поля {attribute}', '2019-03-16 09:36:49'),
(1518, 'module_iecsv', 0, 'prices_from_season_module.', 'Цены из модуля \"Сезонные цены\" не импортируются и не экспортируются.', '2019-03-16 09:36:55'),
(1519, 'module_stats', 0, 'View statistics', 'Просмотр статистики', '2019-03-16 09:36:59'),
(1520, 'common', 0, 'Statistics', 'Статистика', '2019-03-16 09:37:00'),
(1521, 'module_stats', 0, 'Date', 'Дата', '2019-03-16 09:37:01'),
(1522, 'module_stats', 0, 'Added listings', 'Добавлено объявлений', '2019-03-16 09:37:09'),
(1523, 'module_stats', 0, 'Registered users', 'Зарегистрировано пользователей', '2019-03-16 09:37:13'),
(1524, 'module_stats', 0, 'Added comments', 'Добавлено комментариев', '2019-03-16 09:37:20'),
(1525, 'module_stats', 0, 'Done payments', 'Выполнено платежей', '2019-03-16 09:37:25'),
(1526, 'module_stats', 0, 'Statistics', 'Статистика', '2019-03-16 09:37:32'),
(1527, 'module_stats', 0, 'Statistics of last {n} days', 'Статистика за последние {n} дней', '2019-03-16 09:37:37'),
(1528, 'module_stats', 0, 'Generated_data', 'В демонстрационном режиме данные сгенерированы случайным образом', '2019-03-16 09:37:38'),
(1529, 'module_stats', 0, 'Added reviews', 'Добавлено отзывов', '2019-03-16 09:37:44'),
(1530, 'module_formeditor', 0, 'Visible to all', 'Видно всем', '2019-03-16 09:37:50'),
(1531, 'module_formeditor', 0, 'Visible for registered', 'Видно зарегистрированным', '2019-03-16 09:37:58'),
(1532, 'module_formeditor', 0, 'Visible for owner or admin', 'Видно владельцу и администратору', '2019-03-16 09:38:03'),
(1533, 'module_formeditor', 0, 'Visible for admin', 'Видно администратору', '2019-03-16 09:38:06'),
(1534, 'module_formdesigner', 0, 'Visibility', 'Видимость', '2019-03-16 09:38:12'),
(1535, 'module_apartments', 0, 'Location', 'Местоположение', '2019-03-16 09:38:18'),
(1536, 'module_apartments', 0, 'Is located', 'Находится в', '2019-03-16 09:38:25'),
(1537, 'module_apartments', 0, 'offers', 'предложения', '2019-03-16 09:38:27'),
(1538, 'module_seasonalprices', 0, 'week', 'нед.', '2019-03-16 09:38:29'),
(1539, 'module_seasonalprices', 0, 'month', 'мес.', '2019-03-16 09:38:30'),
(1540, 'module_seasonalprices', 0, 'hour', 'ч.', '2019-03-16 09:38:36'),
(1541, 'module_seasonalprices', 0, 'day', 'д.', '2019-03-16 09:38:37'),
(1542, 'module_service', 0, 'Clear assets', 'Очистить папку \"assets\"', '2019-03-16 09:38:39'),
(1543, 'module_service', 0, 'Clear runtime', 'Очистить папку \"runtime\"', '2019-03-16 09:38:40'),
(1544, 'module_service', 0, 'Are you sure you want to empty the cache?', 'Вы действительно хотите очистить выбранный кэш', '2019-03-16 09:38:45'),
(1545, 'module_service', 0, 'Cache files in the folder {folder} have been successfully removed', 'Файлы кэша в папке {folder} были успешно удалены', '2019-03-16 09:38:53'),
(1546, 'module_configuration', 0, 'defaultApartmentType', 'Тип объявления по умолчанию', '2019-03-16 09:38:56'),
(1547, 'module_advertising', 0, 'Reviews', 'Отзывы', '2019-03-16 09:39:01'),
(1548, 'module_advertising', 0, 'Reviews -> add', 'Отзывы -> добавление', '2019-03-16 09:39:05'),
(1549, 'module_advertising', 0, 'Guestad -> add', 'Добавить объявление ( модуль \'guestad\' )', '2019-03-16 09:39:08'),
(1550, 'module_advertising', 0, 'Infopages -> view', 'Информационные страницы -> просмотр', '2019-03-16 09:39:15'),
(1551, 'module_advertising', 0, 'All pages', 'Все страницы', '2019-03-16 09:39:21'),
(1552, 'module_advertising', 0, 'Apart from the pages that open in a modal window (e.g. in fancybox and others)', 'За исключением страниц, открывающихся в модальном окне ( например: в fancybox и другое )', '2019-03-16 09:39:27'),
(1553, 'module_entries', 0, 'Manage entries', 'Менеджер материалов', '2019-03-16 09:39:34'),
(1554, 'module_entries', 0, 'Add entry', 'Добавить материал', '2019-03-16 09:39:36'),
(1555, 'module_entries', 0, 'Entry title', 'Заголовок материала', '2019-03-16 09:39:43'),
(1556, 'module_entries', 0, 'Entry body', 'Текст материала', '2019-03-16 09:39:49'),
(1557, 'module_entries', 0, 'Creation date', 'Дата создания', '2019-03-16 09:39:56'),
(1558, 'module_entries', 0, 'Announce', 'Анонс', '2019-03-16 09:40:00'),
(1559, 'module_entries', 0, 'Image for entry', 'Изображение для материала', '2019-03-16 09:40:04'),
(1560, 'module_entries', 0, 'Entries', 'Материалы', '2019-03-16 09:40:06'),
(1561, 'module_entries', 0, 'Categories of entries', 'Категории материалов', '2019-03-16 09:40:13'),
(1562, 'module_entries', 0, 'Category', 'Категория', '2019-03-16 09:40:15'),
(1563, 'module_entries', 0, 'Edit entry', 'Редактировать материал', '2019-03-16 09:40:23'),
(1564, 'module_entries', 0, 'Delete entry', 'Удалить материал', '2019-03-16 09:40:30'),
(1565, 'module_entries', 0, 'Add category', 'Добавить категорию', '2019-03-16 09:40:33'),
(1566, 'module_entries', 0, 'Edit category', 'Редактировать категорию', '2019-03-16 09:40:37'),
(1567, 'module_entries', 0, 'News', 'Новости', '2019-03-16 09:40:39'),
(1568, 'module_entries', 0, 'Read more &raquo;', 'Читать дальше &raquo;', '2019-03-16 09:40:46'),
(1569, 'module_entries', 0, 'Entries list is empty.', 'Список материалов пуст.', '2019-03-16 09:40:51'),
(1570, 'module_entries', 0, 'All materials for this category will be deleted. Are you sure?', 'Все материалы данной категории будут удалены. Вы уверены?', '2019-03-16 09:40:52'),
(1571, 'module_entries', 0, 'Articles filter', 'Фильтр материалов', '2019-03-16 09:40:56'),
(1572, 'module_entries', 0, 'Id', 'Id', '2019-03-16 09:41:02'),
(1573, 'module_entries', 0, 'Frequency', 'Частота', '2019-03-16 09:41:09'),
(1574, 'module_entries', 0, 'Tags can only contain word characters.', 'Тэги могут состоять только из букв.', '2019-03-16 09:41:15'),
(1575, 'module_entries', 0, 'Tags', 'Тэги', '2019-03-16 09:41:19'),
(1576, 'module_entries', 0, 'Please separate different tags with commas.', 'Пожалуйста, разделяйте тэги запятой.', '2019-03-16 09:41:25'),
(1577, 'module_entries', 0, 'by tag', 'по тэгу', '2019-03-16 09:41:30'),
(1578, 'module_entries', 0, 'Created on', 'Дата создания', '2019-03-16 09:41:35'),
(1579, 'module_advertising', 0, 'Entries', 'Материалы', '2019-03-16 09:41:38'),
(1580, 'module_advertising', 0, 'Entries -> view', 'Материалы -> просмотр', '2019-03-16 09:41:41'),
(1581, 'common', 0, '1 menu', '1 меню', '2019-03-16 09:41:42'),
(1582, 'common', 0, '2 menu', '2 меню', '2019-03-16 09:41:49'),
(1583, 'common', 0, 'not defined', 'не определено', '2019-03-16 09:41:56'),
(1584, 'common', 0, '{0} Selected', 'Выбрано {0}', '2019-03-16 09:41:57'),
(1585, 'module_metroStations', 0, 'Manage subway stations', 'Управление станциями метро', '2019-03-16 09:42:03'),
(1586, 'module_metroStations', 0, 'Add station', 'Добавить станцию', '2019-03-16 09:42:06'),
(1587, 'common', 0, 'Reference \"Subway stations\"', 'Справочник \"Станции метро\"', '2019-03-16 09:42:11'),
(1588, 'common', 0, 'Subway stations', 'Станции метро', '2019-03-16 09:42:15'),
(1589, 'module_metroStations', 0, 'Add multiple stations', 'Добавить несколько станций', '2019-03-16 09:42:22'),
(1590, 'module_metroStations', 0, 'Edit station', 'Редактировать станцию', '2019-03-16 09:42:23'),
(1591, 'common', 0, 'module_name_metroStations', 'Модуль \"Станции метро\"', '2019-03-16 09:42:29'),
(1592, 'common', 0, 'module_description_metroStations', 'Модуль позволяет указывать принадлежность объекта к станциям метро. Соответствующим образом изменится и форма поиска, что позволит проще и быстрее искать объявления.', '2019-03-16 09:42:31'),
(1593, 'module_metroStations', 0, 'Add multiple stations help', 'Введите список станций метро, по одному в каждой строке. Если установлен русский язык, для других языков названия будут преобразованы в транслит. Не забудьте отредактировать переводы после добавления.', '2019-03-16 09:42:32'),
(1594, 'common', 0, '{attribute} cannot be blank.', 'Необходимо заполнить поле {attribute}.', '2019-03-16 09:42:39'),
(1595, 'module_metroStations', 0, 'Select metro stations', 'Выберите станции метро', '2019-03-16 09:42:47'),
(1596, 'module_metroStations', 0, 'Not selected', 'Не выбрано', '2019-03-16 09:42:54'),
(1597, 'module_booking', 0, 'It is necessary to pay', 'Вы должны заплатить за бронирование.', '2019-03-16 09:43:01'),
(1598, 'module_bookingtable', 0, 'Change status', 'Изменить статус', '2019-03-16 09:43:04'),
(1599, 'module_bookingtable', 0, 'Success change status', 'Статус изменен', '2019-03-16 09:43:07'),
(1600, 'module_booking', 0, 'Advance payment', 'Предоплата', '2019-03-16 09:43:14'),
(1601, 'module_booking', 0, 'The user will receive an email with a request to pay the booking.', 'Пользователь получит электронное письмо с просьбой оплатить бронирование.', '2019-03-16 09:43:19'),
(1602, 'module_booking', 0, 'The percentage of advance payment for booking', 'Предоплата (%)', '2019-03-16 09:43:26'),
(1603, 'module_bookingtable', 0, 'Error change status', 'Ошибка при изменении статуса', '2019-03-16 09:43:32'),
(1604, 'module_usercpanel', 0, 'My bookings', 'Мои заявки', '2019-03-16 09:43:39'),
(1605, 'module_booking', 0, 'Pay for booking', 'Платеж за бронирование', '2019-03-16 09:43:43'),
(1606, 'module_payment', 0, 'Pay now', 'К оплате', '2019-03-16 09:43:44'),
(1607, 'module_booking', 0, 'Purchase booking', 'Оплата за бронирование', '2019-03-16 09:43:49'),
(1608, 'module_apartments', 0, 'Is it your listing?', 'Это Ваше объявление?', '2019-03-16 09:43:56'),
(1609, 'module_apartments', 0, 'Would you like to', 'Хотите', '2019-03-16 09:43:58'),
(1610, 'module_apartments', 0, 'quicker?', 'быстрее?', '2019-03-16 09:44:03'),
(1611, 'module_apartments', 0, 'Try to', 'Попробуйте', '2019-03-16 09:44:06'),
(1612, 'module_apartments', 0, 'apply paid services', 'применить платные услуги', '2019-03-16 09:44:13'),
(1613, 'common', 0, 'module_name_historyChanges', 'Модуль \"История изменений\"', '2019-03-16 09:44:18'),
(1614, 'common', 0, 'module_description_historyChanges', 'С помощью данного модуля Вы можете видеть изменения, сделанные пользователями или модераторами (при наличии модуля \"Модераторы\"). Записываются изменения в разделах: объявления, комментарии, жалобы, бронирование, пользователи, отзывы, клиенты, материалы.', '2019-03-16 09:44:20'),
(1615, 'module_historyChanges', 0, 'History changes', 'История изменений', '2019-03-16 09:44:23'),
(1616, 'module_historyChanges', 0, 'Description', 'Описание', '2019-03-16 09:44:28'),
(1617, 'module_historyChanges', 0, 'Action', 'Действие', '2019-03-16 09:44:35'),
(1618, 'module_historyChanges', 0, 'Model name', 'Название модели', '2019-03-16 09:44:42'),
(1619, 'module_historyChanges', 0, 'Model ID', 'ID модели', '2019-03-16 09:44:43'),
(1620, 'module_historyChanges', 0, 'Database field', 'Поле базы данных', '2019-03-16 09:44:48'),
(1621, 'module_historyChanges', 0, 'User', 'Пользователь', '2019-03-16 09:44:56'),
(1622, 'module_historyChanges', 0, 'Old value', 'Старое значение', '2019-03-16 09:45:02'),
(1623, 'module_historyChanges', 0, 'New value', 'Новое значение', '2019-03-16 09:45:06'),
(1624, 'module_historyChanges', 0, 'User added', 'добавил', '2019-03-16 09:45:10'),
(1625, 'module_historyChanges', 0, 'User modified', 'изменил', '2019-03-16 09:45:18'),
(1626, 'module_historyChanges', 0, 'User deleted', 'удалил', '2019-03-16 09:45:20'),
(1627, 'module_historyChanges', 0, 'System', 'Система', '2019-03-16 09:45:24'),
(1628, 'module_historyChanges', 0, 'video', 'видео', '2019-03-16 00:59:50'),
(1629, 'module_historyChanges', 0, 'image', 'изображение', '2019-03-16 09:45:27'),
(1630, 'module_historyChanges', 0, 'panorama', 'панорама', '2019-03-16 00:59:50'),
(1631, 'module_historyChanges', 0, 'main photo', 'главное фото', '2019-03-16 09:45:38'),
(1632, 'module_historyChanges', 0, 'references', 'справочники', '2019-03-16 09:45:42'),
(1633, 'module_historyChanges', 0, 'metro_stations', 'станции метро', '2019-03-16 09:45:43'),
(1634, 'module_currency', 0, 'Currency rate update error', 'Ошибка обновления курсов', '2019-03-16 09:45:49'),
(1635, 'module_currency', 0, 'Currency rate update complete', 'Курсы валют успешно обновлены', '2019-03-16 09:45:53'),
(1636, 'module_currency', 0, 'Yahoo Currency Service', 'Yahoo', '2019-03-16 09:45:58'),
(1637, 'module_currency', 0, 'Europe Central Bank', 'Европейский Центральный банк', '2019-03-16 09:46:04'),
(1638, 'module_currency', 0, 'Central Bank of Russia', 'Центральный банк России', '2019-03-16 09:46:09'),
(1639, 'module_currency', 0, 'Curency source', 'Источник курсов валют', '2019-03-16 09:46:14'),
(1640, 'module_currency', 0, 'Update currency now', 'Обновить курсы валют', '2019-03-16 09:46:20'),
(1641, 'module_currency', 0, 'Currency rate help', 'Укажите стоимость единицы данной валюты в единицах валюты по умолчанию', '2019-03-16 09:46:25'),
(1642, 'module_apartments', 0, 'Disabled type', 'Отключенный тип', '2019-03-16 09:46:30'),
(1643, 'common', 0, 'Event (name in code)', 'Событие (название события в коде)', '2019-03-16 09:46:35'),
(1644, 'module_apartments', 0, 'Custom city', 'Другой город', '2019-03-16 09:46:37'),
(1645, 'module_apartments', 0, 'City from list', 'Выбрать город из списка', '2019-03-16 09:46:43'),
(1646, 'module_apartments', 0, 'City waiting for admin apporove', 'Город будет отображаться в объявлении после подтверждения администратора', '2019-03-16 09:46:50'),
(1647, 'module_configuration', 0, 'allowCustomCities', 'Разрешить пользователям добавлять города', '2019-03-16 09:46:54'),
(1648, 'module_configuration', 0, 'useSchemaOrgMarkup', 'Использовать микроразметку Schema.org (JSON-LD) markup для Материалов и Объявлений', '2019-03-16 09:46:59'),
(1649, 'module_configuration', 0, 'geo', 'GEO модуль', '2019-03-16 09:47:04'),
(1650, 'module_configuration', 0, 'geo_time_cache', 'Время кэширования geo данных', '2019-03-16 09:47:09'),
(1651, 'module_configuration', 0, 'geo_in_search', 'Подставлять GEO данные в форму поиска', '2019-03-16 09:47:11'),
(1652, 'module_configuration', 0, 'geo_in_index', 'Фильтровать объявления на главной странице по geo данным', '2019-03-16 09:47:14'),
(1653, 'module_configuration', 0, 'geo_in_ad', 'Подставлять GEO данные при добавлении объявлений', '2019-03-16 09:47:20'),
(1654, 'module_configuration', 0, 'geo_in_index_flag', 'Фильтровать объявления на главной по гео данным, только если в данной стране есть объявления', '2019-03-16 09:47:28'),
(1655, 'common', 0, 'module_name_geo', 'GEO модуль ', '2019-03-16 09:47:30'),
(1656, 'common', 0, 'module_description_geo', 'GEO модуль позволяет определять страну, регион и город по IP', '2019-03-16 09:47:34'),
(1657, 'module_geo', 0, 'not to expose', 'Нет', '2019-03-16 09:47:38'),
(1658, 'module_geo', 0, 'only the country', 'Только страну', '2019-03-16 09:47:45'),
(1659, 'module_geo', 0, 'country and region', 'Страну и регион', '2019-03-16 09:47:51'),
(1660, 'module_geo', 0, 'country, region and city', 'Страну, регион и город', '2019-03-16 09:47:53'),
(1661, 'module_formdesigner', 0, 'Show for type of listing', 'Показывать для типов сделки', '2019-03-16 09:47:54'),
(1662, 'module_paidservices', 0, 'Payment immediately', 'Оплата сразу', '2019-03-16 09:48:00'),
(1663, 'module_paidservices', 0, 'Note for payment immediately', 'При выставлении опции \"Оплата сразу\" пользователю сразу будет предложено оплатить бронирование. При этом оплата поступит на счет администратора.\r\n\"Оплата сразу\" действует только для объявлений с ценой за сутки.', '2019-03-16 09:48:02'),
(1664, 'module_paidservices', 0, 'You must disable the module \"Seasonal prices\"', 'Вы должны отключить модуль \"Сезонные цены\"', '2019-03-16 09:48:07'),
(1665, 'common', 0, 'uses cookie', 'использует cookie', '2019-03-16 09:48:10'),
(1666, 'module_configuration', 0, 'useShowInfoUseCookie', 'Отображать предупреждение об использовании Cookie на сайте', '2019-03-16 09:48:16'),
(1667, 'module_themes', 0, 'Use_full_width_slider_homepage', 'Широкий слайдер на главной странице', '2019-03-16 09:48:18'),
(1668, 'module_seo', 0, 'Listing', 'Объявления', '2019-03-16 09:48:23'),
(1669, 'module_seo', 0, 'Entries', 'Статьи', '2019-03-16 09:48:27'),
(1670, 'module_seo', 0, 'Menu', 'Меню', '2019-03-16 09:48:28'),
(1671, 'module_seo', 0, 'Article', 'Вопросы и ответы', '2019-03-16 09:48:35'),
(1672, 'module_seo', 0, 'InfoPages', 'Информационные страницы', '2019-03-16 09:48:37'),
(1673, 'module_seo', 0, 'EntriesCategory', 'Категории материалов', '2019-03-16 09:48:45'),
(1674, 'module_seo', 0, 'Settings', 'Прочие настройки', '2019-03-16 09:48:51'),
(1675, 'module_seo', 0, 'siteName_label', 'Название сайта', '2019-03-16 09:48:52'),
(1676, 'module_seo', 0, 'siteKeywords_label', 'Ключевые слова сайта', '2019-03-16 09:48:57'),
(1677, 'module_seo', 0, 'siteDescription_label', 'Описание сайта', '2019-03-16 09:49:03'),
(1679, 'module_seo', 0, 'Model Name', 'Раздел', '2019-03-16 09:49:04'),
(1680, 'module_seo', 0, 'Model Id', 'ID', '2019-03-16 09:49:06'),
(1681, 'common', 0, 'Manage SEO settings', 'Настройки SEO', '2019-03-16 09:49:08'),
(1682, 'module_seo', 0, 'Generation SEO', 'Генерация url и meta данных', '2019-03-16 09:49:11'),
(1683, 'module_seo', 0, 'Generate', 'Генерация', '2019-03-16 09:49:18'),
(1684, 'module_seo', 0, 'Successful SEO Generation', 'Успешная генерация данных.', '2019-03-16 09:49:23'),
(1685, 'module_seo', 0, 'For sections', 'Для разделов', '2019-03-16 09:49:26'),
(1686, 'module_seo', 0, 'Please, indicate the section(s)', 'Пожалуйста, укажите разделы', '2019-03-16 09:49:31'),
(1687, 'module_seo', 0, 'Delete old urls and metadata', 'Удалить старые url и метаданные', '2019-03-16 09:49:36'),
(1688, 'module_referencecategories', 0, 'Save and add values', 'Создать категорию и добавить значения', '2019-03-16 09:49:38'),
(1689, 'common', 0, 'Add and continue', 'Добавить и продолжить', '2019-03-16 09:49:44'),
(1690, 'module_location', 0, 'Save and add cities', 'Сохранить регион и добавить города', '2019-03-16 09:49:51'),
(1691, 'module_apartmentCity', 0, 'The new city is successfully created.', 'Новый город успешно создан.', '2019-03-16 09:49:52'),
(1692, 'module_location', 0, 'The new region is successfully created.', 'Новый регион успешно создан.', '2019-03-16 09:49:58'),
(1693, 'module_location', 0, 'Please add cities to the region now.', 'Пожалуйста, добавьте города в регион.', '2019-03-16 09:50:06'),
(1694, 'module_formeditor', 0, 'Create new category', 'Создать новую категорию', '2019-03-16 09:50:07'),
(1695, 'module_formeditor', 0, 'Reference name', 'Имя справочника', '2019-03-16 09:50:11'),
(1696, 'module_formeditor', 0, 'Display style', 'Стиль отображения', '2019-03-16 09:50:13'),
(1697, 'module_formeditor', 0, 'Please add values to the field now.', 'Пожалуйста, добавьте значения в категорию.', '2019-03-16 09:50:20'),
(1698, 'module_referencevalues', 0, 'The new reference value is successfully created.', 'Новое значение успешно создано.', '2019-03-16 09:50:22'),
(1699, 'module_referencecategories', 0, 'The new category is successfully created.', 'Новая категория успешно создана.', '2019-03-16 09:50:26'),
(1700, 'module_referencecategories', 0, 'Please add values to the category now.', 'Пожалуйста, добавьте значения в категорию.', '2019-03-16 09:50:27'),
(1701, 'common', 0, 'Save and continue', 'Сохранить и продолжить', '2019-03-16 09:50:32'),
(1702, 'module_location', 0, 'The new city is successfully created.', 'Новый город успешно создан.', '2019-03-16 09:50:35'),
(1703, 'common', 0, 'Search form', 'Поиск', '2019-03-16 09:50:39'),
(1704, 'common', 0, 'The Agency with the same name already registered', 'Агентство с таким названием уже зарегистрировано', '2019-03-16 09:50:42'),
(1705, 'common', 0, 'Enter agency name', 'Укажите название агентства', '2019-03-16 09:50:46'),
(1706, 'module_news', 0, 'Are you sure you want to delete this item?', 'Вы действительно хотите удалить этот элемент?', '2019-03-16 09:50:49'),
(1707, 'common', 0, 'The total cost of the booking: {cost}{currency}', 'Полная стоимость бронирования: {cost}{currency}', '2019-03-16 09:50:56'),
(1708, 'common', 0, 'You must pay {percent}% : {cost}{currency}', 'Вы должны заплатить {percent}%: {cost}{currency}', '2019-03-16 09:50:59'),
(1709, 'module_bookingtable', 0, 'Amount of days * Price per day', 'Количество дней * Цена за сутки', '2019-03-16 09:51:04'),
(1710, 'module_booking', 0, 'Booking admin comment help', 'Если вы укажете другую сумму, приведите в комментарии расчет стоимости брони', '2019-03-16 09:51:05'),
(1711, 'YiiMailer', 0, 'You need an HTML capable viewer to read this message.', 'You need an HTML capable viewer to read this message.', '2019-03-16 09:51:09'),
(1712, 'YiiMailer', 0, 'SMTP Error: Could not authenticate.', 'SMTP Error: Could not authenticate.', '2019-03-16 00:59:50'),
(1713, 'YiiMailer', 0, 'SMTP Error: Could not connect to SMTP host.', 'SMTP Error: Could not connect to SMTP host.', '2019-03-16 00:59:50'),
(1714, 'YiiMailer', 0, 'SMTP Error: Data not accepted.', 'SMTP Error: Data not accepted.', '2019-03-16 00:59:50'),
(1715, 'YiiMailer', 0, 'Message body empty', 'Message body empty', '2019-03-16 00:59:50'),
(1716, 'YiiMailer', 0, 'Unknown encoding: ', 'Unknown encoding: ', '2019-03-16 00:59:50'),
(1717, 'YiiMailer', 0, 'Could not execute: ', 'Could not execute: ', '2019-03-16 00:59:50'),
(1718, 'YiiMailer', 0, 'Could not access file: ', 'Could not access file: ', '2019-03-16 00:59:50'),
(1719, 'YiiMailer', 0, 'File Error: Could not open file: ', 'File Error: Could not open file: ', '2019-03-16 00:59:50'),
(1720, 'YiiMailer', 0, 'The following From address failed: ', 'The following From address failed: ', '2019-03-16 00:59:50'),
(1721, 'YiiMailer', 0, 'Could not instantiate mail function.', 'Could not instantiate mail function.', '2019-03-16 09:51:58'),
(1722, 'YiiMailer', 0, 'Invalid address', 'Invalid address', '2019-03-16 09:52:02'),
(1723, 'YiiMailer', 0, ' mailer is not supported.', ' mailer is not supported.', '2019-03-16 00:59:50'),
(1724, 'YiiMailer', 0, 'You must provide at least one recipient email address.', 'You must provide at least one recipient email address.', '2019-03-16 00:59:50'),
(1725, 'YiiMailer', 0, 'SMTP Error: The following recipients failed: ', 'SMTP Error: The following recipients failed: ', '2019-03-16 00:59:50'),
(1726, 'YiiMailer', 0, 'Signing Error: ', 'Signing Error: ', '2019-03-16 00:59:50'),
(1727, 'YiiMailer', 0, 'SMTP Connect() failed.', 'SMTP Connect() failed.', '2019-03-16 00:59:50'),
(1728, 'YiiMailer', 0, 'SMTP server error: ', 'SMTP server error: ', '2019-03-16 00:59:50'),
(1729, 'YiiMailer', 0, 'Cannot set or reset variable: ', 'Cannot set or reset variable: ', '2019-03-16 00:59:50'),
(1730, 'common', 0, 'Сalendar for booking a property', 'Календарь бронирования', '2019-03-16 09:52:36'),
(1731, 'module_booking', 0, 'Admin comment', 'Комментарий администратора', '2019-03-16 09:52:42'),
(1732, 'module_booking', 0, 'The client wants to book', 'Клиент хочет забронировать', '2019-03-16 09:52:46'),
(1733, 'module_booking', 0, 'day|days|days', 'день|дня|дней', '2019-03-16 09:52:50'),
(1734, 'module_booking', 0, 'Discount if there are more than 1 guest(%)', 'Скидка, если гостей больше одного(%)', '2019-03-16 09:52:53'),
(1735, 'module_paidservices', 0, 'Calculate by minimum seasonal price', 'Расчет по минимальной сезонной цене', '2019-03-16 09:52:56'),
(1736, 'module_paidservices', 0, 'Calculate by maximum seasonal price', 'Расчет по максимальной сезонной цене', '2019-03-16 09:53:03'),
(1737, 'module_paidservices', 0, 'No calculation, price will be set by admin. Payment is immediately cancelled.', 'Не расчитывать, цену укажет администратор. Оплата сразу отменяется.', '2019-03-16 09:53:09'),
(1738, 'module_paidservices', 0, 'Fee calculation for non-season days', 'Расчет стоимости для дней которые не попадают в сезон', '2019-03-16 09:53:10'),
(1739, 'module_booking', 0, 'Number of guests', 'Гостей', '2019-03-16 09:53:14'),
(1740, 'module_themes', 0, 'Use_full_width_map_homepage', 'Широкая карта на главной странице', '2019-03-16 09:53:19'),
(1741, 'module_themes', 0, 'additional_map_help', 'На карте отображаются объяления из раздела \"Спецпредложения\" и объявления, с применёнными платными услугами: Пометить как спец. предложение, Поднять в поиске и Добавить в слайдер на главной', '2019-03-16 09:53:24'),
(1742, 'module_bookingtable', 0, 'Discount', 'Скидка', '2019-03-16 09:53:30'),
(1743, 'module_booking', 0, 'In total', 'Всего', '2019-03-16 09:53:35'),
(1744, 'module_bookingtable', 0, 'Taking account of number of guests the fee is', 'С учетом количества гостей стоимость бронирования равна', '2019-03-16 09:53:38'),
(1745, 'module_paidservices', 0, 'Taking account of number of guests while calculating the booking fee', 'Учитывать количество гостей при расчете бронирования', '2019-03-16 09:53:40'),
(1746, 'module_paidservices', 0, 'Once the option is on, the fee is calculating by multiplying the number of guests by the calculated booking fee', 'При включении опции стоимость расчитывается умножением количества гостей на итоговую стоимость бронирования.', '2019-03-16 09:53:42'),
(1747, 'module_paidservices', 0, 'Pay now', 'Оплатить сейчас', '2019-03-16 09:53:45'),
(1748, 'module_booking', 0, 'Details', 'Детали', '2019-03-16 09:53:50'),
(1749, 'module_booking', 0, 'Booking details', 'Детали бронирования', '2019-03-16 09:53:55'),
(1750, 'common', 0, 'Owner', 'Владелец', '2019-03-16 09:54:01'),
(1751, 'common', 0, 'Add balance', 'Пополнить счет', '2019-03-16 09:54:06'),
(1752, 'common', 0, 'Agent name', 'Имя агента', '2019-03-16 09:54:12'),
(1753, 'common', 0, 'Price from', 'Цена от', '2019-03-16 09:54:17'),
(1754, 'common', 0, 'Price to', 'Цена до', '2019-03-16 09:54:22'),
(1755, 'common', 0, 'Price', 'Цена', '2019-03-16 09:54:26'),
(1756, 'module_apartments', 0, 'priceToValidatorText', 'Некорректная цена', '2019-03-16 09:54:27'),
(1757, 'common', 0, 'Rotate', 'Перевернуть', '2019-03-16 09:54:30'),
(1758, 'module_seasonalprices', 0, 'For these days, the season has already exhibited price', 'За эти дни у сезона уже выставлена цена', '2019-03-16 09:54:31'),
(1759, 'module_seasonalprices', 0, 'Update seasonal price', 'Редактирование сезона', '2019-03-16 09:54:37'),
(1760, 'module_stats', 0, 'Booking requests', 'Бронирование недвижимости', '2019-03-16 09:54:38'),
(1761, 'module_timezones', 0, 'Time zone is not set', 'Часовой пояс не установлен (часовой пояс сервера)', '2019-03-16 09:54:42'),
(1762, 'module_configuration', 0, 'site_timezone', 'Часовой пояс сайта', '2019-03-16 09:54:48'),
(1763, 'common', 0, 'Square', 'Площадь', '2019-03-16 09:54:50'),
(1764, 'common', 0, 'Square from', 'Площадь от', '2019-03-16 09:54:57'),
(1765, 'common', 0, 'Square to', 'Площадь до', '2019-03-16 09:54:59'),
(1766, 'common', 0, 'Rooms', 'Комнат', '2019-03-16 09:55:01'),
(1767, 'common', 0, 'Floor from', 'Этаж от', '2019-03-16 09:55:07'),
(1768, 'common', 0, 'Floor to', 'Этаж до', '2019-03-16 09:55:12'),
(1769, 'module_payment', 0, 'Secret key', 'Secret key', '2019-03-16 00:59:50'),
(1770, 'module_tariffPlans', 0, 'No active tariff plans', 'Нет активных тарифных планов', '2019-03-16 09:55:15'),
(1771, 'common', 0, 'Enter the required value', 'Введите требуемое значение', '2019-03-16 09:55:18'),
(1772, 'module_configuration', 0, 'Testing settings', 'Тестирование настроек', '2019-03-16 09:55:21'),
(1773, 'module_configuration', 0, 'To email', 'Отправить на email', '2019-03-16 09:55:28'),
(1774, 'module_configuration', 0, 'Success_send', 'Письмо успешно отправлено', '2019-03-16 09:55:29'),
(1775, 'common', 0, 'Image SEO: alt tag', 'SEO изображения: тэг alt', '2019-03-16 09:55:34'),
(1776, 'module_seo', 0, 'Body text', 'Текст на странице', '2019-03-16 09:55:39'),
(1777, 'module_seo', 0, 'Entries images', 'Изображение к статье', '2019-03-16 09:55:40'),
(1778, 'module_seo', 0, 'Listing images', 'Изображение к объявлению', '2019-03-16 09:55:43'),
(1779, 'module_seo', 0, 'ALT', 'ALT', '2019-03-16 00:59:50'),
(1780, 'common', 0, 'ID', 'ID', '2019-03-16 09:55:56'),
(1781, 'module_seo', 0, 'City', 'Город', '2019-03-16 09:56:02'),
(1782, 'common', 0, 'Summary info page', 'Сводная информация на странице', '2019-03-16 09:56:03'),
(1783, 'common', 0, 'All listings', 'Все объявления', '2019-03-16 09:56:05'),
(1784, 'common', 0, 'in', 'в', '2019-03-16 09:56:09'),
(1785, 'common', 0, 'city_short', 'г.', '2019-03-16 09:56:16'),
(1786, 'common', 0, 'Property', 'Недвижимость', '2019-03-16 09:56:23'),
(1787, 'module_seo', 0, 'ApartmentObjType', 'Тип недвижимости', '2019-03-16 09:56:30'),
(1788, 'common', 0, 'Listings by categories', 'Недвижимость по категориям', '2019-03-16 09:56:37'),
(1789, 'common', 0, 'Summary_infopage_listing', 'Сводная информация на странице + список объявлений', '2019-03-16 09:56:44'),
(1790, 'common', 0, 'km', 'км', '2019-03-16 00:59:50'),
(1791, 'common', 0, 'Distance from', 'Расстояние от', '2019-03-16 09:56:56'),
(1792, 'common', 0, 'meter', 'м', '2019-03-16 09:56:59'),
(1793, 'common', 0, 'Please zoom in.', 'Мы нашли слишком много объявлений и отобразили только часть из них. Пожалуйста, приблизьте карту.', '2019-03-16 09:57:04'),
(1794, 'module_configuration', 0, 'module_apartments_gmapsZoomManyApartments', 'Уровень масштабирования для просмотра множества объектов на карте', '2019-03-16 09:57:06'),
(1795, 'module_configuration', 0, 'module_apartments_osmapsZoomManyApartments', 'Уровень масштабирования для просмотра множества объектов на карте', '2019-03-16 09:57:07'),
(1796, 'module_configuration', 0, 'module_apartments_ymapsZoomManyApartments', 'Уровень масштабирования для просмотра множества объектов на карте', '2019-03-16 09:57:13'),
(1797, 'common', 0, 'Hide filter', 'Скрыть фильтр', '2019-03-16 09:57:16'),
(1798, 'common', 0, 'Comments for my listings', 'Комментарии к моим объявлениям', '2019-03-16 09:57:18'),
(1799, 'common', 0, 'My comments', 'Мои комментарии', '2019-03-16 09:57:22'),
(1800, 'module_apartments', 0, 'views_past_week', 'Статистика - просмотров за последнюю неделю', '2019-03-16 09:57:27'),
(1801, 'common', 0, '{n} views', '{n} просмотр|{n} просмотров', '2019-03-16 09:57:34'),
(1802, 'common', 0, 'No statistics available', 'Нет данных статистики', '2019-03-16 09:57:36'),
(1803, 'common', 0, 'With photo', 'С фото', '2019-03-16 09:57:43'),
(1804, 'common', 0, 'Without photo', 'Без фото', '2019-03-16 09:57:48'),
(1805, 'common', 0, 'Photo', 'Фото', '2019-03-16 09:57:49'),
(1806, 'common', 0, 'Clear all filter', 'Сбросить фильтр', '2019-03-16 09:57:53'),
(1807, 'module_payment', 0, 'Help image', 'Поясняющая картинка', '2019-03-16 09:57:59'),
(1808, 'module_payment', 0, 'Go to your Paypal profile', 'Перейдите в свой профиль Paypal', '2019-03-16 09:58:06'),
(1809, 'module_payment', 0, 'Click My selling tools in the sidebar', 'Выберите \"Мои инструменты продаж\" в боковой панели', '2019-03-16 09:58:13'),
(1810, 'module_payment', 0, 'Scroll to the bottom and click PayPal button language encoding', 'Прокрутите вниз и нажмите PayPal кнопку языковой кодировки', '2019-03-16 09:58:19'),
(1811, 'module_payment', 0, 'Click More options and set the encoding to UTF-8', 'Нажмите кнопку \"Дополнительные возможности\" и установите кодировку UTF-8', '2019-03-16 09:58:27'),
(1812, 'module_configuration', 0, 'googleMapApiKey', 'API KEY', '2019-03-16 00:59:50'),
(1813, 'common', 0, 'Upload more photos from your account', 'Больше фотографий вы сможете загрузить из своего аккаунта', '2019-03-16 09:58:36'),
(1814, 'common', 0, 'Error loading. Try again later.', 'Ошибка загрузки. Повторите попытку позже.', '2019-03-16 09:58:42'),
(1815, 'module_images', 0, 'You are trying to download more than {num} pictures', 'Вы пытаетесь загрузить больше, чем {num} фотографий', '2019-03-16 09:58:47'),
(1816, 'module_configuration', 0, 'booking_half_day', 'Возможность бронировать половину дня', '2019-03-16 09:58:54'),
(1817, 'module_booking', 0, 'In the forenoon', 'До полудня', '2019-03-16 09:58:56'),
(1818, 'module_booking', 0, 'In the afternoon', 'После полудня', '2019-03-16 09:59:02'),
(1819, 'module_bookingcalendar', 0, 'Available Check-Out Time for this date is only in the forenoon', 'В этот день, можно выбрать время только до полудня', '2019-03-16 09:59:05'),
(1820, 'module_bookingcalendar', 0, 'Available Check-in Time for this date is only in the afternoon', 'В этот день, можно выбрать время только после полудня', '2019-03-16 09:59:07'),
(1821, 'module_bookingcalendar', 0, 'Dates you have chosen are unavailable', 'Даты, которые вы выбрали недоступны', '2019-03-16 09:59:09'),
(1822, 'module_bookingcalendar', 0, 'Date you have chosen is unavailable', 'Дата недоступна для бронирования', '2019-03-16 09:59:12'),
(1829, 'module_currency', 0, 'SAR_translate', 'SAR', '2019-03-16 00:59:50'),
(1830, 'module_currency', 0, 'BYN_translate', 'BYN', '2019-03-16 09:59:21'),
(1831, 'common', 0, 'RTL', 'RTL', '2019-03-16 00:59:50'),
(1832, 'common', 0, 'Overview', 'Обзор', '2019-03-16 09:59:33'),
(1833, 'common', 0, 'Listings awaiting confirmation', 'Объявлений на модерации', '2019-03-16 09:59:37'),
(1834, 'common', 0, 'New private messages', 'Новых личных сообщений', '2019-03-16 09:59:44'),
(1835, 'common', 0, 'Comments awaiting confirmation', 'Новых комментарии на рассмотрении', '2019-03-16 09:59:47'),
(1836, 'common', 0, 'New bookings', 'Новых заявок на бронирование', '2019-03-16 09:59:50'),
(1837, 'common', 0, 'Cities awaiting moderation', 'Городов на подтверждении', '2019-03-16 09:59:54'),
(1838, 'common', 0, 'New payments', 'Новых платежей', '2019-03-16 09:59:56'),
(1839, 'common', 0, 'Collapse', 'Свернуть', '2019-03-16 10:00:02'),
(1840, 'common', 0, 'Coordinates found', 'Координаты найдены', '2019-03-16 10:00:06'),
(1841, 'common', 0, 'Coordinates not found', 'Координаты не найдены', '2019-03-16 10:00:10'),
(1842, 'common', 0, 'Control', 'Управление', '2019-03-16 10:00:13'),
(1843, 'common', 0, 'Message deleted by user', 'Сообщение удалено пользователем', '2019-03-16 10:00:20'),
(1844, 'module_bookingcalendar', 0, 'Created by booking request', 'Добавлено запросом на бронирование', '2019-03-16 10:00:26'),
(1845, 'module_historyChanges', 0, 'Clear history older than', 'Удалять историю старше', '2019-03-16 10:00:32'),
(1846, 'common', 0, 'Actions', 'Действия', '2019-03-16 10:00:36'),
(1847, 'common', 0, 'Manage', 'Управление', '2019-03-16 10:00:38'),
(1848, 'common', 0, 'View', 'Просмотр', '2019-03-16 10:00:43'),
(1849, 'common', 0, 'Update', 'Редактировать', '2019-03-16 10:00:46'),
(1850, 'module_userads', 0, 'Change', 'Изменить', '2019-03-16 10:00:51'),
(1851, 'module_booking', 0, 'Booking status change', 'Изменение статуса бронирования', '2019-03-16 10:00:57'),
(1852, 'module_formeditor', 0, 'compare from to', 'Поле должно быть в диапазоне от ... до ...', '2019-03-16 10:01:02'),
(1853, 'module_formeditor', 0, 'type range', 'Поле-диапазон', '2019-03-16 10:01:08'),
(1854, 'common', 0, 'field_to', 'до', '2019-03-16 10:01:13'),
(1855, 'common', 0, 'field_from', 'от', '2019-03-16 10:01:19'),
(1856, 'module_formeditor', 0, 'both values are required and must be numerical', 'Оба значения являются обязательными и должны быть числами', '2019-03-16 10:01:22'),
(1857, 'module_configuration', 0, 'useReCaptcha', 'Использовать reCAPTCHA V2', '2019-03-16 10:01:26'),
(1858, 'module_configuration', 0, 'reCaptchaKey', 'Ключ сайта reCAPTCHA V2', '2019-03-16 10:01:33'),
(1859, 'module_configuration', 0, 'reCaptchaSecret', 'Секретный ключ reCAPTCHA V2', '2019-03-16 10:01:38'),
(1860, 'common', 0, 'Previous', 'Назад', '2019-03-16 10:01:44'),
(1861, 'common', 0, 'Next', 'Далее', '2019-03-16 10:01:47'),
(1862, 'module_configuration', 0, 'stepByStepAd', 'Пошаговое добавление объявлений', '2019-03-16 10:01:54'),
(1863, 'module_formeditor', 0, 'Main page', 'Главная страница', '2019-03-16 10:01:58'),
(1864, 'module_formeditor', 0, 'Inner pages', 'Внутренние страницы', '2019-03-16 10:02:04'),
(1865, 'common', 0, 'From listing page', 'Со страницы объявления', '2019-03-16 10:02:09'),
(1866, 'common', 0, 'Documents', 'Файлы', '2019-03-16 10:02:16'),
(1867, 'common', 0, 'Documents_upload_help', 'Максимальное количество файлов - 5. Размер файл не должен превышать 5 МБ', '2019-03-16 10:02:23'),
(1868, 'module_apartments', 0, 'document_file', 'Файл', '2019-03-16 10:02:29'),
(1869, 'module_apartments', 0, 'You are trying to download more than {num} documents', 'Вы пытаетесь загрузить больше, чем {num} файлов', '2019-03-16 10:02:32'),
(1870, 'module_apartments', 0, 'No_documents', 'Нет файлов', '2019-03-16 10:02:35'),
(1871, 'module_apartments', 0, 'Original_document_name', 'Имя файла', '2019-03-16 10:02:37'),
(1872, 'module_apartments', 0, 'document_original_name', 'Имя файла', '2019-03-16 10:02:39'),
(1873, 'module_apartments', 0, 'document_modified_name', 'Хранимое имя файла', '2019-03-16 10:02:42'),
(1874, 'module_historyChanges', 0, 'document', 'Файл', '2019-03-16 10:02:44'),
(1876, 'common', 0, 'Manage carousel', 'Управление каруселью', '2019-03-16 10:02:48'),
(1877, 'module_slider', 0, 'Manage carousel', 'Управление каруселью', '2019-03-16 10:02:51'),
(1878, 'module_slider', 0, 'Add carousel', 'Добавить карусель', '2019-03-16 10:02:53'),
(1879, 'module_slider', 0, 'Delete carousel', 'Удалить карусель', '2019-03-16 10:02:58'),
(1880, 'module_slider', 0, 'Edit carousel', 'Редактировать карусель', '2019-03-16 10:03:00'),
(1881, 'common', 0, 'Photos for carousel', 'Фото для карусели', '2019-03-16 10:03:07'),
(1882, 'common', 0, 'Image data', 'Данные изображения', '2019-03-16 10:03:09'),
(1883, 'module_slider', 0, 'Code', 'Код для вставки в материалы', '2019-03-16 10:03:16'),
(1884, 'module_payment', 0, 'Use ATOL', 'Использовать АТОЛ', '2019-03-16 10:03:21'),
(1885, 'module_payment', 0, 'ATOL CMS Login', 'Логин', '2019-03-16 10:03:26'),
(1886, 'module_payment', 0, 'ATOL CMS Password', 'Пароль', '2019-03-16 10:03:33'),
(1887, 'module_payment', 0, 'Organization code', 'Код организации', '2019-03-16 10:03:40'),
(1888, 'module_payment', 0, 'Organization INN', 'ИНН', '2019-03-16 10:03:42'),
(1889, 'module_payment', 0, 'Organization address', 'Адрес организации', '2019-03-16 10:03:50'),
(1890, 'module_payment', 0, 'Use_ATOL_help', 'Только для Российской Федерации и платежах в рублях.<br /><br />15.07.2016 вступила в силу новая редакция 54-ФЗ  «О применении кассовой техники».<br />В ней говорится о поэтапном переходе бизнеса на применение контрольно-кассовой техники с доступом в интернет (онлайн-ККТ).<br />Теперь данные о каждой вашей продаже должны передаваться по интернету оператору фискальных данных (он же ОФД).<br />А от него они уже будут поступать в налоговую инспекцию.', '2019-03-16 10:03:53'),
(1891, 'module_customHtml', 0, 'Manage custom html', 'Свой HTML', '2019-03-16 10:03:59'),
(1892, 'module_customHtml', 0, 'Add custom html', 'Добавить свой HTML', '2019-03-16 10:04:05'),
(1893, 'module_customHtml', 0, 'Code', 'Код для вставки в материалы', '2019-03-16 10:04:08'),
(1894, 'module_customHtml', 0, 'Custom HTML', 'Свой HTML', '2019-03-16 10:04:12'),
(1895, 'module_customHtml', 0, 'Update custom html', 'Редактировать свой html', '2019-03-16 10:04:18'),
(1896, 'module_customHtml', 0, 'Delete custom html', 'Удалить свой html', '2019-03-16 10:04:25'),
(1897, 'module_customHtml', 0, 'Name', 'Название', '2019-03-16 10:04:29'),
(1898, 'module_customHtml', 0, 'Code for view tempalte', 'Код для вставки в шаблон', '2019-03-16 10:04:34'),
(1899, 'module_payment', 0, 'Tax system', 'Система налогообложения', '2019-03-16 10:04:40'),
(1900, 'module_payment', 0, 'Tax number', 'Номер налога', '2019-03-16 10:04:47'),
(1901, 'module_payment', 0, 'Common system', 'Общая система налогооблажения', '2019-03-16 10:04:51'),
(1902, 'module_payment', 0, 'Simplified system (income)', 'Упрощенная система налогооблажения (доходы)', '2019-03-16 10:04:55'),
(1903, 'module_payment', 0, 'Simplified system (income minus charges)', 'Упрощенная система налогооблажения (доходы минус расходы)', '2019-03-16 10:05:01'),
(1904, 'module_payment', 0, 'A single tax on imputed income', 'Единый налог на вмененный доход', '2019-03-16 10:05:04'),
(1905, 'module_payment', 0, 'Unified agricultural tax', 'Единый сельскохозяйственный налог', '2019-03-16 10:05:10'),
(1906, 'module_payment', 0, 'Patent system', 'Патентная система налогооблажения', '2019-03-16 10:05:15'),
(1907, 'module_payment', 0, 'Without VAT', 'Без НДС', '2019-03-16 10:05:21'),
(1908, 'module_payment', 0, 'VAT 0%', 'НДС по ставке 0%', '2019-03-16 10:05:26'),
(1909, 'module_payment', 0, 'VAT 10%', 'НДС чека по ставке 10%', '2019-03-16 10:05:33'),
(1910, 'module_payment', 0, 'VAT 18%', 'НДС чека по ставке 18%', '2019-03-16 10:05:39'),
(1911, 'module_payment', 0, 'VAT 10/110', 'НДС чека по расчетной ставке 10/110', '2019-03-16 10:05:41'),
(1912, 'module_payment', 0, 'VAT 18/118', 'НДС чека по расчетной ставке 18/118', '2019-03-16 10:05:43'),
(1913, 'common', 0, 'Save and close', 'Сохранить и закрыть', '2019-03-16 10:05:50'),
(1914, 'common', 0, 'By clicking \"{buttonName}\", you agree to our <a href=\"{licenceUrl}\" target=\"_blank\">User agreement</a>', 'Нажимая \"{buttonName}\", Вы соглашаетесь с <a href=\"{licenceUrl}\" target=\"_blank\">Пользовательским соглашением</a>', '2019-03-16 10:05:57'),
(1915, 'module_referencevalues', 0, 'Rent', 'Сниму', '2019-03-16 10:06:00'),
(1916, 'module_referencevalues', 0, 'Buy', 'Куплю', '2019-03-16 10:06:04'),
(1917, 'module_referencevalues', 0, 'Exchange', 'Обменяю', '2019-03-16 10:06:11'),
(1918, 'common', 0, 'Loan calculator', 'Кредитный калькулятор', '2019-03-16 10:06:18'),
(1919, 'module_loanCalculator', 0, 'Amount of credit', 'Сумма кредита', '2019-03-16 10:06:23'),
(1920, 'module_loanCalculator', 0, 'Amount of credit (month)', 'Срок кредита (мес.)', '2019-03-16 10:06:25'),
(1921, 'module_loanCalculator', 0, 'Interest rate', 'Процентная ставка', '2019-03-16 10:06:30'),
(1922, 'module_loanCalculator', 0, 'Getting payments', 'Начало выплат', '2019-03-16 10:06:34'),
(1923, 'module_loanCalculator', 0, 'Calculate', 'Рассчитать', '2019-03-16 10:06:41'),
(1924, 'module_loanCalculator', 0, 'Monthly payment', 'Ежемесячный платеж', '2019-03-16 10:06:48'),
(1925, 'module_loanCalculator', 0, 'Overpayment', 'Переплата', '2019-03-16 10:06:55'),
(1926, 'module_loanCalculator', 0, 'January', 'Январь', '2019-03-16 10:07:02'),
(1927, 'module_loanCalculator', 0, 'February', 'Февраль', '2019-03-16 10:07:09'),
(1928, 'module_loanCalculator', 0, 'March', 'Март', '2019-03-16 10:07:16'),
(1929, 'module_loanCalculator', 0, 'April', 'Апрель', '2019-03-16 10:07:18'),
(1930, 'module_loanCalculator', 0, 'may', 'Май', '2019-03-16 10:07:22'),
(1931, 'module_loanCalculator', 0, 'June', 'Июнь', '2019-03-16 10:07:27'),
(1932, 'module_loanCalculator', 0, 'July', 'Июль', '2019-03-16 10:07:32'),
(1933, 'module_loanCalculator', 0, 'August', 'Август', '2019-03-16 10:07:37'),
(1934, 'module_loanCalculator', 0, 'September', 'Сентябрь', '2019-03-16 10:07:42'),
(1935, 'module_loanCalculator', 0, 'October', 'Октября', '2019-03-16 10:07:46'),
(1936, 'module_loanCalculator', 0, 'November', 'Ноябрь', '2019-03-16 10:07:47'),
(1937, 'module_loanCalculator', 0, 'December', 'Декабрь', '2019-03-16 10:07:53'),
(1938, 'module_loanCalculator', 0, 'Payment date', 'Дата платежа', '2019-03-16 10:08:01'),
(1939, 'module_loanCalculator', 0, 'The balance of debt', 'Остаток задолженности', '2019-03-16 10:08:05'),
(1940, 'module_loanCalculator', 0, 'Interest payments', 'Платеж по процентам', '2019-03-16 10:08:12'),
(1941, 'module_loanCalculator', 0, 'Loan payment', 'Платеж по кредиту', '2019-03-16 10:08:14'),
(1942, 'module_loanCalculator', 0, 'Annuity payment', 'Аннуитетный платеж', '2019-03-16 10:08:22'),
(1943, 'module_loanCalculator', 0, 'Loan calculator', 'Кредитный калькулятор', '2019-03-16 10:08:27'),
(1944, 'common', 0, '{n} review|{n} reviews', '{n} отзыв|{n} отзыва|{n} отзывов', '2019-03-16 10:08:29'),
(1945, 'module_quicksearch', 0, 'Sorting by rating', 'Сортировать по рейтингу', '2019-03-16 10:08:33'),
(1946, 'common', 0, 'Summary_infopage', 'Сводная информация на странице', '2019-03-16 10:08:39'),
(1947, 'module_infopages', 0, 'Filter for summary infopage', 'Фильтр для сводной информации на странице', '2019-03-16 10:08:42'),
(1948, 'common', 0, 'Title for the apartments list', 'Заголовок для списка объявлений', '2019-03-16 10:08:43'),
(1949, 'common', 0, 'Title for the listings by categories', 'Заголовок для недвижимости по категориям', '2019-03-16 10:08:46'),
(1950, 'common', 0, 'Title for the articles list', 'Заголовок для списка материалов', '2019-03-16 10:08:53'),
(1951, 'common', 0, 'Title for the contact form', 'Заголовок для формы контактов', '2019-03-16 10:08:56'),
(1952, 'module_service', 0, 'The change of the variable  \"max_execution_time\" is forbidden by your hosting provider. The backup feature is unavailable.', 'Изменение параметра \"max_execution_time\" запрещено хостер-провайдером. Функция создания резервных копий недоступна.', '2019-03-16 10:09:01'),
(1953, 'module_service', 0, 'There are more than {listingsCount} listings in your site, the size of the folder uploads is {uploadFolderSize}', 'Ваш сайт имеет более {listingsCount} объявлений, размер папки uploads составляет {uploadFolderSize}.', '2019-03-16 10:09:04'),
(1954, 'module_service', 0, 'You\'d rather use hosting features to create a backup.', 'Вам лучше использовать средства хостинга для создания резервной копии сайта.', '2019-03-16 10:09:09'),
(1955, 'module_service', 0, 'We don\'t recommend you to use the backup feature with the help of CMS to avoid long uploading and buzzing of the site, and also because this process may take a long time.', 'Мы не рекомендуем использовать создание резервной копии встроенным в CMS механизмом во избежании \"подтормаживания\" сайта или зависания, а также в связи с возможной продолжительностью данного процесса.', '2019-03-16 10:09:17'),
(1956, 'module_service', 0, 'The backup process and the site restoring can be done much faster in the Cpanel of the hosting provider.', 'Процесс создания резервных копий и восстановления сайта из контрольной панели хостер-провайдером в разы быстрее.', '2019-03-16 10:09:20');
INSERT INTO `ore_gj_translate_message` (`id`, `category`, `status`, `message`, `translation_ru`, `date_updated`) VALUES
(1957, 'module_service', 0, 'You can also set the backup timetable, if your hosting provider has such a feature.', 'Также вы можете настроить создание копий по расписанию, если ваш хостер-провайдер это позволяет.', '2019-03-16 10:09:26'),
(1958, 'module_service', 0, 'We recommend you to use our partners\' hosting: {hostingPartnerUrl}', 'Мы рекомендуем вам воспользоваться хостингом от наших партнёров: {hostingPartnerUrl}', '2019-03-16 10:09:32'),
(1959, 'module_service', 0, 'Create backup', 'Создать резервную копию', '2019-03-16 10:09:33'),
(1960, 'module_service', 0, 'Name', 'Название', '2019-03-16 10:09:38'),
(1961, 'module_service', 0, 'Size', 'Размер', '2019-03-16 10:09:43'),
(1962, 'module_service', 0, 'Create date', 'Дата создания', '2019-03-16 10:09:46'),
(1963, 'common', 0, 'Download', 'Скачать', '2019-03-16 10:09:52'),
(1964, 'common', 0, 'Restore', 'Восстановить из резервной копии', '2019-03-16 10:09:53'),
(1965, 'module_service', 0, 'Are you sure restore backup? This process may fail and the website will become unavailable!', 'Вы уверены, что хотите восстановить сайт из резервной копии? Эта операция может закончиться ошибкой и сайт будет недоступен!', '2019-03-16 10:09:55'),
(1966, 'module_service', 0, 'Successfully Create the backup file: {backup}', 'Файл резервной копии успешно создан: {backup}', '2019-03-16 10:09:58'),
(1967, 'module_service', 0, 'The size of the folder uploads is {uploadFolderSize}', 'Размер папки uploads составляет {uploadFolderSize}.', '2019-03-16 10:10:01'),
(1968, 'module_service', 0, 'Warning: This is an experimental function. For any questions or suggestions don\'t hesitate to contact us: <a href=\'{contact_us_link}\' target=\'_blank\'>{contact_us_link}</a>', 'Внимание: Это экспериментальная функция. По вопросам или ошибкам не  стесняйтесь писать нам: <a href=\'{contact_us_link}\' target=\'_blank\'>{contact_us_link}</a> ', '2019-03-16 10:10:03'),
(1969, 'module_service', 0, 'Unable to restore backup correctly: {backup}', 'Неудалось корректно восстановить сайт из резервной копии: {backup}', '2019-03-16 10:10:09'),
(1970, 'common', 0, 'Please wait until the process is complete.', 'Пожалуйста, дождитесь завершения процесса.', '2019-03-16 10:10:11'),
(1971, 'module_service', 0, 'Successfully restored the backup file: {backup}', 'Сайт успешно восстановлен из резервной копии: {backup}', '2019-03-16 10:10:16'),
(1972, 'module_customHtml', 0, 'Body', 'Текст', '2019-03-16 10:10:18'),
(1973, 'slider', 0, 'Title', 'Заголовок', '2019-03-16 10:10:21'),
(1974, 'slider', 0, 'Text', 'Текст', '2019-03-16 10:10:28'),
(1975, 'module_configuration', 0, 'module_notifier_allow_replyToEmail', 'Разрешить отвечать на email пользователя', '2019-03-16 10:10:31'),
(1976, 'module_themes', 0, 'Use_search_without_slider_homepage', 'Форма поиска без слайдера на главной странице', '2019-03-16 10:10:33'),
(1977, 'common', 0, 'Search by open_plan', 'Свободная планировка', '2019-03-16 10:10:41'),
(1978, 'common', 0, 'Search by room_type', 'Тип комнат', '2019-03-16 10:10:48'),
(1979, 'common', 0, 'Search by balcony_type', 'Тип балкона', '2019-03-16 10:10:52'),
(1980, 'common', 0, 'Search by wc_type', 'Тип санузла', '2019-03-16 10:10:56'),
(1981, 'common', 0, 'Search by floor_coat', 'Покрытие пола', '2019-03-16 10:11:03'),
(1982, 'common', 0, 'Search by garage_type', 'Тип гаража', '2019-03-16 10:11:05'),
(1983, 'common', 0, 'Search by build_year', 'Год постройки', '2019-03-16 10:11:07'),
(1984, 'common', 0, 'Search by repair', 'Ремонт', '2019-03-16 10:11:08'),
(1985, 'common', 0, 'Search by object_state', 'Состояние объекта', '2019-03-16 10:11:11'),
(1986, 'common', 0, 'Search by building_type', 'Тип здания', '2019-03-16 10:11:14'),
(1987, 'common', 0, 'Search by plot_type', 'Тип участка', '2019-03-16 10:11:21'),
(1988, 'common', 0, 'Search by utilities', 'Коммуникации', '2019-03-16 10:11:23'),
(1989, 'module_socialauth', 1, 'Sign up with', 'Зарегистрироваться c помощью', '2019-03-16 10:11:29'),
(1990, 'module_apartments', 0, 'Show in search', 'Показывать в поиске', '2019-03-16 10:11:35'),
(1991, 'module_apartments', 0, 'Show in grid', 'Показывать в общей таблице', '2019-03-16 10:11:37'),
(1992, 'module_apartments', 0, 'Contains objects', 'Содержит объекты', '2019-03-16 10:11:42'),
(1993, 'common', 0, 'child_section_6', 'Номера', '2019-03-16 10:11:49'),
(1994, 'common', 0, 'child_add_6', 'Добавить номер', '2019-03-16 10:11:52'),
(1995, 'common', 0, 'child_success_add_6', 'Номер успешно сохранен', '2019-03-16 10:11:56'),
(1996, 'module_apartmentObjType', 0, 'Section', 'Раздел', '2019-03-16 10:12:03'),
(1997, 'module_apartmentObjType', 0, 'The caption on the add button', 'Надпись на кнопке добавления', '2019-03-16 10:12:09'),
(1998, 'module_apartmentObjType', 0, 'The message about the successful addition', 'Сообщение об успешном сохранении', '2019-03-16 10:12:15'),
(1999, 'module_yandexRealty', 0, 'Type', 'Тип', '2019-03-16 10:12:18'),
(2000, 'module_yandexRealty', 0, 'Subtype', 'Подтип', '2019-03-16 10:12:20'),
(2001, 'common', 0, 'Getting started', 'С чего начать', '2019-03-16 10:12:23'),
(2002, 'common', 0, 'Go to', 'Перейти', '2019-03-16 10:12:30'),
(2003, 'common', 0, 'Add web counter', 'Добавьте счётчик посещаемости', '2019-03-16 10:12:35'),
(2004, 'common', 0, 'Change the site logo', 'Смените логотип сайта', '2019-03-16 10:12:42'),
(2005, 'common', 0, 'Set up sending letters from the site', 'Настройте отправку писем с сайта', '2019-03-16 10:12:44'),
(2006, 'common', 0, 'Add property types', 'Добавьте типы недвижимости', '2019-03-16 10:12:47'),
(2007, 'common', 0, 'Add apartment properties', 'Добавьте свойства объектов', '2019-03-16 10:12:48'),
(2008, 'common', 0, 'Set up watermark in objects photo', 'Установите водяной знак на фотографии', '2019-03-16 10:12:56'),
(2009, 'common', 0, 'Add listings', 'Добавьте объявления', '2019-03-16 10:12:59'),
(2010, 'common', 0, 'Post news about website startup', 'Опубликуйте новость о запуске сайта', '2019-03-16 10:13:02'),
(2011, 'module_blockIp', 0, 'Error. Repeat attempt later', 'Ошибка. Повторите попытку позже', '2019-03-16 10:13:07'),
(2012, 'common', 0, 'child_section_5', 'Квартиры', '2019-03-16 10:13:13'),
(2013, 'common', 0, 'child_add_5', 'Добавить квартиру', '2019-03-16 10:13:20'),
(2014, 'common', 0, 'child_success_add_5', 'Квартира успешно сохранена', '2019-03-16 10:13:24'),
(2015, 'common', 0, 'An unusual way of Open Real Estate script usage', 'Необычный способ применения Open Real Estate', '2019-03-16 10:13:31'),
(2016, 'common', 0, 'Upload failed. To upload image please increase the amount of RAM in your hosting.', 'Загрузка не удалась. Для загрузки этого изображения увеличьте объём памяти на хостинге.', '2019-03-16 10:13:32'),
(2017, 'module_basis_theme', 0, 'Popular Destinations', 'Популярные направления', '2019-03-16 10:13:37'),
(2018, 'common', 0, 'Best listings', 'Лучшие варианты', '2019-03-16 10:13:42'),
(2019, 'common', 0, 'photo|photos|photos', 'фото|фотографии|фотографий', '2019-03-16 10:13:48'),
(2020, 'module_theme_basis', 0, 'You receive the full-fledged website to a flow of new clients', 'Вы получаете полноценный сайт для потока новых клиентов', '2019-03-16 10:13:50'),
(2021, 'module_theme_basis', 0, 'Free of charge', 'Бесплатно', '2019-03-16 10:13:53'),
(2022, 'module_theme_basis', 0, 'download the script', 'скачайте скрипт', '2019-03-16 10:13:59'),
(2023, 'module_theme_basis', 0, 'The free version', 'Бесплатная версия', '2019-03-16 10:14:03'),
(2024, 'module_theme_basis', 0, 'with an open source', 'с открытым кодом', '2019-03-16 10:14:10'),
(2025, 'module_theme_basis', 0, 'Just download', 'Просто скачайте архив', '2019-03-16 10:14:15'),
(2026, 'module_theme_basis', 0, 'Open Real Estate archive and install on a hosting', 'Open Real Estate и установите на хостинг', '2019-03-16 10:14:19'),
(2027, 'module_theme_basis', 0, 'Fill', 'Заполните', '2019-03-16 10:14:24'),
(2028, 'module_theme_basis', 0, 'the website', 'сайт', '2019-03-16 10:14:31'),
(2029, 'module_theme_basis', 0, 'The website is ready!', 'Сайт готов!', '2019-03-16 10:14:37'),
(2030, 'module_theme_basis', 0, 'You just have to fill the base of listings', 'Вам остается лишь заполнить базу объявлений', '2019-03-16 10:14:43'),
(2031, 'module_theme_basis', 0, 'Receive', 'Получайте', '2019-03-16 10:14:50'),
(2032, 'module_theme_basis', 0, 'new clients', 'новых клиентов', '2019-03-16 10:14:53'),
(2033, 'module_theme_basis', 0, 'With our help, ', 'С нашей помощью ', '2019-03-16 10:14:58'),
(2034, 'module_theme_basis', 0, 'more than 1000 real estate', 'более 1000 агентств', '2019-03-16 10:15:03'),
(2035, 'module_theme_basis', 0, 'agencies and private realtors already derive an income from the website', 'недвижимости и частных риелторов уже получают доход со своего сайта', '2019-03-16 10:15:10'),
(2036, 'module_theme_basis', 0, 'To try free of charge', 'Попробуйте бесплатно', '2019-03-16 10:15:14'),
(2037, 'module_entries', 0, 'Last news', 'Последние новости', '2019-03-16 10:15:17'),
(2038, 'common', 0, 'All news', 'Все новости', '2019-03-16 10:15:18'),
(2039, 'common', 0, 'Add news', 'Добавить новости', '2019-03-16 10:15:26'),
(2040, 'common', 0, '{n} in the comparison list', '{n} в списке сравнения', '2019-03-16 10:15:28'),
(2041, 'module_theme_basis', 0, 'About us', 'О нас', '2019-03-16 10:15:35'),
(2042, 'module_theme_basis', 0, 'index_email', 'support@monoray.net', '2019-03-16 00:59:50'),
(2043, 'module_theme_basis', 0, 'index_skype', 'monoray.studio', '2019-03-16 00:59:50'),
(2044, 'module_theme_basis', 0, 'index_phone', '+7 (8362) 38-18-28', '2019-03-16 00:59:50'),
(2045, 'module_theme_basis', 0, 'index_about_text', 'Open Real Estate - это полностью готовое решение для бизнеса недвижимости. Если Вы являетесь риэлтором или агентством, то данное решение поможет повысить Вашу прибыль.', '2019-03-16 10:15:57'),
(2046, 'module_theme_basis', 0, 'Helpful information', 'Полезная информация', '2019-03-16 10:15:58'),
(2047, 'module_theme_basis', 0, 'We are in social networks', 'Мы в соцсетях', '2019-03-16 10:16:02'),
(2048, 'module_theme_basis', 0, 'General information', 'Общая информация', '2019-03-16 10:16:05'),
(2049, 'module_quicksearch', 0, 'Sorting by default', 'Сортировка по умолчанию', '2019-03-16 10:16:06'),
(2050, 'module_themes', 0, 'Index page', 'Главная страница', '2019-03-16 10:16:12'),
(2051, 'module_themes', 0, 'Cities', 'Города', '2019-03-16 10:16:18'),
(2052, 'module_themes', 0, 'Display widget \"slider\" and \"popular directions\"', 'Показать виджет «Слайдер» и «Популярные направления»', '2019-03-16 10:16:21'),
(2053, 'module_themes', 0, 'Display widget \"Best listings\"', 'Показать виджет \"Лучшие объявления\"', '2019-03-16 10:16:22'),
(2054, 'module_themes', 0, 'Display widget \"Feature\"', 'Показать виджет «Особенность»', '2019-03-16 10:16:27'),
(2055, 'module_themes', 0, 'Display widget \"Contact\"', 'Показать виджет «Свяжитесь с нами»', '2019-03-16 10:16:33'),
(2056, 'module_themes', 0, 'Display widget \"Last news\"', 'Показать виджет «Последние новости»', '2019-03-16 10:16:39'),
(2057, 'module_themes', 0, 'Show specified cities', 'Показать указанные города', '2019-03-16 10:16:43'),
(2058, 'module_themes', 0, 'Widget \"Popular destinations\"', 'Виджет «Популярные направления»', '2019-03-16 10:16:50'),
(2059, 'module_themes', 0, 'Edit city', 'Изменить город', '2019-03-16 10:16:54'),
(2060, 'module_themes', 0, 'Delete row', 'Удалить ряд', '2019-03-16 10:16:57'),
(2061, 'module_themes', 0, 'Add city', 'Добавить город', '2019-03-16 10:17:01'),
(2062, 'common', 0, 'WYSIWYG_apply', 'Применить', '2019-03-16 10:17:06'),
(2063, 'common', 0, 'WYSIWYG_destroy', 'Удалить', '2019-03-16 10:17:13'),
(2064, 'module_menumanager', 0, 'Add menu', 'Добавить меню', '2019-03-16 10:17:14'),
(2065, 'module_menumanager', 0, 'Manage menu', 'Управление меню', '2019-03-16 10:17:18'),
(2066, 'common', 0, 'Title', 'Заголовок', '2019-03-16 10:17:22'),
(2067, 'module_currency', 0, 'HKD_translate', 'HKD', '2019-03-16 00:59:50'),
(2068, 'module_themes', 0, 'Link to group in vk', 'Ссылка на группу в Вконтакте', '2019-03-16 10:17:35'),
(2069, 'module_themes', 0, 'Link to group in facebook', 'Ссылка на группу в facebook', '2019-03-16 10:17:36'),
(2070, 'module_themes', 0, 'Link to group in twitter', 'Ссылка на группу в твиттере', '2019-03-16 10:17:42'),
(2071, 'module_themes', 0, 'Coordinates of the marker contacts, latitude', 'Координаты для маркера контактов, широта (latitude)', '2019-03-16 10:17:50'),
(2072, 'module_themes', 0, 'Coordinates of the marker contacts, longitude', 'Координаты для маркера контактов, долгота (longitude)', '2019-03-16 10:17:52'),
(2073, 'module_themes', 0, 'Zoom for contact map', 'Масштаб для карты контактов', '2019-03-16 10:17:54'),
(2074, 'module_apartmentObjType', 0, 'Type live', 'Жилая недвижимость', '2019-03-16 10:17:55'),
(2075, 'module_apartmentObjType', 0, 'Type commercial', 'Коммерческая недвижимость', '2019-03-16 10:17:57'),
(2076, 'module_apartmentObjType', 0, 'Type new', 'Новостройка', '2019-03-16 10:17:59'),
(2077, 'common', 0, 'Setup recaptcha (spam protection)', 'Настройте recaptcha (защита от спама)', '2019-03-16 10:18:01'),
(2078, 'common', 0, '<a target=\"_blank\" href=\"https://open-real-estate.info/en/system-requirements\">System requirements</a>', '<a target=\"_blank\" href=\"https://open-real-estate.info/ru/system-requirements\">Системные требования</a>', '2019-03-16 10:18:02'),
(2079, 'common', 0, '<a target=\"_blank\" href=\"https://open-real-estate.info/en/license\">License agreement</a>', '<a target=\"_blank\" href=\"https://open-real-estate.info/ru/license\">Лицензионное соглашение</a>', '2019-03-16 10:18:09'),
(2080, 'common', 0, '<a target=\"_blank\" href=\"https://open-real-estate.info/en/technical-support-rules\">Support terms</a>', '<a target=\"_blank\" href=\"https://open-real-estate.info/ru/technical-support-rules\">Условия технической поддержки</a>', '2019-03-16 10:18:14'),
(2081, 'common', 0, '<a target=\"_blank\" href=\"https://open-real-estate.info/en/download-open-real-estate\">Get a new version of Open Real Estate CMS</a>', '<a target=\"_blank\" href=\"https://open-real-estate.info/ru/download-open-real-estate\">Получить новую версию Open Real Estate CMS</a>', '2019-03-16 10:18:20'),
(2082, 'common', 0, '<a target=\"_blank\" href=\"https://monoray.net/forum/\">Our forum</a>', '<a target=\"_blank\" href=\"https://monoray.ru/forum/\">Наш форум</a>', '2019-03-16 10:18:27'),
(2083, 'common', 0, '<a target=\"_blank\" href=\"https://open-real-estate.info/en/faq\">FAQ</a>', '<a target=\"_blank\" href=\"https://open-real-estate.info/ru/faq\">FAQ</a>', '2019-03-16 10:18:34'),
(2084, 'common', 0, 'Information', 'Информация', '2019-03-16 10:18:41'),
(2085, 'module_configuration', 0, 'Price format “to”', 'Фромат цены \"до\"', '2019-03-16 10:18:43'),
(2086, 'module_configuration', 0, 'Price format “from”', 'Формат цены \"от\"', '2019-03-16 10:18:44'),
(2087, 'module_configuration', 0, 'Price format by default', 'Формат цены по умолчанию', '2019-03-16 10:18:46'),
(2088, 'module_currency', 0, 'free.currencyconverterapi.com', 'free.currencyconverterapi.com', '2019-03-16 00:59:50'),
(2089, 'module_currency', 0, 'HRK_translate', 'HRK', '2019-03-16 00:59:50'),
(2090, 'module_currency', 0, 'IDR_translate', 'IDR', '2019-03-16 00:59:50'),
(2091, 'module_currency', 0, 'ILS_translate', 'ILS', '2019-03-16 00:59:50'),
(2092, 'module_currency', 0, 'ISK_translate', 'ISK', '2019-03-16 00:59:50'),
(2093, 'module_currency', 0, 'MXN_translate', 'MXN', '2019-03-16 00:59:50'),
(2094, 'module_currency', 0, 'MYR_translate', 'MYR', '2019-03-16 00:59:50'),
(2095, 'module_currency', 0, 'NZD_translate', 'NZD', '2019-03-16 00:59:50'),
(2096, 'module_currency', 0, 'PHP_translate', 'PHP', '2019-03-16 00:59:50'),
(2097, 'module_currency', 0, 'THB_translate', 'THB', '2019-03-16 00:59:50'),
(2098, 'module_configuration', 0, 'show_loan_calculator', 'Отображать ипотечный калькулятор', '2019-03-16 10:19:14'),
(2099, 'module_users', 0, 'Use API', 'Использовать REST API', '2019-03-16 10:19:21'),
(2100, 'module_users', 0, 'API token', 'REST API TOKEN', '2019-03-16 00:59:50'),
(2101, 'common', 0, 'Regenerate', 'Сгенерировать', '2019-03-16 10:19:28'),
(2102, 'common', 0, 'module_name_api', 'Модуль \"REST API\"', '2019-03-16 10:19:31'),
(2103, 'common', 0, 'module_description_api', 'Модуль предоставляет простой способ использовать REST API на вашем сайте через HTTP запросы. Получайте список объявлений в JSON формате. Отправляйте или обновляйте информацию простой отправкой HTTP запроса.', '2019-03-16 10:19:33'),
(2105, 'common', 0, 'Undefined auth user. Please send PHP_AUTH_USER_TOKEN', 'Undefined auth user. Please send PHP_AUTH_USER_TOKEN', '2019-03-16 00:59:50'),
(2106, 'module_users', 0, 'API user', 'REST API user', '2019-03-16 00:59:50'),
(2107, 'module_users', 0, 'API password', 'REST API password', '2019-03-16 00:59:50'),
(2108, 'common', 0, 'Invalid data parameters', 'Invalid data parameters', '2019-03-16 10:19:50'),
(2109, 'module_theme_basis', 0, 'Toggle navigation', 'Toggle navigation', '2019-03-16 00:59:50'),
(2110, 'common', 0, 'child_section_1', 'Раздел квартир', '2019-03-16 10:19:59'),
(2111, 'common', 0, 'child_add_1', 'Добавить квартиру', '2019-03-16 10:20:00'),
(2112, 'common', 0, 'child_success_add_1', 'Успешно добавлена квартира', '2019-03-16 10:20:07'),
(2113, 'module_translateCsv', 0, 'Translate Csv', 'Переводы в CSV формате', '2019-03-16 10:20:14'),
(2114, 'module_translateCsv', 0, 'Export CSV', 'Экспорт CSV', '2019-03-16 10:20:19'),
(2115, 'module_translateCsv', 0, 'Export', 'Экспорт', '2019-03-16 10:20:22'),
(2116, 'module_translateCsv', 0, 'Import CSV', 'Импорт CSV', '2019-03-16 10:20:26'),
(2117, 'module_translateCsv', 0, 'Import', 'Импорт', '2019-03-16 10:20:33'),
(2121, 'module_translateCsv', 0, 'The File is invalid for use as the following: delimiter must be: {delimiter}. Enclosure must be: \".', 'Файл невозможно импортировать по причине: разделитель должен быть: {delimiter}. Вложение должно быть: \".', '2019-03-16 10:20:41'),
(2122, 'module_translateCsv', 0, 'fields imported', 'записей было импортировано', '2019-03-16 10:20:42'),
(2123, 'module_payment', 0, 'VAT 20%', 'НДС чека по ставке 20%', '2019-03-16 10:20:45'),
(2124, 'module_payment', 0, 'VAT 20/120', 'НДС чека по расчетной ставке 20/120', '2019-03-16 10:20:46'),
(2125, 'module_translateCsv', 0, 'Example CSV file', 'Пример CSV файла', '2019-03-16 10:20:47'),
(2126, 'module_tariffPlans', 0, 'Paid tariff plans', 'Платные тарифные планы', '2019-03-16 10:20:55'),
(2127, 'module_tariffPlans', 0, 'No tariff plan', 'Без тарифного плана', '2019-03-16 10:20:59'),
(2128, 'module_configuration', 0, 'module_apartments_ymapApiKey', 'API-ключ', '2019-04-01 10:25:11'),
(2129, 'common', 0, 'Get API Key', 'Получить API Key', '2019-04-02 03:36:50'),
(2133, 'module_themes', 0, 'Display widget \"Popular directions\"', 'Показать виджет \"Популярные направления\"', '2019-07-29 08:06:25'),
(2134, 'module_themes', 0, 'Upload listings', 'Загрузка объявлений', '2019-07-29 08:02:52'),
(2135, 'module_themes', 0, 'Edit item', 'Редактировать пункт', '2019-07-29 07:51:02'),
(2136, 'module_themes', 0, 'Not load', 'Не загружать', '2019-07-29 08:01:53'),
(2137, 'module_themes', 0, 'Load by criteria', 'Загрузка по критериям', '2019-07-29 08:00:37'),
(2138, 'module_themes', 0, 'Load all', 'Загружать все', '2019-07-29 08:00:24'),
(2139, 'common', 0, 'The item is deleted', 'Элемент удален', '2019-07-29 07:57:19'),
(2141, 'module_themes', 0, 'Objects for the widget', 'Объекты для виджета', '2019-07-29 07:57:43'),
(2142, 'common', 0, 'module_name_articles', 'Модуль \"Вопросы - ответы\"', '2019-11-30 04:11:53'),
(2143, 'common', 0, 'module_description_articles', '-', '2019-11-30 04:12:13'),
(2144, 'common', 0, 'module_name_reviews', 'Модуль \"Отзывы\"', '2019-11-30 04:12:48'),
(2145, 'common', 0, 'module_description_reviews', '-', '2019-11-30 04:12:57'),
(2146, 'module_favorite', 0, 'Favorites', 'Избранное', '2020-02-16 13:06:30'),
(2147, 'module_favorite', 0, 'Remove from favorites', 'Удалить из избранного', '2020-02-16 13:06:13'),
(2148, 'module_favorite', 0, 'Add as favorite', 'Добавить в избранное', '2020-02-16 13:05:46'),
(2149, 'common', 0, 'thumbQuality', 'Качество миниатюр (1 - 100)', '2020-01-28 10:15:27'),
(2150, 'common', 0, 'module_name_favorite', 'Модуль \"Избранное\"', '2020-02-28 12:58:08'),
(2151, 'common', 0, 'module_description_favorite', '-', '2020-02-28 12:58:10'),
(2152, 'module_configuration', 0, 'useTitleWithID', 'Вывод ID объявления перед названием', '2020-03-28 07:33:58'),
(2153, 'module_configuration', 0, 'parentIdAll', '\"Находится в\" выбор всех подходящих объектов', '2020-03-28 08:34:07'),
(2154, 'module_configuration', 0, 'descriptionUseEditor', 'Визуальный редактор для поля \"Описание\"', '2020-03-29 09:00:31'),
(2155, 'module_configuration', 0, 'shuffleSlider', 'Перемешивать порядок фото в слайдере', '2020-03-29 09:15:40'),
(2156, 'module_tariffPlans', 0, 'For user type', 'Тип пользователя', '2020-05-04 00:35:34'),
(2157, 'module_configuration', 0, 'module_notifier_adminApartmentNeedModerate', 'Посылать администратору письмо при  изменении объявления?', '2020-05-28 14:55:54'),
(2158, 'module_themes', 0, 'Widget \"Best listings\"', 'Виджет \"Лучшие объявления\"', '2020-05-30 05:38:01'),
(2159, 'module_apartments', 0, 'Limit object', 'Количество объявлений', '2020-05-30 05:36:48'),
(2160, 'module_themes', 0, 'Widgets', 'Виджеты', '2020-05-30 05:35:36'),
(2161, 'module_configuration', 0, 'module_notifier_adminNewApartment', 'Посылать администратору письмо при создании нового объявления?', '2020-06-09 06:14:40'),
(2162, 'module_configuration', 0, 'module_notifier_adminApartmentNeedModerate', 'Посылать администратору письмо о необходимости модерации объявления (если включена опция \"Модерация объявлений от пользователей\")?', '2020-06-09 09:41:38'),
(2163, 'module_messages', 0, 'Read by user', 'Прочитано', '2020-06-29 11:35:23'),
(2164, 'module_messages', 0, 'Unread', 'Не прочитано', '2020-06-29 11:35:09'),
(2165, 'module_configuration', 0, 'convertYoutubeLink', 'Конвертировать Youtube ссылки', '2020-07-14 03:53:59'),
(2166, 'module_currency', 0, 'nbg.ge', 'nbg.ge', '2020-07-14 03:52:13'),
(2167, 'module_currency', 0, 'API Key', 'Ключ API', '2020-07-14 03:53:08'),
(2168, 'common', 0, 'Saved as draft', 'Сохранено как черновик', '2020-10-11 05:17:53'),
(2169, 'common', 0, 'Drafts', 'Черновики', '2020-10-11 05:48:55'),
(2170, 'module_apartments', 0, 'Drafts', 'Черновики', '2020-10-11 06:17:46'),
(2171, 'common', 0, 'Autosave is done', 'Автосохранение выполнено', '2020-10-11 07:57:41'),
(2172, 'module_apartments', 0, 'Drafts are automatically deleted once a day', 'Черновики автоматически удаляются раз в сутки', '2020-10-11 08:03:50'),
(2173, 'common', 0, 'My drafts', 'Мои черновики', '2020-10-11 08:30:07'),
(2174, 'module_apartments', 0, 'Manage drafts', 'Управление черновикаим', '2020-10-11 08:30:07'),
(2175, 'common', 0, 'Manage SEO search', 'Настройка SEO для поиска', '2020-10-28 15:09:56'),
(2176, 'module_seo', 0, 'By URL', 'По Url', '2020-10-28 15:10:14'),
(2177, 'module_seo', 0, 'By search', 'По поиску', '2020-10-28 15:10:53'),
(2178, 'module_seo', 0, 'meta Title', 'meta Title', '2020-10-28 15:11:09'),
(2179, 'module_seo', 0, 'meta Description', 'meta Description', '2020-10-28 15:12:27'),
(2180, 'module_seo', 0, 'meta Keywords', 'meta Keywords', '2020-10-28 15:12:41'),
(2181, 'module_seo', 0, 'meta robots noindex', 'meta robots noindex', '2020-10-28 15:12:54'),
(2182, 'module_seo', 0, 'H1', 'H1', '2020-10-28 15:13:05'),
(2183, 'common', 0, 'Yandex feed setting', 'Настройка Яндекс XML', '2020-10-28 15:16:01'),
(2184, 'common', 0, 'Geographical coverage', 'Расположение', '2020-10-28 15:17:22'),
(2185, 'module_yandexRealty', 0, 'Yandex feed add', 'Добавить Яндекс XML', '2020-10-28 15:18:54'),
(2186, 'module_seo', 0, 'Type', 'Тип', '2020-10-28 15:20:37'),
(2187, 'module_seo', 0, 'Search / Url', 'Поиск / URL', '2020-10-28 15:21:24'),
(2188, 'module_seo', 0, 'Text', 'Текст', '2020-10-28 15:21:43'),
(2189, 'module_seo', 0, 'URL required', 'Введите URL', '2020-10-28 15:22:42'),
(2190, 'common', 0, 'Sitemap setup', 'Настройка карты сайта', '2020-12-28 10:12:06'),
(2191, 'module_sitemap', 0, 'Specify the url you want to hide.', 'Укажите URL-адреса, которые хотите скрыть.', '2020-12-28 10:12:06'),
(2192, 'module_badwords', 0, 'Add word to the blacklist', 'Добавить слово в чёрный список', '2020-12-28 10:12:06'),
(2193, 'module_badwords', 0, 'Manage blacklist', 'Управление чёрным списком слов', '2020-12-28 10:12:06'),
(2194, 'EditableSaver.editable', 0, 'Empty', 'Пусто', '2020-12-28 10:12:06'),
(2195, 'common', 0, 'Badwords', 'Чёрный список слов', '2020-12-28 10:12:06'),
(2196, 'module_badwords', 0, 'Delete a word', 'Удалить слово', '2020-12-28 10:12:06'),
(2197, 'module_badwords', 0, 'Edit a word', 'Редактировать слово', '2020-12-28 10:12:06'),
(2198, 'common', 0, 'A code has been sent to your E-mail. Please enter it in the field below. The code is valid for {n} minutes.', 'На ваш E-mail был отправлен код. Пожалуйста, введите его в поле ниже. Код действителен в течение {n} минут.', '2020-12-28 10:12:06'),
(2199, 'common', 0, 'Code', 'Код', '2020-12-28 10:12:06'),
(2200, 'common', 0, 'The confirmation code was not sent to Email. Please try again later.', 'Код для подтверждения операции не был отправлен на Email. Повторите попытку позднее.', '2020-12-28 10:12:06'),
(2201, 'common', 0, 'The code has expired. Enter your username and password again on the authorization page.', 'Срок действия кода истёк. Введите логин и пароль заново на странице авторизации.', '2020-12-28 10:12:06'),
(2202, 'common', 0, 'Incorrect code', 'Некорректный код', '2020-12-28 10:12:06'),
(2203, 'module_configuration', 0, 'useLoginAdminSendEmailCode', 'Отправлять код подтверждения на e-mail для авторизации в панель администратора', '2021-01-09 12:25:06'),
(2204, 'module_configuration', 0, 'useSeoSearchConfigByLink', 'Включить раздел \"Настройка SEO для поиска\" по URL', '2021-01-12 04:45:55'),
(2205, 'module_configuration', 0, 'useSeoSearchConfigBySearch', 'Включить раздел \"Настройка SEO для поиска\" по поиску', '2021-01-12 04:45:05'),
(2206, 'module_seo', 0, 'Example', 'Пример', '2021-01-12 06:02:34'),
(2207, 'module_seo', 0, 'URL should start with \"search\", example - search?apType=1&objType=1', 'URL должен начинаться с \"search\", пример - search?apType=1&objType=1', '2021-01-12 05:58:31'),
(2208, 'module_seo', 0, 'Matching has already been added for this search', 'Соответствие уже было добавлено для этого поиска', '2021-01-12 06:00:03'),
(2209, 'common', 0, '{label} contains forbidden words: {badwords}. You need to remove them.', 'Поле {label} содержит запрещённые слова: {badwords}. Удалите их.', '2021-01-12 06:02:34'),
(2210, 'common', 0, '{label} for {lang} contains forbidden words: {badwords}. You need to remove them.', 'Поле {label} для языка {lang} содержит запрещённые слова: {badwords}. Удалите их.', '2021-01-12 06:02:34'),
(2211, 'module_configuration', 0, 'autoSaveEnableAdmin', 'Авто сохранение объявлений в админ. панели', '2021-04-29 14:43:46'),
(2212, 'module_configuration', 0, 'autoSaveEnableUser', 'Авто сохранение объявлений для пользователя', '2021-04-29 14:44:18'),
(2213, 'module_configuration', 0, 'autoSaveInterval', 'Интервал авто сохранения объявлений в секундах', '2021-04-29 14:46:34'),
(2214, 'common', 0, 'Request a call back', 'Заказать обратный звонок', '2021-09-12 09:40:19'),
(2215, 'common', 0, 'Fill out the form below and our specialists will contact you', 'Заполните форму ниже и наши специалисты свяжутся с вами ', '2021-09-12 09:43:05'),
(2220, 'common', 0, 'Thanks! Our staff will call you back as soon as possible', 'Спасибо! Наши сотрудники перезвонят вам в ближайшее время ', '2021-09-12 09:42:51'),
(2221, 'common', 1, 'Remove marker', NULL, '2022-02-15 18:17:32'),
(2222, 'common', 1, 'Clear', NULL, '2022-02-15 18:17:32'),
(2223, 'module_apartments', 1, 'Name', NULL, '2022-02-15 18:23:53'),
(2224, 'module_configuration', 1, 'siteTitle', NULL, '2022-02-15 19:12:51'),
(2225, 'module_configuration', 1, 'siteKeywords', NULL, '2022-02-15 19:12:51'),
(2226, 'module_configuration', 1, 'siteDescription', NULL, '2022-02-15 19:12:51'),
(2227, 'module_guestad', 1, 'Name', NULL, '2022-04-13 07:12:39'),
(2228, 'module_apartments', 1, 'type_view_5', NULL, '2022-04-16 05:57:47');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_users`
--

CREATE TABLE `ore_gj_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `role` enum('admin','moderator','registered') NOT NULL DEFAULT 'registered',
  `type` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `temprecoverpassword` varchar(50) NOT NULL DEFAULT '',
  `salt` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ava` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `agency_name` varchar(100) NOT NULL DEFAULT '',
  `agent_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `additional_info_ru` text,
  `activatekey` varchar(50) NOT NULL DEFAULT '',
  `recoverPasswordKey` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `is_use_api` tinyint(1) NOT NULL DEFAULT '0',
  `api_token` varchar(50) NOT NULL DEFAULT '',
  `login_code` varchar(40) DEFAULT NULL,
  `login_code_expired` timestamp NULL DEFAULT NULL,
  `balance` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `agency_user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `last_ip_addr` varchar(60) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_users`
--

INSERT INTO `ore_gj_users` (`id`, `role`, `type`, `username`, `password`, `temprecoverpassword`, `salt`, `email`, `ava`, `phone`, `agency_name`, `agent_status`, `additional_info_ru`, `activatekey`, `recoverPasswordKey`, `active`, `is_use_api`, `api_token`, `login_code`, `login_code_expired`, `balance`, `agency_user_id`, `date_created`, `date_updated`, `last_login_date`, `last_ip_addr`) VALUES
(1, 'admin', 1, 'uzxan', '7ea06b84ca647b2a8b895f5f53a20d6f', '', '620bea74842f72.68008815', 'virus_93.93@mail.ru', '1565108046_1.jpg', '+7 000 111 1111', '', 0, '', '', '', 1, 1, '58282dd37e02cb5ebbcb6693bfe35793', NULL, NULL, 0, 0, '2013-11-15 19:12:12', '2022-10-27 08:41:48', '2022-10-27 08:41:48', '185.167.120.132'),
(2, 'registered', 1, 'demo', 'b7300769e471d88d5d0c8fa7e77f8c3e', '', '4ed36e64356867.12929158', 'demore@monoray.net', '1565108065_2.jpg', '+7 000 111 2222', '', 0, 'Недвижимость по низким ценам без посредников!', '', '', 1, 0, '', NULL, NULL, 2493, 0, '2013-11-15 19:12:12', '2020-03-16 05:52:23', '2016-05-07 16:46:47', ''),
(4, 'registered', 1, 'Севарахон', '754a16a2fac9fce31cdc6659e5acac4d', '', '62122b50121e22.00402428', 'sevausmanova091@gmail.com', '', '+998997892551', '', 0, NULL, '09867d1055e22ca8a4f15d65ca78f0a9', '', 1, 0, '', NULL, NULL, 0, 0, '2022-02-20 11:51:44', '2022-02-20 11:53:30', '2022-02-20 11:53:30', '213.230.116.4'),
(5, 'registered', 1, 'test', 'c50399a3906be169860f4b4f09d73585', '', '62127662198ac8.90737844', 'uzxans@mail.ru', '', '+790477444444', '', 0, NULL, 'c8ff412c9b33d0841138c04757a4c38b', '', 1, 0, '', NULL, NULL, 0, 0, '2022-02-20 17:12:02', '2022-02-20 19:19:33', '2022-02-20 19:19:33', '92.100.219.178'),
(6, 'registered', 2, 'Sunnatilla', '9afc5e3255102d9373256219d9e0c101', '', '6228b5c91753c0.36729185', 'sunnatilla2809@mail.ru', '', '+998977177228', 'Elite', 0, NULL, '7abaf3947c6a2e24dc391ab32d9b3b36', '', 1, 0, '', NULL, NULL, 0, 0, '2022-03-09 14:12:25', '2022-03-09 15:34:29', '2022-03-09 15:34:29', '213.230.118.226'),
(7, 'registered', 1, 'Александр Юн', '39fdce897e0eb09c475748618224581f', '', '6228c6bb2f7d14.20812819', 'Ko1234@mail.ru', '', '+998909071800', '', 0, NULL, '045683fa2ed8616edbbca5842df2841b', '', 1, 0, '', NULL, NULL, 0, 0, '2022-03-09 15:24:43', '2022-03-09 15:24:45', '2022-03-09 15:24:45', '82.215.107.184'),
(8, 'registered', 3, 'umid', '2fffde9a06eec7a42898dde4676fa9d3', 'S5BjzfAPlR', '6257e6dcd1cba7.65543494', 'jonlinavolar@gmail.com', '1649927384_8.jpg', '+998900222020', 'Umid Production', 0, '', '2515b1b37fbc1bb8e63afed366ba90f3', 'ad5a3ac2678312eb6d7e6ebf25e2bceb', 1, 0, '', NULL, NULL, 0, 6, '2022-04-13 07:12:37', '2022-04-14 09:20:23', '2022-04-14 09:20:23', '95.214.211.125'),
(9, 'registered', 1, 'Shaxina', '818831c70f516986b53d9be73ebe1593', '', '625804d7e0a398.47828073', 'Sultonovashaxina@gmail.com', '', '998o11160506', '', 0, NULL, 'e979e6aeb3d02774d3c834e0d07c24ca', '', 1, 0, '', NULL, NULL, 0, 0, '2022-04-14 11:26:15', '2022-04-14 11:26:15', NULL, ''),
(10, 'registered', 1, 'Shahina', '6e46ab41c74276d77d6bb1d5b69333ec', '', '625d8c36365589.75240062', 'Sultonovashahina@gmail.com', '', '998911160506', '', 0, NULL, '4b979acf72f66eb871fb22d458f1fbbd', '', 1, 0, '', NULL, NULL, 0, 0, '2022-04-18 16:05:10', '2022-04-18 16:05:10', NULL, ''),
(11, 'registered', 2, 'VerifproCiz', '1f0a3f3d3ebab9e4a259405ca6141c24', '', '62da9c70f32496.52634724', 'viduevdjpabdixb@gmail.com', '', '81796956722', 'VerifproCiz', 0, NULL, 'c25aa81e7b7a3f4fc863037c0c57a571', '', 1, 0, '', NULL, NULL, 0, 6, '2022-07-22 12:47:44', '2022-07-22 12:47:44', NULL, ''),
(12, 'registered', 2, 'ForumJarf', 'f5f09c80907431a75ac563fb3fba04b4', '', '62f0077e672e60.17554687', 'kuurij.314@gmail.com', '', '87539293196', 'ForumJarf', 0, NULL, '4405021d2ba9b54feeb4af783e6fa2c5', '', 1, 0, '', NULL, NULL, 0, 11, '2022-08-07 18:42:06', '2022-08-07 18:42:06', NULL, ''),
(13, 'registered', 1, 'JamesZow', '4013a5d091743f9ac233dfb4b1bd7012', '', '62f0223d35d228.88072021', 'jamesonstat1@mymailer.buzz', '', '86246798364', 'JamesZow', 0, NULL, 'c725fd02a7a9b4f94bd8659b28e3864d', '', 1, 0, '', NULL, NULL, 0, 11, '2022-08-07 20:36:13', '2022-08-07 20:36:13', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_users_sessions`
--

CREATE TABLE `ore_gj_users_sessions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `id` char(32) NOT NULL DEFAULT '',
  `expire` int(11) NOT NULL DEFAULT '0',
  `data` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `ore_gj_users_sessions`
--

INSERT INTO `ore_gj_users_sessions` (`user_id`, `id`, `expire`, `data`) VALUES
(0, '1352fd9ef1360280c5b4365377bd256b', 1667288406, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31333a222f677565737461642f6164642f223b616664396161316461323563303261303466303736323766393765666532363367756573745f61645f73657373696f6e69647c733a34353a22313335326664396566313336303238306335623433363533373762643235366236333630633762356538303731223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '154982be47db7afd1c78359d27a7ab2f', 1667286455, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31343a222f3f6361743d37266c733d6d6170223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a333a226d6170223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '165880e6fc35b13332638927f5cb14a3', 1667287828, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31323a222f3f666565643d747572626f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '179189ede8598f762238eda541fabeef', 1667288316, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31323a222f3f666565643d747572626f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '1c1bd2a9aa0ee0667bc10cb9e020437b', 1667287745, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '1c743158ca6c22f1dcfb79ab59f7a595', 1667286292, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32373a222f3f706167655f69643d353133266c733d6d617026706167653d32223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a333a226d6170223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '2af78b5d500aaa862a419708bff7638b', 1667287326, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a313a222f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '442aeb75052ecf9295b0e166dcd77fbf', 1667287974, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b616664396161316461323563303261303466303736323766393765666532363373656172636855726c7c733a35333a222f7365617263683f646f2d7465726d2d7365617263683d30266f626a547970653d3026726f6f6d733d302677703d31267465726d3d223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '5a43fa3a405da739de51bfba37c991d7', 1667287831, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31323a222f3f666565643d747572626f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '6c8a1aee36a4ed59888f3e5198541f63', 1667288831, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32333a222f3f703d343530266c733d626c6f636b26706167653d32223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '8330ba5b09e8558edbeb9433be279d29', 1667289069, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a313a222f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '845275a409da4ac4387c3613b1d11f6c', 1667286874, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a313a222f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '8761b56c1cfc89885aeb2cc09ed0a412', 1667288407, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31333a222f677565737461642f6164642f223b616664396161316461323563303261303466303736323766393765666532363367756573745f61645f73657373696f6e69647c733a34353a22383736316235366331636663383938383561656232636330396564306134313236333630633762366562646164223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '8a4d38c62b4d25264a70e27ea61480c6', 1667286659, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a34313a222f3f61745f62697a5f6469723d6c6976652d6669742d67796d26706167653d32266c733d626c6f636b223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, '92dfc7e5aa5f76ea91bfcd74559bbf75', 1667287885, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a383a222f3f6c733d6d6170223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a333a226d6170223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'a3f482f56a0466b57d5dfd8fb68f8e18', 1667288463, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31343a222f3f703d343338266c733d6d6170223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a333a226d6170223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'a5cb44f97ef24d47d5698826336b33c6', 1667287386, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32313a222f3f7461673d6172656e6461266c733d626c6f636b223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'cda2e592c7ef0db6caa22b800f15e72d', 1667289117, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32353a222f3f6361743d3726736f72743d7072696365266c733d6d6170223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a333a226d6170223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'dac5d86d947d96128607a52c12254a0f', 1667289200, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32333a222f3f703d34303226706167653d32266c733d7461626c65223b61666439616131646132356330326130346630373632376639376566653236336d6f64655f6c6973745f73686f777c733a353a227461626c65223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'dbaa1ceef7c3c77f3746e12c3e5b2f19', 1667288105, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a32333a222f3f703d323537266c733d626c6f636b26706167653d32223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'e4e57524d52988d79381c9ee9f2dc283', 1667288544, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b616664396161316461323563303261303466303736323766393765666532363373656172636855726c7c733a35373a222f7365617263683f646f2d7465726d2d7365617263683d30266f626a547970653d3026726f6f6d733d302677703d31267465726d3d32303232223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'e54aa652d32b87d68833e5f2fa84989c', 1667287026, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b616664396161316461323563303261303466303736323766393765666532363373656172636855726c7c733a31393a222f7365617263683f7365727669636549643d36223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'eb18abf555fd4063798a4c744b9436aa', 1667287281, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a313a222f223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
(0, 'fcf3248ac3bb308ef4311963ac03d67c', 1667288405, 0x61666439616131646132356330326130346630373632376639376566653236336d656e755f6163746976657c733a303a22223b61666439616131646132356330326130346630373632376639376566653236335f5f72657475726e55726c7c733a31333a222f677565737461642f6164642f223b616664396161316461323563303261303466303736323766393765666532363367756573745f61645f73657373696f6e69647c733a34353a22666366333234386163336262333038656634333131393633616330336436376336333630633762353034636536223b61666439616131646132356330326130346630373632376639376566653236335969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d);

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_users_social`
--

CREATE TABLE `ore_gj_users_social` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `service` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ore_gj_yandex_list`
--

CREATE TABLE `ore_gj_yandex_list` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `itemsSelected` longtext NOT NULL,
  `count_ap` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ore_gj_apartment`
--
ALTER TABLE `ore_gj_apartment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`),
  ADD KEY `obj_type_id` (`obj_type_id`),
  ADD KEY `loc_country` (`loc_country`),
  ADD KEY `loc_region` (`loc_region`),
  ADD KEY `loc_city` (`loc_city`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `sorter` (`sorter`),
  ADD KEY `fullActive` (`active`,`owner_active`),
  ADD KEY `priceType_fullActive` (`price_type`,`active`,`owner_active`),
  ADD KEY `type_fullActive` (`type`,`active`,`owner_active`),
  ADD KEY `type_priceType_fullActive` (`type`,`price_type`,`active`,`owner_active`),
  ADD KEY `country_type_priceType_fullActive` (`loc_country`,`type`,`price_type`,`active`,`owner_active`),
  ADD KEY `halfActive` (`active`),
  ADD KEY `priceType_halfActive` (`price_type`,`active`),
  ADD KEY `type_halfActive` (`type`,`active`),
  ADD KEY `type_priceType_halfActive` (`type`,`price_type`,`active`),
  ADD KEY `country_type_priceType_halfActive` (`loc_country`,`type`,`price_type`,`active`),
  ADD KEY `specialActiveDeleted` (`is_special_offer`,`active`,`deleted`),
  ADD KEY `halfActiveLocCity` (`loc_city`,`active`),
  ADD KEY `halfActiveCity` (`city_id`,`active`),
  ADD KEY `fullActiveLocCity` (`loc_city`,`active`,`owner_active`),
  ADD KEY `fullActiveCity` (`city_id`,`active`,`owner_active`),
  ADD KEY `halfActiveObjTypeLocCity` (`obj_type_id`,`loc_city`,`active`),
  ADD KEY `halfActiveObjTypeCity` (`obj_type_id`,`city_id`,`active`),
  ADD KEY `fullActiveObjTypeLocCity` (`obj_type_id`,`loc_city`,`active`,`owner_active`),
  ADD KEY `fullActiveObjTypeCity` (`obj_type_id`,`city_id`,`active`,`owner_active`),
  ADD KEY `sorterActive` (`sorter`,`active`);

--
-- Индексы таблицы `ore_gj_apartment_city`
--
ALTER TABLE `ore_gj_apartment_city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_complain`
--
ALTER TABLE `ore_gj_apartment_complain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apartment_id` (`apartment_id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_apartment_complain_reason`
--
ALTER TABLE `ore_gj_apartment_complain_reason`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_document`
--
ALTER TABLE `ore_gj_apartment_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apartment_id` (`apartment_id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_apartment_obj_type`
--
ALTER TABLE `ore_gj_apartment_obj_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_panorama`
--
ALTER TABLE `ore_gj_apartment_panorama`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_reference`
--
ALTER TABLE `ore_gj_apartment_reference`
  ADD KEY `apartment_id` (`apartment_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_value_id` (`reference_value_id`);

--
-- Индексы таблицы `ore_gj_apartment_reference_categories`
--
ALTER TABLE `ore_gj_apartment_reference_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_apartment_reference_values`
--
ALTER TABLE `ore_gj_apartment_reference_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_category_id` (`reference_category_id`),
  ADD KEY `for_rent` (`for_rent`),
  ADD KEY `for_sale` (`for_sale`),
  ADD KEY `buy` (`buy`),
  ADD KEY `rent` (`rent`),
  ADD KEY `exchange` (`exchange`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_apartment_statistics`
--
ALTER TABLE `ore_gj_apartment_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apartment_id` (`apartment_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `apId_date` (`apartment_id`,`date_created`);

--
-- Индексы таблицы `ore_gj_apartment_times_in`
--
ALTER TABLE `ore_gj_apartment_times_in`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_times_out`
--
ALTER TABLE `ore_gj_apartment_times_out`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_apartment_video`
--
ALTER TABLE `ore_gj_apartment_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`apartment_id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_apartment_window_to`
--
ALTER TABLE `ore_gj_apartment_window_to`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_articles`
--
ALTER TABLE `ore_gj_articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_badwords`
--
ALTER TABLE `ore_gj_badwords`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_block_ip`
--
ALTER TABLE `ore_gj_block_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_long` (`ip_long`);

--
-- Индексы таблицы `ore_gj_booking_table`
--
ALTER TABLE `ore_gj_booking_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apartment_id` (`apartment_id`),
  ADD KEY `time_in` (`time_in`),
  ADD KEY `time_out` (`time_out`);

--
-- Индексы таблицы `ore_gj_carousel`
--
ALTER TABLE `ore_gj_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_carousel_images`
--
ALTER TABLE `ore_gj_carousel_images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_clients`
--
ALTER TABLE `ore_gj_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_comments`
--
ALTER TABLE `ore_gj_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_comparison_list`
--
ALTER TABLE `ore_gj_comparison_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `apartment_id` (`apartment_id`);

--
-- Индексы таблицы `ore_gj_configuration`
--
ALTER TABLE `ore_gj_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_custom_html`
--
ALTER TABLE `ore_gj_custom_html`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_entries`
--
ALTER TABLE `ore_gj_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Индексы таблицы `ore_gj_entries_all_tags`
--
ALTER TABLE `ore_gj_entries_all_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_entries_category`
--
ALTER TABLE `ore_gj_entries_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_entries_image`
--
ALTER TABLE `ore_gj_entries_image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_favorite`
--
ALTER TABLE `ore_gj_favorite`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Индексы таблицы `ore_gj_formdesigner`
--
ALTER TABLE `ore_gj_formdesigner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_id` (`reference_id`);

--
-- Индексы таблицы `ore_gj_formdesigner_obj_type`
--
ALTER TABLE `ore_gj_formdesigner_obj_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formdesigner_id` (`formdesigner_id`),
  ADD KEY `obj_type_id` (`obj_type_id`);

--
-- Индексы таблицы `ore_gj_images`
--
ALTER TABLE `ore_gj_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_object` (`id_object`),
  ADD KEY `id_owner` (`id_owner`),
  ADD KEY `date_updated` (`date_updated`),
  ADD KEY `sorter` (`sorter`);

--
-- Индексы таблицы `ore_gj_infopages`
--
ALTER TABLE `ore_gj_infopages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_lang`
--
ALTER TABLE `ore_gj_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Индексы таблицы `ore_gj_lang_widget_opt`
--
ALTER TABLE `ore_gj_lang_widget_opt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `model_name` (`model_name`);

--
-- Индексы таблицы `ore_gj_menu`
--
ALTER TABLE `ore_gj_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_list_id` (`menu_list_id`),
  ADD KEY `parentId` (`parentId`),
  ADD KEY `pageId` (`pageId`);

--
-- Индексы таблицы `ore_gj_menu_list`
--
ALTER TABLE `ore_gj_menu_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_news_product`
--
ALTER TABLE `ore_gj_news_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_notifier`
--
ALTER TABLE `ore_gj_notifier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`event`);

--
-- Индексы таблицы `ore_gj_object_image`
--
ALTER TABLE `ore_gj_object_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `model_name` (`model_name`);

--
-- Индексы таблицы `ore_gj_reviews`
--
ALTER TABLE `ore_gj_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_search_form`
--
ALTER TABLE `ore_gj_search_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obj_type_id` (`obj_type_id`),
  ADD KEY `formdesigner_id` (`formdesigner_id`);

--
-- Индексы таблицы `ore_gj_search_form_field_param`
--
ALTER TABLE `ore_gj_search_form_field_param`
  ADD UNIQUE KEY `field` (`field`);

--
-- Индексы таблицы `ore_gj_seo_friendly_url_history`
--
ALTER TABLE `ore_gj_seo_friendly_url_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `model_name` (`model_name`),
  ADD KEY `model_name_and_id` (`model_name`,`model_id`);

--
-- Индексы таблицы `ore_gj_seo_friendly_url_search`
--
ALTER TABLE `ore_gj_seo_friendly_url_search`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_service`
--
ALTER TABLE `ore_gj_service`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_sitemap_config`
--
ALTER TABLE `ore_gj_sitemap_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ore_gj_socialauth`
--
ALTER TABLE `ore_gj_socialauth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_updated` (`date_updated`);

--
-- Индексы таблицы `ore_gj_themes`
--
ALTER TABLE `ore_gj_themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_default` (`is_default`);

--
-- Индексы таблицы `ore_gj_translate_message`
--
ALTER TABLE `ore_gj_translate_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `message` (`message`);

--
-- Индексы таблицы `ore_gj_users`
--
ALTER TABLE `ore_gj_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `ore_gj_users_sessions`
--
ALTER TABLE `ore_gj_users_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-session_expire` (`expire`),
  ADD KEY `idx-session-user_id` (`user_id`),
  ADD KEY `idx-session-id` (`id`);

--
-- Индексы таблицы `ore_gj_users_social`
--
ALTER TABLE `ore_gj_users_social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `ore_gj_yandex_list`
--
ALTER TABLE `ore_gj_yandex_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment`
--
ALTER TABLE `ore_gj_apartment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_city`
--
ALTER TABLE `ore_gj_apartment_city`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_complain`
--
ALTER TABLE `ore_gj_apartment_complain`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_complain_reason`
--
ALTER TABLE `ore_gj_apartment_complain_reason`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_document`
--
ALTER TABLE `ore_gj_apartment_document`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_obj_type`
--
ALTER TABLE `ore_gj_apartment_obj_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_panorama`
--
ALTER TABLE `ore_gj_apartment_panorama`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_reference_categories`
--
ALTER TABLE `ore_gj_apartment_reference_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_reference_values`
--
ALTER TABLE `ore_gj_apartment_reference_values`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_statistics`
--
ALTER TABLE `ore_gj_apartment_statistics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1827;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_times_in`
--
ALTER TABLE `ore_gj_apartment_times_in`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_times_out`
--
ALTER TABLE `ore_gj_apartment_times_out`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_video`
--
ALTER TABLE `ore_gj_apartment_video`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_apartment_window_to`
--
ALTER TABLE `ore_gj_apartment_window_to`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ore_gj_articles`
--
ALTER TABLE `ore_gj_articles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `ore_gj_badwords`
--
ALTER TABLE `ore_gj_badwords`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ore_gj_block_ip`
--
ALTER TABLE `ore_gj_block_ip`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_booking_table`
--
ALTER TABLE `ore_gj_booking_table`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_carousel`
--
ALTER TABLE `ore_gj_carousel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_carousel_images`
--
ALTER TABLE `ore_gj_carousel_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_clients`
--
ALTER TABLE `ore_gj_clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_comments`
--
ALTER TABLE `ore_gj_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ore_gj_comparison_list`
--
ALTER TABLE `ore_gj_comparison_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `ore_gj_configuration`
--
ALTER TABLE `ore_gj_configuration`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT для таблицы `ore_gj_custom_html`
--
ALTER TABLE `ore_gj_custom_html`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ore_gj_entries`
--
ALTER TABLE `ore_gj_entries`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `ore_gj_entries_all_tags`
--
ALTER TABLE `ore_gj_entries_all_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ore_gj_entries_category`
--
ALTER TABLE `ore_gj_entries_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ore_gj_entries_image`
--
ALTER TABLE `ore_gj_entries_image`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ore_gj_formdesigner`
--
ALTER TABLE `ore_gj_formdesigner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `ore_gj_formdesigner_obj_type`
--
ALTER TABLE `ore_gj_formdesigner_obj_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT для таблицы `ore_gj_images`
--
ALTER TABLE `ore_gj_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `ore_gj_infopages`
--
ALTER TABLE `ore_gj_infopages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ore_gj_lang`
--
ALTER TABLE `ore_gj_lang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ore_gj_lang_widget_opt`
--
ALTER TABLE `ore_gj_lang_widget_opt`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_menu`
--
ALTER TABLE `ore_gj_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `ore_gj_menu_list`
--
ALTER TABLE `ore_gj_menu_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ore_gj_news_product`
--
ALTER TABLE `ore_gj_news_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT для таблицы `ore_gj_notifier`
--
ALTER TABLE `ore_gj_notifier`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `ore_gj_object_image`
--
ALTER TABLE `ore_gj_object_image`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `ore_gj_reviews`
--
ALTER TABLE `ore_gj_reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_search_form`
--
ALTER TABLE `ore_gj_search_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT для таблицы `ore_gj_seo_friendly_url_history`
--
ALTER TABLE `ore_gj_seo_friendly_url_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `ore_gj_seo_friendly_url_search`
--
ALTER TABLE `ore_gj_seo_friendly_url_search`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_service`
--
ALTER TABLE `ore_gj_service`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ore_gj_sitemap_config`
--
ALTER TABLE `ore_gj_sitemap_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ore_gj_socialauth`
--
ALTER TABLE `ore_gj_socialauth`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `ore_gj_themes`
--
ALTER TABLE `ore_gj_themes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ore_gj_translate_message`
--
ALTER TABLE `ore_gj_translate_message`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2229;

--
-- AUTO_INCREMENT для таблицы `ore_gj_users`
--
ALTER TABLE `ore_gj_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `ore_gj_users_social`
--
ALTER TABLE `ore_gj_users_social`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ore_gj_yandex_list`
--
ALTER TABLE `ore_gj_yandex_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
