-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 23, 2021 lúc 11:45 AM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vietproshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Nam', 'nam', '0', NULL, NULL),
(2, 'Áo Nam', 'ao-nam', '1', NULL, NULL),
(3, 'Quần Nam', 'quan-nam', '1', NULL, NULL),
(4, 'Nữ', 'nu', '0', NULL, NULL),
(5, 'Áo Nữ', 'ao-nu', '4', NULL, NULL),
(6, 'Quần Nữ', 'quan-nu', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `infouser`
--

CREATE TABLE `infouser` (
  `users_id` int(10) UNSIGNED NOT NULL,
  `cmt` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `infouser`
--

INSERT INTO `infouser` (`users_id`, `cmt`, `created_at`, `updated_at`) VALUES
(1, '12345678', NULL, NULL),
(2, '124578', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2020_09_04_114656_create_products_table', 2),
(6, '2020_09_04_131926_create_infouser_table', 2),
(59, '2014_10_12_000000_create_users_table', 3),
(60, '2014_10_12_100000_create_password_resets_table', 3),
(61, '2019_08_19_000000_create_failed_jobs_table', 3),
(62, '2020_08_31_133531_create_categories_table', 3),
(63, '2020_09_04_132442_create_info_table', 3),
(64, '2020_09_14_130212_create_product_table', 3),
(65, '2020_09_14_131329_create_order_table', 3),
(66, '2020_09_14_135120_create_order_detail_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `address`, `email`, `phone`, `total`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn Đạt', 'Bắc Cạn', 'vandat@gmail.com', '03658879942', '110000.00', 1, NULL, NULL),
(2, 'Nguyễn Tùng Lâm', 'Bắc Ninh', 'tunglam@gmail.com', '03564478214', '110000.00', 1, NULL, NULL),
(3, 'Võ Văn Minh', 'Ninh Bình', 'vanminh@gmail.com', '03214789547', '110000.00', 2, NULL, NULL),
(4, 'Nguyễn thế Kiên', 'Lạng Sơn', 'thekien@gmail.com', '03525246673', '110000.00', 2, NULL, NULL),
(5, 'Trần Đại Công', 'Văn Giang', 'daicong@gmail.com', '0354879500', '110000.00', 2, NULL, NULL),
(6, 'Pham Duc', 'Hà nội', 'phamduc99yn@gmail.com', '0943437859', '700.00', 1, '2020-12-04 19:50:52', '2020-12-04 19:54:38'),
(7, 'van', 'Hà nội', 'dev03@gmail.com', '0395954444', '700.00', 1, '2020-12-04 20:54:28', '2020-12-13 07:36:36'),
(8, 'Pham Duc', 'Hà nội', '1235blabla@gmail.com', '0943437859', '700.00', 0, '2020-12-05 04:21:14', '2020-12-05 04:21:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `orders_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `name`, `code`, `image`, `price`, `quantity`, `orders_id`, `created_at`, `updated_at`) VALUES
(1, 'Áo khoác', 'AK001', 'ao-khoac.jpg', '100000.00', 1, 1, NULL, NULL),
(2, 'Áo nữ phối viễn', 'AN001', 'ao-nu-phoi-vien.jpg', '150000.00', 2, 1, NULL, NULL),
(3, 'Áo nữ sơ mi cổ đúc', 'AN002', 'ao-nu-so-mi-co-co-duc.jpg', '350000.00', 3, 2, NULL, NULL),
(4, 'Quần kaki đỏ mận', 'KAKI', 'quan-kaki-do-man-qk162-8273.jpg', '350000.00', 4, 3, NULL, NULL),
(5, 'Áo nữ sơ mi chấm bi', 'AN003', 'ao-nu-so-mi-cham-bi.jpg', '350000.00', 5, 3, NULL, NULL),
(6, 'Áo nữ sơ mi chấm bi', 'AN003', 'ao-nu-so-mi-cham-bi.jpg', '350000.00', 1, 6, '2020-12-04 19:50:53', '2020-12-04 19:50:53'),
(7, 'Quần kaki đỏ mận', 'KAKI', 'quan-kaki-do-man-qk162-8273.jpg', '350000.00', 1, 6, '2020-12-04 19:50:53', '2020-12-04 19:50:53'),
(8, 'Áo nữ sơ mi chấm bi', 'AN003', 'ao-nu-so-mi-cham-bi.jpg', '350000.00', 2, 7, '2020-12-04 20:54:29', '2020-12-04 20:54:29'),
(9, 'Áo nữ sơ mi chấm bi', 'AN003', 'ao-nu-so-mi-cham-bi.jpg', '350000.00', 2, 8, '2020-12-05 04:21:14', '2020-12-05 04:21:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `describer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `slug`, `info`, `describer`, `image`, `price`, `featured`, `state`, `categories_id`, `created_at`, `updated_at`) VALUES
(1, 'Áo khoác', 'AK001', 'ao-khoac', 'Áo khoác nam', 'Áo khoác thu đông nam', 'ao-khoac.jpg', '100000.00', 1, 1, 2, NULL, NULL),
(3, 'Áo nữ sơ mi cổ đúc', 'AN002', 'ao-nu-so-mi-co-duc', 'Áo nữ sơ mi có cổ đúc', 'Áo nữ sơ mi có cổ đúc', 'ao-nu-so-mi-co-co-duc.jpg', '350000.00', 1, 1, 5, NULL, NULL),
(4, 'Quần kaki đỏ mận', 'KAKI', 'quan-kaki-do-man', 'Quần kaki đỏ mận', 'Quần kaki đỏ mận', 'quan-kaki-do-man-qk162-8273.jpg', '350000.00', 1, 1, 3, NULL, NULL),
(5, 'Áo nữ sơ mi chấm bi', 'AN003', 'ao-nu-so-mi-cham-bi', 'Áo nữ sơ mi chấm bi', 'Áo nữ sơ mi chấm bi', 'ao-nu-so-mi-cham-bi.jpg', '350000.00', 1, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0395954444',
  `level` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `provider`, `provider_id`, `address`, `phone`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', '$2y$10$tOzoVCz.02AVIEIoeCEe0.jN3.IP99bAOh32MwhdEWt01oDbNNktW', NULL, NULL, NULL, '0395954444', 2, NULL, NULL, NULL),
(2, 'Dev01', 'dev01@gmail.com', '$2y$10$yp9MHL7mIBOjhKX8H6X0guk0gjwWu8mmNF4F0GBLYsxY7u5hx1.hK', NULL, NULL, NULL, '0395954444', 1, NULL, NULL, NULL),
(4, 'Dev02', 'dev03@gmail.com', '$2y$10$T6Q08c5.jKBO2.zaHG1uPuTTQ3bWVadQgncXxx.o/G8WhR.S3Hl/m', NULL, NULL, NULL, '0395954445', 1, NULL, NULL, NULL),
(783, 'Jamey Little II', 'dritchie@hotmail.com', '$2y$10$xxXR.FACMtGAQ59cNvm20ejjR3gtp4WZ7mzabFtnIEPhx/jk9phIO', NULL, NULL, NULL, '597.377.2984', 1, NULL, '2020-10-07 13:05:48', '2020-10-07 13:05:48'),
(454948, 'Colten Nikolaus IV', 'weimann.hillard@goodwin.com', '$2y$10$yIEhOxkePVwZwztjWj01YuTgvR3E.MhMnFKGc.GfYljfAt.FOwt.q', NULL, NULL, NULL, '693-777-6723', 2, NULL, NULL, NULL),
(722305, 'Lorenzo O\'Reilly', 'alivia61@haley.org', '$2y$10$bTFKf/W.iCvq6bXUodB5SuAhHslsSQ9le7JnkCgyHFWukQkvxoXdm', NULL, NULL, NULL, '(269) 887-4814 x000', 1, NULL, NULL, NULL),
(2506156, 'Phạm Đức', NULL, NULL, 'facebook', '2866969760198336', NULL, '0395954444', NULL, NULL, '2020-10-07 09:03:46', '2020-10-07 09:03:46');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `infouser`
--
ALTER TABLE `infouser`
  ADD PRIMARY KEY (`users_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_orders_id_foreign` (`orders_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_categories_id_foreign` (`categories_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `info`
--
ALTER TABLE `info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `infouser`
--
ALTER TABLE `infouser`
  MODIFY `users_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2506157;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_orders_id_foreign` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
