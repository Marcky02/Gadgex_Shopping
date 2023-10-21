-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 10:55 PM
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
-- Database: `gadgex`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_id` int(11) NOT NULL COMMENT 'cart items id',
  `session_id` int(11) NOT NULL COMMENT 'session id',
  `items_id` int(11) NOT NULL COMMENT 'items id',
  `cart_quantity` int(11) NOT NULL COMMENT 'cart quantity',
  `cart_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'cart date added',
  `cart_modified_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'cart date modified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL COMMENT 'Feedback I.D',
  `users_id` int(11) NOT NULL COMMENT 'Users I.D',
  `items_id` int(11) NOT NULL COMMENT 'Items I.D',
  `feeedback_details` varchar(250) NOT NULL COMMENT 'Feedback Details',
  `feedback_ratings` int(11) NOT NULL COMMENT 'Feedback Ratings',
  `feedback_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Feedback record Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL COMMENT 'items I.D',
  `items_name` varchar(250) NOT NULL COMMENT 'Items Name',
  `items_description` varchar(250) NOT NULL COMMENT 'Items Description',
  `cat_id` int(11) NOT NULL COMMENT 'Category I.D',
  `inventory_id` int(11) NOT NULL COMMENT 'Inventory I.D',
  `items_price` decimal(10,0) NOT NULL COMMENT 'Item Price',
  `dis_id` int(11) NOT NULL COMMENT 'Discount I.D',
  `items_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A=Active,\r\nX=Sold Out',
  `items_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Items date added',
  `items_modified_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Items Modified At',
  `items_deleted_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Items Deleted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_category`
--

CREATE TABLE `items_category` (
  `cat_id` int(11) NOT NULL COMMENT 'Category I.D',
  `cat_name` varchar(250) NOT NULL COMMENT 'Category name',
  `cat_description` varchar(250) NOT NULL COMMENT 'Category Description',
  `cat_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Category date added',
  `cat_modified_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Category modified at',
  `cat_deleted_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Category deleted at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_discount`
--

CREATE TABLE `items_discount` (
  `dis_id` int(11) NOT NULL COMMENT 'Discount I.D',
  `dis_name` varchar(250) NOT NULL COMMENT 'Discount Name',
  `dis_description` varchar(250) NOT NULL COMMENT 'Discount Description',
  `dis_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'Discount status',
  `dis_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Discount date added',
  `dis_modified_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Discount modified at ',
  `dis_deleted_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Discount deleted at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_inventory`
--

