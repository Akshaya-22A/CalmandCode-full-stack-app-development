-- Init SQL for Solar Secure Node Project
-- Creates products, orders, order_items, payments tables and inserts sample products

CREATE TABLE IF NOT EXISTS `products` (
  `id` VARCHAR(50) NOT NULL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `sale_price` DECIMAL(10,2) DEFAULT NULL,
  `image` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orders` (
  `id` VARCHAR(50) NOT NULL PRIMARY KEY,
  `cost` DECIMAL(12,2) NOT NULL,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `status` VARCHAR(50),
  `city` VARCHAR(150),
  `address` TEXT,
  `phone` VARCHAR(50),
  `date` DATETIME,
  `products_ids` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` VARCHAR(50) NOT NULL,
  `product_id` VARCHAR(50) NOT NULL,
  `product_name` VARCHAR(255),
  `product_price` DECIMAL(10,2),
  `product_image` VARCHAR(255),
  `product_quantity` INT DEFAULT 1,
  `order_date` DATETIME,
  INDEX (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `payments` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` VARCHAR(50) NOT NULL,
  `transaction_id` VARCHAR(255),
  `date` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample products
INSERT INTO `products` (`id`,`name`,`description`,`price`,`sale_price`,`image`) VALUES
('p1','Chicken Cheese Burger','Chicken Burger with loaded cheese,toppings of cheese makes the burger extra cheesy and delicious.',39.99,NULL,'1.jpeg'),
('p2','Seafood Pizza','A whole pizza with golden-brown crust topped with shrimp, imitation crab sticks, squid and melted cheese.',39.99,49.99,'2.jpeg'),
('p3','Classic Beef Burger','A sesame seed bun sandwiching a beef patty, cheddar cheese, ketchup, mayonnaise, lettuce, tomato.',15.99,19.99,'3.jpeg')
ON DUPLICATE KEY UPDATE name=VALUES(name);
