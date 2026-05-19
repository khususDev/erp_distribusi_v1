-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_erp
CREATE DATABASE IF NOT EXISTS `db_erp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_erp`;

-- Dumping structure for table db_erp.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table db_erp.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_sidebar` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.menus: ~29 rows (approximately)
INSERT INTO `menus` (`id`, `name`, `route`, `icon`, `parent_id`, `order`, `is_active`, `is_sidebar`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'dashboard', 'fas fa-home', NULL, 1, 1, 1, NULL, NULL),
	(2, 'Master Data', NULL, 'fas fa-file', NULL, 2, 1, 1, NULL, NULL),
	(3, 'Management', NULL, 'fas fa-id', NULL, 3, 1, 1, NULL, NULL),
	(4, 'Department', 'mst_grl_department', NULL, 20, 2, 1, 1, NULL, NULL),
	(5, 'Product', 'mst_product', NULL, 2, 2, 1, 1, NULL, NULL),
	(6, 'User', 'mng_user', NULL, 3, 1, 1, 1, NULL, NULL),
	(7, 'Menu Permission', 'mng_menupermission', NULL, 3, 2, 1, 1, NULL, NULL),
	(8, 'Roles', 'mng_role', NULL, 3, 3, 1, 1, NULL, NULL),
	(9, 'Location', 'mst_grl_location', NULL, 20, 3, 1, 1, NULL, NULL),
	(10, 'UOM', 'mst_inv_uom', NULL, 23, 1, 1, 1, NULL, NULL),
	(11, 'Currency', 'mst_fin_currency', NULL, 28, 1, 1, 1, NULL, NULL),
	(12, 'Payment Method', 'mst_fin_payment_method', NULL, 28, 2, 1, 1, NULL, NULL),
	(13, 'Tax', 'mst_fin_tax', NULL, 28, 3, 1, 1, NULL, NULL),
	(20, 'Organization', NULL, 'fas fa-id-badge', 2, 1, 1, 1, NULL, NULL),
	(21, 'Company', 'mst_grl_company', NULL, 20, 1, 1, 1, NULL, NULL),
	(22, 'Product Category\r\n', 'mst_inv_category', NULL, 23, 3, 1, 1, NULL, NULL),
	(23, 'Product & Inventory', NULL, 'fas fa-id-badge', 2, 2, 1, 1, NULL, NULL),
	(24, 'Brand', 'mst_inv_brand', NULL, 23, 2, 1, 1, NULL, NULL),
	(25, 'Product', 'mst_inv_product', NULL, 23, 4, 1, 1, NULL, NULL),
	(26, 'Warehouse', 'mst_inv_warehouse', NULL, 23, 5, 1, 1, NULL, NULL),
	(27, 'Storage Location', 'mst_inv_storage', NULL, 23, 6, 1, 1, NULL, NULL),
	(28, 'Finance', NULL, 'fas fa-id-badge', 2, 4, 1, 1, NULL, NULL),
	(29, 'Sales', NULL, 'fas fa-id-badge', 2, 3, 1, 1, NULL, NULL),
	(30, 'Customer Category', 'mst_sls_customer_category', NULL, 29, 1, 1, 1, NULL, NULL),
	(31, 'Customer', 'mst_sls_customer', NULL, 29, 1, 1, 1, NULL, NULL),
	(32, 'Salesman', 'mst_sls_salesman', NULL, 29, 1, 1, 1, NULL, NULL),
	(33, 'Sales Area', 'mst_sls_area', NULL, 29, 1, 1, 1, NULL, NULL),
	(34, 'Mapping Area', 'mst_sls_salesman_area', NULL, 29, 1, 1, 1, NULL, NULL),
	(35, 'Payment Term', 'mst_fin_payment_term', NULL, 28, 4, 1, 1, NULL, NULL);

-- Dumping structure for table db_erp.menu_permission
CREATE TABLE IF NOT EXISTS `menu_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.menu_permission: ~28 rows (approximately)
INSERT INTO `menu_permission` (`id`, `menu_id`, `user_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(4, 4, 1),
	(8, 3, 1),
	(9, 6, 1),
	(10, 7, 1),
	(11, 8, 1),
	(12, 9, 1),
	(13, 10, 1),
	(14, 11, 1),
	(15, 12, 1),
	(16, 13, 1),
	(17, 20, 1),
	(18, 21, 1),
	(19, 23, 1),
	(20, 22, 1),
	(21, 24, 1),
	(22, 25, 1),
	(23, 26, 1),
	(24, 27, 1),
	(26, 28, 1),
	(27, 29, 1),
	(28, 30, 1),
	(29, 31, 1),
	(30, 32, 1),
	(31, 33, 1),
	(32, 34, 1),
	(33, 35, 1);

-- Dumping structure for table db_erp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.migrations: ~35 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2026_01_06_033717_create_menus_table', 1),
	(6, '2026_01_06_034750_add_is_sidebar_to_menus_table', 1),
	(7, '2026_01_07_163914_create_permission_tables', 2),
	(8, '2026_01_07_164051_add_permission_to_menus_table', 3),
	(9, '2026_01_11_064604_create_menu_permission_table', 4),
	(10, '2026_01_12_081158_create_roles_table', 5),
	(11, '2026_01_12_081246_create_role_user_table', 5),
	(12, '2026_01_17_202500_create_department_table', 6),
	(13, '2026_01_19_163707_create_location_table', 7),
	(14, '2026_01_19_171043_create_uom_table', 8),
	(15, '2026_01_19_172510_create_currency_table', 9),
	(16, '2026_01_19_173917_create_payment_method_table', 10),
	(17, '2026_01_19_175331_create_tax_table', 11),
	(18, '2026_01_23_065706_create_companies_table', 12),
	(19, '2026_01_27_155525_create_product_category_table', 13),
	(20, '2026_01_27_155525_create_category_table', 14),
	(21, '2026_01_29_093115_create_mst_brand_table', 15),
	(22, '2026_01_29_093231_create_mst_warehouse_table', 16),
	(23, '2026_01_29_093336_create_mst_storage_table', 17),
	(24, '2026_01_29_094238_create_mst_brand_table', 18),
	(26, '2026_01_29_173237_mst_product_uom', 20),
	(27, '2026_01_31_170611_add_inventory_flags_to_mst_product_table', 21),
	(28, '2026_02_01_162024_generate_sku_for_existing_products', 21),
	(29, '2026_02_01_162119_add_unique_to_mst_product_sku', 21),
	(30, '2026_02_01_163648_create_mst_warehouse_table', 22),
	(31, '2026_02_01_164931_create_mst_storage_table', 23),
	(32, '2026_02_01_172749_create_mst_sales_customer_category_table', 24),
	(33, '2026_02_03_163553_create_mst_sales_customer_table', 25),
	(35, '2026_02_03_165818_create_mst_sales_salesman_table', 26),
	(38, '2026_05_08_180328_create_mst_finance_payment_term_table', 27),
	(39, '2026_05_17_152329_create_mst_inventory_product_table', 28),
	(40, '2026_05_08_172233_create_mst_sales_area_table', 29),
	(41, '2026_05_19_030946_create_mst_inventory_product_uom_table', 30);

-- Dumping structure for table db_erp.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table db_erp.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.model_has_roles: ~0 rows (approximately)

-- Dumping structure for table db_erp.mst_finance_currency
CREATE TABLE IF NOT EXISTS `mst_finance_currency` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_currency: ~0 rows (approximately)
INSERT INTO `mst_finance_currency` (`id`, `code`, `name`, `symbol`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'US', 'Europa', '$', 1, '2026-01-19 10:35:37', '2026-01-19 10:35:37');

-- Dumping structure for table db_erp.mst_finance_payment_method
CREATE TABLE IF NOT EXISTS `mst_finance_payment_method` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_method_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_payment_method: ~0 rows (approximately)

-- Dumping structure for table db_erp.mst_finance_payment_term
CREATE TABLE IF NOT EXISTS `mst_finance_payment_term` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_finance_payment_term_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_payment_term: ~0 rows (approximately)
INSERT INTO `mst_finance_payment_term` (`id`, `code`, `name`, `days`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'a12', 'gfdf', 20, '55', 1, '2026-05-08 12:10:34', '2026-05-08 12:10:34');

-- Dumping structure for table db_erp.mst_finance_tax
CREATE TABLE IF NOT EXISTS `mst_finance_tax` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_tax: ~0 rows (approximately)
INSERT INTO `mst_finance_tax` (`id`, `code`, `name`, `rate`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'PPN11', 'PPN 11 %', 11.00, 'dfsdfsd', 1, '2026-01-19 11:04:38', '2026-01-19 11:04:38');

-- Dumping structure for table db_erp.mst_inventory_brand
CREATE TABLE IF NOT EXISTS `mst_inventory_brand` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_brand_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_brand: ~0 rows (approximately)
INSERT INTO `mst_inventory_brand` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Mayora indah', 'BR001', 'PT Mayota Indah', 1, '2026-01-29 08:57:16', '2026-01-29 09:08:35');

-- Dumping structure for table db_erp.mst_inventory_product
CREATE TABLE IF NOT EXISTS `mst_inventory_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `uom_id` bigint unsigned NOT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `type` enum('stock','non_stock','service') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stock',
  `track_stock` tinyint(1) NOT NULL DEFAULT '1',
  `is_sellable` tinyint(1) NOT NULL DEFAULT '1',
  `is_purchaseable` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `min_stock` decimal(15,2) NOT NULL DEFAULT '0.00',
  `max_stock` decimal(15,2) DEFAULT NULL,
  `purchase_price` decimal(18,2) NOT NULL DEFAULT '0.00',
  `selling_price` decimal(18,2) NOT NULL DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_inventory_product_sku_unique` (`sku`),
  UNIQUE KEY `mst_inventory_product_barcode_unique` (`barcode`),
  KEY `mst_inventory_product_category_id_foreign` (`category_id`),
  KEY `mst_inventory_product_brand_id_foreign` (`brand_id`),
  KEY `mst_inventory_product_uom_id_foreign` (`uom_id`),
  KEY `mst_inventory_product_tax_id_foreign` (`tax_id`),
  CONSTRAINT `mst_inventory_product_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `mst_inventory_brand` (`id`),
  CONSTRAINT `mst_inventory_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `mst_inventory_product_category` (`id`),
  CONSTRAINT `mst_inventory_product_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `mst_finance_tax` (`id`),
  CONSTRAINT `mst_inventory_product_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `mst_inventory_uom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_product: ~4 rows (approximately)
INSERT INTO `mst_inventory_product` (`id`, `sku`, `name`, `barcode`, `category_id`, `brand_id`, `uom_id`, `tax_id`, `type`, `track_stock`, `is_sellable`, `is_purchaseable`, `is_active`, `min_stock`, `max_stock`, `purchase_price`, `selling_price`, `description`, `created_at`, `updated_at`) VALUES
	(1, '21312312', 'ndaskdnakd', '1232nk32nkjnk', 1, 1, 4, 1, 'stock', 1, 1, 1, 0, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:41:25', '2026-05-17 11:04:06'),
	(3, '4465568889', 'ndaskdnakd', '65767vghgb', 1, 1, 4, 1, 'stock', 1, 1, 1, 1, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:43:42', '2026-05-17 10:43:42'),
	(4, '721827136', 'ndaskdnakd', 'bjhb3jh432j', 1, 1, 4, 1, 'stock', 1, 1, 1, 1, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:45:06', '2026-05-17 10:45:06'),
	(5, '20260510001', 'NESCAFE GULA AREN', 'nsf0992781772839389', 3, 1, 5, 1, 'stock', 0, 1, 1, 1, 25.00, 100.00, 7000.00, 10000.00, 'Nescafe Gula Aren', '2026-05-17 10:48:02', '2026-05-17 11:21:40');

-- Dumping structure for table db_erp.mst_inventory_product_category
CREATE TABLE IF NOT EXISTS `mst_inventory_product_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_product_category: ~2 rows (approximately)
INSERT INTO `mst_inventory_product_category` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'wew', 'we', 'ererer', 1, '2026-01-27 09:23:13', '2026-01-27 09:23:13'),
	(3, 'nons', 'nn', 'noons', 1, '2026-05-16 11:02:06', '2026-05-16 11:02:57');

-- Dumping structure for table db_erp.mst_inventory_storage
CREATE TABLE IF NOT EXISTS `mst_inventory_storage` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_storage_code_warehouse_id_unique` (`code`,`warehouse_id`),
  KEY `mst_storage_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `mst_storage_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `mst_inventory_warehouse` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_storage: ~2 rows (approximately)
INSERT INTO `mst_inventory_storage` (`id`, `code`, `name`, `warehouse_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'tes', 'tesssssqewqewqeqw', 1, 'tes', 0, '2026-02-01 09:56:41', '2026-02-01 09:56:53'),
	(2, 'ST', 'New Storage', 2, 'Sadnksajdnasd', 0, '2026-05-17 07:50:06', '2026-05-17 07:50:21');

-- Dumping structure for table db_erp.mst_inventory_uom
CREATE TABLE IF NOT EXISTS `mst_inventory_uom` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uom_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_uom: ~5 rows (approximately)
INSERT INTO `mst_inventory_uom` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(3, 'tes', 'tesiii', 'teeeeerrr', 1, '2026-01-29 02:52:18', '2026-05-16 10:51:50'),
	(4, 'PCS', 'PIECE', 'SATUAN PER ITEM', 1, '2026-01-29 10:51:06', '2026-01-29 10:51:06'),
	(5, 'BOX', 'BOX', '1 BOX ISI 12', 1, '2026-01-29 10:52:03', '2026-01-29 10:52:03'),
	(6, 'KG', 'KILOGRAM', 'BERAT DALAM KILO', 1, '2026-01-29 10:52:20', '2026-01-29 10:52:20'),
	(8, 'tu', 'tes uom', 'thgcvbkj', 1, '2026-05-16 10:51:33', '2026-05-16 10:51:33');

-- Dumping structure for table db_erp.mst_inventory_warehouse
CREATE TABLE IF NOT EXISTS `mst_inventory_warehouse` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_warehouse_code_unique` (`code`),
  KEY `mst_warehouse_location_id_foreign` (`location_id`),
  CONSTRAINT `mst_warehouse_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `mst_organization_location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_warehouse: ~2 rows (approximately)
INSERT INTO `mst_inventory_warehouse` (`id`, `code`, `name`, `location_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'tes', 'tes wawa', 1, 'tes', 1, '2026-02-01 09:45:30', '2026-02-01 09:56:25'),
	(2, 'NL', 'New Location', 3, 'jnfjdkfsndjf', 0, '2026-05-17 07:45:36', '2026-05-17 07:45:51');

-- Dumping structure for table db_erp.mst_organization_company
CREATE TABLE IF NOT EXISTS `mst_organization_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_organization_company: ~6 rows (approximately)
INSERT INTO `mst_organization_company` (`id`, `name`, `code`, `email`, `phone`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
	(2, 'asdas', 'sadasdas', 'asdas@mail.com', '09213128171', 'test', 1, '2026-01-29 02:46:18', '2026-01-29 02:46:18'),
	(3, 'tes3', 't3', 'andre@mail.com', '12321321312312', 'asdasdasdas', 1, '2026-05-08 11:51:09', '2026-05-08 11:51:09'),
	(6, 'tes3', 't4', 'andre@mail.com', NULL, NULL, 1, '2026-05-10 11:34:51', '2026-05-10 11:34:51'),
	(8, 'tut', 't5', 'tuti@mail.com', '012931231221', 'asdasdcccdd', 1, '2026-05-13 12:01:27', '2026-05-13 12:03:44'),
	(9, 'jkaa', 'at20', 'tesss@mail.com', '08218288911', 'dfsdfsdf', 1, '2026-05-13 12:04:37', '2026-05-13 12:04:37'),
	(10, 'yeee', 'y2', 'yuu@mail.com', '082122222222', 'sdfsdfjashadas', 1, '2026-05-13 12:08:16', '2026-05-13 12:08:16');

-- Dumping structure for table db_erp.mst_organization_department
CREATE TABLE IF NOT EXISTS `mst_organization_department` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `department_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_organization_department: ~0 rows (approximately)
INSERT INTO `mst_organization_department` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(5, 'FN', 'Finance', 'Finance Division', 1, '2026-05-15 22:31:24', '2026-05-15 22:31:24');

-- Dumping structure for table db_erp.mst_organization_location
CREATE TABLE IF NOT EXISTS `mst_organization_location` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('BRANCH','AREA','WAREHOUSE','OFFICE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_code_unique` (`code`),
  KEY `location_parent_id_foreign` (`parent_id`),
  CONSTRAINT `location_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `mst_organization_location` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_organization_location: ~2 rows (approximately)
INSERT INTO `mst_organization_location` (`id`, `code`, `name`, `type`, `parent_id`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'asd', 'Warehouse 1', 'AREA', NULL, 'alamat', 1, '2026-01-19 09:55:58', '2026-01-19 09:57:56'),
	(3, '123', 'asdasdas', 'WAREHOUSE', NULL, 'sdasdasda', 1, '2026-05-08 11:51:48', '2026-05-08 11:51:48');

-- Dumping structure for table db_erp.mst_salesman_area
CREATE TABLE IF NOT EXISTS `mst_salesman_area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salesman_id` bigint unsigned NOT NULL,
  `sales_area_id` bigint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_salesman_area: ~0 rows (approximately)

-- Dumping structure for table db_erp.mst_sales_area
CREATE TABLE IF NOT EXISTS `mst_sales_area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_area_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_area: ~2 rows (approximately)
INSERT INTO `mst_sales_area` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'TES', 'tos', 'tes', 0, '2026-02-06 09:42:43', '2026-02-06 09:42:58'),
	(2, 'bubu', 'vvuvu', 'vuvu', 1, '2026-02-06 11:51:40', '2026-02-06 11:51:40');

-- Dumping structure for table db_erp.mst_sales_customer
CREATE TABLE IF NOT EXISTS `mst_sales_customer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_category_id` bigint unsigned NOT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_customer_code_unique` (`code`),
  KEY `mst_sales_customer_customer_category_id_foreign` (`customer_category_id`),
  KEY `mst_sales_customer_location_id_foreign` (`location_id`),
  CONSTRAINT `mst_sales_customer_customer_category_id_foreign` FOREIGN KEY (`customer_category_id`) REFERENCES `mst_sales_customer_category` (`id`),
  CONSTRAINT `mst_sales_customer_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `mst_organization_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_customer: ~0 rows (approximately)
INSERT INTO `mst_sales_customer` (`id`, `code`, `name`, `customer_category_id`, `location_id`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'C20260101', 'SEPTIAN NEW', 1, 1, NULL, NULL, 'TES', 0, '2026-02-03 09:49:04', '2026-02-03 09:49:18');

-- Dumping structure for table db_erp.mst_sales_customer_category
CREATE TABLE IF NOT EXISTS `mst_sales_customer_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_customer_category_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_customer_category: ~0 rows (approximately)
INSERT INTO `mst_sales_customer_category` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'tos', 'tes', 'rwa', 1, '2026-02-01 10:45:50', '2026-02-03 09:32:51');

-- Dumping structure for table db_erp.mst_sales_salesman
CREATE TABLE IF NOT EXISTS `mst_sales_salesman` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_salesman_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_salesman: ~2 rows (approximately)
INSERT INTO `mst_sales_salesman` (`id`, `code`, `name`, `phone`, `email`, `is_active`, `created_at`, `updated_at`) VALUES
	(2, 'SM20260001', 'SEPTIAN', '082123063600', 'septian@gmail.com', 0, '2026-02-03 10:26:51', '2026-02-03 10:26:57'),
	(3, 'tessss', 'SEPTIAN', '082123063600', 'septian@gmail.com', 1, '2026-02-06 11:51:16', '2026-02-06 11:51:16');

-- Dumping structure for table db_erp.mst_sales_salesman_area
CREATE TABLE IF NOT EXISTS `mst_sales_salesman_area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salesman_id` bigint unsigned NOT NULL,
  `sales_area_id` bigint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_mapping_salesman_id_sales_area_id_unique` (`salesman_id`,`sales_area_id`),
  KEY `mst_sales_mapping_sales_area_id_foreign` (`sales_area_id`),
  CONSTRAINT `mst_sales_mapping_sales_area_id_foreign` FOREIGN KEY (`sales_area_id`) REFERENCES `mst_sales_area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mst_sales_mapping_salesman_id_foreign` FOREIGN KEY (`salesman_id`) REFERENCES `mst_sales_salesman` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_salesman_area: ~0 rows (approximately)

-- Dumping structure for table db_erp.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table db_erp.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.permissions: ~4 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view_dashboard', 'web', '2026-01-10 23:10:08', '2026-01-10 23:10:08'),
	(2, 'view_product', 'web', '2026-01-10 23:10:08', '2026-01-10 23:10:08'),
	(3, 'view_user', 'web', '2026-01-10 23:10:08', '2026-01-10 23:10:08'),
	(4, 'view_department', 'web', '2026-01-10 23:10:08', '2026-01-10 23:10:08');

-- Dumping structure for table db_erp.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db_erp.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.roles: ~2 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(3, 'test', 'test', 'test', 1, '2026-01-12 04:34:31', '2026-01-12 04:34:31'),
	(4, 'test2', 't2', 'twest', 1, '2026-01-17 10:49:04', '2026-01-17 10:49:04');

-- Dumping structure for table db_erp.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.role_has_permissions: ~0 rows (approximately)

-- Dumping structure for table db_erp.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_user_user_id_role_id_unique` (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.role_user: ~0 rows (approximately)

-- Dumping structure for table db_erp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'admin@erp.com', '2026-01-07 08:28:57', '$2y$12$0rh1SXFmJfCX7N.Se5OZLuTIHZquVAlehCagOG/MOgjWvSi7fbxL.', NULL, '2026-01-07 08:28:57', '2026-01-07 08:28:57'),
	(2, 'Staff Admin', 'staff@erp.com', '2026-01-07 08:28:57', '$2y$12$63hIuEKENdbJsiRIFEIFP.gKitp5xecKJbgk1D6aKE.E4uuWyinh.', NULL, '2026-01-07 08:28:57', '2026-01-07 08:28:57');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
