/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.18-MariaDB : Database - siptadahan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`siptadahan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `siptadahan`;

/*Table structure for table `evidence_lists` */

DROP TABLE IF EXISTS `evidence_lists`;

CREATE TABLE `evidence_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) unsigned NOT NULL,
  `barang_bukti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evidence_lists_request_id_foreign` (`request_id`),
  CONSTRAINT `evidence_lists_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `evidence_lists` */

insert  into `evidence_lists`(`id`,`request_id`,`barang_bukti`) values 
(5,1,'senpi'),
(6,1,'payung'),
(7,1,'mouse'),
(8,1,'rumah'),
(26,7,'asdasd');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),
(4,'2019_08_19_000000_create_failed_jobs_table',1),
(5,'2019_12_14_000001_create_personal_access_tokens_table',1),
(6,'2021_03_19_162223_create_sessions_table',1),
(8,'2021_03_27_130645_create_permission_tables',1),
(10,'2021_03_31_093547_create_notifications_table',1),
(12,'2021_03_19_233734_create_requests_table',2),
(13,'2021_04_15_155210_create_prisoners_table',3),
(14,'2021_03_30_001926_create_evidence_lists_table',4);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'App\\Models\\User',1),
(2,'App\\Models\\User',2),
(3,'App\\Models\\User',3),
(4,'App\\Models\\User',4),
(5,'App\\Models\\User',5),
(6,'App\\Models\\User',6),
(7,'App\\Models\\User',7),
(8,'App\\Models\\User',8);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`user_id`,`message`,`status`,`created_at`,`updated_at`) values 
(1,3,'Permohonan nomor Sita/092/QQ disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 00:43:10','2021-04-24 04:06:19'),
(2,3,'Permohonan nomor Perhan/89/UU/01 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 04:03:36','2021-04-24 04:06:19'),
(3,3,'Permohonan nomor Perhan/09/28/Kuhp disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 04:11:59','2021-04-24 11:42:27'),
(4,3,'Permohonan nomor Perhan097756 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 05:44:22','2021-04-24 11:42:27'),
(5,2,'Permohonan nomor SK/Polres/09/23 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 10:38:39','2021-04-24 11:42:27'),
(6,3,'Permohonan nomor SK/Kejaksaan/09/23 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 11:38:17','2021-04-24 11:42:27'),
(7,3,'Permohonan nomor SG/Kejaksaan/09/20 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-24 11:44:55','2021-04-27 15:13:46'),
(8,3,'Permohonan Sita/092/QQ selesai diproses!',1,'2021-04-27 15:26:09','2021-04-27 15:42:42'),
(9,2,'Permohonan nomor SitaGeledah/394/34 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-27 15:41:07','2021-04-27 15:42:42'),
(10,2,'Permohonan nomor SK/Kejaksaan/09/23 disetujui! Silahkan ambil dokumen ke kantor dengan membawa berkas-berkas dan e-ticket.',1,'2021-04-27 21:52:33','2021-04-27 22:21:56');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'Kelola User','web',NULL,NULL),
(2,'Kelola Dashboard','web',NULL,NULL),
(3,'Input Siptadah','web',NULL,NULL),
(4,'Edit Siptadah','web',NULL,NULL),
(5,'Verifikasi Siptadah','web',NULL,NULL),
(6,'Input Tahanan','web',NULL,NULL),
(7,'Edit Tahanan','web',NULL,NULL),
(8,'Verifikasi Tahanan','web',NULL,NULL);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `prisoners` */

DROP TABLE IF EXISTS `prisoners`;

CREATE TABLE `prisoners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `nama_pemohon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal_instansi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_surat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_surat` datetime NOT NULL,
  `nama_tersangka` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` datetime NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `berkas_surat_permohonan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_laporan_polisi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_sp_penyidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_spdp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_penetapan_penahanan_penyidik` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_penetapan_perpanjangan_penahanan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_berita_acara` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0:menunggu, 1:sedang diproses, 2:disetujui, 3:ditolak, 4:selesai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `prisoners` */

/*Table structure for table `requests` */

DROP TABLE IF EXISTS `requests`;

CREATE TABLE `requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `asal_instansi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pemohon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_surat_permohonan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_surat_permohonan` datetime NOT NULL,
  `jenis_permohonan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penyitaan_penggeledahan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_sita_geledah` datetime DEFAULT NULL,
  `berkas_surat_permohonan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_laporan_polisi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_sp_pp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_berita_acara` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_surat_penerimaan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_sp_penyidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_spdp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas_resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pasal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tersangka` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` datetime NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kebangsaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Indonesia',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0:menunggu, 1:sedang diproses, 2:disetujui, 3:ditolak, 4:selesai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requests` */

