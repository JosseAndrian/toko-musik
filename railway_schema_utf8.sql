-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce_alat_musik
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_user_id_product_id_variation_unique` (`user_id`,`product_id`,`variation`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT 'bi-music-note',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Gitar Akustik','gitar-akustik','bi-music-note-beamed','Koleksi gitar akustik dari berbagai merek ternama dunia.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(2,'Gitar Elektrik','gitar-elektrik','bi-lightning-charge','Gitar elektrik untuk genre rock, jazz, blues, dan metal.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(3,'Bass','bass','bi-music-note','Bass gitar elektrik dan akustik untuk semua level pemain.','2026-07-15 04:46:16','2026-07-15 09:33:15'),(4,'Drum & Perkusi','drum-perkusi','bi-disc','Drum akustik, elektrik, dan alat perkusi lainnya.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(5,'Keyboard & Piano','keyboard-piano','bi-music-note-list','Keyboard portable, digital piano, dan synthesizer.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(6,'Aksesoris','aksesoris','bi-plug','Senar, pick, strap, capo, efek pedal, dan aksesoris lainnya.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(7,'Biola & Violin','biola-violin','bi-vinyl','Biola, viola, cello, dan perlengkapan alat gesek.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(8,'Microphone','microphone','bi-mic','Microphone condenser, dynamic, dan wireless untuk recording & live.','2026-07-15 04:46:16','2026-07-15 04:46:16'),(9,'Soundcard & Mixer','soundcard-mixer','bi-sliders','Audio interface, soundcard USB, dan mixer untuk home studio.','2026-07-15 04:46:16','2026-07-15 04:46:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `is_from_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_bot` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`),
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,'hai admin, saya ingin bertanya',0,0,1,'2026-07-15 05:18:57','2026-07-15 05:39:42'),(2,2,'Halo! Selamat datang di **Musik Store** 🎵🤖\nSaya MusikBot, asisten virtual kami. Berikut yang bisa Anda tanyakan:\n\n🎸 Produk (gitar, drum, keyboard, bass, biola, microphone, soundcard)\n🛒 Cara pesan & checkout\n💳 Pembayaran & konfirmasi\n📦 Pengiriman & tracking\n🔄 Retur & garansi\n📍 Lokasi & jam operasional\n\nKetik pertanyaan Anda, kami siap membantu! 😊',1,0,1,'2026-07-15 05:18:57','2026-07-15 05:41:16'),(3,2,'ada yang bisasaya bantu?',1,0,1,'2026-07-15 05:19:19','2026-07-15 05:41:16'),(4,2,'apakah ada gitar',0,0,1,'2026-07-15 05:19:28','2026-07-15 05:39:42'),(5,2,'Terima kasih telah menghubungi **Musik Store** 🤖\nMaaf, saya belum memahami pertanyaan Anda sepenuhnya.\n\nCoba tanyakan dengan kata kunci seperti:\n• *\"gitar akustik\"*, *\"drum\"*, *\"keyboard\"*\n• *\"cara pesan\"*, *\"cara bayar\"*\n• *\"lokasi toko\"*, *\"jam buka\"*\n• *\"pengiriman\"*, *\"garansi\"*\n\nAtau klik **Hubungi Admin** untuk berbicara langsung dengan tim kami. 😊',1,0,1,'2026-07-15 05:19:28','2026-07-15 05:41:16'),(6,2,'saya sedang mencari gitar',0,0,1,'2026-07-15 05:19:42','2026-07-15 05:39:42'),(7,2,'🎸 **Gitar Akustik** tersedia di Musik Store:\n\n1. <a href=\"http://127.0.0.1:8000/shop/yamaha-f310-acoustic-guitar-672e56\" class=\"bot-product-link\">Yamaha F310 Acoustic Guitar</a> — <strong>Rp 1.500.000</strong>\n\nLihat semua koleksi: [Produk → Gitar Akustik](http://127.0.0.1:8000/shop?category=1)',1,0,1,'2026-07-15 05:19:42','2026-07-15 05:41:16'),(8,2,'hi',0,0,0,'2026-07-15 05:40:04','2026-07-15 05:40:04'),(9,2,'saya cari gitar',0,0,0,'2026-07-15 05:40:43','2026-07-15 05:40:43'),(10,2,'saya cari gitar',0,0,0,'2026-07-15 05:41:16','2026-07-15 05:41:16');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_08_19_000000_create_failed_jobs_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1),(3,'2024_01_01_000001_create_users_table',1),(4,'2024_01_01_000002_create_categories_table',1),(5,'2024_01_01_000003_create_products_table',1),(6,'2024_01_01_000004_create_carts_table',1),(7,'2024_01_01_000005_create_orders_table',1),(8,'2024_01_01_000006_create_order_details_table',1),(9,'2024_01_01_000007_create_payments_table',1),(10,'2026_05_10_174251_add_variations_to_tables',1),(11,'2026_05_10_175800_add_price_to_carts_table',1),(12,'2026_05_10_175813_add_price_to_carts_table',1),(13,'2026_05_10_184910_fix_cart_unique_index',1),(14,'2026_05_11_220000_create_reviews_table',1),(15,'2026_05_11_230000_create_messages_table',1),(16,'2026_07_15_112325_add_is_bot_to_messages_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,'Yamaha F310 Acoustic Guitar',NULL,1500000.00,1,1500000.00,'2026-01-04 18:00:00','2026-01-04 18:00:00'),(3,2,6,'Fender Stratocaster Player Series',NULL,12500000.00,1,12500000.00,'2026-01-14 18:00:00','2026-01-14 18:00:00'),(4,3,15,'Yamaha DTX402K Electronic Drum Set',NULL,6500000.00,1,6500000.00,'2026-02-02 18:00:00','2026-02-02 18:00:00'),(7,5,20,'Casio CT-X700 Portable Keyboard',NULL,2800000.00,1,2800000.00,'2026-02-21 18:00:00','2026-02-21 18:00:00'),(16,10,37,'Behringer C-1 Condenser Microphone',NULL,850000.00,1,850000.00,'2026-04-09 18:00:00','2026-04-09 18:00:00'),(24,15,7,'Ibanez GRG170DX Electric Guitar',NULL,3200000.00,1,3200000.00,'2026-05-18 18:00:00','2026-05-18 18:00:00'),(26,16,33,'Mandalika Biola 4/4 Full Size',NULL,850000.00,1,850000.00,'2026-05-25 18:00:00','2026-05-25 18:00:00'),(29,18,1,'Yamaha F310 Acoustic Guitar',NULL,1500000.00,1,1500000.00,'2026-06-07 18:00:00','2026-06-07 18:00:00'),(41,25,20,'Casio CT-X700 Portable Keyboard',NULL,2800000.00,1,2800000.00,'2026-07-15 12:42:53','2026-07-15 12:42:53'),(42,26,33,'Mandalika Biola 4/4 Full Size',NULL,850000.00,1,850000.00,'2026-07-15 12:46:14','2026-07-15 12:46:14'),(43,27,45,'Dolphin Sound R4 USB Audio Interface',NULL,450000.00,1,450000.00,'2026-07-15 12:58:47','2026-07-15 12:58:47'),(44,27,42,'Focusrite Scarlett 2i2 3rd Gen',NULL,2800000.00,1,2800000.00,'2026-07-15 12:58:47','2026-07-15 12:58:47'),(45,28,15,'Yamaha DTX402K Electronic Drum Set',NULL,6500000.00,1,6500000.00,'2026-07-15 13:03:50','2026-07-15 13:03:50'),(46,29,37,'Behringer C-1 Condenser Microphone',NULL,850000.00,1,850000.00,'2026-07-15 13:24:17','2026-07-15 13:24:17'),(47,30,45,'Dolphin Sound R4 USB Audio Interface',NULL,450000.00,1,450000.00,'2026-07-15 13:25:08','2026-07-15 13:25:08'),(48,31,42,'Focusrite Scarlett 2i2 3rd Gen',NULL,2800000.00,1,2800000.00,'2026-07-15 13:29:53','2026-07-15 13:29:53'),(49,32,47,'VALETON GP200','VALETON GP200R',5800000.00,1,5800000.00,'2026-07-16 05:53:51','2026-07-16 05:53:51');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `shipping_address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `payment_method` enum('transfer_bank','cod') NOT NULL DEFAULT 'transfer_bank',
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(15,2) NOT NULL,
  `status` enum('pending','paid','processing','shipped','completed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_code_unique` (`order_code`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD-20260105-49F1E3',2,'Jl. Contoh Alamat No. 73, Depok','086799865199','Depok','Jawa Barat','23495','transfer_bank',1860000.00,25000.00,1885000.00,'completed',NULL,'2026-01-04 18:00:00','2026-01-04 18:00:00'),(2,'ORD-20260115-6535B5',2,'Jl. Contoh Alamat No. 74, Jakarta Selatan','081974881030','Jakarta Selatan','DKI Jakarta','91367','transfer_bank',12500000.00,30000.00,12530000.00,'completed',NULL,'2026-01-14 18:00:00','2026-01-14 18:00:00'),(3,'ORD-20260203-A898D7',2,'Jl. Contoh Alamat No. 113, Bogor','084429304912','Bogor','Jawa Barat','60696','transfer_bank',6500000.00,15000.00,6515000.00,'completed',NULL,'2026-02-02 18:00:00','2026-02-02 18:00:00'),(4,'ORD-20260212-97DC31',2,'Jl. Contoh Alamat No. 100, Bekasi','085453573542','Bekasi','Jawa Barat','91192','transfer_bank',4350000.00,20000.00,4370000.00,'completed',NULL,'2026-02-11 18:00:00','2026-02-11 18:00:00'),(5,'ORD-20260222-B0DBA9',2,'Jl. Contoh Alamat No. 41, Depok','086426647857','Depok','Jawa Barat','82190','transfer_bank',3085000.00,20000.00,3105000.00,'completed',NULL,'2026-02-21 18:00:00','2026-02-21 18:00:00'),(6,'ORD-20260307-340351',2,'Jl. Contoh Alamat No. 41, Tangerang','085281578004','Tangerang','Banten','56681','transfer_bank',6500000.00,20000.00,6520000.00,'completed',NULL,'2026-03-06 18:00:00','2026-03-06 18:00:00'),(7,'ORD-20260314-7ED7C2',2,'Jl. Contoh Alamat No. 189, Bandung','084198360784','Bandung','Jawa Barat','56158','transfer_bank',12300000.00,0.00,12300000.00,'completed',NULL,'2026-03-13 18:00:00','2026-03-13 18:00:00'),(8,'ORD-20260325-3B6C96',2,'Jl. Contoh Alamat No. 103, Jakarta Selatan','082124280053','Jakarta Selatan','DKI Jakarta','13454','transfer_bank',2560000.00,30000.00,2590000.00,'shipped',NULL,'2026-03-24 18:00:00','2026-03-24 18:00:00'),(9,'ORD-20260402-FC0678',2,'Jl. Contoh Alamat No. 171, Depok','089438916009','Depok','Jawa Barat','53136','transfer_bank',2920000.00,25000.00,2945000.00,'completed',NULL,'2026-04-01 18:00:00','2026-04-01 18:00:00'),(10,'ORD-20260410-FA3A61',2,'Jl. Contoh Alamat No. 82, Bogor','081943046643','Bogor','Jawa Barat','90975','transfer_bank',850000.00,25000.00,875000.00,'completed',NULL,'2026-04-09 18:00:00','2026-04-09 18:00:00'),(11,'ORD-20260418-986D9A',2,'Jl. Contoh Alamat No. 38, Bekasi','085547591037','Bekasi','Jawa Barat','44702','transfer_bank',4680000.00,30000.00,4710000.00,'completed',NULL,'2026-04-17 18:00:00','2026-04-17 18:00:00'),(12,'ORD-20260428-D91F1B',2,'Jl. Contoh Alamat No. 23, Tangerang','082293122318','Tangerang','Banten','28861','transfer_bank',8500000.00,20000.00,8520000.00,'shipped',NULL,'2026-04-27 18:00:00','2026-04-27 18:00:00'),(13,'ORD-20260504-76F95C',2,'Jl. Contoh Alamat No. 132, Bandung','089985566154','Bandung','Jawa Barat','75992','transfer_bank',4500000.00,15000.00,4515000.00,'completed',NULL,'2026-05-03 18:00:00','2026-05-03 18:00:00'),(14,'ORD-20260511-011B0C',2,'Jl. Contoh Alamat No. 42, Depok','088934107736','Depok','Jawa Barat','58883','transfer_bank',3450000.00,15000.00,3465000.00,'completed',NULL,'2026-05-10 18:00:00','2026-05-10 18:00:00'),(15,'ORD-20260519-00CC09',2,'Jl. Contoh Alamat No. 68, Jakarta Selatan','084755899894','Jakarta Selatan','DKI Jakarta','37311','transfer_bank',3200000.00,15000.00,3215000.00,'processing',NULL,'2026-05-18 18:00:00','2026-05-18 18:00:00'),(16,'ORD-20260526-3F118D',2,'Jl. Contoh Alamat No. 173, Bogor','085729010238','Bogor','Jawa Barat','28255','transfer_bank',935000.00,30000.00,965000.00,'completed',NULL,'2026-05-25 18:00:00','2026-05-25 18:00:00'),(17,'ORD-20260603-DE8C20',2,'Jl. Contoh Alamat No. 123, Bekasi','081870184091','Bekasi','Jawa Barat','27523','transfer_bank',3000000.00,15000.00,3015000.00,'completed',NULL,'2026-06-02 18:00:00','2026-06-02 18:00:00'),(18,'ORD-20260608-F9CB98',2,'Jl. Contoh Alamat No. 152, Depok','084195599804','Depok','Jawa Barat','57361','transfer_bank',2470000.00,25000.00,2495000.00,'shipped',NULL,'2026-06-07 18:00:00','2026-06-07 18:00:00'),(19,'ORD-20260615-F34B6F',2,'Jl. Contoh Alamat No. 71, Tangerang','087692719298','Tangerang','Banten','25472','transfer_bank',15000000.00,15000.00,15015000.00,'paid',NULL,'2026-06-14 18:00:00','2026-06-14 18:00:00'),(20,'ORD-20260622-C92419',2,'Jl. Contoh Alamat No. 23, Bandung','086176731917','Bandung','Jawa Barat','93330','transfer_bank',3680000.00,30000.00,3710000.00,'processing',NULL,'2026-06-21 18:00:00','2026-06-21 18:00:00'),(21,'ORD-20260702-66AE93',2,'Jl. Contoh Alamat No. 96, Jakarta Selatan','081620565290','Jakarta Selatan','DKI Jakarta','33664','transfer_bank',360000.00,30000.00,390000.00,'paid',NULL,'2026-07-01 18:00:00','2026-07-01 18:00:00'),(22,'ORD-20260705-17535E',2,'Jl. Contoh Alamat No. 109, Depok','088205118814','Depok','Jawa Barat','15890','transfer_bank',9300000.00,25000.00,9325000.00,'pending',NULL,'2026-07-04 18:00:00','2026-07-04 18:00:00'),(23,'ORD-20260707-3C43F1',2,'Jl. Contoh Alamat No. 159, Bogor','086891728946','Bogor','Jawa Barat','48053','transfer_bank',3800000.00,25000.00,3825000.00,'pending',NULL,'2026-07-06 18:00:00','2026-07-06 18:00:00'),(24,'ORD-20260703-EFF4A6',2,'Jl. Contoh Alamat No. 41, Bekasi','086336699004','Bekasi','Jawa Barat','62744','transfer_bank',2550000.00,0.00,2550000.00,'cancelled',NULL,'2026-07-02 18:00:00','2026-07-02 18:00:00'),(25,'ORD-20260715-D11E12',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17148','cod',2800000.00,50000.00,2850000.00,'cancelled','titip di pos satpam saja pak yalo','2026-07-15 12:42:53','2026-07-15 12:44:51'),(26,'ORD-20260715-6C239D',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',850000.00,50000.00,900000.00,'paid','titip di pos satpam saja','2026-07-15 12:46:14','2026-07-15 12:46:53'),(27,'ORD-20260715-7E9147',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',3250000.00,50000.00,3300000.00,'paid','titip di pos satpam saja pak yalo','2026-07-15 12:58:47','2026-07-15 12:59:48'),(28,'ORD-20260715-6C598A',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',6500000.00,50000.00,6550000.00,'cancelled',NULL,'2026-07-15 13:03:50','2026-07-15 13:26:36'),(29,'ORD-20260715-1C1A97',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',850000.00,50000.00,900000.00,'cancelled','titip di pos satpam saja','2026-07-15 13:24:17','2026-07-15 13:26:33'),(30,'ORD-20260715-41EDE9',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',450000.00,50000.00,500000.00,'paid','titip di pos satpam saja','2026-07-15 13:25:08','2026-07-15 13:26:08'),(31,'ORD-20260715-1D4CB1',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',2800000.00,50000.00,2850000.00,'pending',NULL,'2026-07-15 13:29:53','2026-07-15 13:29:53'),(32,'ORD-20260716-F6A893',2,'Jl. Margonda Raya No. 100, Depok','081234567890','Kota Bks','Jawa Barat','17145','transfer_bank',5800000.00,50000.00,5850000.00,'completed',NULL,'2026-07-16 05:53:51','2026-07-16 05:54:52');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `proof_image` varchar(255) DEFAULT NULL,
  `status` enum('pending','verified','rejected') NOT NULL DEFAULT 'pending',
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_order_id_foreign` (`order_id`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,NULL,'verified','BCA','1234567289','Customer Demo','Transfer via Mandiri','2026-01-05 06:00:00','2026-01-04 18:00:00','2026-01-04 18:00:00'),(2,2,NULL,'verified','BCA','1234564097','Customer Demo','Transfer via Mandiri','2026-01-15 06:00:00','2026-01-14 18:00:00','2026-01-14 18:00:00'),(3,3,NULL,'verified','Mandiri','1234568527','Customer Demo','Transfer via Mandiri','2026-02-03 08:00:00','2026-02-02 18:00:00','2026-02-02 18:00:00'),(4,4,NULL,'verified','Mandiri','1234562268','Customer Demo','Transfer via BCA','2026-02-11 21:00:00','2026-02-11 18:00:00','2026-02-11 18:00:00'),(5,5,NULL,'verified','BCA','1234569737','Customer Demo','Transfer via BCA','2026-02-21 23:00:00','2026-02-21 18:00:00','2026-02-21 18:00:00'),(6,6,NULL,'verified','Mandiri','1234566718','Customer Demo','Transfer via BCA','2026-03-07 04:00:00','2026-03-06 18:00:00','2026-03-06 18:00:00'),(7,7,NULL,'verified','Mandiri','1234561579','Customer Demo','Transfer via Mandiri','2026-03-14 18:00:00','2026-03-13 18:00:00','2026-03-13 18:00:00'),(8,8,NULL,'verified','BCA','1234567102','Customer Demo','Transfer via Mandiri','2026-03-25 01:00:00','2026-03-24 18:00:00','2026-03-24 18:00:00'),(9,9,NULL,'verified','Mandiri','1234565653','Customer Demo','Transfer via Mandiri','2026-04-02 05:00:00','2026-04-01 18:00:00','2026-04-01 18:00:00'),(10,10,NULL,'verified','Mandiri','1234566153','Customer Demo','Transfer via Mandiri','2026-04-10 03:00:00','2026-04-09 18:00:00','2026-04-09 18:00:00'),(11,11,NULL,'verified','Mandiri','1234569350','Customer Demo','Transfer via Mandiri','2026-04-18 07:00:00','2026-04-17 18:00:00','2026-04-17 18:00:00'),(12,12,NULL,'verified','BCA','1234569644','Customer Demo','Transfer via BCA','2026-04-27 20:00:00','2026-04-27 18:00:00','2026-04-27 18:00:00'),(13,13,NULL,'verified','Mandiri','1234565976','Customer Demo','Transfer via Mandiri','2026-05-04 00:00:00','2026-05-03 18:00:00','2026-05-03 18:00:00'),(14,14,NULL,'verified','BCA','1234563719','Customer Demo','Transfer via Mandiri','2026-05-11 09:00:00','2026-05-10 18:00:00','2026-05-10 18:00:00'),(15,15,NULL,'verified','Mandiri','1234561130','Customer Demo','Transfer via BCA','2026-05-19 18:00:00','2026-05-18 18:00:00','2026-05-18 18:00:00'),(16,16,NULL,'verified','BCA','1234563420','Customer Demo','Transfer via Mandiri','2026-05-26 09:00:00','2026-05-25 18:00:00','2026-05-25 18:00:00'),(17,17,NULL,'verified','Mandiri','1234566923','Customer Demo','Transfer via BCA','2026-06-03 01:00:00','2026-06-02 18:00:00','2026-06-02 18:00:00'),(18,18,NULL,'verified','Mandiri','1234561294','Customer Demo','Transfer via BCA','2026-06-08 14:00:00','2026-06-07 18:00:00','2026-06-07 18:00:00'),(19,19,NULL,'pending','Mandiri','1234563598','Customer Demo','Transfer via Mandiri',NULL,'2026-06-14 18:00:00','2026-06-14 18:00:00'),(20,20,NULL,'verified','Mandiri','1234568452','Customer Demo','Transfer via BCA','2026-06-21 21:00:00','2026-06-21 18:00:00','2026-06-21 18:00:00'),(21,21,NULL,'pending','BCA','1234564557','Customer Demo','Transfer via Mandiri',NULL,'2026-07-01 18:00:00','2026-07-01 18:00:00'),(22,26,'payments/d5FXck3alOKvVi9munqTwTND6putYEoUz7hcD3nR.png','verified','BCA','0858804235','Customer Demo',NULL,'2026-07-15 12:47:39','2026-07-15 12:46:53','2026-07-15 12:47:39'),(23,27,'payments/X1JaQ0c6dsfgB8KyOEM8Df5ICwBsxUMWHmE4kWlQ.png','pending','BCA','08588042','Customer Demo',NULL,NULL,'2026-07-15 12:59:48','2026-07-15 12:59:48'),(24,30,'payments/zZaBJeFMf0wltQCI34dqILr9A9FTFDNa7aDKk9lA.png','pending','BCA','08588042','Customer Demo',NULL,NULL,'2026-07-15 13:26:08','2026-07-15 13:26:08'),(25,32,'payments/1ZqWpsmLwlTQO2GR7BqtqS09xhpkeD9ss34L6DY4.png','verified','BCA','08588042','Customer Demo',NULL,'2026-07-16 05:54:28','2026-07-16 05:54:22','2026-07-16 05:54:28');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sold_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Yamaha F310 Acoustic Guitar','yamaha-f310-acoustic-guitar-672e56','Gitar akustik Yamaha F310 memberikan kualitas, desain, dan suara yang sangat baik. Cocok untuk pemula hingga menengah.','[{\"name\":\"Natural\",\"price\":1500000,\"stock\":0,\"image\":null},{\"name\":\"Tobacco Brown Sunburst\",\"price\":1550000,\"stock\":0,\"image\":null}]',1500000.00,0,'products/BkR9pwvJ4CpaQMYC0sMhLdgBOSsVZuz3l2DoqV2I.jpg',1,1,0,'2026-07-15 04:46:16','2026-07-15 05:14:31'),(6,2,'Fender Stratocaster Player Series','fender-stratocaster-player-series-c69049','Gitar elektrik legendaris dengan tone yang jernih dan playability yang nyaman. Made in Mexico.','[{\"name\":\"3-Color Sunburst\",\"price\":12500000,\"stock\":0,\"image\":null},{\"name\":\"Polar White\",\"price\":12500000,\"stock\":0,\"image\":null},{\"name\":\"Tidepool Blue\",\"price\":12800000,\"stock\":0,\"image\":null}]',12500000.00,0,'products/Cqh3xoHbgPWWEgE9bC7lxPAGpRPOLickRbfJZwEG.jpg',1,1,0,'2026-07-15 04:46:16','2026-07-15 05:08:02'),(7,2,'Ibanez GRG170DX Electric Guitar','ibanez-grg170dx-electric-guitar-59e52c','Gitar elektrik Ibanez GRG170DX dengan HSH pickup configuration. Neck tipis dan cepat untuk shredding.','[{\"name\":\"Black Night\",\"price\":3200000,\"stock\":0,\"image\":null},{\"name\":\"Transparent Red Burst\",\"price\":3300000,\"stock\":0,\"image\":null}]',3200000.00,0,'products/TEF7hQRmzQ7s5qD6Ri7M8D2N7kbZAzFakQCcnwkZ.png',0,1,0,'2026-07-15 04:46:16','2026-07-15 05:08:13'),(15,4,'Yamaha DTX402K Electronic Drum Set','yamaha-dtx402k-electronic-drum-set-74ba03','Drum elektrik Yamaha DTX402K, sangat cocok untuk latihan di rumah tanpa mengganggu tetangga. 10 built-in training.','[]',6500000.00,3,'products/rDkl8grWZQKbTMa05ZSZgdiiTyCeY6QwtoUxMWMx.jpg',1,1,0,'2026-07-15 04:46:16','2026-07-15 13:26:36'),(20,5,'Casio CT-X700 Portable Keyboard','casio-ct-x700-portable-keyboard-933632','Keyboard portable Casio CT-X700 dengan AiX Sound Source, 61 keys, 600 tone, dan 195 rhythm.','[]',2800000.00,10,'products/TsVzEV6j5msamH33XXnyCfNSK2z6ZWzCVQSH0zFP.jpg',0,1,1,'2026-07-15 04:46:16','2026-07-15 12:44:51'),(33,7,'Mandalika Biola 4/4 Full Size','mandalika-biola-44-full-size-ff58ff','Biola Mandalika 4/4 full size dengan body spruce, fingerboard ebony. Cocok untuk pemula dan pelajar.','[]',850000.00,11,'products/ZziNrpw0gPDArYU4JhMW9qQvsExsxHcYpGss9aWk.jpg',0,1,0,'2026-07-15 04:46:16','2026-07-15 12:46:14'),(37,8,'Behringer C-1 Condenser Microphone','behringer-c-1-condenser-microphone-978a0f','Microphone condenser studio Behringer C-1 dengan large-diaphragm cardioid. Cocok untuk vokal dan recording.','[]',850000.00,10,'products/zZBi2Fkf8OV4eIp4SHyaXef24UsTeU2o3Z8noiGx.jpg',0,1,0,'2026-07-15 04:46:16','2026-07-15 13:26:33'),(42,9,'Focusrite Scarlett 2i2 3rd Gen','focusrite-scarlett-2i2-3rd-gen-e2db88','Audio interface USB-C Focusrite Scarlett 2i2 dengan 2 input/2 output. Preamp berkualitas studio.','[]',2800000.00,4,'products/4PXoUGxa4jWK3GupLsIlIEgUdAu7zhzRUoxUHE3V.jpg',1,1,0,'2026-07-15 04:46:16','2026-07-15 13:29:53'),(45,9,'Dolphin Sound R4 USB Audio Interface','dolphin-sound-r4-usb-audio-interface-d4f7cf','Audio interface lokal Dolphin Sound R4 dengan 4 input, fitur loopback untuk streaming/podcast.','[]',450000.00,18,'products/n00NHfbJg61dURsNF9rEKLMyzmmVVBP4JYo0M5Nr.png',0,1,0,'2026-07-15 04:46:16','2026-07-15 13:25:08'),(47,6,'VALETON GP200','valeton-gp200-6a576c410ddf6','VALETON GP200, VALETON GP200X. VALETON GP200R','[{\"name\":\"VALETON GP200\",\"price\":5400000,\"stock\":3,\"image\":\"products\\/variations\\/7TZHiU40yhTyjiDdNZO9rYGuxJmEMmWbDR0gGVqk.jpg\"},{\"name\":\"VALETON GP200R\",\"price\":5800000,\"stock\":2,\"image\":\"products\\/variations\\/T8c4fUEBuOSRRJAdfrxoUbRIkNN37tytX4PMZxFd.jpg\"},{\"name\":\"VALETON GP200X\",\"price\":6000000,\"stock\":3,\"image\":\"products\\/variations\\/1w3Tc1W4afzYjD7kcPLSYz8GzyEBS26RtZumFXtN.jpg\"}]',5400000.00,8,'products/variations/7TZHiU40yhTyjiDdNZO9rYGuxJmEMmWbDR0gGVqk.jpg',0,1,1,'2026-07-15 05:17:21','2026-07-16 05:54:52');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  KEY `reviews_order_id_foreign` (`order_id`),
  CONSTRAINT `reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','admin@musikstore.com',NULL,'$2y$10$nZvzKepVOZT2ayNkljxHK.heTpVpK2fGnw1rlG1AnIim8/8R7YoPa',NULL,NULL,'admin',NULL,'2026-07-15 04:46:16','2026-07-15 04:46:16'),(2,'Customer Demo','customer@musikstore.com',NULL,'$2y$10$G8qcPr95xbE9UsvBo.m2quHd18xmFSrX75MwIZJgVsu9TJ2Wn2o92','081234567890','Jl. Margonda Raya No. 100, Depok','customer',NULL,'2026-07-15 04:46:16','2026-07-15 04:46:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-16 17:57:17
