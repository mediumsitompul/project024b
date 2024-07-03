-- --------------------------------------------------------
-- Host:                         192.168.100.100
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_shopping
CREATE DATABASE IF NOT EXISTS `db_shopping` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_shopping`;

-- Dumping structure for table db_shopping.t_buy_now
CREATE TABLE IF NOT EXISTS `t_buy_now` (
  `id` int(11) NOT NULL,
  `idx` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `pic_` varchar(100) DEFAULT NULL,
  `price_` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `datetime_` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_shopping.t_buy_now: ~4 rows (approximately)
/*!40000 ALTER TABLE `t_buy_now` DISABLE KEYS */;
INSERT INTO `t_buy_now` (`id`, `idx`, `name`, `item`, `pic_`, `price_`, `price`, `datetime_`) VALUES
	(3, 'CX003', 'tas1', 'From USA', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/tas1.png', 'price: $500', '500', '2022-07-19 15:20:00'),
	(3, 'CX003', 'tas1', 'From USA', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/tas1.png', 'price: $500', '500', '2022-07-19 15:20:00'),
	(6, 'CX006', 'watch1', 'From Swiss', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/watch1.png', 'price: $800', '800', '2022-07-19 15:14:00'),
	(6, 'CX006', 'watch1', 'From Swiss', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/watch1.png', 'price: $800', '800', '2022-07-19 15:14:00'),
	(2, 'CX002', 'sepatu2', 'From France', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/sepatu2.png', 'price: $129', '129', '2022-07-19 15:14:00');
/*!40000 ALTER TABLE `t_buy_now` ENABLE KEYS */;

-- Dumping structure for table db_shopping.t_goods_list
CREATE TABLE IF NOT EXISTS `t_goods_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `pic_` varchar(100) DEFAULT NULL,
  `price_` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `datetime_` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_shopping.t_goods_list: ~7 rows (approximately)
/*!40000 ALTER TABLE `t_goods_list` DISABLE KEYS */;
INSERT INTO `t_goods_list` (`id`, `idx`, `name`, `item`, `pic_`, `price_`, `price`, `datetime_`) VALUES
	(1, 'CX001', 'sepatu1', 'From London', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/sepatu1.png', 'price: $100', '100', '2022-07-19 15:10:00'),
	(2, 'CX002', 'sepatu2', 'From France', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/sepatu2.png', 'price: $129', '129', '2022-07-19 15:14:00'),
	(3, 'CX003', 'tas1', 'From USA', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/tas1.png', 'price: $500', '500', '2022-07-19 15:20:00'),
	(4, 'CX004', 'tas2', 'From Australia', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/tas2.png', 'price: $650', '650', '2022-07-19 15:25:00'),
	(5, 'CX005', 'tas3', 'From Canada', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/tas3.png', 'price: $450', '450', '2022-07-19 15:14:00'),
	(6, 'CX006', 'watch1', 'From Swiss', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/watch1.png', 'price: $800', '800', '2022-07-19 15:14:00'),
	(7, 'CX007', 'watch2', 'Fom Germany', 'http://192.168.100.100:8087/flutter_shopping/assets/images2/watch2.png', 'price: $950', '950', '2022-07-19 15:14:00');
/*!40000 ALTER TABLE `t_goods_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
