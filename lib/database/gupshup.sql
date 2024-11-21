-- File name: C:\Users\DELL\Documents\gupshup.sql
-- Created by ꯈΟ麼Ο黔ΟꯠΟ黈Ο㿈Ξ鸈Ο 


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `usertype` VARCHAR(255) NOT NULL DEFAULT 'user',
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `two_factor_secret` TEXT NULL,
  `two_factor_recovery_codes` TEXT NULL,
  `two_factor_confirmed_at` TIMESTAMP NULL DEFAULT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `current_team_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `profile_photo_path` VARCHAR(2048) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC),
  UNIQUE KEY `users_email_unique` (`email` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `areaId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `areaTitle` VARCHAR(255) NOT NULL,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`areaId` ASC),
  KEY `area_uid_foreign` (`uId` ASC),
  CONSTRAINT `area_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currencyId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `currencyTitle` VARCHAR(255) NOT NULL,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`currencyId` ASC),
  KEY `currency_uid_foreign` (`uId` ASC),
  CONSTRAINT `currency_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `acctype`
--

CREATE TABLE `acctype` (
  `accTypeId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `accTypeTitle` VARCHAR(255) NOT NULL,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`accTypeId` ASC),
  KEY `acctype_uid_foreign` (`uId` ASC),
  CONSTRAINT `acctype_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `phone` VARCHAR(255) NOT NULL,
  `guest` VARCHAR(255) NOT NULL,
  `time` VARCHAR(255) NOT NULL,
  `date` VARCHAR(255) NOT NULL,
  `note` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL DEFAULT 'Pending',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` VARCHAR(255) NOT NULL,
  `value` MEDIUMTEXT NOT NULL,
  `expiration` INT(11) NOT NULL,
  PRIMARY KEY (`key` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` VARCHAR(255) NOT NULL,
  `owner` VARCHAR(255) NOT NULL,
  `expiration` INT(11) NOT NULL,
  PRIMARY KEY (`key` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `detail` LONGTEXT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `userid` VARCHAR(255) NULL DEFAULT NULL,
  `qty` DOUBLE NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `accparent`
--

CREATE TABLE `accparent` (
  `parentId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `accParentTitle` VARCHAR(255) NOT NULL,
  `accTypeId` BIGINT(20) UNSIGNED NOT NULL,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`parentId` ASC),
  KEY `accparent_acctypeid_foreign` (`accTypeId` ASC),
  KEY `accparent_uid_foreign` (`uId` ASC),
  CONSTRAINT `accparent_acctypeid_foreign` FOREIGN KEY (`accTypeId`) REFERENCES `acctype` (`accTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accparent_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id` ASC),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `detail` LONGTEXT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `total_jobs` INT(11) NOT NULL,
  `pending_jobs` INT(11) NOT NULL,
  `failed_jobs` INT(11) NOT NULL,
  `failed_job_ids` LONGTEXT NOT NULL,
  `options` MEDIUMTEXT NULL,
  `cancelled_at` INT(11) NULL DEFAULT NULL,
  `created_at` INT(11) NOT NULL,
  `finished_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `queue` VARCHAR(255) NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `attempts` TINYINT(3) UNSIGNED NOT NULL,
  `reserved_at` INT(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id` ASC),
  KEY `jobs_queue_index` (`queue` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `qty` VARCHAR(255) NULL DEFAULT NULL,
  `price` VARCHAR(255) NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `delivery_status` VARCHAR(255) NOT NULL DEFAULT 'In Progress',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`email` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `tokenable_type` VARCHAR(255) NOT NULL,
  `tokenable_id` BIGINT(20) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id` ASC),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token` ASC),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type` ASC,`tokenable_id` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` VARCHAR(255) NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` VARCHAR(45) NULL DEFAULT NULL,
  `user_agent` TEXT NULL,
  `payload` LONGTEXT NOT NULL,
  `last_activity` INT(11) NOT NULL,
  PRIMARY KEY (`id` ASC),
  KEY `sessions_user_id_index` (`user_id` ASC),
  KEY `sessions_last_activity_index` (`last_activity` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `acTitle` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `mobile` VARCHAR(255) NULL DEFAULT NULL,
  `openingBal` DOUBLE NOT NULL DEFAULT 0,
  `CurrentBal` DOUBLE NOT NULL DEFAULT 0,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `currencyId` BIGINT(20) UNSIGNED NOT NULL,
  `accTypeId` BIGINT(20) UNSIGNED NOT NULL,
  `parentId` BIGINT(20) UNSIGNED NOT NULL,
  `areaId` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`acId` ASC),
  KEY `accounts_uid_foreign` (`uId` ASC),
  KEY `accounts_currencyid_foreign` (`currencyId` ASC),
  KEY `accounts_acctypeid_foreign` (`accTypeId` ASC),
  KEY `accounts_parentid_foreign` (`parentId` ASC),
  KEY `accounts_areaid_foreign` (`areaId` ASC),
  CONSTRAINT `accounts_acctypeid_foreign` FOREIGN KEY (`accTypeId`) REFERENCES `acctype` (`accTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_areaid_foreign` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_parentid_foreign` FOREIGN KEY (`parentId`) REFERENCES `accparent` (`parentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucherId` BIGINT(20) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `voucherDate` DATE NOT NULL,
  `voucherPrefix` VARCHAR(255) NOT NULL,
  `remarks` TEXT NULL,
  `drAcId` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `crAcId` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `debit` DOUBLE NOT NULL DEFAULT 0,
  `credit` DOUBLE NOT NULL DEFAULT 0,
  `debitSR` DOUBLE NOT NULL DEFAULT 0,
  `creditSR` DOUBLE NOT NULL DEFAULT 0,
  `uId` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`voucherId` ASC),
  KEY `vouchers_dracid_foreign` (`drAcId` ASC),
  KEY `vouchers_cracid_foreign` (`crAcId` ASC),
  KEY `vouchers_uid_foreign` (`uId` ASC),
  CONSTRAINT `vouchers_cracid_foreign` FOREIGN KEY (`crAcId`) REFERENCES `accounts` (`acId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vouchers_dracid_foreign` FOREIGN KEY (`drAcId`) REFERENCES `accounts` (`acId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vouchers_uid_foreign` FOREIGN KEY (`uId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`,`name`,`email`,`usertype`,`phone`,`address`,`email_verified_at`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`two_factor_confirmed_at`,`remember_token`,`current_team_id`,`profile_photo_path`,`created_at`,`updated_at`) VALUES (1,'admin','admin@gmail.com','admin','+923346013608','Moza Wan Chattah',NULL,'$2y$12$7W1r0rwebfloKOYJvtzZdObM9EdhF96wMRhzmL1Ra.L7m9UQHMUq2',NULL,NULL,NULL,'MbzSEHEfgv8VjH1O1B1GI8DRXXLbSG066ogTsU60V75oq12D3U3lMBfj7OOt',NULL,NULL,'2024-11-12 06:40:13','2024-11-12 06:40:13'),(2,'user1','user1@gmail.com','user','+923346013608','Moza Wan Chattah',NULL,'$2y$12$lIdweM8XLVfIlY3106WoZ.p8cXPLhiLRTCPxA8a1n36x04/WBt1pK',NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-13 06:26:33','2024-11-13 06:26:33');

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`areaId`,`areaTitle`,`uId`,`created_at`,`updated_at`) VALUES (1,'MULTAN',1,'2024-11-12 06:41:13','2024-11-12 06:41:13'),(2,'LAHORE',1,'2024-11-14 06:44:38','2024-11-14 06:44:38'),(3,'ISLAMABAD',1,'2024-11-14 06:44:43','2024-11-14 06:44:43'),(4,'KARACHI',1,'2024-11-14 06:44:47','2024-11-14 06:44:47'),(5,'RAWALPINDI 2',1,'2024-11-14 06:44:53','2024-11-16 07:16:21'),(6,'RAWALPINDI',1,'2024-11-16 07:16:33','2024-11-16 07:16:33');

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currencyId`,`currencyTitle`,`uId`,`created_at`,`updated_at`) VALUES (1,'PKR',1,'2024-11-12 06:40:44','2024-11-12 06:40:44'),(2,'SAR',1,'2024-11-14 06:40:55','2024-11-14 06:40:55'),(3,'USD',1,'2024-11-14 06:40:58','2024-11-14 06:40:58'),(4,'UAE',1,'2024-11-14 06:41:02','2024-11-14 06:41:02');

--
-- Dumping data for table `acctype`
--

INSERT INTO `acctype` (`accTypeId`,`accTypeTitle`,`uId`,`created_at`,`updated_at`) VALUES (1,'BANK',1,'2024-11-12 06:41:45','2024-11-16 06:47:09'),(2,'CUSTOMER',1,'2024-11-14 06:41:26','2024-11-14 06:41:31'),(3,'SUPPLIER',1,'2024-11-14 06:41:38','2024-11-14 06:41:38'),(4,'CAPITAL',1,'2024-11-14 06:42:10','2024-11-14 06:42:10'),(5,'REVENUE',1,'2024-11-14 06:42:16','2024-11-14 06:42:16'),(6,'EXPENSE',1,'2024-11-14 06:42:19','2024-11-14 06:42:19'),(9,'Admin Expense',1,'2024-11-16 07:09:12','2024-11-16 07:09:27');

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`,`value`,`expiration`) VALUES ('c525a5357e97fef8d3db25841c86da1a','i:1;',1732087340),('c525a5357e97fef8d3db25841c86da1a:timer','i:1732087340;',1732087340),('e10fd735ad88f21f45ee9e47870c152d','i:1;',1731479321),('e10fd735ad88f21f45ee9e47870c152d:timer','i:1731479321;',1731479321);

--
-- Dumping data for table `accparent`
--

INSERT INTO `accparent` (`parentId`,`accParentTitle`,`accTypeId`,`uId`,`created_at`,`updated_at`) VALUES (1,'CASH & BANKS',1,1,'2024-11-12 06:42:07','2024-11-14 06:42:46'),(2,'PARTIES',2,1,'2024-11-14 06:42:53','2024-11-14 06:42:53'),(3,'VENDORS',3,1,'2024-11-14 06:43:01','2024-11-14 06:43:01'),(4,'CAPITAL & DRAWINGS',4,1,'2024-11-14 06:43:16','2024-11-14 06:43:16'),(5,'SALES & CGS',5,1,'2024-11-14 06:43:41','2024-11-14 06:43:41'),(6,'ADMIN EXPENSES',6,1,'2024-11-14 06:43:50','2024-11-14 06:43:50');

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_09_24_070807_create_personal_access_tokens_table',1),(5,'2024_09_26_064606_create_currency_table',1),(6,'2024_09_26_064623_create_area_table',1),(7,'2024_09_26_064655_create_accType_table',1),(8,'2024_09_26_064659_create_accParent_table',1),(9,'2024_09_26_064710_create_accounts_table',1),(10,'2024_09_26_064726_create_vouchers_table',1),(11,'2024_10_09_160153_add_two_factor_columns_to_users_table',1),(12,'2024_10_10_153823_create_food_table',1),(13,'2024_10_16_171949_create_carts_table',1),(14,'2024_10_16_181215_add_userid_field_to_carts',1),(15,'2024_10_18_154219_create_orders_table',1),(16,'2024_10_25_031747_create_books_table',1);

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) VALUES (2,'App\\Models\\User',2,'API Token','8c6cdda9f1ed34009a3dfd9ba3ef28ab4db024d3adfbeda57391b231f42cb0c6','[\"*\"]',NULL,NULL,'2024-11-16 06:42:49','2024-11-16 06:42:49'),(3,'App\\Models\\User',1,'API Token','7866cf43595e973978eb7c49a0cd64dbf94004dadba25b3a31c1891bea6a34f8','[\"*\"]','2024-11-16 09:04:44',NULL,'2024-11-16 06:43:29','2024-11-16 09:04:44');

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acId`,`acTitle`,`email`,`mobile`,`openingBal`,`CurrentBal`,`uId`,`currencyId`,`accTypeId`,`parentId`,`areaId`,`created_at`,`updated_at`) VALUES (1,'Mustafa',NULL,NULL,0,0,1,1,1,1,1,'2024-11-12 06:42:38','2024-11-12 06:42:38'),(2,'Burhan',NULL,NULL,0,0,1,2,3,3,3,'2024-11-14 06:45:21','2024-11-14 06:45:21'),(3,'Farhand',NULL,NULL,0,0,1,4,2,2,4,'2024-11-14 06:45:41','2024-11-14 06:45:41'),(4,'Muzamil',NULL,NULL,0,0,1,4,3,3,2,'2024-11-14 06:46:09','2024-11-14 06:46:09'),(5,'Raees',NULL,NULL,0,0,1,3,5,5,5,'2024-11-14 06:46:30','2024-11-14 06:46:30'),(6,'Qaiser',NULL,NULL,0,0,1,3,4,4,1,'2024-11-14 06:47:00','2024-11-14 06:47:00'),(7,'Salaman BUTT','salamanbutt@gmail.com','+923346013608',0,0,1,2,9,1,6,'2024-11-16 07:34:37','2024-11-16 07:34:37'),(8,'Noor SB','noorsb@gmail.com','+923346013608',0,0,1,1,1,1,3,'2024-11-16 07:37:52','2024-11-16 07:37:52');

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucherId`,`voucherDate`,`voucherPrefix`,`remarks`,`drAcId`,`crAcId`,`debit`,`credit`,`debitSR`,`creditSR`,`uId`,`created_at`,`updated_at`) VALUES (1,'2024-11-14','CR','Cash Received.',NULL,6,0,1000,0,100,1,'2024-11-12 06:43:32','2024-11-14 06:55:18'),(2,'2024-11-14','CR','Cash Received.',NULL,4,0,2000,0,200,1,'2024-11-12 06:45:26','2024-11-14 07:00:22'),(3,'2024-11-14','CP','Cash Paid.',3,NULL,300,0,30,0,1,'2024-11-12 06:48:38','2024-11-14 07:02:09'),(4,'2024-11-14','CP','Cash Paid.',2,NULL,200,0,20,0,1,'2024-11-14 07:00:47','2024-11-14 07:00:47'),(5,'2024-11-14','JV','Amount Transfered.',5,6,400,400,40,40,1,'2024-11-14 07:01:43','2024-11-14 07:01:43'),(6,'2024-11-14','CP','Cash Paid.',1,NULL,400,0,40,0,1,'2024-11-14 07:05:36','2024-11-14 07:05:51'),(7,'2024-11-14','CR','Cash Received.',NULL,1,0,100,0,10,1,'2024-11-14 07:07:14','2024-11-14 07:07:14'),(8,'2024-11-14','JV','Amount Transfered.',2,1,200,200,20,20,1,'2024-11-14 07:07:55','2024-11-14 07:07:55'),(9,'2024-11-14','JV','Amount Transfered.',1,5,600,600,60,60,1,'2024-11-14 07:08:14','2024-11-14 07:08:14'),(10,'2024-11-16','CR','Cash Received.',NULL,1,0,50,0,5,1,'2024-11-16 06:48:06','2024-11-16 06:48:06'),(11,'2024-11-16','CP','Cash Paid.',6,NULL,40,0,4,0,1,'2024-11-16 06:54:53','2024-11-16 06:54:53'),(12,'2024-11-16','JV','Amount Transferred.',2,3,50,50,5,5,1,'2024-11-16 07:03:35','2024-11-16 07:03:35');
