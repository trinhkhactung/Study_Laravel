-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2020 at 05:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

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
  `name_faculty` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stt` tinyint(4) NOT NULL DEFAULT 1,
  `create_at_faculty` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id_faculty`, `name_faculty`, `description`, `stt`, `create_at_faculty`) VALUES
(1, 'Công nghệ thông tin', 'Lập trình', 1, '2020-04-02 22:57:17'),
(2, 'Thiết kế đồ họa', 'Chuyên thiết kế 2D, 3D', 1, '2020-04-02 22:57:33'),
(3, 'TOEIC', 'Đào tạo ngôn ngữ tiếng Anh', 1, '2020-04-02 22:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_faculty` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `id_faculty`, `name`, `email`, `phone`, `addres`, `status`, `create_at`) VALUES
(2, 1, 'Trịnh Khắc Tùng', 'khactung7@gmail.com', '0373263978', 'Hà Nội', 1, '2020-04-02 22:59:41'),
(3, 2, 'Nguyễn Tuấn Anh', 'tuananh@gmail.com', '0989888999', 'Hà Nam', 1, '2020-04-02 22:59:41'),
(17, 2, 'Cao Văn Nam', 'vannam@gmail.com', '0989898098', 'Cao Bằng', 1, '2020-04-03 02:18:21'),
(18, 1, 'Nguyễn Xuân Phúc', 'xuanphuc@gmail.com', '0989878789', 'Hà Nội', 1, '2020-04-03 02:18:54'),
(19, 3, 'Nghiêm Xuân Tú', 'xuantu@gmail.com', '0989786899', 'Quảng Ninh', 1, '2020-04-03 16:47:38'),
(24, 3, 'Cao Văn Minh', 'vanminh@gmail.com', '0989876899', 'Hà Nội', 1, '2020-04-04 13:54:52'),
(27, 1, 'Đoàn Văn Hậu', 'vanhau@gmail.com', '0987563721', 'Hà Nội', 1, '2020-04-05 12:22:08'),
(29, 2, 'Đen Vâu', 'denvau@gmail.com', '0978654123', 'Hà Nội', 1, '2020-04-05 15:40:49'),
(30, 2, 'Tô Văn Lưu', 'vanluu@gmail.com', '0987654321', 'Cao Bằng', 1, '2020-04-05 16:00:25'),
(32, 1, 'Sơn Tùng MTP', 'sontung@gmail.com', '0987845342', 'Thái Bình', 1, '2020-04-05 22:53:09'),
(34, 1, 'Phan Văn Đức', 'vanduc@gmail.com', '098765432', 'Nam Hà - Nghệ An', 1, '2020-04-06 16:14:18');

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
(3, '2020_04_02_194100_create_member_table', 2),
(4, '2020_04_02_221132_create_faculty_table', 3),
(5, '2020_04_02_224832_add_id_faculty_table', 4),
(6, '2020_04_05_222100_create_news_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `times_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `short_description`, `avatar`, `description`, `status`, `times_at`) VALUES
(2, 'Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết', 'Mặc định Windows 10 đã có sẳn Windows Security, tuy nhiên nếu bạn muốn việc bảo mật được tối ưu hơn, hãy sử dụng các phần mềm bản quyền của các hãng antivirus nổi tiếng như Kaspersky, Bitdefender.', '15862922761586110255photo-1-1586100125744992203385.jpg', '<p style=\"text-align:justify\">Ng&agrave;y c&agrave;ng nhiều c&ocirc;ng ty cho ph&eacute;p nh&acirc;n vi&ecirc;n l&agrave;m việc tại nh&agrave; để ngăn ngừa dịch virus corona chủng mới (SARS-CoV-2) l&acirc;y lan. Tuy nhi&ecirc;n, theo c&aacute;c chuy&ecirc;n gia về an ninh mạng th&igrave; khi l&agrave;m việc với m&aacute;y t&iacute;nh tại nh&agrave;, bạn rất dễ bị hacker tấn c&ocirc;ng hơn do kh&ocirc;ng được bảo vệ một c&aacute;ch đầy đủ.</p>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://kenh14cdn.com/2020/4/5/photo-1-1586100125744992203385.jpg\" target=\"_blank\" title=\"\"><img alt=\"Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết - Ảnh 1.\" id=\"img_36fedc70-7751-11ea-b245-49118c38b197\" src=\"https://kenh14cdn.com/thumb_w/620/2020/4/5/photo-1-1586100125744992203385.jpg\" title=\"Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết - Ảnh 1.\" /></a></p>\r\n\r\n<p style=\"text-align:justify\">Đơn giản v&igrave; hiện tại &quot;virus corona&quot; hoặc &quot;Covid-19&quot; l&agrave; những cụm từ được sử dụng nhiều để đ&aacute;nh cắp th&ocirc;ng tin người d&ugrave;ng hoặc c&agrave;i những phần mềm độc hại v&agrave;o thiết bị c&aacute; nh&acirc;n. Những người bị hacker tấn c&ocirc;ng kh&ocirc;ng những đối mặt với rủi ro c&aacute; nh&acirc;n m&agrave; c&oacute; thể trở th&agrave;nh cửa hậu để tin tặc x&acirc;m nhập v&agrave;o hệ thống dữ liệu của tổ chức.</p>\r\n\r\n<p style=\"text-align:justify\"><em>Do đ&oacute;, để tr&aacute;nh việc bị tin tặc lợi dụng, cũng như tự tăng cường bảo mật m&aacute;y t&iacute;nh khi l&agrave;m việc tại nh&agrave;, bạn c&oacute; thể tham khảo một v&agrave;i gợi &yacute; sau đ&acirc;y.</em></p>\r\n\r\n<p style=\"text-align:justify\"><strong>1. Cập nhật c&aacute;c phần mềm c&agrave;i đặt tr&ecirc;n m&aacute;y t&iacute;nh l&ecirc;n phi&ecirc;n bản mới nhất</strong></p>\r\n\r\n<p style=\"text-align:justify\">Đ&acirc;y l&agrave; việc l&agrave;m đầu ti&ecirc;n m&agrave; bạn n&ecirc;n lưu &yacute; v&agrave; thực hiện đầu ti&ecirc;n khi bắt đầu l&agrave;m việc với m&aacute;y t&iacute;nh tại nh&agrave;. Việc kiểm tra, c&agrave;i đặt c&aacute;c bản cập nhật mới cho phần mềm m&igrave;nh thường d&ugrave;ng được xem như l&agrave; một việc l&agrave;m cần thiết nhằm gi&uacute;p đảm bảo c&aacute;c phần mềm n&agrave;y lu&ocirc;n ở trạng th&aacute;i sử dụng tốt nhất.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/images/images/News/nhung-buc-anh-dep-tuyet-voi-ve-tinh-ban.jpg\" style=\"height:413px; width:640px\" /></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">B&ecirc;n cạnh đ&oacute;, việc c&agrave;i đặt phi&ecirc;n bản mới c&ograve;n gi&uacute;p phần mềm khắc phục c&aacute;c lỗi ph&aacute;t sinh ở phi&ecirc;n bản cũ v&agrave; sử dụng th&ecirc;m được c&aacute;c t&iacute;nh năng mới m&agrave; nh&agrave; ph&aacute;t triển bổ sung th&ecirc;m.</p>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://kenh14cdn.com/2020/4/5/photo-2-15861001312451055745614.png\" target=\"_blank\" title=\"Bạn có thể truy cập vào trang web của nhà phát triển để tải và cài đặt phiên bản mới cho phần mềm hoặc sử dụng công cụ Ucheck để thao tác được nhanh hơn.\"><img alt=\"Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết - Ảnh 3.\" id=\"img_3922cde0-7751-11ea-b245-49118c38b197\" src=\"https://kenh14cdn.com/thumb_w/620/2020/4/5/photo-2-15861001312451055745614.png\" title=\"Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết - Ảnh 3.\" /></a></p>\r\n\r\n<p style=\"text-align:justify\">Bạn c&oacute; thể truy cập v&agrave;o trang web của nh&agrave; ph&aacute;t triển để tải v&agrave; c&agrave;i đặt phi&ecirc;n bản mới cho phần mềm hoặc sử dụng c&ocirc;ng cụ&nbsp;<a href=\"https://genk.vn/cap-nhat-phien-ban-moi-nhat-cho-tat-ca-phan-mem-tren-may-tinh-chi-trong-1-thao-tac-20170206080324536.chn\" rel=\"nofollow\" title=\"Ucheck\"><strong>Ucheck</strong></a>&nbsp;để thao t&aacute;c được nhanh hơn.</p>\r\n\r\n<p style=\"text-align:justify\"><strong>2. K&iacute;ch hoạt t&iacute;nh năng x&aacute;c thực hai yếu tố</strong></p>\r\n\r\n<p style=\"text-align:justify\">X&aacute;c thực hai bước l&agrave; phương ph&aacute;p bảo mật cộng th&ecirc;m trước khi truy cập v&agrave;o t&agrave;i khoản. N&oacute; y&ecirc;u cầu bất kỳ ai đăng nhập v&agrave;o t&agrave;i khoản của bạn kh&ocirc;ng những phải c&oacute; mật khẩu m&agrave; c&ograve;n cần m&atilde; truy cập. M&atilde; n&agrave;y c&oacute; thể gửi đến t&agrave;i khoản email của bạn hoặc lấy trong ứng dụng Authentication tr&ecirc;n điện thoại.</p>', 1, '2020-04-06 01:10:55'),
(7, 'Những lưu ý về bảo mật khi làm việc với máy tính tại nhà mà bạn nên biết 1', 'asdasd', '15862922881586290114coder-1-696x418.jpg', '<p>ddqwdwqd</p>', 1, '2020-04-08 03:08:34'),
(8, 'Ngoại hạng Anh lâm nguy: Sếp lớn thông báo tin dữ, Liverpool \"toát mồ hôi\"', 'Video diễn biến chính trận Liverpool - Bournemouth ở vòng 29 giải Ngoại hạng Anh (Bản quyền clip thuộc K+', '15862928741586290981Bien-cang-Ngoai-hang-Anh-Dan-sao-phan-doi-giam-luong-de-mat-1-ty-bang-man-1586051688-576-width660height537.jpg', '<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"color:#c0392b\"><strong>Liverpool </strong></span>đang sống trong những ng&agrave;y th&aacute;ng &quot;s&oacute;ng gi&oacute;&quot;. Họ vừa g&aacute;nh chịu &quot;cơn mưa chỉ tr&iacute;ch&quot; từ dư luận sau khi đ&ograve;i sa thải nhiều nh&acirc;n vi&ecirc;n v&agrave; hưởng trợ cấp từ Ch&iacute;nh phủ Anh&nbsp;để chi trả đến 80% quỹ lương cho c&aacute;c nh&acirc;n vi&ecirc;n khiến BLĐ &quot;The Kop&quot; buộc phải hủy quyết định g&acirc;y tranh c&atilde;i n&agrave;y<img alt=\"\" src=\"/images/images/News/Liverpool-de-hut-vo-dich-Ngoai-hang-Anh-Sep-lon-chot-cau-dieng-nguoi-livb2_okln-1586281289-507-width660height430.jpg\" style=\"height:430px; width:660px\" /></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Ph&aacute;t biểu tr&ecirc;n tờ Daily Mail, người đứng đầu FA cho biết: &quot;B&oacute;ng đ&aacute; đang phải đối mặt với những th&aacute;ch thức ngo&agrave;i sức tưởng tượng&nbsp;với&nbsp;những người điều h&agrave;nh n&oacute;.&nbsp;Đại dịch Covid-19 sẽ k&eacute;o&nbsp;theo những&nbsp;hậu quả kinh tế to lớn v&agrave; khiến tất cả c&aacute;c lĩnh vực kinh doanh sẽ phải g&aacute;nh chịu thiệt hại.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Ch&uacute;ng t&ocirc;i đang đối mặt với nguy cơ mất đi c&aacute;c c&acirc;u lạc bộ v&agrave; giải đấu lớn khi nền t&agrave;i ch&iacute;nh sụp đổ.&nbsp;Nhiều cộng đồng CĐV c&oacute; thể mất đi c&aacute;c c&acirc;u lạc bộ m&agrave; họ y&ecirc;u qu&yacute;.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Trước nghịch cảnh chưa từng c&oacute; n&agrave;y, tất cả c&aacute;c b&ecirc;n li&ecirc;n quan đến lĩnh vực n&agrave;y&nbsp;từ c&aacute;c cầu thủ, người h&acirc;m mộ, c&acirc;u lạc bộ, chủ sở hữu đội b&oacute;ng v&agrave; những nh&agrave; l&atilde;nh đạo c&aacute;c giải đấu&nbsp;cần phải bước l&ecirc;n ph&iacute;a trước v&agrave; chia sẻ g&aacute;nh nặng để giữ cho giải đấu n&agrave;y (Ngoại hạng Anh)&nbsp;được tồn tại.&quot; - &Ocirc;ng Clarke cho biết.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Vị Chủ tịch FA cũng nhấn mạnh&nbsp;rằng một kế hoạch dự ph&ograve;ng cần phải được chuẩn bị nếu m&ugrave;a giải hiện tại kh&ocirc;ng thể ho&agrave;n th&agrave;nh:</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">&quot;Ch&uacute;ng t&ocirc;i phải c&oacute; một kế hoạch để đảm bảo rằng b&oacute;ng đ&aacute; Anh sẽ kh&ocirc;ng bị suy giảm chất lượng nếu m&ugrave;a giải n&agrave;y bị hủy bỏ v&agrave; m&ugrave;a giải tiếp theo cũng bị t&agrave;n ph&aacute; (v&igrave; đại dịch Covid-19).&nbsp;</span></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/images/images/News/Liverpool-de-hut-vo-dich-Ngoai-hang-Anh-Sep-lon-chot-cau-dieng-nguoi-26914316-0-image-a-23_1586270278297-1586281289-404-width660height440.jpg\" style=\"height:440px; width:660px\" /></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Ch&uacute;ng t&ocirc;i vẫn hy vọng&nbsp;kết th&uacute;c m&ugrave;a b&oacute;ng đ&aacute; chuy&ecirc;n nghiệp n&agrave;y trọn vẹn v&igrave; điều đ&oacute;&nbsp;sẽ giải quyết c&aacute;c vấn đề về những suất thăng hạng v&agrave; xuống hạng c&ugrave;ng với đội sẽ&nbsp;được trao tặng&nbsp;danh hiệu v&ocirc; địch.&nbsp;</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Tuy nhi&ecirc;n, vẫn c&oacute; khả năng rất lớn ch&uacute;ng t&ocirc;i kh&ocirc;ng thể kết th&uacute;c m&ugrave;a giải n&agrave;y v&igrave; b&oacute;ng đ&aacute; kh&ocirc;ng phải l&agrave; ưu ti&ecirc;n số 1 của ch&uacute;ng t&ocirc;i&nbsp;m&agrave; đ&oacute; l&agrave;&nbsp;cuộc sống của con người. V&agrave; ch&uacute;ng t&ocirc;i sẽ tu&acirc;n&nbsp;theo sự chỉ đạo của&nbsp;Ch&iacute;nh phủ t&ugrave;y theo diễn biến đại dịch.&quot;</span></p>', 1, '2020-04-08 03:17:36'),
(9, 'Tròn 1 tuần thực hiện giãn cách xã hội, đường phố Hà Nội bất ngờ đông đúc trở lại', 'Sau những ngày đầu thực hiện nghiêm túc việc giãn cách xã hội, chiều ngày 7/4 đường phố Hà Nội lại dường như đông đúc hẳn lên...', '1586333539ddn6083-1586153001030614950087-1586289248480980465830.jpg', '<p><span style=\"font-size:14px\">Ng&agrave;y 7/4, tr&ograve;n 1 tuần H&agrave; Nội thực hiện chỉ thị c&aacute;ch ly to&agrave;n x&atilde; hội của Thủ tướng ch&iacute;nh phủ để ph&ograve;ng chống dịch Covid-19. Nếu như những ng&agrave;y đầu, H&agrave; Nội trở n&ecirc;n lạ lẫm với những&nbsp;<a href=\"https://kenh14.vn/khung-canh-khac-la-cua-ha-noi-thoi-dich-covid-19-nhung-canh-cua-im-phang-phac-nguoi-dan-trum-kin-tap-the-duc-ben-ho-guom-2020032622474758.chn\" target=\"_blank\" title=\"tuyến phố vắng bóng người\">tuyến phố vắng b&oacute;ng người</a>, c&aacute;c ng&ocirc;i nh&agrave; đ&oacute;ng cửa im phăng phắc th&igrave; h&ocirc;m nay, nhiều người lại được phen bất ngờ khi rất nhiều con đường bỗng trở n&ecirc;n đ&ocirc;ng đ&uacute;c lạ thường, d&ugrave; vẫn trong thời gian... c&aacute;ch ly to&agrave;n x&atilde; hội.&nbsp;</span></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/images/images/9209973225145788987805695237761176372248576n-1-15862844936921191075499.jpg\" style=\"height:465px; width:620px\" /></p>\r\n\r\n<p><span style=\"font-size:14px\">Theo quan s&aacute;t, ng&agrave;y 7/4 thời tiết H&agrave; Nội tốt l&ecirc;n so với những ng&agrave;y mưa dầm trước đ&oacute;, c&oacute; nắng v&agrave; ấm &aacute;p. Xung quanh nhiều khu d&acirc;n cư, lượng người đổ ra đường đi bộ, tập v&agrave;i động t&aacute;c thể dục, trẻ em đ&aacute; b&oacute;ng kh&aacute; đ&ocirc;ng. C&aacute; biệt tại khu vực Bờ Hồ, vẫn thấy b&oacute;ng 1,2 đ&ocirc;i trẻ dừng xe m&aacute;y bỏ khẩu trang để chụp ảnh cho nhau, c&oacute; đ&ocirc;i th&igrave; ngồi vỉa h&egrave; c&aacute;c cửa h&agrave;ng đ&oacute;ng cửa uống tr&agrave; sữa tr&ograve; chuyện r&ocirc;m rả...</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/images/images/8-1585993118827351132612-15862874851531397090167.jpg\" style=\"height:413px; width:620px\" /></p>\r\n\r\n<h3 style=\"text-align:center\"><span style=\"font-size:14px\"><strong>C&oacute; tuyến phố bất ngờ đ&ocirc;ng đ&uacute;c trở lại ngay trong những ng&agrave;y c&aacute;ch ly x&atilde; hội</strong></span></h3>\r\n\r\n<p><span style=\"font-size:14px\">Đưa vợ đi si&ecirc;u thị sau gần 1 tuần kh&ocirc;ng ra khỏi nh&agrave;, h&ocirc;m nay, anh Quang L&ecirc; (31 tuổi) kh&ocirc;ng giấu nổi bất ngờ bởi sự đ&ocirc;ng đ&uacute;c tr&ecirc;n đường phố H&agrave; Nội.<em>&nbsp;</em><em>&quot;Được c&ocirc;ng ty cho l&agrave;m việc online, n&ecirc;n h&ocirc;m nay cũng l&agrave; ng&agrave;y thứ 5, thứ 6 li&ecirc;n tiếp t&ocirc;i kh&ocirc;ng ra khỏi nh&agrave;. C&ograve;n nhớ h&ocirc;m đầu ti&ecirc;n thực hiện chỉ thị của Thủ tướng, t&ocirc;i đ&atilde; su&yacute;t kh&ocirc;ng nhận ra H&agrave; Nội thường ng&agrave;y của m&igrave;nh. Đường phố vắng vẻ, xe cộ thưa thớt, h&agrave;ng qu&aacute;n đ&oacute;ng cửa hết loạt. Vắng c&ograve;n hơn cả m&ugrave;ng 1 Tết.</em></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><em>Vậy m&agrave;, h&ocirc;m nay, khi vừa ph&oacute;ng xe ra khỏi ng&otilde; để đưa vợ đi si&ecirc;u thị v&igrave; &quot;cạn lương thực&quot;, 1 lần nữa t&ocirc;i lại su&yacute;t kh&ocirc;ng nhận ra H&agrave; Nội trong những ng&agrave;y c&aacute;ch ly to&agrave;n x&atilde; hội. Đ&ocirc;ng đ&uacute;c như... chưa từng gi&atilde;n c&aacute;ch. Lại l&agrave; khung cảnh &ugrave;n ứ, nhốn nh&aacute;o nơi ng&atilde; tư như từ trước khi c&oacute; chỉ thị số 16. Thật kh&oacute; hiểu, chẳng lẽ mọi người cũng đi si&ecirc;u thị như t&ocirc;i? Cũng kh&ocirc;ng đ&uacute;ng lắm! C&oacute; vẻ kh&aacute; nhiều người đang &quot;thả lỏng&quot; sau nhiều ng&agrave;y phải ở trong nh&agrave;, c&oacute; những cặp đ&ocirc;i c&ograve;n đ&egrave;o nhau như ra đường h&oacute;ng gi&oacute; vậy... Nhưng đang dịch m&agrave; nhỉ, tại sao mọi người lại c&oacute; thể đổ ra đường nhiều đến thế?&quot;</em>, anh Quang L&ecirc; n&oacute;i.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:14px\">Cũng bất ngờ bởi cảnh tượng tr&ecirc;n đường phố H&agrave; Nội ng&agrave;y h&ocirc;m nay, chị Kim Anh (27 tuổi, 1 nh&acirc;n vi&ecirc;n c&ocirc;ng sở ở Thanh Xu&acirc;n) chia sẻ: &quot;<em>H&ocirc;m nay trời nắng n&ecirc;n mọi người đổ ra đường &agrave;? Tất nhi&ecirc;n l&agrave; trừ những người bắt buộc phải đi l&agrave;m v&agrave; c&oacute; việc bất khả kh&aacute;ng, thế nhưng những ng&agrave;y đầu ti&ecirc;n thực hiện c&aacute;ch ly x&atilde; hội, m&igrave;nh thấy hầu hết mọi người đều tu&acirc;n thủ nghi&ecirc;m ngặt, đường phố d&ugrave; c&oacute; l&agrave; v&agrave;o giờ cao điểm cũng rất thưa.</em></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><em>Vậy sao bỗng dưng h&ocirc;m nay lại đ&ocirc;ng đ&uacute;c lạ thường đến thế? C&oacute; những bạn trẻ thậm ch&iacute; c&ograve;n dừng lại một số điểm vắng người để chụp ảnh, miệng kh&ocirc;ng hề đeo khẩu trang. M&igrave;nh cảm thấy kh&oacute; hiểu thật sự. Hay do những ng&agrave;y gần đ&acirc;y, số ca nhiễm Covid-19 mới đang &iacute;t dần n&ecirc;n mọi người bắt đầu chủ quan, kh&ocirc;ng c&ograve;n lo sợ như những ng&agrave;y đầu?&quot;.</em></span></p>', 1, '2020-04-08 15:10:44'),
(10, 'Lực lượng Y tế trắng đêm ở ga Sài Gòn, chờ lấy mẫu xét nghiệm Covid-19 của gần 300 hành khách', 'Việc triển khai thực hiện khai báo y tế và lấy mẫu xét nghiệm virus SARS-CoV-2 đối với khách đi tàu đến ga Sài Gòn từ lúc 0 giờ ngày 1/4 vì vậy lực lượng Y tế phải chuẩn bị mọi thứ từ sớm.', '1586583433img6556-15865711539601042962069-crop-15865730118511427255457.jpg', '<p style=\"text-align:justify\"><span style=\"font-size:14px\">Đến 8h ng&agrave;y 11/4, việc lấy mẫu x&eacute;t nghiệm của tất cả h&agrave;nh kh&aacute;ch v&agrave; nh&acirc;n vi&ecirc;n l&aacute;i t&agrave;u tại ga S&agrave;i G&ograve;n (quận 3, TP. HCM) mới ho&agrave;n tất. Đ&acirc;y l&agrave; lần đầu ti&ecirc;n tất cả h&agrave;nh kh&aacute;ch đến TP. HCM bằng đường sắt (qua ga S&agrave;i G&ograve;n) được tiến h&agrave;nh lấy mẫu x&eacute;t nghiệm virus SARS-CoV-2 nhằm ph&aacute;t hiện, kiểm so&aacute;t kịp thời dịch bệnh Covid-19.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">B&aacute;c sĩ Nguyễn Hồng T&acirc;m - Gi&aacute;m đốc Trung t&acirc;m Kiểm dịch y tế quốc tế TP. HCM, cho biết trung t&acirc;m triển khai thực hiện khai b&aacute;o y tế v&agrave; lấy mẫu x&eacute;t nghiệm virus SARS-CoV-2 đối với kh&aacute;ch đi t&agrave;u về ga S&agrave;i G&ograve;n từ l&uacute;c 0 giờ c&ugrave;ng ng&agrave;y. Để sẵn s&agrave;ng với mọi t&igrave;nh huống trong trường hợp ph&aacute;t hiện c&oacute; dấu hiệu mắc Covid-19, lực lượng Y tế phải chuẩn bị từ sớm, thậm ch&iacute; thức trắng để triển khai việc kiểm tra, lấy mẫu x&eacute;t nghiệm.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Theo b&aacute;c sĩ T&acirc;m, đội ngũ y tế sẽ kiểm tra những th&ocirc;ng tin khai b&aacute;o y tế điện tử của kh&aacute;ch đi t&agrave;u v&agrave; cả nh&acirc;n vi&ecirc;n l&aacute;i t&agrave;u, trường hợp n&agrave;o khai b&aacute;o đạt y&ecirc;u cầu sẽ tiếp tục được lấy mẫu x&eacute;t nghiệm virus SARS-CoV-2. Nếu khai b&aacute;o y tế chưa đạt y&ecirc;u cầu, phải khai b&aacute;o lại đến khi đạt y&ecirc;u cầu.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Đại diện ga S&agrave;i G&ograve;n cho biết, h&ocirc;m nay chỉ c&oacute; 1 chuyến t&agrave;u chở kh&aacute;ch đến ga S&agrave;i G&ograve;n với 299 h&agrave;nh kh&aacute;ch, tất cả đều được kiểm tra y tế v&agrave; lấy mẫu x&eacute;t nghiệm. Tại thời điểm kiểm tra kiểm so&aacute;t dịch, chưa ph&aacute;t hiện trường hợp n&agrave;o c&oacute; th&acirc;n nhiệt cao bất thường.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><img alt=\"\" src=\"/images/images/News/img6493-1586571153944896968083.jpg\" style=\"height:421px; width:1000px\" /></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><em><strong>H&agrave;nh kh&aacute;ch xuống t&agrave;u đứng chờ với khoảng c&aacute;ch 2m khi v&agrave;o kiểm tra y tế, lấy mẫu x&eacute;t nghiệm.</strong></em></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><img alt=\"\" src=\"/images/images/News/img6675-1586571153982669528837.jpg\" style=\"height:667px; width:1000px\" /></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><strong><em>Lực lượng C&ocirc;ng an, d&acirc;n ph&ograve;ng địa phương cũng được tăng cường để hỗ trợ việc kiểm tra y tế, lấy mẫu x&eacute;t nghiệm đối với tất cả h&agrave;nh kh&aacute;ch.</em></strong></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>', 1, '2020-04-11 12:37:13');

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
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD UNIQUE KEY `news_title_unique` (`title`);

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
  MODIFY `id_faculty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
