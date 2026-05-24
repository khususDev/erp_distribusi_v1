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
  `group_menu_id` bigint DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_sidebar` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.menus: ~32 rows (approximately)
INSERT INTO `menus` (`id`, `name`, `route`, `icon`, `group_menu_id`, `parent_id`, `order`, `is_active`, `is_sidebar`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'dashboard', 'LayoutDashboard', 1, NULL, 1, 1, 1, NULL, NULL),
	(2, 'Master Data Management', NULL, 'Folder', 1, NULL, 2, 1, 1, NULL, NULL),
	(3, 'User Management', NULL, 'UserGroup', 1, NULL, 3, 1, 1, NULL, NULL),
	(4, 'Department', 'mst_grl_department', NULL, NULL, 20, 2, 1, 1, NULL, NULL),
	(5, 'Product', 'mst_product', NULL, NULL, NULL, 2, 1, 1, NULL, NULL),
	(6, 'User', 'mng_user', NULL, NULL, 3, 1, 1, 1, NULL, NULL),
	(7, 'Menu Permission', 'mng_menupermission', NULL, NULL, 3, 2, 1, 1, NULL, NULL),
	(8, 'Roles', 'mng_role', NULL, NULL, 3, 3, 1, 1, NULL, NULL),
	(9, 'Location', 'mst_grl_location', NULL, NULL, 20, 3, 1, 1, NULL, NULL),
	(10, 'UOM', 'mst_inv_uom', NULL, NULL, 23, 1, 1, 1, NULL, NULL),
	(11, 'Currency', 'mst_fin_currency', NULL, NULL, 28, 1, 1, 1, NULL, NULL),
	(12, 'Payment Method', 'mst_fin_payment_method', NULL, NULL, 28, 2, 1, 1, NULL, NULL),
	(13, 'Tax', 'mst_fin_tax', NULL, NULL, 28, 3, 1, 1, NULL, NULL),
	(20, 'Organization', NULL, 'fas fa-id-badge', NULL, 2, 1, 1, 1, NULL, NULL),
	(21, 'Company', 'mst_grl_company', NULL, NULL, 20, 1, 1, 1, NULL, NULL),
	(22, 'Product Category\r\n', 'mst_inv_category', NULL, NULL, 23, 3, 1, 1, NULL, NULL),
	(23, 'Product & Inventory', NULL, 'fas fa-id-badge', NULL, 2, 2, 1, 1, NULL, NULL),
	(24, 'Brand', 'mst_inv_brand', NULL, NULL, 23, 2, 1, 1, NULL, NULL),
	(25, 'Product', 'mst_inv_product', NULL, NULL, 23, 4, 1, 1, NULL, NULL),
	(26, 'Warehouse', 'mst_inv_warehouse', NULL, NULL, 23, 5, 1, 1, NULL, NULL),
	(27, 'Storage Location', 'mst_inv_storage', NULL, NULL, 23, 6, 1, 1, NULL, NULL),
	(28, 'Finance', NULL, 'fas fa-id-badge', NULL, 2, 4, 1, 1, NULL, NULL),
	(29, 'Sales', NULL, 'fas fa-id-badge', NULL, 2, 3, 1, 1, NULL, NULL),
	(30, 'Customer Category', 'mst_sls_customer_category', NULL, NULL, 29, 1, 1, 1, NULL, NULL),
	(31, 'Customer', 'mst_sls_customer', NULL, NULL, 29, 1, 1, 1, NULL, NULL),
	(32, 'Salesman', 'mst_sls_salesman', NULL, NULL, 29, 1, 1, 1, NULL, NULL),
	(33, 'Sales Area', 'mst_sls_area', NULL, NULL, 29, 1, 1, 1, NULL, NULL),
	(34, 'Mapping Area', 'mst_sls_mapping_area', NULL, NULL, 29, 1, 1, 1, NULL, NULL),
	(35, 'Payment Term', 'mst_fin_payment_term', NULL, NULL, 28, 4, 1, 1, NULL, NULL),
	(36, 'Purchasing', NULL, 'fas fa-id-badge', NULL, 2, 5, 1, 1, NULL, NULL),
	(37, 'Supplier Category', 'mst_prc_supplier_category', NULL, NULL, 36, 1, 1, 1, NULL, NULL),
	(38, 'Supplier', 'mst_prc_supplier', NULL, NULL, 36, 2, 1, 1, NULL, NULL);

-- Dumping structure for table db_erp.menus_group
CREATE TABLE IF NOT EXISTS `menus_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_urut` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.menus_group: ~7 rows (approximately)
INSERT INTO `menus_group` (`id`, `name`, `no_urut`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'MAIN MENU', 1, 1, NULL, NULL),
	(2, 'MASTER DATA MANAGEMENT', 2, 1, NULL, NULL),
	(3, 'SALES & DISTRIBUTION', 3, 1, NULL, NULL),
	(4, 'HUMAN CAPITAL', 4, 1, NULL, NULL),
	(5, 'ADMINISTRATION', 5, 1, NULL, NULL),
	(6, 'REPORTS & ANALYTICS', 6, 1, NULL, NULL),
	(7, 'SYSTEM', 7, 1, NULL, NULL);

-- Dumping structure for table db_erp.menu_permission
CREATE TABLE IF NOT EXISTS `menu_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.menu_permission: ~31 rows (approximately)
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
	(33, 35, 1),
	(34, 36, 1),
	(35, 37, 1),
	(36, 38, 1);

