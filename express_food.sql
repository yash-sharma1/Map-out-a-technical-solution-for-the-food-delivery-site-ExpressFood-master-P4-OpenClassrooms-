-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 14, 2017 at 09:14 PM
-- Server version: 10.1.24-MariaDB-1~jessie
-- PHP Version: 7.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_item`
--

CREATE TABLE `category_item` (
  `menu_item_id` int(11) NOT NULL,
  `meal_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_item`
--

INSERT INTO `category_item` (`menu_item_id`, `meal_category_id`) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(5, 6),
(6, 5),
(7, 2),
(8, 3),
(8, 4),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `chef_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`chef_id`, `user_id`) VALUES
(1, 43),
(2, 44);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `user_id`, `email_address`, `phone_number`) VALUES
(12, 20, 'adam.moltke@exmaple.com', '55468957'),
(13, 21, 'christian.bluhme@example.com', '65782459'),
(14, 22, 'anders.orsted@example.com', '52684128'),
(15, 23, 'peter.bang@example.com', '34587625'),
(16, 24, 'carl.andrae@axample.com', '25789654'),
(17, 25, 'carl.hall@example.com', '12348657'),
(18, 26, 'carl.rotwitt@example.com', '65824758'),
(19, 27, 'ditlev.monrad@example.com', '68951342'),
(20, 28, 'christian.vind-frijs', '35768241'),
(21, 29, 'ludvig.holstein-holsteinborg', '75386424'),
(22, 30, 'christian.fonnesbech@example.com', '15948263'),
(23, 31, 'jacob.estrup@example.com', '95162843'),
(24, 32, 'tage.thott@example.com', '88654231'),
(25, 33, 'hugo.hørring@example.com', '44587658');

-- --------------------------------------------------------

--
-- Table structure for table `client_order`
--

