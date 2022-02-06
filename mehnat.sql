-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 06 2022 г., 20:41
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mehnat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE `company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`id`, `name`, `leader`, `adress`, `email`, `website`, `phone`, `created_at`, `updated_at`) VALUES
(4, 'Generika', 'george', 'yakkasaroy', 'george@inbox.ru', 'generika.uz', 998903345431, '2022-02-05 10:01:02', '2022-02-05 10:01:07'),
(5, 'Mehnat', 'Abramov', 'Yunusobod', 'abramov@inbox.ru', 'Mehnat.uz', 998905446787, '2022-02-06 01:32:36', '2022-02-06 01:32:36'),
(7, 'Mehnat.uz', 'Abramov', 'Yunusobod', 'qosimov@inbox.ru', 'Mehnat.uz', 998905446787, '2022-02-06 05:49:48', '2022-02-06 05:49:48');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `passport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `passport`, `surname`, `name`, `patronymic`, `position`, `phone`, `adress`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 'AB6045678', 'Эрназаров', 'Элёр', 'Уйгун угли', 'программист', '998909401041', 'Мирзо улугбек', '2022-02-06 03:05:35', '2022-02-06 10:01:17', 4),
(2, 'AB6034254', 'Эрназаров', 'Элёр', 'Уйгун угли', 'программист', '998909401041', 'Мирзо улугбек', '2022-02-06 03:36:30', '2022-02-06 03:40:49', 5),
(4, 'AB6045678', 'Эрназаров', 'Достон', 'Уйгун угли', 'программист', '998909401041', 'Мирзо улугбек', '2022-02-06 09:18:37', '2022-02-06 09:22:32', 7),
(5, 'AB6545678', 'Шокиров', 'Ахмад', 'Абдулла угли', 'программист', '998909431041', 'Мирзо улугбек', '2022-02-06 10:07:52', '2022-02-06 10:07:52', 7),
(6, 'AB6545673', 'Андрев', 'Саша', 'Абдуллаевич', 'программист', '998909431041', 'Мирзо улугбек', '2022-02-06 11:34:06', '2022-02-06 11:34:06', 5),
(7, 'AB6545773', 'Андрев', 'Саша', 'Абдуллаевич', 'программист', '998909431041', 'Мирзо улугбек', '2022-02-06 11:36:24', '2022-02-06 11:36:24', 5),
(9, 'AB6545373', 'Андревич', 'Саша', 'Абдуллаевич', 'программист', '998909431041', 'Мирзо улугбек', '2022-02-06 12:24:17', '2022-02-06 12:31:47', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_05_083348_company', 2),
(6, '2022_02_05_083428_employee', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', 'dc2c28c9d947f4a7e9b5a65c44df6935aaefa8af76b1ac9e60057bc01931b6c8', '[\"*\"]', NULL, '2022-02-04 10:57:07', '2022-02-04 10:57:07'),
(2, 'App\\Models\\User', 1, 'myapptoken', '6362cdde84ea6958ca5f9b51e6abc6bb9aef26a11224316096beae682a81aa02', '[\"*\"]', '2022-02-06 09:16:08', '2022-02-05 03:11:24', '2022-02-06 09:16:08'),
(3, 'App\\Models\\User', 2, 'myapptoken', 'e4443b1cecd99ea870737245f7d9b498e07ba3705dd2c128acbe80e7cb13b30d', '[\"*\"]', NULL, '2022-02-06 07:19:50', '2022-02-06 07:19:50'),
(4, 'App\\Models\\User', 3, 'myapptoken', 'af4deb6ffc32e7b432b000cdcb31f592d6e67bb89cd44b5a104295e6981b9ecc', '[\"*\"]', NULL, '2022-02-06 07:27:01', '2022-02-06 07:27:01'),
(5, 'App\\Models\\User', 4, 'myapptoken', '91fe1e22f63f61e439f06d60fb02cf36b7aabf257808ccd14e800f839c9856e0', '[\"*\"]', NULL, '2022-02-06 07:27:50', '2022-02-06 07:27:50'),
(6, 'App\\Models\\User', 5, 'myapptoken', '72638bafd99b5209c3bb50225edf6dc204a6b600392ce4a9c132b0b0ba5e4756', '[\"*\"]', NULL, '2022-02-06 07:28:45', '2022-02-06 07:28:45'),
(7, 'App\\Models\\User', 6, 'myapptoken', 'c2ceea5aa7f993b5fe11910f1c8ea59211dc14cfb2885a3ca4a74bf03f6fa555', '[\"*\"]', NULL, '2022-02-06 07:30:17', '2022-02-06 07:30:17'),
(8, 'App\\Models\\User', 7, 'myapptoken', '4c6f1670446ea51af4609da53f6258a58eb7e065df4eaee96b6115b0f7f8d044', '[\"*\"]', NULL, '2022-02-06 08:06:12', '2022-02-06 08:06:12'),
(9, 'App\\Models\\User', 5, 'myapptoken', 'eddefd12a1806726ad159f9fe9c129874358d2be656f115802d0fdcffca6c85e', '[\"*\"]', '2022-02-06 12:35:16', '2022-02-06 09:15:18', '2022-02-06 12:35:16'),
(10, 'App\\Models\\User', 8, 'myapptoken', 'fb414348244c5badbf4765bf51c9268fcb3d20940d5b90e4215c1062c5971961', '[\"*\"]', NULL, '2022-02-06 10:51:34', '2022-02-06 10:51:34'),
(11, 'App\\Models\\User', 8, 'myapptoken', '719c840e2124a7b828b4a9871054281319857cb5f5a0290da44b075a4b534696', '[\"*\"]', NULL, '2022-02-06 10:52:34', '2022-02-06 10:52:34');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `user_type`, `company_id`) VALUES
(1, 'Elyor', 'elyor941004@inbox.ru', NULL, '$2y$10$G3grcCQKPWXCV9kAwdIqNuv.51paE3TZY.j1da4q3oorrA9FzHn42', NULL, '2022-02-04 10:57:07', '2022-02-04 10:57:07', NULL, 0),
(3, 'George', 'george@inbox.ru', NULL, '$2y$10$H/PSflquiM6EGpENJc/FyOE.Eh0ByzT9ApuxHKk14TCReZ0hBWoZK', NULL, '2022-02-06 07:27:01', '2022-02-06 07:27:01', NULL, 4),
(4, 'Alisher', 'mehnat@inbox.ru', NULL, '$2y$10$/gkcPO.siJUT7HNltZ36ludtSuw6qLjuGV9TwjFmZLLBiF0W0ZrQi', NULL, '2022-02-06 07:27:50', '2022-02-06 07:27:50', NULL, 7),
(5, 'Admin', 'admin@inbox.ru', NULL, '$2y$10$UOGV.XFfJSGT2rADHiAq1Ox06CBswrKh8fO6Hs4hpnNnqPSDUVLu6', NULL, '2022-02-06 07:28:45', '2022-02-06 07:28:45', 1, 5),
(8, 'wschool', 'wschool@inbox.ru', NULL, '$2y$10$QWa9nu.Cysesmre/yj9GBuAH/IFcuhQfMgwgLQ1PLp4NGp/fS1U8K', NULL, '2022-02-06 10:51:34', '2022-02-06 10:51:34', NULL, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