-- Dumping structure for table db_erp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.migrations: ~41 rows (approximately)
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
	(35, '2026_02_03_165818_create_mst_sales_salesman_table', 26),
	(38, '2026_05_08_180328_create_mst_finance_payment_term_table', 27),
	(39, '2026_05_17_152329_create_mst_inventory_product_table', 28),
	(41, '2026_05_19_030946_create_mst_inventory_product_uom_table', 30),
	(42, '2026_05_21_033357_create_mst_finance_chart_account_table', 31),
	(43, '2026_05_21_033632_create_mst_finance_bank_table', 31),
	(44, '2026_05_21_073821_create_mst_sales_salesman_table', 32),
	(45, '2026_05_21_100110_create_mst_sales_customer_table', 33),
	(46, '2026_05_22_093749_create_menus_group_table', 34),
	(47, '2026_05_22_102838_create_mst_sales_mapping_area_table', 35),
	(48, '2026_05_23_090003_create_mst_purchasing_supplier_category_table', 36),
	(49, '2026_05_23_145323_create_mst_purchasing_supplier_table', 37),
	(50, '2026_05_24_082911_create_mst_system_document_number_table', 38);

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

-- Dumping structure for table db_erp.mst_finance_bank
CREATE TABLE IF NOT EXISTS `mst_finance_bank` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_finance_bank_code_unique` (`code`),
  KEY `mst_finance_bank_currency_id_foreign` (`currency_id`),
  KEY `mst_finance_bank_coa_id_foreign` (`coa_id`),
  CONSTRAINT `mst_finance_bank_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `mst_finance_chart_account` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_finance_bank_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `mst_finance_currency` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_bank: ~0 rows (approximately)

