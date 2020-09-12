-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2020 at 04:28 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id_faculty` int(10) UNSIGNED NOT NULL,
  `name_faculty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stt` tinyint(4) NOT NULL DEFAULT 1,
  `create_at_faculty` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id_faculty`, `name_faculty`, `description`, `stt`, `create_at_faculty`) VALUES
(1, 'Công nghệ thông tin', 'Mô tả khoa công nghệ', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `id_faculty` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `email`, `phone`, `addres`, `status`, `create_at`, `id_faculty`) VALUES
(1, 'Trịnh Khắc Tùng', 'khactung7@gmail.com', '0373263978', 'Hà Nội', 1, '2020-09-03 16:38:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_04_02_194100_create_member_table', 1),
(4, '2020_04_02_221132_create_faculty_table', 1),
(5, '2020_04_02_224832_add_id_faculty_table', 1),
(6, '2020_04_05_222100_create_news_table', 1),
(8, '2020_09_07_121719_add_slug_to_news', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `times_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `short_description`, `avatar`, `description`, `status`, `times_at`) VALUES
(1, 'Quế Ngọc Hải dùng tư cách thành viên đội tuyển Quốc gia Việt Nam', 'que-ngoc-hai-dung-tu-cach-thanh-vien-doi-tuyen-quoc-gia-viet-nam-1', 'Xôn xao nhất sáng 3/9 là sự việc trung vệ Quế Ngọc Hải tham gia đóng quảng cáo và chia sẻ một video có dấu hiệu vi phạm bản quyền hình ảnh đội tuyển Việt Nam.', '15991262511544854077-895-hang-loat-thuong-1544853981-width660height440.jpg', '<p style=\"text-align:justify\">Cụ thể, ng&agrave;y 29/8, tr&ecirc;n Facebook c&aacute; nh&acirc;n, cầu thủ Quế Ngọc Hải đăng tải 1 video quảng c&aacute;o cho 1 game về b&oacute;ng đ&aacute; do ch&iacute;nh anh đ&oacute;ng vai ch&iacute;nh. Trong video d&agrave;i 3 ph&uacute;t, Quế Ngọc Hải mặc 1 chiếc &aacute;o giống với &aacute;o đấu của đội tuyển Việt Nam, chỉ kh&ocirc;ng c&oacute; logo nh&agrave; t&agrave;i trợ nhưng vẫn gợi li&ecirc;n tưởng đến h&igrave;nh ảnh khi anh thi đấu cho đội tuyển Quốc gia.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Cầu thủ sinh năm 1993 giới thiệu về bản th&acirc;n bằng c&acirc;u khẳng định: &quot;T&ocirc;i l&agrave; Quế Ngọc Hải, th&agrave;nh vi&ecirc;n đội tuyển Quốc gia Việt Nam&quot;.&nbsp;Ngo&agrave;i ra, video n&agrave;y c&ograve;n sử dụng c&aacute;c h&igrave;nh ảnh li&ecirc;n quan đến bản quyền của đội tuyển Việt Nam, xuất hiện c&aacute;c cầu thủ kh&aacute;c như Trọng Ho&agrave;ng, H&ugrave;ng Dũng, Huy H&ugrave;ng v&agrave; Quang Hải khi tham dự AFF Cup 2018 v&agrave; v&ograve;ng loại World Cup 2022. Những dữ liệu tr&ecirc;n khiến người xem hiểu lầm đội tuyển Việt Nam đ&atilde; tham gia quảng c&aacute;o cho game b&oacute;ng đ&aacute; n&oacute;i tr&ecirc;n.</p>\r\n\r\n<p style=\"text-align:justify\">iệc đơn vị quảng c&aacute;o cố t&igrave;nh sử dụng h&igrave;nh ảnh của đội tuyển Việt Nam, VFF v&agrave; nh&agrave; t&agrave;i trợ của đội tuyển c&oacute; quyền l&ecirc;n tiếng để đ&ograve;i hỏi quyền lợi. Nhưng tuyển thủ Quế Ngọc Hải cũng kh&ocirc;ng tr&aacute;nh được li&ecirc;n quan khi để xảy ra sai s&oacute;t đ&oacute;. Việc cầu thủ tham gia đ&oacute;ng quảng c&aacute;o kiếm th&ecirc;m thu nhập đ&atilde; diễn ra kh&aacute; nhiều v&agrave; kh&ocirc;ng thể phủ nhận những lợi &iacute;ch thiết thực m&agrave; &quot;nghề tay tr&aacute;i&quot; n&agrave;y đem đến cho c&aacute;c ch&agrave;ng trai.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://kenh14cdn.com/2020/9/3/que-ngoc-hai-dtqg-1599107574709374763993-1599107642134263658452.png\" target=\"_blank\" title=\"Quế Ngọc Hải chia sẻ video quảng cáo sử dụng trái phép hình ảnh của đội tuyển Việt Nam (Ảnh chụp màn hình)\"><img alt=\"Quế Ngọc Hải dùng tư cách thành viên đội tuyển Quốc gia Việt Nam đóng quảng cáo vi phạm bản quyền - Ảnh 2.\" id=\"img_af015fe0-ed9e-11ea-af0f-0d49c7ba8353\" src=\"https://kenh14cdn.com/thumb_w/620/2020/9/3/que-ngoc-hai-dtqg-1599107574709374763993-1599107642134263658452.png\" title=\"Quế Ngọc Hải dùng tư cách thành viên đội tuyển Quốc gia Việt Nam đóng quảng cáo vi phạm bản quyền - Ảnh 2.\" /></a></p>\r\n\r\n<p>Quế Ngọc Hải chia sẻ video quảng c&aacute;o sử dụng tr&aacute;i ph&eacute;p h&igrave;nh ảnh của đội tuyển Việt Nam (Ảnh chụp m&agrave;n h&igrave;nh)</p>\r\n\r\n<p style=\"text-align:justify\">Tuy nhi&ecirc;n, Quế Ngọc Hải&nbsp;đ&atilde; d&ugrave;ng tư c&aacute;ch của tuyển thủ Quốc gia để quảng c&aacute;o cho một thương hiệu khai th&aacute;c h&igrave;nh ảnh đội tuyển kh&ocirc;ng hợp ph&aacute;p. Anh ch&agrave;ng đồng thời đ&atilde; d&ugrave;ng Facebook c&aacute; nh&acirc;n để chia sẻ về video quảng c&aacute;o n&agrave;y d&ugrave; trong đ&oacute; chứa những h&igrave;nh ảnh vi phạm bản quyền h&igrave;nh ảnh của đội tuyển Việt Nam. Khi video g&acirc;y ra tranh c&atilde;i, thủ qu&acirc;n đội tuyển Việt Nam đ&atilde; x&oacute;a b&agrave;i đăng tr&ecirc;n Facebook c&aacute; nh&acirc;n.</p>\r\n\r\n<p style=\"text-align:justify\">Sai s&oacute;t l&agrave; do&nbsp;Quế Ngọc Hải&nbsp;bất cẩn hay ch&iacute;nh anh chưa c&oacute; sự hiểu biết đầy đủ về vấn đề bản quyền h&igrave;nh ảnh của đội tuyển.&nbsp;V&agrave; người đại diện, tư vấn truyền th&ocirc;ng cho anh đ&oacute;ng vai tr&ograve; như thế n&agrave;o trong sự việc? Trước khi c&ocirc;ng khai video quảng c&aacute;o đến c&ocirc;ng ch&uacute;ng, đăng tr&ecirc;n Facebook ch&iacute;nh chủ của Quế Ngọc Hải, người đại diện liệu c&oacute; nh&igrave;n nhận được những vấn đề bản quyền n&ecirc;u tr&ecirc;n hay kh&ocirc;ng m&agrave; vẫn để sai s&oacute;t diễn ra?</p>', 1, '2020-09-03 16:44:11'),
(2, 'Video highlight trận Tây Ban Nha - Ukraine. OKE', 'video-highlight-tran-tay-ban-nha-ukraine-oke', 'Sự kiện: UEFA Nations League, Đội tuyển Tây Ban Nha, Sergio Ramos\r\nVideo diễn biến chính trận Tây Ban Nha - Ukraine:', '1599456564Video-highlight-tran-Tay-Ban-Nha---Ukraine-Nguoi-hung-Ramos-ky-tich-than-dong-Barca-119042978_3662293993833043_2023209014419648842_o-1599435634-261-width660height456.jpg', '<p style=\"text-align:justify\">3 ngày sau khi vất vả cầm hòa ĐT Đức 1-1 ở trận ra quân tại bảng A4 UEFA Nations League, <a href=\"https://www.24h.com.vn/doi-tuyen-tay-ban-nha-c48e4405.html\" title=\"ĐT Tây Ban Nha\">ĐT Tây Ban Nha</a> trở về sân nhà tiếp đón đội đầu bảng Ukraine, đội vừa thắng Thụy Sĩ 2-1.</p>\r\n\r\n<p style=\"text-align:justify\">Ngay phút thứ 3 trung vệ đội trưởng Sergio Ramos đã thực hiện thành công quả penalty để mở tỷ số cho “Những chú bò tót” nhờ Ansu-Fati câu lỗi với hậu vệ Sergey Krivtsov trong vòng cấm đội khách. Đến phút 29, ngôi sao thuộc biên chế Real Madrid hoàn tất cú đúp của riêng mình khi đánh đầu tung lưới của thủ thành Andriy Pyatov.</p>\r\n\r\n<p style=\"text-align:justify\">Chỉ 3 phút sau, Ansu-Fati có cú sút xa đẹp mắt để nâng tỷ số lên 3-0 cho ĐT Tây Ban Nha. Với pha lập công này, thần đồng của Barcelona đã đi vào lịch sử khi trở thành cầu thủ trẻ nhất ghi bàn cho “La Roja” ở mốc 17 tuổi 311 ngày.</p>\r\n\r\n<p style=\"text-align:justify\"> </p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Video highlight trận Tây Ban Nha - Ukraine: Người hùng Ramos, kỳ tích thần đồng Barca - 2\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-09-07/Video-ket-qua-bong-da-Tay-Ban-Nha---Ukraine-Nguoi-hung-Ramos-ky-tich-than-dong-Barca-bb18lf5w-1599425058-187-width660height419.jpg\" /></p>\r\n\r\n<p style=\"text-align:justify\"> </p>\r\n\r\n<p style=\"text-align:justify\">Ansu-Fati trở thành cầu thủ trẻ nhất ghi bàn cho ĐT Tây Ban Nha trong lịch sử</p>\r\n\r\n<p style=\"text-align:justify\">Những phút sau đó, ĐT Ukraine của HLV Andriy Shevchenko dù rất cố gắng nhưng không thể gượng dậy. Đội bóng Đông Âu này còn thủng lưới thêm một bàn nữa ở phút 84 sau tình huống dứt điểm một chạm gọn gàng của tân binh Man City Ferran Torres.</p>\r\n\r\n<p style=\"text-align:justify\">Đại thắng 4-0 trước Ukraine, Tây Ban Nha đã có 4 điểm sau 2 trận và chiếm ngôi đầu bảng A4 từ chính đối thủ này. Ở trận đấu cùng giờ, ĐT Đức bị ĐT Thụy Sĩ cầm hòa 1-1, do đó Ukraine xếp thứ 2 với 3 điểm, Đức đã tụt xuống đứng thứ 3 với chỉ 2 điểm và Thụy Sĩ đang tạm xếp bét bảng với chỉ 1 điểm trong tay.</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Chung cuộc: </strong><u>ĐT Tây Ban Nha 4-0 ĐT Ukraine</u> (Tỷ số hiệp 1: 3-0)</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Ghi bàn: </strong>Ramos 3’ (penalty) & 29’, Ansu-Fati 32’, Torres 84’</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Đội hình xuất phát:</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>ĐT Tây Ban Nha </strong>(4-3-3): David de Gea; Jesus Navas, Sergio Ramos, Pau Torres, Sergio Reguilon; Mikel Merino, Rodri, Thiago Alcantara; Dani Olmo, Gerard Moreno, Ansu-Fati</p>\r\n\r\n<p style=\"text-align:justify\"><strong>ĐT Ukraine </strong>(4-3-3): Andriy Pyatov; Oleksandr Tymchyk, Sergey Krivtsov, Mykola Matvyenko, Bogdan Mykhaylichenko; Ihor Kharatin, Ruslan Malinovskiy, Oleksandr Zinchenko; Andriy Yarmolenko, Marlos Bonfim, Roman Yaremchuk</p>', 1, '2020-09-07 12:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', '$2y$10$.WzaRzQrv9dxNUdwv/Lth.D5GyW5DWoj2o8fRPToNXKlZsUZ5Uzhe', 'laHcunKwQcV2jhjZMg1xgktzhooxV43GSljRIgigIgBECVCvT7wRR4bd1ucG', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id_faculty`),
  ADD UNIQUE KEY `faculty_name_faculty_unique` (`name_faculty`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_email_unique` (`email`),
  ADD UNIQUE KEY `member_phone_unique` (`phone`),
  ADD KEY `member_id_faculty_foreign` (`id_faculty`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_title_unique` (`title`),
  ADD UNIQUE KEY `news_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id_faculty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_id_faculty_foreign` FOREIGN KEY (`id_faculty`) REFERENCES `faculty` (`id_faculty`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
