-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 08:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordertest`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `deleted`) VALUES
(1, 'Item 1', 350, 0),
(2, 'Item 2', 213, 0),
(3, 'shomai', 9999, 0),
(4, 'suman', 25, 0),
(5, 'sabaw', 50, 0),
(6, 'longaniza', 12, 0),
(7, 'sopas', 1, 0),
(8, 'hotdog ni ylman', 15000, 0),
(9, 'sausage ni Andrae', 25000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `linechart`
--

CREATE TABLE `linechart` (
  `chart_id` int(100) NOT NULL,
  `MonthYear` date NOT NULL,
  `Quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `linechart`
--

INSERT INTO `linechart` (`chart_id`, `MonthYear`, `Quantity`) VALUES
(1, '2023-04-01', 0),
(2, '2023-05-14', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`) VALUES
(1, 4, 'Sample Address', 'Sample', '2022-09-26 10:15:51', 'Wallet', 1126, 'Cancelled by Customer', 1),
(2, 4, 'Sample', 'Sample only', '2022-09-26 10:24:50', 'Wallet', 776, 'Delivered', 0),
(3, 6, 'dodong Street. jolly town, pekoland', 'I&#039;m rich boi!! eat my money', '2023-04-08 22:39:18', 'Wallet', 5630, 'Delivered', 0),
(4, 9, 'sa bahay', '', '2023-05-14 18:51:47', 'Wallet', 426, 'Cancelled by Customer', 1),
(5, 9, 'sa bahay', '', '2023-05-14 19:03:42', 'Wallet', 213, 'Cancelled by Customer', 1),
(6, 9, 'zambo', '', '2023-05-14 21:33:58', 'Wallet', 213, 'Cancelled by Customer', 1),
(7, 9, 'estrada tetuan', 'sa bahay', '2023-05-14 21:58:39', 'Wallet', 350, 'Yet to be delivered', 0),
(8, 9, 'tetuan', '', '2023-05-15 00:31:55', 'Cash On Delivery', 350, 'Delivered', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 700),
(2, 1, 2, 2, 426),
(3, 2, 1, 1, 350),
(4, 2, 2, 2, 426),
(5, 3, 1, 10, 3500),
(6, 3, 2, 10, 2130),
(7, 4, 2, 2, 426),
(8, 4, 3, 0, 0),
(9, 5, 2, 1, 213),
(10, 5, 3, 0, 0),
(11, 6, 2, 1, 213),
(12, 6, 3, 0, 0),
(13, 6, 4, 0, 0),
(14, 7, 1, 1, 350),
(15, 7, 2, 0, 0),
(16, 7, 3, 0, 0),
(17, 7, 4, 0, 0),
(18, 8, 1, 1, 350),
(19, 8, 2, 0, 0),
(20, 8, 3, 0, 0),
(21, 8, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `poster_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(1, 4, 'Sample ticket', 'This is my sample ticket description for demo purposes only.', 'Closed', 'Support', '2022-09-26 10:25:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `user_id`, `description`, `date`) VALUES
(1, 1, 4, 'This is my sample ticket description for demo purposes only.', '2022-09-26 10:25:31'),
(2, 1, 1, 'Sample Only', '2022-09-26 10:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Admin', 'admin', '$2y$10$vSCV6JHGpGn7Iwyb/DCZYuMA.6h.3qeL6ku35vjvfgK21cLNiETbO', 'admin@foms.com', '1123, Here St., There City, Anywhere, 2306', 9321546987, 1, 0),
(4, 'Customer', 'Mark Cooper', 'mcooper', '$2y$10$yPP1O4sO2yjrdxdyS5XfuOH04rnNpDMsrVs.eNtlJ5iF2CiOdfjjm', 'mcooper123@mail.com', 'Sample Address', 9123564978, 1, 0),
(5, 'Customer', 'Samantha Lou', 'slou23', '$2y$10$1lgR2XKGBrlVaF5I.ReUgeJsGsKA/1TgS0dfpSn9ttLpM7jKa4D76', NULL, NULL, 93214564987, 0, 0),
(6, 'Customer', 'Vampy', 'Admin1', '$2y$10$XObgf5fKnNEaG7Qo6Mm4ZONrehkaXhYQ.IddIyi5TIMJix52IFv4W', NULL, NULL, 9051092815, 0, 0),
(7, 'Customer', 'dongbai kawaii', 'dongbai', '$2y$10$ORnmZncpN4l3i7XSXZdX7.t.bYw8NtWTR0Y1PurmGkjVHxANRsMKK', NULL, NULL, 9999999, 0, 0),
(8, 'Customer', 'dodong', 'lasang', '$2y$10$2ibOzacbrbNJM0P6Rbw.L.3mBHx4cfQi8kSenDcPmTNJatKz0r1ne', NULL, NULL, 21524512485456, 0, 0),
(9, 'Customer', 'lakeisha', 'lolluxx', '$2y$10$pl7RscbuZgbE8sD1LMhTUeCn3nLhlfAhl3BuuOjz8rp/FQyS4Eghe', NULL, NULL, 9051092895, 1, 0),
(10, 'Customer', 'testicles', 'addon1', '$2y$10$CPbj0ZXheW86BOay5M1lfuxqhgvIjcW5.zJOX0HCbRCYOzVDf.0Lm', NULL, NULL, 1234242, 0, 0),
(11, 'Customer', '12345', '12345', '$2y$10$HOwfhXsn6DTNJBsGz35LpuIZgNffHFCCAoBZt5eDL4IAAAWO2EwdS', NULL, NULL, 12345, 0, 0),
(19, 'Customer', '12342', '12342', '$2y$10$WSd3/TvdDb/3fX3bem5B.uNE8GZIU0BXanix0kI5LlyUAw/BkDQA.', NULL, NULL, 12342, 0, 0),
(20, 'Customer', '66666', '66666', '$2y$10$hfOO6QYPf3kQxpxqiKpcOe0MCUNoCB0BSh.z5BodyqSGxAgg895Yy', NULL, NULL, 66666, 0, 0),
(21, 'Customer', 'vampie', 'vampirelol', '$2y$10$.fT7mKt9defMLY2sSbc5heXOCNFHY34CM5LtFNs90sDdg7hmSIkkO', NULL, NULL, 9051092815, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `customer_id`) VALUES
(1, 1),
(9, 4),
(10, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(15, 10),
(16, 11),
(17, 19),
(18, 20);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE `wallet_details` (
  `id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` (`id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '321456897', 123, 69),
(2, 9, '7904696931316022', 832, 1224),
(3, 10, '1111111111111111', 111, 2000),
(4, 11, '1983657438274927', 333, 994370),
(5, 12, '1343994934542143', 333, 2000),
(6, 13, '1211564561231231', 2124564564, 2000),
(7, 14, '1111111111111111', 0, 1650),
(8, 15, '1111111111111111', 0, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `linechart`
--
ALTER TABLE `linechart`
  ADD PRIMARY KEY (`chart_id`),
  ADD UNIQUE KEY `MonthYear` (`MonthYear`),
  ADD KEY `chart_id` (`chart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `linechart`
--
ALTER TABLE `linechart`
  MODIFY `chart_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
