/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - zfm_attendance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zfm_attendance` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `zfm_attendance`;

/*Table structure for table `attendance_details` */

DROP TABLE IF EXISTS `attendance_details`;

CREATE TABLE `attendance_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` bigint(20) unsigned NOT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attendance_details` */

insert  into `attendance_details`(`id`,`attendance_id`,`long`,`lat`,`address`,`photo`,`type`,`created_at`,`updated_at`) values 
(1,1,'52.5065133','13.1445545','Pagaden, Subang','admin-1677230810.jpg','in','2023-02-24 09:26:50','2023-02-24 09:26:50'),
(2,1,'52.5065133','13.1445545','Pagaden, Subang','admin-1677231621.jpg','out','2023-02-24 09:40:21','2023-02-24 09:40:21');

/*Table structure for table `attendances` */

DROP TABLE IF EXISTS `attendances`;

CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attendances` */

insert  into `attendances`(`id`,`user_id`,`status`,`created_at`,`updated_at`) values 
(1,1,1,'2023-02-24 09:26:50','2023-02-24 09:40:21');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2019_08_19_000000_create_failed_jobs_table',1),
(3,'2023_02_24_064658_create_attendances_table',1),
(4,'2023_02_24_064759_create_attendance_details_table',1),
(5,'2019_12_14_000001_create_personal_access_tokens_table',2),
(6,'2014_10_12_100000_create_password_resets_table',3);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('zulfames@gmail.com','$2y$10$1F74ZBEbPXu5kM0KLLi4Wu6QBybPpRDFa3XTARJxLK8z5UX6BzFVm','2023-02-24 14:24:55');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values 
(8,'App\\User',1,'web','ca3bdad1ffe8080169c264bf0276d2292e9213db91d31a705b81014f61e77522','[\"*\"]',NULL,'2023-02-24 14:39:01','2023-02-24 14:39:01');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`is_admin`,`photo`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','zulfadlirizal@gmail.com',NULL,'$2y$10$xLYwpB7Iyms14XJibAt0O.PG3tgKh/3RWSbytu5K7g0FeoThR8Jj2',1,'admin-1677240006.jpg','sut3y0iFQCKtk1aaKmm99XUpHZFdOGm4Eyor0zg5BzQsBctEcq0QZ8gWrKQQ','2023-02-24 08:35:49','2023-02-24 15:01:14'),
(2,'Zulfadli Rizal','zulfames@gmail.com',NULL,'$2y$10$y/d0.M1dulfwvK7NoQvOWeC65egavtm8HqkORAMm1sTQQsDhYwjES',0,'zulfadli-rizal-1677238788.jpg',NULL,'2023-02-24 11:39:48','2023-02-24 11:39:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
