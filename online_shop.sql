SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin_info` (
  `admin_id` int NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
);
INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Sheeven Jean', 'mertonjean@gmail.com', 'CSCI4560');
-- created myself as sole admin
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`); -- forgot primary keys

--
CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_title` text NOT NULL
);
INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Sony'),
(4, 'Microsoft'),
(5, 'Google'),
(6, 'HP'),
(7, 'Dell');
-- list of brands' products sold on the shop
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
CREATE TABLE `lastest` (
  `product_id` int NOT NULL,
  `product_brand` varchar(255) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int NOT NULL,
  `product_size` varchar(255) NOT NULL
);
INSERT INTO `lastest` (`product_id`, `product_brand`, `product_title`, `product_price`, `product_size`) VALUES
(1, 'Apple', 'Iphone 14 Pro', 1000, '128gb'),
(2, 'Apple', 'Iphone 14 Pro', 1100, '256gb'),
(3, 'Apple', 'Iphone 14 Pro', 1300, '512gb'),
(4, 'Apple', 'Iphone 14 Pro max', 1100, '128gb'),
(5, 'Apple', 'Iphone 14 Pro max', 1200, '256gb'),
(6, 'Apple', 'Iphone 14 Pro max', 1400, '512gb'),
(7, 'Apple', 'Ipad Air 4th gen', 500, '256gb'),
(8, 'Apple', 'Ipad Pro', 800, '128gb'),
(9, 'Apple', 'Ipad 10th gen', 350, '64gb'),
(10, 'Apple', 'MacBook Air', 1000, '256gb'),
(11, 'Apple', 'MacBook Pro', 1300, '512gb'),
(12, 'Samsung', 'Samsung Galaxy S22', 800, '128gb'),
(13, 'Samsung', 'Samgsung Galaxy book 2', 550, '128gb'),
(14, 'Samsung', 'Samsung Galaxy book Pro 360', 750, '128gb'),
(15, 'Sony', 'Playstation 5', 500, '825gb'),
(16, 'Sony', 'Playstation 5 Digital', 400, '825gb'),
(17, 'Sony', 'DualSense Controller', 70, 'N/A'),
(18, 'Microsoft', 'Xbox Series X', 500, '1Tb'),
(19, 'Microsoft', 'Xbox Series S', 300, '512gb'),
(20, 'Microsoft', 'Xbox controller', 70, 'N/A'),
(21, 'Google', 'Google Pixel 7', 600, '128gb'),
(22, 'Google', 'Google Pixel 7 Pro', 900, '128gb');
-- to add product images and more products
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);
  
--
CREATE TABLE `cart_info` (
  `id` int NOT NULL,
  `poduct_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int NOT NULL
);
ALTER TABLE `cart_info`
  ADD PRIMARY KEY (`id`);
  
INSERT INTO `cart_info` (`id`, `poduct_id`, `user_id`, `qty`) VALUES
(1, 1, 1, 1),
(2, 5, 4, 1),
(3, 7, 5, 2);


--
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(10) NOT NULL
);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Chandler', 'Davis', 'chandlerdavis@gmail.com', 'abcd', '1234567890', '123 random place', 'apt 000'),
(2, 'Alexa', 'Davis', 'alexabaez@gmail.com', 'efg', '0987654321', '123 random place', 'apt 000'),
(3, 'Merton', 'Jean', 'merton@gmail.com', 'hijk', '615123456', '123 random place', 'apt 000'),
(4, 'Nashley', 'Jean', 'nashleyjea@gmail.com', 'lmnop', '6154567890', '500 disneyland', 'apt 1000'),
(5, 'Mary', 'Guirguis', 'maryguirguis@gmail.com', 'qrstuv', '6154441122', '100 somewhere', 'apt 2'),
(6, 'imaginary', 'person', 'madeup@gmail.com', 'wxyz', '6152221100', 'nowhere', 'apt 0');
-- too add more users
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);
  
--
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL
);
CREATE TABLE `order_info` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `cvv` int NOT NULL
);

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `status`) VALUES
(1, 1, 11, 1, 'TYXX-HFHFJF', 'Completed'),
(2, 4, 5, 1, 'TYZX-FHFHFD', 'Completed'),
(3, 5, 7, 2, 'TTYL-JFJSLR', 'Completed');
INSERT INTO `order_info` (`order_id`, `user_id`, `name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `amount`, `cvv`) VALUES
(1, 12, ',Chandler Davis', 'chandlerdavis@gmail.com', '123 random place', 'Murfreesboro', 'Tennessee', '37130', 'bofa', '6465 7574 7475 5747', '09/23', 1, 1300, 355), 
(2, 4, 'Nashely Jean', 'nashleyjean@gmail.com', '500 disneyland', 'Miami', 'Florida', '48478', 'chase', '5748 4837 8736 4763', '11/24', 1, 1100, 364),
(3, 5, 'Mary Guirguis', 'maryguirguis@gmail.com', '100 somewhere', 'Nashville', 'Tennessee', 37073, 'bofa', '5768 6864 5845 4584', '12/25', 2, 1000, 465);

--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);
