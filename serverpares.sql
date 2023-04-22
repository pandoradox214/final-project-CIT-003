-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2023 at 04:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serverpares`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(100) NOT NULL,
  `Admin_Username` varchar(20) NOT NULL,
  `Admin_Password` varchar(20) NOT NULL,
  `Admin_Firstname` varchar(20) NOT NULL,
  `Admin_Lastname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(100) NOT NULL,
  `Customer_FirstName` varchar(20) NOT NULL,
  `Customer_LastName` varchar(20) NOT NULL,
  `Customer_ContactNumber` bigint(11) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_Username` varchar(50) NOT NULL,
  `Customer_Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_FirstName`, `Customer_LastName`, `Customer_ContactNumber`, `Customer_Email`, `Customer_Username`, `Customer_Password`) VALUES
(1, '', '', 0, 'Admin@pares.com', 'Admin', '$2y$10$VTtJCEs0sW6.sR2QtT8vFOrv11MnFr4FuByAPt2Qwc9'),
(2, '', '', 0, '', 'andrae', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Delivery_ID` int(100) NOT NULL,
  `orders_ID` int(100) NOT NULL,
  `Delivery_Date` date NOT NULL,
  `Delivery_Time` time(6) NOT NULL,
  `Delivery_Address` varchar(20) NOT NULL,
  `Delivery_Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edits`
--

CREATE TABLE `edits` (
  `Admin_ID` int(100) NOT NULL,
  `Product_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `orders_address` varchar(300) NOT NULL,
  `orders_date` date NOT NULL DEFAULT current_timestamp(),
  `orders_time` time NOT NULL DEFAULT current_timestamp(),
  `orders_price` int(11) NOT NULL,
  `orders_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(100) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Product_Stocks` int(20) NOT NULL,
  `Product_Price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `Admin_ID` int(100) NOT NULL,
  `orders_id` int(100) NOT NULL,
  `MonthlySales` varchar(100) NOT NULL,
  `SalesTrends` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `orders_ID` int(100) NOT NULL,
  `Product_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Delivery_ID`),
  ADD KEY `Delivery_ID` (`Delivery_ID`,`orders_ID`),
  ADD KEY `orders_ID` (`orders_ID`);

--
-- Indexes for table `edits`
--
ALTER TABLE `edits`
  ADD KEY `Admin_ID` (`Admin_ID`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `orders_id` (`orders_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD KEY `Admin_ID` (`Admin_ID`,`orders_id`),
  ADD KEY `orders_id` (`orders_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD KEY `orders_ID` (`orders_ID`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Delivery_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`orders_ID`) REFERENCES `orders` (`orders_id`);

--
-- Constraints for table `edits`
--
ALTER TABLE `edits`
  ADD CONSTRAINT `edits_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`),
  ADD CONSTRAINT `edits_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`orders_ID`) REFERENCES `orders` (`orders_id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
