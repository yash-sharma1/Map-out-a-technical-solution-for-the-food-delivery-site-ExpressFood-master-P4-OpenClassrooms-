-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2020 at 08:19 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

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
-- Table structure for table `clients_orders`
--

CREATE TABLE `clients_orders` (
  `client_order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `delievery_address_id` int(11) NOT NULL,
  `deliverer_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Preparing food','Delieverd','On the way') NOT NULL,
  `ETA` datetime NOT NULL,
  `delieverd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients_orders`
--

INSERT INTO `clients_orders` (`client_order_id`, `client_id`, `delievery_address_id`, `deliverer_id`, `bill_amount`, `created`, `status`, `ETA`, `delieverd`) VALUES
(1, 12, 64, 5, 50, '2020-01-09 19:29:53', 'Delieverd', '2020-01-09 20:19:16', '2020-01-09 20:17:16'),
(2, 13, 65, 7, 45, '2020-01-09 19:29:53', 'On the way', '2020-01-09 20:32:27', '2020-01-09 20:30:25'),
(3, 14, 66, 4, 60, '2020-01-14 21:21:24', 'Preparing food', '2020-01-14 20:07:00', '0000-00-00 00:00:00'),
(4, 17, 67, 11, 95, '2020-01-14 21:25:25', 'On the way', '2020-01-14 21:54:00', '0000-00-00 00:00:00'),
(5, 25, 77, 6, 80, '2020-01-14 21:25:25', 'Preparing food', '2020-01-14 22:11:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `daily_menu`
--

CREATE TABLE `daily_menu` (
  `Day` date NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `meal_id` int(11) DEFAULT NULL,
  `dessert_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_menu`
--

INSERT INTO `daily_menu` (`Day`, `menu_item_id`, `meal_id`, `dessert_id`) VALUES
('2020-01-14', 1, 5, NULL),
('2020-01-14', 2, 4, NULL),
('2020-01-14', 3, NULL, 1),
('2020-01-14', 4, NULL, 2);

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
-- Table structure for table `delivery_people`
--

CREATE TABLE `delivery_people` (
  `deliverer_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliverer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_people`
--

INSERT INTO `delivery_people` (`deliverer_name`, `deliverer_id`) VALUES
('Zeing', 4),
('Rahul', 5),
('Sahil', 6),
('Jackie ', 7),
('Henry', 8),
('Harry', 9),
('Sammy', 10),
('Charlie', 11),
('Ben ', 12);

-- --------------------------------------------------------

--
-- Table structure for table `desserts`
--

CREATE TABLE `desserts` (
  `dessert_id` int(11) NOT NULL,
  `dessert_name` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desserts`
--

INSERT INTO `desserts` (`dessert_id`, `dessert_name`, `description`, `quantity`, `price`) VALUES
(5, 'Almond Delight', 'A creamy healthy and tasty dessert', 1, 15.45),
(3, 'Ham Pie', 'Pie with a taste of Mom\'s Hands', 1, 7.69),
(1, 'Mixed Fruit Ice-Cream', 'Mouth watering Mixed Fruit Ice-cream ', 1, 5.99),
(4, 'Pancakes', 'Hot delicious Pancakes', 1, 10.5),
(6, 'Ras Malai', 'A tasty and cold Indian dessert', 1, 6.59),
(2, 'Rassogulla', 'An Indain but world famous dessert ', 1, 2.39);

-- --------------------------------------------------------

--
-- Table structure for table `main_meal`
--

CREATE TABLE `main_meal` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_meal`
--

INSERT INTO `main_meal` (`meal_id`, `meal_name`, `description`, `quantity`, `price`) VALUES
(3, 'Cheese Burger & Shake', 'Delicious combo of Shake and burger', 1, 11.49),
(1, 'Egg Sandwich', 'Delicious fresh breads with egg filling', 1, 13.99),
(4, 'Indian desi thali', 'Traditional Indian food with various items', 1, 20.99),
(6, 'Italian Combo', '2 diiferent dishes of Italian food', 1, 18.5),
(2, 'Mashed Potatoes & Bacon', 'Delicious food keep hunger away for few hours', 1, 14.39),
(5, 'Punjabi Chicken', 'Delicious spicy chicken in punjabi style ', 1, 19.59);

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `client_order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`client_order_id`, `client_id`, `delivery_address_id`, `bill_amount`, `created`) VALUES
(1, 12, 64, 45, '2020-01-09 19:29:53'),
(2, 13, 65, 50, '2020-01-09 19:29:53'),
(3, 14, 66, 60, '2020-01-14 21:21:24'),
(4, 17, 67, 95, '2020-01-14 21:25:25'),
(5, 25, 77, 80, '2020-01-14 21:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `client_order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`client_order_id`, `menu_item_id`, `quantity`) VALUES
(1, 2, 4),
(2, 3, 1),
(3, 4, 1),
(4, 1, 3),
(5, 3, 2);

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
(2);

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
(33, 'Hugo', 'Hørring');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `clients_orders`
--
ALTER TABLE `clients_orders`
  ADD PRIMARY KEY (`client_order_id`),
  ADD KEY `client_order_id` (`client_id`,`deliverer_id`,`bill_amount`,`created`),
  ADD KEY `delieverd` (`delieverd`),
  ADD KEY `delievery_address_id` (`delievery_address_id`),
  ADD KEY `clients_orders_ibfk_2` (`deliverer_id`);

--
-- Indexes for table `daily_menu`
--
ALTER TABLE `daily_menu`
  ADD PRIMARY KEY (`menu_item_id`);

--
-- Indexes for table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`delivery_address_id`);

--
-- Indexes for table `delivery_people`
--
ALTER TABLE `delivery_people`
  ADD PRIMARY KEY (`deliverer_id`);

--
-- Indexes for table `desserts`
--
ALTER TABLE `desserts`
  ADD PRIMARY KEY (`dessert_id`),
  ADD KEY `dessert_name` (`dessert_name`,`description`,`quantity`,`price`);

--
-- Indexes for table `main_meal`
--
ALTER TABLE `main_meal`
  ADD PRIMARY KEY (`meal_id`),
  ADD KEY `meal_name` (`meal_name`,`description`,`quantity`,`price`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`client_order_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `delivery_address_id` (`delivery_address_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`client_order_id`),
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
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `clients_orders`
--
ALTER TABLE `clients_orders`
  MODIFY `client_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `daily_menu`
--
ALTER TABLE `daily_menu`
  MODIFY `menu_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `delivery_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `delivery_people`
--
ALTER TABLE `delivery_people`
  MODIFY `deliverer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `desserts`
--
ALTER TABLE `desserts`
  MODIFY `dessert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `main_meal`
--
ALTER TABLE `main_meal`
  MODIFY `meal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `client_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `clients_orders`
--
ALTER TABLE `clients_orders`
  ADD CONSTRAINT `clients_orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `clients_orders_ibfk_2` FOREIGN KEY (`deliverer_id`) REFERENCES `delivery_people` (`deliverer_id`);

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`client_order_id`) REFERENCES `clients_orders` (`client_order_id`),
  ADD CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients_orders` (`client_id`),
  ADD CONSTRAINT `order_history_ibfk_3` FOREIGN KEY (`delivery_address_id`) REFERENCES `clients_orders` (`delievery_address_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`client_order_id`) REFERENCES `clients_orders` (`client_order_id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `daily_menu` (`menu_item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