CREATE TABLE `client_order` (
  `client_order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `deliverer_id` int(11) DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `delivered` datetime NOT NULL,
  `status` enum('new','delivered','in_transit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `eta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_order`
--

INSERT INTO `client_order` (`client_order_id`, `client_id`, `deliverer_id`, `delivery_address_id`, `created`, `delivered`, `status`, `eta`) VALUES
(5, 13, 4, 65, '2017-08-31 12:34:00', '2017-08-31 12:44:00', 'delivered', '2017-08-31 12:44:00'),
(6, 14, 5, 69, '2017-09-01 13:23:00', '2017-09-01 13:33:00', 'delivered', '2017-09-01 13:34:00'),
(7, 15, 6, 67, '2017-09-01 14:56:00', '2017-09-01 15:10:00', 'delivered', '2017-09-01 15:11:00'),
(8, 16, 7, 74, '2017-09-01 15:34:00', '2017-09-01 15:45:00', 'delivered', '2017-09-01 15:45:00'),
(9, 17, 8, 68, '2017-09-01 16:43:00', '2017-09-01 16:50:00', 'delivered', '2017-09-01 16:50:00'),
(10, 18, 9, 71, '2017-09-01 17:54:00', '2017-09-01 18:05:00', 'delivered', '2017-09-01 18:08:00'),
(11, 19, 10, 66, '2017-09-01 18:34:00', '2017-09-01 18:44:00', 'delivered', '2017-09-01 18:45:00'),
(13, 21, 12, 72, '2017-09-02 20:12:00', '2017-09-02 20:23:00', 'delivered', '2017-09-02 20:24:00'),
(14, 22, 12, 77, '2017-09-02 12:05:00', '2017-09-02 12:16:00', 'delivered', '2017-09-02 12:16:00'),
(15, 23, 12, 76, '2017-09-02 13:34:00', '2017-09-02 13:45:00', 'delivered', '2017-09-02 13:45:00'),
(16, 24, 10, 70, '2017-09-02 14:34:00', '2017-09-02 14:56:00', 'delivered', '2017-09-02 14:54:00'),
(17, 25, 4, 73, '2017-09-02 15:23:00', '2017-09-02 15:47:00', 'delivered', '2017-09-02 15:43:00'),
(19, 13, 6, 73, '2017-09-02 17:55:00', '2017-09-02 18:05:00', 'delivered', '2017-09-02 18:05:00'),
(20, 14, 6, 75, '2017-09-02 18:43:00', '2017-09-02 18:54:00', 'delivered', '2017-09-02 18:54:00'),
(21, 15, 7, 67, '2017-09-03 19:42:00', '2017-09-03 19:54:00', 'delivered', '2017-09-03 19:55:00'),
(22, 16, 8, 74, '2017-09-03 20:26:00', '2017-09-03 20:34:00', 'delivered', '2017-09-03 20:34:00'),
(23, 17, 9, 72, '2017-09-03 12:28:00', '2017-09-03 12:34:00', 'delivered', '2017-09-03 12:45:00'),
(24, 18, 10, 66, '2017-09-03 13:27:00', '2017-09-03 13:34:00', 'delivered', '2017-09-03 13:35:00'),
(25, 18, 7, 67, '2017-09-03 14:36:00', '2017-09-03 14:45:00', 'delivered', '2017-09-03 14:45:00'),
(26, 18, 7, 71, '2017-09-03 15:52:00', '2017-09-03 15:59:00', 'delivered', '2017-09-03 15:58:00'),
(27, 19, 7, 77, '2017-09-03 16:31:00', '2017-09-03 16:42:00', 'delivered', '2017-09-03 16:43:00'),
(28, 20, 7, 68, '2017-09-03 17:15:00', '2017-09-03 17:30:00', 'delivered', '2017-09-03 17:29:00'),
(29, 21, 5, 64, '2017-09-03 18:17:00', '2017-09-03 18:34:00', 'delivered', '2017-09-03 18:33:00'),
(30, 22, 5, 72, '2017-09-03 19:53:00', '2017-09-03 19:59:00', 'delivered', '2017-09-03 19:58:00'),
(31, 23, 5, 67, '2017-09-03 20:43:00', '2017-09-03 20:57:00', 'delivered', '2017-09-03 20:57:00'),
(32, 12, 4, 76, '2017-08-31 13:00:00', '2017-08-31 13:13:00', 'delivered', '2017-08-31 13:16:00'),
(33, 13, 4, 74, '2017-08-31 14:34:00', '2017-08-31 14:44:00', 'delivered', '2017-08-31 14:44:00'),
(34, 14, 5, 71, '2017-09-01 14:23:00', '2017-09-01 14:33:00', 'delivered', '2017-09-01 14:34:00'),
(35, 15, 6, 68, '2017-09-01 15:56:00', '2017-09-01 16:10:00', 'delivered', '2017-09-01 16:11:00'),
(36, 16, 7, 65, '2017-09-01 16:34:00', '2017-09-01 16:45:00', 'delivered', '2017-09-01 16:45:00'),
(37, 17, 8, 72, '2017-09-01 17:43:00', '2017-09-01 17:50:00', 'delivered', '2017-09-01 17:50:00'),
(38, 18, 9, 74, '2017-09-01 18:54:00', '2017-09-01 19:05:00', 'delivered', '2017-09-01 19:08:00'),
(39, 19, 10, 66, '2017-09-01 19:34:00', '2017-09-01 19:44:00', 'delivered', '2017-09-01 19:45:00'),
(40, 20, 11, 74, '2017-09-02 20:23:00', '2017-09-02 20:33:00', 'delivered', '2017-09-02 20:33:00'),
(41, 21, 12, 75, '2017-09-02 21:12:00', '2017-09-02 21:23:00', 'delivered', '2017-09-02 21:24:00'),
(42, 22, 12, 69, '2017-09-02 13:05:00', '2017-09-02 13:16:00', 'delivered', '2017-09-02 13:16:00'),
(43, 23, 12, 68, '2017-09-02 14:34:00', '2017-09-02 14:45:00', 'delivered', '2017-09-02 14:45:00'),
(44, 24, 10, 71, '2017-09-02 15:34:00', '2017-09-02 15:56:00', 'delivered', '2017-09-02 15:54:00'),
(45, 25, 4, 67, '2017-09-02 16:23:00', '2017-09-02 16:47:00', 'delivered', '2017-09-02 16:43:00'),
(46, 12, 5, 75, '2017-09-02 17:55:00', '2017-09-02 18:10:00', 'delivered', '2017-09-02 18:11:00'),
(47, 13, 6, 69, '2017-09-02 18:55:00', '2017-09-02 19:05:00', 'delivered', '2017-09-02 19:05:00'),
(48, 14, 6, 68, '2017-09-02 19:43:00', '2017-09-02 19:54:00', 'delivered', '2017-09-02 19:54:00'),
(49, 15, 7, 71, '2017-09-03 20:42:00', '2017-09-03 20:54:00', 'delivered', '2017-09-03 20:55:00'),
(50, 16, 8, 77, '2017-09-03 21:26:00', '2017-09-03 21:34:00', 'delivered', '2017-09-03 21:34:00'),
(51, 17, 9, 73, '2017-09-03 13:28:00', '2017-09-03 13:34:00', 'delivered', '2017-09-03 13:45:00'),
(52, 18, 10, 72, '2017-09-03 14:27:00', '2017-09-03 14:34:00', 'delivered', '2017-09-03 14:35:00'),
(53, 18, 7, 71, '2017-09-03 15:36:00', '2017-09-03 15:45:00', 'delivered', '2017-09-03 15:45:00'),
(54, 18, 7, 67, '2017-09-03 16:52:00', '2017-09-03 16:59:00', 'delivered', '2017-09-03 16:58:00'),
(55, 19, 7, 75, '2017-09-03 17:31:00', '2017-09-03 17:42:00', 'delivered', '2017-09-03 17:43:00'),
(56, 20, 7, 76, '2017-09-03 18:15:00', '2017-09-03 18:30:00', 'delivered', '2017-09-03 18:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `deliverer`
--

CREATE TABLE `deliverer` (
  `deliverer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverer`
--

INSERT INTO `deliverer` (`deliverer_id`, `user_id`) VALUES
(4, 34),
(5, 35),
(6, 36),
(7, 37),
(8, 38),
(9, 39),
(10, 40),
(11, 41),
(12, 42);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_address`
--

CREATE TABLE `delivery_address` (
  `delivery_address_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `street` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_address`
--

INSERT INTO `delivery_address` (`delivery_address_id`, `client_id`, `street`, `number`, `zip_code`) VALUES
(64, 12, 'Andersinevej', '12', '3453'),
(65, 13, 'Andersvej', '12', '3453'),
(66, 14, 'Kimsvej', '12', '3453'),
(67, 15, 'Dennisvej', '12', '3453'),
(68, 16, 'Idavej', '12', '3453'),
(69, 17, 'Davidvej', '12', '3453'),
(70, 18, 'Sunesvej', '12', '3453'),
(71, 19, 'Jakobvej', '12', '3453'),
(72, 20, 'Rimvej', '12', '3453'),
(73, 21, 'Tingvej', '12', '3453'),
(74, 22, 'Granatvej', '12', '3453'),
(75, 23, 'Pladsvej', '12', '3453'),
(76, 24, 'Rungvej', '12', '3453'),
(77, 25, 'Ringvej', '12', '3453');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `menu_item_id` int(11) NOT NULL,
  `refrigerator_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`menu_item_id`, `refrigerator_id`, `amount`) VALUES
(2, 1, 350),
(5, 2, 450),
(14, 3, 250),
(16, 3, 250);

-- --------------------------------------------------------

--
-- Table structure for table `meal_category`
--

CREATE TABLE `meal_category` (
  `meal_category_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_category`
--

INSERT INTO `meal_category` (`meal_category_id`, `name`, `description`) VALUES
(1, 'Indian', 'Food inspired by the great recipes of India.'),
(2, 'Italian', 'Food inspired by the great recipes of Italy.'),
(3, 'Mexican', 'Food inspired by the great recipes of Mexico.'),
(4, 'Beef', 'Food which contains beef.'),
(5, 'Vegetarian', 'Food which does not contain any meat.'),
(6, 'International', 'Food that seems inspired by many nations.');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE `menu_item` (
  `menu_item_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` enum('main','dessert') COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_menu` tinyint(4) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`menu_item_id`, `name`, `description`, `course`, `on_menu`, `price`) VALUES
(2, 'Butter Chicken', 'Lovely chicken in curry butter sauce', 'main', 1, 15.00),
(3, 'Meat Balls', 'Great tasting meat balls with sauce', 'main', 0, 14.00),
(4, 'Chicken Enchiladas', 'Tortillas with awesome chicken filling', 'main', 0, 15.54),
(5, 'Steak sandwich', 'Sandwich, white bread with steak filling', 'main', 1, 10.11),
(6, 'Vegan Warrior', 'Vegan dish with all the best from natures crops', 'main', 0, 15.76),
(7, 'Egg sandwich', 'Sandwich, white bread with egg filling', 'main', 0, 11.10),
(8, 'Chili', 'The greates chili dish in the world', 'main', 0, 13.59),
(9, 'Mashed potatoes and bacon', 'A classic for keeping the hunger at bay for hours', 'main', 0, 10.76),
(10, 'Cheese Burger', 'Bun, Beef, Cheese... That\'s all folks!', 'main', 0, 12.00),
(11, 'Ham Pie', 'Pie like your mom used to make it.', 'main', 0, 16.54),
(12, 'Tiramisu', 'The best dessert ever', 'dessert', 0, 8.54),
(13, 'Pancakes with ice cream', 'Hot pancakes with italian ice cream', 'dessert', 0, 7.54),
(14, 'Mixed fruits', 'Mixed fruits cut into squares', 'dessert', 1, 5.00),
(15, 'Cinnamon bun', 'A bun with cinnamon. Old school!', 'dessert', 0, 6.00),
(16, 'Almond Delight', 'A creamy almond dessert', 'dessert', 1, 8.21);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `client_order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`client_order_id`, `menu_item_id`, `amount`) VALUES
(5, 14, 2),
(6, 12, 3),
(7, 4, 2),
(8, 2, 2),
(8, 14, 2),
(9, 2, 2),
(10, 3, 2),
(11, 4, 2),
(13, 6, 2),
(14, 7, 2),
(15, 8, 2),
(16, 9, 2),
(17, 10, 3),
(17, 11, 3),
(19, 2, 2),
(20, 3, 2),
(21, 4, 3),
(22, 5, 2),
(23, 6, 2),
(24, 7, 3),
(25, 8, 2),
(26, 9, 1),
(27, 10, 2),
(28, 11, 3),
(29, 12, 1),
(30, 2, 5),
(31, 3, 2),
(32, 4, 1),
(33, 5, 2),
(34, 6, 2),
(35, 7, 2),
(36, 8, 2),
(37, 9, 2),
(38, 10, 5),
(39, 11, 2),
(40, 12, 2),
(41, 2, 2),
(42, 3, 30),
(42, 13, 30),
(43, 4, 3),
(44, 5, 3),
(45, 6, 3),
(46, 7, 3),
(47, 8, 2),
(48, 9, 1),
(49, 10, 1),
(50, 11, 1),
(51, 2, 2),
(52, 3, 2),
(53, 4, 2),
(54, 5, 2),
(55, 4, 2),
(56, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `refrigerator`
--

CREATE TABLE `refrigerator` (
  `refrigerator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refrigerator`
--

INSERT INTO `refrigerator` (`refrigerator_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`) VALUES
(20, 'Adam', 'Moltke'),
(21, 'Christian', 'Blume'),
(22, 'Anders', 'Ørsted'),
(23, 'Peter', 'Bang'),
(24, 'Carl', 'Andræ'),
(25, 'Carl', 'Hall'),
(26, 'Carl', 'Rotwitt'),
(27, 'Ditlev', 'Monrad'),
(28, 'Christian', 'Vind-Frijs'),
(29, 'Ludvig', 'Holstein-Holsteinborg'),
(30, 'Christian', 'Fonnesbech'),
(31, 'Jacob', 'Estrup'),
(32, 'Tage', 'Thott'),
(33, 'Hugo', 'Hørring'),
(34, 'Hannibal', 'Sehested'),
(35, 'Johan', 'Deuntzer'),
(36, 'Jens', 'Christensen'),
(37, 'Niels', 'Neergaard'),
(38, 'Ludvig', 'Holstein-Ledreborg'),
(39, 'Carl', 'Zhale'),
(40, 'Klaus', 'Berntsen'),
(41, 'Otto', 'Liebe'),
(42, 'Michael', 'Friss'),
(43, 'Thorvald', 'Stauning'),
(44, 'Thomas', 'Madsen-Mygdal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`menu_item_id`,`meal_category_id`),
  ADD KEY `meal_category_id` (`meal_category_id`);

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`chef_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `client_order`
--
ALTER TABLE `client_order`
  ADD PRIMARY KEY (`client_order_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `deliverer_id` (`deliverer_id`),
  ADD KEY `delivery_address_id` (`delivery_address_id`);

--
-- Indexes for table `deliverer`
--
ALTER TABLE `deliverer`
  ADD PRIMARY KEY (`deliverer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`delivery_address_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`menu_item_id`,`refrigerator_id`),
  ADD KEY `refrigerator_id` (`refrigerator_id`);

--
-- Indexes for table `meal_category`
--
ALTER TABLE `meal_category`
  ADD PRIMARY KEY (`meal_category_id`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`menu_item_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`client_order_id`,`menu_item_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `refrigerator`
--
ALTER TABLE `refrigerator`
  ADD PRIMARY KEY (`refrigerator_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chef`
--
ALTER TABLE `chef`
  MODIFY `chef_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `client_order`
--
ALTER TABLE `client_order`
  MODIFY `client_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `deliverer`
--
ALTER TABLE `deliverer`
  MODIFY `deliverer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `delivery_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `meal_category`
--
ALTER TABLE `meal_category`
  MODIFY `meal_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `menu_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `refrigerator`
--
ALTER TABLE `refrigerator`
  MODIFY `refrigerator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_item`
--
ALTER TABLE `category_item`
  ADD CONSTRAINT `category_item_ibfk_1` FOREIGN KEY (`meal_category_id`) REFERENCES `meal_category` (`meal_category_id`),
  ADD CONSTRAINT `category_item_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`menu_item_id`);

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_order`
--
ALTER TABLE `client_order`
  ADD CONSTRAINT `client_order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_order_ibfk_2` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`deliverer_id`),
  ADD CONSTRAINT `client_order_ibfk_3` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_address` (`delivery_address_id`);

--
-- Constraints for table `deliverer`
--
ALTER TABLE `deliverer`
  ADD CONSTRAINT `deliverer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`menu_item_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`refrigerator_id`) REFERENCES `refrigerator` (`refrigerator_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`client_order_id`) REFERENCES `client_order` (`client_order_id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`menu_item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