CREATE TABLE `items_inventory` (
  `inventory_id` int(11) NOT NULL COMMENT 'Inventory I.D',
  `inventory_quantity` int(11) NOT NULL COMMENT 'Inventory quantity',
  `inventory_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Inventory date added',
  `inventory_modified_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Inventory modified at',
  `inventory_deleted_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Inventory deleted at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL COMMENT 'Order I.D',
  `users_id` int(11) NOT NULL COMMENT 'Users I.D',
  `order_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Order Date Added',
  `order_total_amount` decimal(10,0) NOT NULL COMMENT 'total amount of the order',
  `address_id` int(11) NOT NULL COMMENT 'address I.D',
  `payment_details_id` int(11) NOT NULL COMMENT 'Payment Details I.D'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL COMMENT 'Order Items I.D',
  `order_id` int(11) NOT NULL COMMENT 'Order I.D',
  `items_id` int(11) NOT NULL COMMENT 'Items I.D',
  `order_quantity` int(11) NOT NULL COMMENT 'Order Quantity',
  `order_price` decimal(10,0) NOT NULL COMMENT 'Order Price',
  `order_total_price` decimal(10,0) NOT NULL COMMENT 'Total order Price',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'date added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_details_id` int(11) NOT NULL COMMENT 'Payment Details I.D',
  `payment_id` int(11) NOT NULL COMMENT 'payment I.D',
  `payment_amount` decimal(10,0) NOT NULL COMMENT 'Payment amount',
  `payment_status` char(1) NOT NULL DEFAULT 'S' COMMENT 'transaction statuses: S=Succeed. F=Failed. P=Pending.',
  `payment_method` varchar(250) NOT NULL COMMENT 'Payment method Mastercard\r\nGoogle Pay\r\nPayPal\r\nApple Pay\r\nBank transfer\r\nCash\r\nDirect debit\r\nInstallment plan\r\nOnline Banking',
  `Payment_date_added` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Payment date added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL COMMENT 'Reports I.D',
  `users_id` int(11) NOT NULL COMMENT 'Users I.D',
  `items_id` int(11) NOT NULL COMMENT 'Items I.D',
  `report_type` char(3) NOT NULL DEFAULT 'A' COMMENT 'A =Inappropriate Content\r\nB =Fake Product\r\nC =Misleading Description\r\nD =Counterfeit Goods\r\nE =Copyright Infringement\r\nF =Harassment or Abuse\r\nG =Security Concerns\r\nH =Spam or Phishing\r\nI =Customer Support Request\r\nJ =Other',
  `report_details` varchar(250) NOT NULL COMMENT 'Report Details',
  `report_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Report Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_id`
--

CREATE TABLE `session_id` (
  `session_id` int(11) NOT NULL COMMENT 'session id',
  `users_id` int(11) NOT NULL COMMENT 'users Id',
  `session_total` int(11) NOT NULL COMMENT 'total items in the session',
  `session_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'session date added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL COMMENT 'User I.D',
  `username` varchar(250) NOT NULL COMMENT 'Username',
  `fullname` varchar(250) NOT NULL COMMENT 'Users Fullname',
  `email` varchar(250) NOT NULL COMMENT 'Users Email',
  `password` varchar(250) NOT NULL COMMENT 'Users Password',
  `user_date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Users date added',
  `user_type` char(1) NOT NULL DEFAULT 'U' COMMENT 'Users type:\r\nU = User,\r\nA = Admin',
  `user_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'User Status:\r\nA =  Active,\r\nI = Inactive\r\nX = Banned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

CREATE TABLE `users_address` (
  `address_id` int(11) NOT NULL COMMENT 'Address I.D',
  `users_id` int(11) NOT NULL COMMENT 'Users I.D',
  `address` varchar(250) NOT NULL COMMENT 'Users Address',
  `city` varchar(250) NOT NULL COMMENT 'Users City',
  `postal_code` varchar(10) NOT NULL COMMENT 'Users Postal COde',
  `country` varchar(150) NOT NULL COMMENT 'Users Country',
  `telephone` int(11) NOT NULL COMMENT 'Users Telephone Number',
  `mobile` int(11) NOT NULL COMMENT 'Users Mobile NUmber',
  `location_details` varchar(250) NOT NULL COMMENT 'Users Deatiled Location'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

CREATE TABLE `user_payment` (
  `payment_id` int(11) NOT NULL COMMENT 'Payment_I.D',
  `users_id` int(11) NOT NULL COMMENT 'Users I.D',
  `card_number` int(11) NOT NULL COMMENT 'Card NUmber',
  `card_holder_name` varchar(250) NOT NULL COMMENT 'Name of the Card owner',
  `card_cvv` varchar(250) NOT NULL COMMENT 'Password of the card'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`);

--
-- Indexes for table `items_category`
--
ALTER TABLE `items_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `items_discount`
--
ALTER TABLE `items_discount`
  ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `items_inventory`
--
ALTER TABLE `items_inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_details_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `session_id`
--
ALTER TABLE `session_id`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- Indexes for table `users_address`
--
ALTER TABLE `users_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cart items id';

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Feedback I.D';

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'items I.D';

--
-- AUTO_INCREMENT for table `items_category`
--
ALTER TABLE `items_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Category I.D';

--
-- AUTO_INCREMENT for table `items_discount`
--
ALTER TABLE `items_discount`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Discount I.D';

--
-- AUTO_INCREMENT for table `items_inventory`
--
ALTER TABLE `items_inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Inventory I.D';

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Order I.D';

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Order Items I.D';

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_details_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Payment Details I.D';

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reports I.D';

--
-- AUTO_INCREMENT for table `session_id`
--
ALTER TABLE `session_id`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'session id';

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User I.D';

--
-- AUTO_INCREMENT for table `users_address`
--
ALTER TABLE `users_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Address I.D';

--
-- AUTO_INCREMENT for table `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Payment_I.D';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
