-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2026 at 03:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2026_01_13_102618_create_personal_access_tokens_table', 1),
(14, '2026_01_13_102708_create_products_table', 1),
(15, '2026_01_13_102709_create_carts_table', 1),
(16, '2026_01_13_102710_create_orders_table', 1),
(17, '2026_01_13_102716_create_order_items_table', 1),
(18, '2026_01_13_103144_add_role_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 999.99, 'pending', '2026-01-13 07:23:03', '2026-01-13 07:23:03'),
(2, 14, 699.99, 'pending', '2026-01-13 08:18:25', '2026-01-13 08:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 999.99, '2026-01-13 07:23:03', '2026-01-13 07:23:03'),
(2, 2, 2, 1, 699.99, '2026-01-13 08:18:25', '2026-01-13 08:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'A powerful laptop for all your needs.', 999.99, 0, '2026-01-13 06:57:01', '2026-01-13 08:13:53'),
(2, 'Smartphone', 'Latest smartphone with amazing features.', 699.99, 24, '2026-01-13 06:57:01', '2026-01-13 08:18:25'),
(3, 'Headphones', 'Noise-cancelling headphones.', 199.99, 50, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(4, 'Keyboard', 'Mechanical keyboard for gamers.', 89.99, 0, '2026-01-13 06:57:01', '2026-01-13 08:14:01'),
(5, 'Mouse', 'Wireless mouse with high precision.', 49.99, 40, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(6, 'quidem numquam reprehenderit', 'Et corrupti porro molestiae architecto blanditiis sapiente. Non ut dolor dolore magni. Est sunt cumque delectus et qui ut quae ea.', 42.08, 38, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(7, 'voluptatibus et magnam', 'Culpa aut voluptatibus et autem qui ipsa magni. Est reiciendis nemo velit vitae mollitia sequi. Ut odio blanditiis sint. Asperiores rem itaque ipsa consequatur tempora.', 708.20, 9, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(8, 'nobis porro quia', 'Dolorem eaque et aliquid non esse nostrum omnis. Voluptates voluptatibus reiciendis laudantium sint aperiam dignissimos voluptas incidunt.', 948.20, 47, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(9, 'eius nisi nam', 'Accusamus quibusdam voluptatem nisi sit ex quae neque qui. Minima quos sapiente et nihil. Mollitia qui rem ut nesciunt explicabo saepe. Ab aut voluptate aliquam quod.', 573.49, 61, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(10, 'delectus velit qui', 'Nisi voluptatum sed cupiditate consequatur illum voluptatem itaque. Est omnis soluta tempora rerum dolore debitis dolorem. Sequi molestiae et aut eum ut qui et aut.', 998.71, 0, '2026-01-13 06:57:01', '2026-01-13 08:14:13'),
(11, 'quidem nobis et', 'Autem officia numquam deserunt similique voluptas quae aut. Reprehenderit qui adipisci et optio cum ipsa rerum. Voluptatum magni sapiente qui et dolores. Consectetur nostrum dolorem earum hic.', 326.70, 61, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(12, 'quia ut eligendi', 'Voluptate consequatur eum unde quibusdam fugiat similique. Omnis necessitatibus et nihil quaerat qui et ducimus. Recusandae doloremque doloremque suscipit necessitatibus harum. Qui voluptatem provident est aut. Cupiditate praesentium et accusamus officia placeat placeat cumque.', 363.30, 79, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(13, 'non earum voluptatibus', 'Itaque maxime voluptatem sint dolor aperiam. Ea sed occaecati sunt est praesentium id. Fugiat voluptatem aut sed et. Sed quod vel veritatis sint eum rem nihil minus.', 955.40, 85, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(14, 'minima sit omnis', 'Enim fugit eum veniam quia reiciendis dolorem nihil reiciendis. Amet tenetur quo rerum enim. Voluptatem tenetur quos minus.', 817.07, 49, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(15, 'enim unde quo', 'Laboriosam vel eaque mollitia accusamus sed. Ducimus iusto doloremque deserunt amet. Voluptatum quos pariatur adipisci quo alias aut voluptatum. Odio illum vel minus deleniti et cum voluptas porro.', 467.63, 84, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(16, 'est quos tempora', 'Facere sed praesentium cumque. Quasi et consequatur minima non placeat officia rerum. Consectetur suscipit iure ab ducimus consequatur consequuntur est.', 193.31, 24, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(17, 'veniam architecto molestiae', 'Omnis esse suscipit omnis tempora sint. Et dicta et dolorem tempore. Sed assumenda magni non.', 109.81, 45, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(18, 'id voluptas atque', 'Et qui quia occaecati consequuntur earum aut nobis et. Nobis repudiandae aperiam et earum. Vel est id facilis et totam dolorem expedita amet. Et eligendi nesciunt accusamus placeat.', 687.17, 50, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(19, 'blanditiis sunt et', 'Vitae soluta accusamus earum atque quia. Ea ut voluptatum accusamus consequuntur ut reiciendis qui. Natus provident corrupti omnis voluptatum repudiandae est non. Asperiores repellendus dicta aperiam quidem nam.', 236.85, 24, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(20, 'dolor praesentium aperiam', 'Provident sed qui est nemo. Labore eum architecto minus reprehenderit ad aperiam nihil. Unde perspiciatis unde voluptas et molestiae necessitatibus eaque. Architecto odio minima est voluptatem nulla quo blanditiis.', 815.67, 30, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(21, 'veritatis eos eum', 'Aut ea numquam dolorum amet nisi. Sed tempore beatae est cum. Magnam vero voluptatem laboriosam esse et molestiae nobis. Aliquid est aut porro sit delectus sit quidem. Non a quidem iste laudantium.', 477.90, 47, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(22, 'quos est commodi', 'Iure corrupti tenetur dolores laudantium. Quos animi nihil porro veniam exercitationem dolorum sit. Voluptatum sint cupiditate aut.', 415.53, 90, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(23, 'officia cumque harum', 'Voluptas facere et doloribus labore. Et aut consequatur eum deleniti ut eligendi qui ex. Repellat et molestiae voluptatem doloribus voluptatem assumenda aliquam.', 307.44, 48, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(24, 'sed voluptas voluptatum', 'Autem similique eius est quis. Dignissimos voluptatem eius omnis.', 558.01, 77, '2026-01-13 06:57:01', '2026-01-13 06:57:01'),
(25, 'natus animi et', 'Voluptas reiciendis minima aperiam et. Rerum molestias aut est vitae officia at at. Est exercitationem totam ut ullam odio asperiores. Libero earum blanditiis et.', 92.63, 2, '2026-01-13 06:57:01', '2026-01-13 06:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DtGasLNZ11P4CHEExMlxqRtyFHkGXeL5p3qJQo5k', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQUpRaktSTk1kQm1mN2xFTlRYQlN3ZTBZVEgwUHBaN25DYWxNN0psbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2ODMxMTgxMjt9fQ==', 1768313888),
('WKMeO3giLkQqnlbehbR89ZPenXlmI8WkJMAfZVeS', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMWtTS3NEMjJpQ1ZSS1o3czBDVFowdDF6WW5rVG9ON1huSWh3NmdiQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMiO3M6NToicm91dGUiO3M6MTI6Im9yZGVycy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE0O30=', 1768313928);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$UUj.hhqAG/sX6T8HWmgNZuRkZWNKVxIcxVKgdzgSxsM2Wfyp.yKHG', 'ZVfx3xoFjspAF3stIvQVSNs5OJVWtAKwwS4A5bSRfaYmokfz0EXZ3sT4kZrX', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'admin'),
(2, 'Regular User', 'user@example.com', NULL, '$2y$12$XB.8bmAuuaIKo65uY6psueN1ZG1ArEPJYbeK1tatPFUIjP9qmTLEe', NULL, '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(3, 'Dejon Considine', 'koreilly@example.net', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'xxGMen19oT', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(4, 'Jadyn Okuneva', 'michel65@example.org', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'RlNa4gmbuY', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(5, 'Prof. Delphia Tremblay DDS', 'katlynn94@example.com', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'OKEhmpirlg', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(6, 'Holly D\'Amore', 'mccullough.destiny@example.net', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'xNl96CPK3W', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(7, 'Dillon Cruickshank', 'candido.donnelly@example.net', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'FLa9qeasrS', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(8, 'Catalina O\'Connell', 'hhyatt@example.com', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'OJOKnv6Y5Y', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(9, 'Carlo Marvin', 'giovanny.murray@example.com', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'UexsLwr8yh', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(10, 'Abbie Cremin', 'fbarrows@example.com', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'oJBmYmKImW', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(11, 'Dr. Sven Krajcik', 'bkrajcik@example.net', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'QvdKC3PSEe', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(12, 'Ms. Lillian Konopelski I', 'htowne@example.com', '2026-01-13 06:57:01', '$2y$12$IMFYZVodrUXqXL8ZHdhhuObOLAKaKhKiemuNU3.B9WWV4Mv8mTGpi', 'U7CesUIAhH', '2026-01-13 06:57:01', '2026-01-13 06:57:01', 'user'),
(13, 'Jerry', 'jerry@gmail.com', NULL, '$2y$12$GtQYPj24MBXyOIj0xRezT.2rLOjOA5OlQMzmiV999IxrHLIcSV1ui', NULL, '2026-01-13 08:08:20', '2026-01-13 08:08:20', 'user'),
(14, 'joyal', 'joyaltony78@gmail.com', NULL, '$2y$12$dcDj/IXT74BRZXDoByr0jucWqBlYLSrqTwODmodeWSSGryHCJsh7u', NULL, '2026-01-13 08:18:08', '2026-01-13 08:18:08', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