-- Dumping structure for table db_erp.mst_finance_chart_account
CREATE TABLE IF NOT EXISTS `mst_finance_chart_account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_chart_account: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_currency: ~2 rows (approximately)
INSERT INTO `mst_finance_currency` (`id`, `code`, `name`, `symbol`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'US', 'Europa', '$', 0, '2026-01-19 10:35:37', '2026-05-20 03:29:12'),
	(2, 'RP', 'Rupiah', 'Rp.', 1, '2026-05-20 03:28:53', '2026-05-20 03:29:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_payment_method: ~2 rows (approximately)
INSERT INTO `mst_finance_payment_method` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'TN', 'Tunai', 'Pembayaran Tunai', 1, '2026-05-20 03:33:35', '2026-05-20 03:33:35'),
	(2, 'tt', 'Test', 'testing', 0, '2026-05-20 03:33:46', '2026-05-20 03:33:57');

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

-- Dumping data for table db_erp.mst_finance_payment_term: ~1 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_finance_tax: ~2 rows (approximately)
INSERT INTO `mst_finance_tax` (`id`, `code`, `name`, `rate`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'PPN11', 'PPN 11', 11.00, 'dfsdfsd', 0, '2026-01-19 11:04:38', '2026-05-20 20:18:00'),
	(2, 'P02', 'PPH', 1.10, 'Pajak Karyawan', 1, '2026-05-20 20:17:25', '2026-05-20 20:17:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_product: ~8 rows (approximately)
INSERT INTO `mst_inventory_product` (`id`, `sku`, `name`, `barcode`, `category_id`, `brand_id`, `uom_id`, `tax_id`, `type`, `track_stock`, `is_sellable`, `is_purchaseable`, `is_active`, `min_stock`, `max_stock`, `purchase_price`, `selling_price`, `description`, `created_at`, `updated_at`) VALUES
	(1, '21312312', 'ndaskdnakd', '1232nk32nkjnk', 1, 1, 4, 1, 'stock', 1, 1, 1, 0, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:41:25', '2026-05-17 11:04:06'),
	(3, '4465568889', 'ndaskdnakd', '65767vghgb', 1, 1, 4, 1, 'stock', 1, 1, 1, 1, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:43:42', '2026-05-17 10:43:42'),
	(4, '721827136', 'ndaskdnakd', 'bjhb3jh432j', 1, 1, 4, 1, 'stock', 1, 1, 1, 1, 10.00, 1000.00, 12000.00, 15000.00, 'nj jjnnxcjcxnjcxnjxc', '2026-05-17 10:45:06', '2026-05-17 10:45:06'),
	(5, '20260510001', 'NESCAFE GULA AREN', 'nsf0992781772839389', 3, 1, 5, 1, 'stock', 0, 1, 1, 1, 25.00, 100.00, 7000.00, 10000.00, 'Nescafe Gula Aren', '2026-05-17 10:48:02', '2026-05-17 11:21:40'),
	(6, '2026050001', 'KLEIBERIT ADHESIVE', 'KJJHB3244434213', 3, 1, 4, 1, 'stock', 1, 1, 1, 0, 10.00, 250.00, 2000000.00, 25000000.00, 'ASDABDJSABDADASDGSAVDHASGVD', '2026-05-19 23:45:54', '2026-05-20 01:22:59'),
	(8, '20260244875', 'KLEIBERIT ADHESIVE', 'hjf67vg7vg7fv', 3, 1, 4, 1, 'stock', 1, 1, 1, 0, 10.00, 250.00, 2000000.00, 25000000.00, 'ASDABDJSABDADASDGSAVDHASGVD', '2026-05-19 23:49:00', '2026-05-20 00:58:48'),
	(9, '20260212345', 'KLEIBERIT ADHESIVE', 'jbhj5b435bj34b5', 3, 1, 4, 1, 'stock', 1, 1, 1, 0, 10.00, 250.00, 2000000.00, 25000000.00, 'ASDABDJSABDADASDGSAVDHASGVD', '2026-05-19 23:49:31', '2026-05-20 01:52:36'),
	(10, '456888443354', 'dsaasdasdsadas', 'sadasdasdasdasdas', 1, 1, 5, 1, 'stock', 1, 1, 1, 1, 0.00, 0.00, 0.00, 0.00, 'sadsadasdasdas', '2026-05-20 00:59:35', '2026-05-20 02:02:16');

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

-- Dumping structure for table db_erp.mst_inventory_product_uom
CREATE TABLE IF NOT EXISTS `mst_inventory_product_uom` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `uom_id` bigint unsigned NOT NULL,
  `conversion_rate` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `is_base` tinyint(1) NOT NULL DEFAULT '0',
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT '0.00',
  `selling_price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_inventory_product_uom_product_id_uom_id_unique` (`product_id`,`uom_id`),
  UNIQUE KEY `mst_inventory_product_uom_barcode_unique` (`barcode`),
  KEY `mst_inventory_product_uom_uom_id_foreign` (`uom_id`),
  CONSTRAINT `mst_inventory_product_uom_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `mst_inventory_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mst_inventory_product_uom_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `mst_inventory_uom` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_inventory_product_uom: ~2 rows (approximately)
INSERT INTO `mst_inventory_product_uom` (`id`, `product_id`, `uom_id`, `conversion_rate`, `is_base`, `barcode`, `purchase_price`, `selling_price`, `created_at`, `updated_at`) VALUES
	(1, 9, 4, 5.0000, 0, NULL, 0.00, 0.00, '2026-05-19 23:49:31', '2026-05-19 23:49:31'),
	(2, 9, 5, 24.0000, 0, NULL, 0.00, 0.00, '2026-05-19 23:49:31', '2026-05-19 23:49:31');

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

-- Dumping structure for table db_erp.mst_purchasing_supplier
CREATE TABLE IF NOT EXISTS `mst_purchasing_supplier` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_category_id` bigint unsigned DEFAULT NULL,
  `payment_term_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(18,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_purchasing_supplier_code_unique` (`code`),
  KEY `mst_purchasing_supplier_supplier_category_id_foreign` (`supplier_category_id`),
  KEY `mst_purchasing_supplier_payment_term_id_foreign` (`payment_term_id`),
  KEY `mst_purchasing_supplier_currency_id_foreign` (`currency_id`),
  CONSTRAINT `mst_purchasing_supplier_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `mst_finance_currency` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_purchasing_supplier_payment_term_id_foreign` FOREIGN KEY (`payment_term_id`) REFERENCES `mst_finance_payment_term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_purchasing_supplier_supplier_category_id_foreign` FOREIGN KEY (`supplier_category_id`) REFERENCES `mst_purchasing_supplier_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_purchasing_supplier: ~1 rows (approximately)
INSERT INTO `mst_purchasing_supplier` (`id`, `code`, `name`, `supplier_category_id`, `payment_term_id`, `currency_id`, `phone`, `email`, `pic_name`, `address`, `city`, `tax_number`, `credit_limit`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'i8', 'test category', 1, 1, 2, '087217728782', 'asda@mail.com', 'nana', 'dnadkasdn', 'adasdas', '0872910981', 100000000.00, 1, 'dfsddsfsd', '2026-05-23 08:48:13', '2026-05-23 08:48:13');

-- Dumping structure for table db_erp.mst_purchasing_supplier_category
CREATE TABLE IF NOT EXISTS `mst_purchasing_supplier_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_purchasing_supplier_category_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_purchasing_supplier_category: ~1 rows (approximately)
INSERT INTO `mst_purchasing_supplier_category` (`id`, `code`, `name`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'tc', 'test category desc', 1, 'testtesttest desc', '2026-05-23 07:37:08', '2026-05-23 08:43:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_area: ~3 rows (approximately)
INSERT INTO `mst_sales_area` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'TES', 'tos', 'tes', 0, '2026-02-06 09:42:43', '2026-02-06 09:42:58'),
	(2, 'bubu', 'fufufafa', 'fufufafa', 0, '2026-02-06 11:51:40', '2026-05-21 00:34:32'),
	(3, 'a1', 'tangerang', 'asd3', 1, '2026-05-21 00:34:10', '2026-05-22 03:44:24');