insert  into `requests`(`id`,`user_id`,`asal_instansi`,`nama_pemohon`,`no_hp`,`no_surat_permohonan`,`tgl_surat_permohonan`,`jenis_permohonan`,`penyitaan_penggeledahan`,`tgl_sita_geledah`,`berkas_surat_permohonan`,`berkas_laporan_polisi`,`berkas_sp_pp`,`berkas_berita_acara`,`berkas_surat_penerimaan`,`berkas_sp_penyidikan`,`berkas_spdp`,`berkas_resume`,`pasal`,`sumber`,`nama_tersangka`,`tempat_lahir`,`tgl_lahir`,`jenis_kelamin`,`kebangsaan`,`alamat`,`agama`,`pekerjaan`,`status`,`created_at`,`updated_at`) values 
(1,3,'Kejaksaan','tatasyus1@gmail.com','0831236302299','Sita/092/QQ','2021-04-23 00:00:00','penyitaan','sudah','2021-04-15 00:00:00',NULL,NULL,NULL,NULL,NULL,'WZiXnB7mP45mQHG9SHgwI63wAx5ivi2ZXG5KQP12.pdf',NULL,NULL,'kuhp/123','reynaldi','reynaldi','kendal','1994-06-22 00:00:00','Laki-laki','Indonesia','Perum Griya Praja Mukti Btn Blok E No 29 Langenharjo Kendal','Katolik','wiraswasta','4','2021-04-24 00:17:35','2021-04-27 15:26:09'),
(7,2,'Polisi','tatas','081231232313','SK/Kejaksaan/09/23','2021-04-22 00:00:00','penyitaan','sudah','2021-04-22 00:00:00',NULL,NULL,NULL,'RD9QN64dde4BD0ZfPCvvJOtCq8RtlNZWF8AnF5rn.docx',NULL,NULL,NULL,NULL,'akuhp/123342','dasdsa','asdas','asd','2017-06-27 00:00:00','Perempuan','Indonesia','adsda','Islam','ad','2','2021-04-27 21:51:29','2021-04-27 21:52:33');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values 
(1,1),
(2,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(4,2),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(5,1),
(6,2),
(6,3),
(6,4),
(6,5),
(6,6),
(7,2),
(7,3),
(7,4),
(7,5),
(7,6),
(8,1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'Admin','web',NULL,NULL),
(2,'Polisi','web',NULL,NULL),
(3,'Kejaksaan','web',NULL,NULL),
(4,'BNN','web',NULL,NULL),
(5,'BPOM','web',NULL,NULL),
(6,'Bea Cukai','web',NULL,NULL),
(7,'Dishub','web',NULL,NULL),
(8,'Satpol PP','web',NULL,NULL);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('06yxQjIICOdKtPsJi1r8tyZ30H4r8ao0Q6yrIoNI',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSkJHVU1hNEc0R0dhY0NBZDMzY2VNenZoYUxHRFZpM05tWUx1c05aYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1619593333),
('9JAdeLsG0hU20w7PDz7i9HBxo8rsJ9Fb2YFtx9ue',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSG0ybXVzUnFidlczeWp0bzZnZmJSTFNjVXptZzVnV2xMeW5aTnZ6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1619626331),
('doAiQHPamp9MnlFPUJmGtgdiza4W0JL5LoQbLQAz',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUW85cFc4SER6YXhrRWhSWkt4M0JYa3NPME5BSHV3Nkx2anpZbjNlaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWhhbmFuIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGJHSE5oUUQ4N2NkSTBPMEx5Y2ZPOWUyTVEwNEh6TXFyMjRRTlhwVUcuWGtlWFd6amNQR0NHIjt9',1619541622),
('EEmws3Xj7zQvyJzxp94r15mHMKntVo1f2gN4ReOm',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGRXOE9PMFVDQWE5R09iOFRiWTBsRlhkRjdRc1J6d09Xa3Q5bDh2NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1619626330),
('h0BunpMmqKEehczLnYfQmFq5JDnHqXuhYW0TvHnj',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYlBFcWRwb1VubzJHRTdrY0FmQ2R6MFlOaVdWbXJXR2VLdlZpYVcyYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1619593334);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`remember_token`,`profile_photo_path`,`created_at`,`updated_at`) values 
(1,'Admin Pidana','admin@test.com',NULL,'$2y$10$MZgTKLr1Fl.NxSI.lR.q2uckFujawtVIdie6dWEeY5FcekejVZ8Ti',NULL,NULL,NULL,NULL,'2021-04-23 11:02:03','2021-04-27 12:59:52'),
(2,'Polisi','polisi@test.com',NULL,'$2y$10$bGHNhQD87cdI0O0LycfO9e2MQ04HzMqr24QNXpUG.XkeXWzjcPGCG',NULL,NULL,NULL,NULL,'2021-04-23 13:43:56','2021-04-23 13:43:56'),
(3,'Kejaksaan','kejaksaan@test.com',NULL,'$2y$10$7JmVlBp81WoY/I.NhqNsV.WDED9t7JdIJowUFrAr197DWDrVVSOsm',NULL,NULL,NULL,NULL,'2021-04-23 13:44:28','2021-04-23 13:44:28'),
(4,'BNN','bnn@test.com',NULL,'$2y$10$AKljPtrUw8tqf3y1Z9Z2SOYom4NwUMCzgH40evE/JQ3qeVUMWURGS',NULL,NULL,NULL,NULL,'2021-04-23 13:44:49','2021-04-23 13:44:49'),
(5,'BPOM','bpom@test.com',NULL,'$2y$10$K.yf/k7OcJIDvxugeAAC0eRtvO7zTQcM3Lv9G2WWkGOWpzTLGnWJG',NULL,NULL,NULL,NULL,'2021-04-23 13:45:09','2021-04-23 20:27:28'),
(6,'Bea Cukai','beacukai@test.com',NULL,'$2y$10$0Pv3XwY9NLQgqn136UiDD.iJyRkQSEv9xHwp1sLPMuwToYKUvsmI.',NULL,NULL,NULL,NULL,'2021-04-23 13:45:29','2021-04-23 13:45:29'),
(7,'Dishub','dishub@test.com',NULL,'$2y$10$8WleFkfQn4PvrQPL//wXlupTmM3r2Lyro2.8ZfGKmai8HA.U9sk3G',NULL,NULL,NULL,NULL,'2021-04-23 13:46:01','2021-04-23 13:46:01'),
(8,'Satpol PP','satpolpp@test.com',NULL,'$2y$10$CatRb8S27JkZRfKh.Ixpqe6fB8UfjT.Z5lbj6kvoL3HQ2N.qCf.5i',NULL,NULL,NULL,NULL,'2021-04-23 13:46:25','2021-04-23 13:46:25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