-- Dumping structure for table db_erp.mst_sales_customer
CREATE TABLE IF NOT EXISTS `mst_sales_customer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_category_id` bigint unsigned DEFAULT NULL,
  `sales_area_id` bigint unsigned DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_term_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `credit_limit` decimal(18,2) NOT NULL DEFAULT '0.00',
  `tax_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_customer_code_unique` (`code`),
  KEY `mst_sales_customer_customer_category_id_foreign` (`customer_category_id`),
  KEY `mst_sales_customer_sales_area_id_foreign` (`sales_area_id`),
  KEY `mst_sales_customer_payment_term_id_foreign` (`payment_term_id`),
  KEY `mst_sales_customer_currency_id_foreign` (`currency_id`),
  CONSTRAINT `mst_sales_customer_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `mst_finance_currency` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_sales_customer_customer_category_id_foreign` FOREIGN KEY (`customer_category_id`) REFERENCES `mst_sales_customer_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_sales_customer_payment_term_id_foreign` FOREIGN KEY (`payment_term_id`) REFERENCES `mst_finance_payment_term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mst_sales_customer_sales_area_id_foreign` FOREIGN KEY (`sales_area_id`) REFERENCES `mst_sales_area` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_customer: ~0 rows (approximately)
INSERT INTO `mst_sales_customer` (`id`, `code`, `name`, `customer_category_id`, `sales_area_id`, `phone`, `email`, `address`, `city`, `payment_term_id`, `currency_id`, `credit_limit`, `tax_number`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'asdasdas', '100', 3, 3, '23423234234', 'dsffsdf@maisda.pcm', 'sadasdsadasd', NULL, 1, NULL, 20.00, 'asdasdsa', 0, NULL, '2026-05-21 03:18:01', '2026-05-21 22:12:31'),
	(2, 'i8', 'toko berkah', 1, 3, '087217728782', 'asda@mail.com', 'dnadkasdn', NULL, 1, NULL, 10.00, '0872910981', 1, NULL, '2026-05-21 22:12:16', '2026-05-22 03:44:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_customer_category: ~4 rows (approximately)
INSERT INTO `mst_sales_customer_category` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'tos', 'tes', 'rwa', 1, '2026-02-01 10:45:50', '2026-02-03 09:32:51'),
	(2, 'd3', 'adsa', 'sadas', 1, '2026-05-21 00:07:22', '2026-05-21 00:07:22'),
	(3, 'd5', 'aasdsa', 'fdsfds', 1, '2026-05-21 00:18:34', '2026-05-21 00:18:34'),
	(4, 'asd', 'sggg', 'asd', 0, '2026-05-21 00:23:00', '2026-05-21 00:23:15');

-- Dumping structure for table db_erp.mst_sales_mapping_area
CREATE TABLE IF NOT EXISTS `mst_sales_mapping_area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salesman_id` bigint unsigned NOT NULL,
  `area_id` bigint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping_salesman_customer_unique` (`salesman_id`,`area_id`) USING BTREE,
  KEY `mst_sales_mapping_area_customer_id_foreign` (`area_id`) USING BTREE,
  CONSTRAINT `FK_mst_sales_mapping_area_mst_sales_area` FOREIGN KEY (`area_id`) REFERENCES `mst_sales_area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mst_sales_mapping_area_salesman_id_foreign` FOREIGN KEY (`salesman_id`) REFERENCES `mst_sales_salesman` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_mapping_area: ~1 rows (approximately)
INSERT INTO `mst_sales_mapping_area` (`id`, `salesman_id`, `area_id`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 1, 'des', '2026-05-22 04:04:07', '2026-05-22 04:04:20');

-- Dumping structure for table db_erp.mst_sales_salesman
CREATE TABLE IF NOT EXISTS `mst_sales_salesman` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_area_id` bigint unsigned DEFAULT NULL,
  `commission_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_sales_salesman_code_unique` (`code`),
  KEY `mst_sales_salesman_sales_area_id_foreign` (`sales_area_id`),
  CONSTRAINT `mst_sales_salesman_sales_area_id_foreign` FOREIGN KEY (`sales_area_id`) REFERENCES `mst_sales_area` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_erp.mst_sales_salesman: ~2 rows (approximately)
INSERT INTO `mst_sales_salesman` (`id`, `code`, `name`, `phone`, `email`, `sales_area_id`, `commission_percent`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'agus', 'setset', 'setes@mail.com', 1, 10.00, 1, NULL, '2026-05-21 01:11:39', '2026-05-22 03:43:56'),
	(2, 'fd2', 'sdfbnvbn', '989789768768', 'fdfsdfsdsdfds', 2, 21.00, 0, NULL, '2026-05-21 01:14:06', '2026-05-21 01:14:13');

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
