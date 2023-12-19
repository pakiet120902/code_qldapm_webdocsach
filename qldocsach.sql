-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 19, 2023 lúc 02:48 AM
-- Phiên bản máy phục vụ: 5.7.25
-- Phiên bản PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qldocsach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `manguoidung` int(11) NOT NULL,
  `tennguoidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tendangnhap` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quyenhan` int(11) NOT NULL,
  `khoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`manguoidung`, `tennguoidung`, `tendangnhap`, `matkhau`, `quyenhan`, `khoa`) VALUES
(1, 'Phan Anh Kiệt', 'pak', 'e10adc3949ba59abbe56e057f20f883e\r\n', 1, 0),
(2, 'Phan Anh Kiệt', 'pakiet', 'e10adc3949ba59abbe56e057f20f883e', 1, 0),
(3, 'Nguyễn Trần Ngọc Ngân', 'ntnngan', 'e10adc3949ba59abbe56e057f20f883e', 2, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quangcao`
--

CREATE TABLE `quangcao` (
  `maquangcao` int(11) NOT NULL,
  `tenquangcao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `masach` int(11) NOT NULL,
  `tensach` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tentacgia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `matheloai` int(11) NOT NULL,
  `nhaxuatban` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgayDang` datetime NOT NULL,
  `hinhanh` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kiemduyet` tinyint(4) NOT NULL,
  `manguoidung` int(11) NOT NULL,
  `luotxem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`masach`, `tensach`, `tentacgia`, `matheloai`, `nhaxuatban`, `NgayDang`, `hinhanh`, `kiemduyet`, `manguoidung`, `luotxem`) VALUES
(1, 'Sherlock Holmes', 'Anh Kiệt', 1, 'Kim Đồng', '2023-12-16 22:25:56', 'images/sherlock-holmes-toan-tap.jpg', 1, 2, 34),
(4, 'Ali Baba and the Forty Thieves', 'Arabian Nights', 4, 'Kim Đồng', '2023-12-18 23:29:24', 'images/81Gz0S9.jpg', 1, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `matheloai` int(11) NOT NULL,
  `tentheloai` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`matheloai`, `tentheloai`) VALUES
(1, 'Trinh Thám'),
(3, 'Khoa Học'),
(4, 'Viễn Tưởng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangsach`
--

CREATE TABLE `trangsach` (
  `matrang` int(11) NOT NULL,
  `trangso` int(11) NOT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `masach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trangsach`
--

INSERT INTO `trangsach` (`matrang`, `trangso`, `noidung`, `masach`) VALUES
(1, 1, '<p>Bạn đọc y&ecirc;u th&iacute;ch truyện trinh th&aacute;m thế giới c&oacute; lẽ kh&ocirc;ng ai l&agrave; kh&ocirc;ng biết đến t&ecirc;n tuổi của nh&agrave; văn Conan Doyle (1859 &ndash; 1930), &ldquo;cha đẻ&rdquo; của nh&acirc;n vật th&aacute;m tử lừng lẫy Sherlock Holmes.<br />\r\n<br />\r\nTuy nhi&ecirc;n, kh&ocirc;ng phải ai cũng biết rằng xung quanh việc ra đời những t&aacute;c phẩm li&ecirc;n quan đến nh&agrave; th&aacute;m tử t&agrave;i ba n&agrave;y, bản th&acirc;n t&aacute;c giả của n&oacute; đ&atilde; từng c&oacute; những h&agrave;nh động hết sức ly kỳ, hấp dẫn kh&ocirc;ng k&eacute;m những g&igrave; m&agrave; th&aacute;m tử Sherlock Holmes từng ph&ocirc; diễn.Nguồn gốc t&ecirc;n gọi Sherlock Holmes:Trước đ&acirc;y người ta đ&atilde; dựa theo một nguồn tư liệu để khẳng định rằng: Sherlock l&agrave; t&ecirc;n của một người chơi Cricket danh tiếng (v&agrave;o những năm 70 của thế kỷ XIX).<br />\r\n<br />\r\nNgười n&agrave;y c&oacute; quen biết với Conan Doyle.<br />\r\n<br />\r\nTuy nhi&ecirc;n, sherlock mới chỉ l&agrave; t&ecirc;n ri&ecirc;ng, c&ograve;n họ của nh&acirc;n vật? Nh&agrave; b&aacute;o Anh t&ecirc;n l&agrave; Bill West đ&atilde; vận dung tới nhiều nguồn tư liệu để khẳng địng rằng: C&oacute; một người t&ecirc;n l&agrave; Edwin Holmes, từng ph&aacute;t minh ra hệ thống b&aacute;o động chống kẻ trộm khiến Doyle rất kh&acirc;m phục.</p>\r\n\r\n<p>V&agrave; để b&agrave;y tỏ sự h&acirc;m mộ của m&igrave;nh, nh&agrave; văn đ&atilde; kh&ocirc;ng ngần ngại d&ugrave;ng họ của nh&agrave; ph&aacute;t minh đ&oacute; l&agrave;m t&ecirc;n họ cho nh&acirc;n vật của m&igrave;nh.Vậy l&agrave;, t&ecirc;n của một cầu thủ Cricket v&agrave; họ của một nh&agrave; ph&aacute;t minh s&aacute;ng chế đ&atilde; kết hợp th&agrave;nh t&ecirc;n sherlock holmes.Conan Doyle đ&atilde; từng &ldquo;thủ ti&ecirc;u&rdquo; nh&acirc;n vật y&ecirc;u qu&yacute; của m&igrave;nh:Nhờ những c&acirc;u chuyện ph&aacute; &aacute;n v&ocirc; c&ugrave;ng ly kỳ, hấp dẫn của nh&acirc;n vật th&aacute;m tử t&agrave;i tr&iacute; sherlock holmes m&agrave; Conan Doyle đ&atilde; c&oacute; được một nguồn thu nhập dồi d&agrave;o gi&uacute;p &ocirc;ng nu&ocirc;i sống được cả gia đ&igrave;nh, v&agrave; hơn thế c&ograve;n trở n&ecirc;n một nh&agrave; văn gi&agrave;u c&oacute;.<br />\r\n<br />\r\nTuy nhi&ecirc;n, bởi mất qu&aacute; nhiều thời gian v&agrave; c&ocirc;ng sức với loại truyện trinh th&aacute;m n&agrave;y, mệt mỏi căng thẳng v&igrave; phải theo đuổi những pha truy bắt đầy kịch t&iacute;nh của nh&acirc;n vật, đ&atilde; c&oacute; l&uacute;c Conan Doyle nghĩ đến &ldquo;thủ ti&ecirc;u&rdquo; nh&acirc;n vật, để cho sherlock holmes chết l&agrave; kết th&uacute;c c&acirc;u chuyện phải ng&agrave;y đ&ecirc;m nắn b&oacute;p theo đơn đặt h&agrave;ng của b&aacute;o ch&iacute;.<br />\r\n<br />\r\n&Yacute; đồ của &ocirc;ng đ&atilde; bị mẹ &ocirc;ng kịch liệt phản đối: &ldquo;Con kh&ocirc;ng được giết anh ta! Con kh&ocirc;ng c&oacute; quyền!&rdquo;.</p>\r\n\r\n<p>Khi một tờ tạp ch&iacute; nọ đặt Conan Doyle viết tiếp một loạt truyện nữa về sherlock holmes, nh&agrave; văn đ&atilde; t&igrave;m c&aacute;ch đặt gi&aacute; cao, cốt để họ r&uacute;t lại lời đề nghị.<br />\r\n<br />\r\nKh&ocirc;ng ngờ họ chấp nhận ngay lời đề nghị n&agrave;y kh&ocirc;ng một lời b&agrave;n c&atilde;i.<br />\r\n<br />\r\nThế l&agrave; Conan Doyle kh&ocirc;ng l&agrave;m sao thực hiện được mong muốn của m&igrave;nh.Nhưng rồi một ng&agrave;y nọ, bởi qu&aacute; mệt mỏi, Conan Doyle đ&atilde; ki&ecirc;n quyết chấm dứt cuộc đời của sherlock holmes.<br />\r\n<br />\r\nTrong một truyện ngắn, &ocirc;ng để cho anh ta bất cẩn tiến đến m&eacute;p của một tảng đ&aacute; v&agrave; rơi xuống th&aacute;c nước Reichenbach.<br />\r\n<br />\r\nNgay lập tức, c&ocirc;ng ch&uacute;ng Anh quốc đ&atilde; gửi thư b&agrave;y tỏ sự phẫn nộ đối với t&aacute;c giả.<br />\r\n<br />\r\n&Aacute;p lực của dư luận đối với nh&agrave; văn l&agrave; hết sức nặng nề! Đến năm 1902, gần mười năm sau kể từ ng&agrave;y sherlock holmes bị &ldquo;chết mất x&aacute;c&rdquo;, đột nhi&ecirc;n Conan Doyle cho xuất hiện trở lại nh&acirc;n vật th&aacute;m tử sherlock holmes.<br />\r\n<br />\r\nChỉ c&oacute; điều c&acirc;u chuyện t&aacute;c giả để xảy ra v&agrave;o thời gian trước khi sherlock holmes chết.<br />\r\n<br />\r\nC&ocirc;ng ch&uacute;ng lấy l&agrave;m tiếc v&agrave; tới tấp gửi thư đề nghị t&aacute;c giả h&atilde;y l&agrave;m c&aacute;ch n&agrave;o cho sherlock holmes sống lại.<br />\r\n<br />\r\nChủ một tờ b&aacute;o cũng đề nghị trả nh&agrave; văn năm ngh&igrave;n đ&ocirc; la trường hợp &ocirc;ng nghĩ ra c&aacute;ch để sherlock holmes sống lại.<br />\r\n<br />\r\nThể theo nguyện vọng của đ&ocirc;ng đảo bạn đọc, Conan Doyle đ&atilde; đặt b&uacute;t viết tiếp truyện &ldquo;Ng&agrave;y trở về của sherlock holmes&rdquo; v&agrave; một loạt truyện nữa.<br />\r\n<br />\r\n&Ocirc;ng đ&atilde; mở đầu c&acirc;u chuyện: &ldquo;Mọi chuyện đ&atilde; xảy ra đ&uacute;ng như ch&uacute;ng ta nghĩ.<br />\r\n<br />\r\n<br />\r\nSherlock holmes đ&acirc;u c&oacute; chết khi rơi xuống vực.<br />\r\n<br />\r\nThật ra, anh ta kh&ocirc;ng rơi xuống vực m&agrave; đ&atilde; t&igrave;m c&aacute;ch b&ograve; dọc theo tảng đ&aacute; để tho&aacute;t khỏi tay kẻ th&ugrave;&rdquo;.&ldquo;Th&aacute;m tử&rdquo; Conan Doyle tham gia ph&aacute; &aacute;n.Ch&uacute;ng ta đều biết, giữa cuộc đời v&agrave; trang s&aacute;ch nhiều khi l&agrave; cả một khoảng c&aacute;ch.<br />\r\n<br />\r\nBởi vậy, việc nh&acirc;n vật của Conan Doyle th&agrave;nh c&ocirc;ng trong việc ph&aacute; &aacute;n l&agrave; một chuyện, việc Conan Doyle trực tiếp tham gia ph&aacute; &aacute;n v&agrave; đ&atilde; th&agrave;nh c&ocirc;ng (trong thực tế) lại l&agrave; một chuyện kh&aacute;c.<br />\r\n<br />\r\nN&oacute; đặc biệt c&oacute; &yacute; nghĩa.Chẳng l&agrave;, v&agrave;o năm 1903, tại l&agrave;ng Great Wyrley ở gần Birmingham đ&atilde; xảy ra một vụ &aacute;n lạ l&ugrave;ng.<br />\r\n<br />\r\nH&agrave;ng loạt ngựa, b&ograve;, cừu lăn ra chết.<br />\r\n<br />\r\nQua khảo s&aacute;t, người ta thấy ở bụng v&agrave; cổ họng của những con vật ấy c&oacute; những vết thương lớn.<br />\r\n<br />\r\nCăn cứ v&agrave;o những l&aacute; thư nặc danh, người ta x&aacute;c định thủ phạm l&agrave; George Edalji (con trai &ocirc;ng mục sư Ấn Độ v&agrave; một phụ nữ Anh).<br />\r\n<br />\r\nThời ấy, tinh thần k&igrave; thị chủng tộc rất mạnh ở c&aacute;c địa phương của nước Anh, th&agrave;nh ra cảnh s&aacute;t đ&atilde; thu thập chứng cứ một c&aacute;ch sơ s&agrave;i v&agrave; người ta chẳng băn khoăn g&igrave; m&agrave; kh&ocirc;ng điệu ch&agrave;ng trai ra to&agrave; v&agrave; kết &aacute;n ch&agrave;ng với mức bảy năm t&ugrave; khổ sai.</p>\r\n\r\n<p>Sau khi bị giam cầm &iacute;t l&acirc;u, ch&agrave;ng trai b&egrave;n viết thư nhờ Conan Doyle minh oan cho.<br />\r\n<br />\r\n<br />\r\nVới bằng chứng x&aacute;c đ&aacute;ng về việc ch&agrave;ng trai bị cận thị nặng, kh&ocirc;ng thể n&agrave;o di chuyển ngo&agrave;i đồng trong đ&ecirc;m tối để hạ s&aacute;t h&agrave;ng loạt con vật như vậy được, Conan Doyle đ&atilde; buộc c&aacute;c cơ quan h&agrave;nh ph&aacute;p v&agrave; tư ph&aacute;p phải lưu &yacute;, xem x&eacute;t lại vụ việc n&agrave;y.<br />\r\n<br />\r\nQuả nhi&ecirc;n, qua điều tra về sau, người ta x&aacute;c định được thủ phạm l&agrave; kẻ kh&aacute;c, v&agrave; ch&agrave;ng trai người Ấn lai ấy đ&atilde; được trả tự do v&agrave; danh dự.Cả t&aacute;c giả v&agrave; nh&acirc;n vật đều bất tử.Sự bất tử của sherlock holmes thể hiện ở chỗ: hơn một trăm năm nay, bạn đọc khắp thế giới vẫn lu&ocirc;n tỏ ra y&ecirc;u mến v&agrave; quyến luyến với nh&acirc;n vật n&agrave;y.<br />\r\n<br />\r\nNhớ ng&agrave;y Conan Doyle cho sherlock holmes &ldquo;tạm từ gi&atilde; c&otilde;i đời&rdquo;, tại Lu&acirc;n Đ&ocirc;n đ&atilde; li&ecirc;n tiếp nổ ra c&aacute;c cuộc biểu t&igrave;nh quanh trụ sở của mấy to&agrave; b&aacute;o.<br />\r\n<br />\r\nThậm ch&iacute;, c&oacute; một nh&oacute;m thanh ni&ecirc;n mặc tang phục, đeo bảng đề t&ecirc;n sherlock holmes diễu h&agrave;nh tr&ecirc;n đường phố.<br />\r\n<br />\r\nHiện ở một số nơi, người ta c&ograve;n ngưỡng mộ đến độ th&agrave;nh lập cả &ldquo;bảo t&agrave;ng sherlock holmes&rdquo; cũng như th&agrave;nh lập c&aacute;c đội đặc nhiệm mang t&ecirc;n nh&acirc;n vật th&aacute;m tử t&agrave;i ba n&oacute;i tr&ecirc;n.C&ograve;n về Conan Doyle th&igrave; khỏi phải n&oacute;i sức &ldquo;t&aacute;i sinh&rdquo; kỳ diệu của &ocirc;ng: C&oacute; ai t&iacute;nh được biết bao lần s&aacute;ch của &ocirc;ng được t&aacute;i bản ở khắp nơi tr&ecirc;n tr&aacute;i đất n&agrave;y? Lại nhớ, khi Conan Doyle qua một cơn đau tim đột ngột từ gi&atilde; c&otilde;i đời, thể theo nguyện vọng của &ocirc;ng, b&agrave; vợ Jean Leckie của &ocirc;ng kh&ocirc;ng để tang (v&igrave; Conan Doyle tin tưởng rằng sau khi chết đi, &ocirc;ng vẫn c&ograve;n li&ecirc;n lạc được với b&agrave;).<br />\r\n<br />\r\nNếu n&oacute;i nh&agrave; văn tồn tại bằng t&aacute;c phẩm, th&igrave; c&oacute; nghĩa l&agrave; Conan Doyle c&ograve;n tồn tại m&atilde;i m&atilde;i..</p>\r\n', 1),
(3, 2, '<p>L&agrave;m quen với Sherlock HolmesNăm 1878, t&ocirc;i tốt nghiệp tại trường Đại học Y London, sau đ&oacute; đến Netley dự kh&oacute;a tu nghiệp d&agrave;nh cho c&aacute;c b&aacute;c sỹ qu&acirc;n y.<br />\r\n<br />\r\nHọc xong, t&ocirc;i được bổ nhiệm về trung đo&agrave;n bộ binh Northumberland số 5, khi ấy đang đ&oacute;ng tại Ấn Độ.<br />\r\n<br />\r\nT&ocirc;i chưa kịp tới đơn vị của m&igrave;nh th&igrave; cuộc chiến tranh Afghanistan lần thứ hai b&ugrave;ng nổ.<br />\r\n<br />\r\nĐặt ch&acirc;n l&ecirc;n Bombay, t&ocirc;i được biết đơn vị v&agrave; tới được Kandahar an to&agrave;n.<br />\r\n<br />\r\nTại đ&acirc;y, t&ocirc;i gặp trung đo&agrave;n của m&igrave;nh.T&ocirc;i bị chuyển sang trung đo&agrave;n Berkshires v&agrave; tham dự trận đ&aacute;nh Maiwand.<br />\r\n<br />\r\nTrong trận n&agrave;y, t&ocirc;i bị thương ở vai, nếu kh&ocirc;ng c&oacute; người l&iacute;nh hầu xốc t&ocirc;i l&ecirc;n ngựa v&agrave; đưa về ph&iacute;a sau chiến tuyến, th&igrave; t&ocirc;i đ&atilde; rơi v&agrave;o tay qu&acirc;n địch rồi.Kiệt sức, t&ocirc;i được đưa về bệnh viện hậu phương Peshawar.<br />\r\n<br />\r\nTại đ&acirc;y, t&ocirc;i b&igrave;nh phục dần, v&agrave; l&uacute;c đ&oacute; c&oacute; thể ra sưởi nắng ngo&agrave;i hi&ecirc;n, th&igrave; lại bị thương h&agrave;n.<br />\r\n<br />\r\nTrong h&agrave;ng th&aacute;ng trời, người ta ra sức cứu sống t&ocirc;i; đến ng&agrave;y khỏi bệnh, t&ocirc;i gầy yếu đến nổi Cục qu&acirc;n y phải đưa t&ocirc;i về Anh lập tức.<br />\r\n<br />\r\nMột th&aacute;ng sau, t&ocirc;i đặt ch&acirc;n l&ecirc;n bến cảng Portsmouth, ch&iacute;nh phủ cho t&ocirc;i nghỉ ch&iacute;n th&aacute;ng để lấy lại sức.V&igrave; kh&ocirc;ng c&oacute; b&agrave; con ở Anh n&ecirc;n t&ocirc;i được tự do như gi&oacute; trời, với 11 shillings[1] 6 pence[2] mỗi ng&agrave;y.</p>\r\n\r\n<p>Trong t&igrave;nh cảnh đ&oacute;, t&ocirc;i bị thu h&uacute;t về London với một sức mạnh kh&ocirc;ng cưỡng lại nổi.<br />\r\n<br />\r\nỞ đ&acirc;y, t&ocirc;i sống &iacute;t l&acirc;u tại một kh&aacute;ch sạn, nhưng chẳng bao l&acirc;u t&ocirc;i thấy m&igrave;nh n&ecirc;n đi t&igrave;m một nh&agrave; trọ xuyềnh xo&agrave;ng v&agrave; đỡ tốn k&eacute;m hơn.Đ&uacute;ng v&agrave;o h&ocirc;m t&ocirc;i đi đến quyết định n&agrave;y, khi đang ở một qu&aacute;n rượu th&igrave; bỗng c&oacute; người vỗ vai t&ocirc;i.<br />\r\n<br />\r\nNgoảnh lại, t&ocirc;i nhận ra Stamford, một thanh ni&ecirc;n trước đ&acirc;y l&agrave;m y t&aacute; dưới quyền t&ocirc;i.<br />\r\n<br />\r\nTrước đ&acirc;y, t&ocirc;i chưa bao giờ thật th&acirc;n với Stamford nhưng b&acirc;y giờ t&ocirc;i vồ vập ch&agrave;o đ&oacute;n anh ta v&agrave; gặp t&ocirc;i, Stamford xem chừng cũng hoan hỉ lắm, t&ocirc;i mời anh ta đi ăn trưa tại kh&aacute;ch sạn.<br />\r\n<br />\r\n<br />\r\nCh&uacute;ng t&ocirc;i gọi xe ngựa, v&agrave; trong l&uacute;c chiếc xe chạy, Stamford hỏi t&ocirc;i:- Dạo n&agrave;y ra sao? Tr&ocirc;ng anh gầy qu&aacute;.T&ocirc;i ph&aacute;c qua v&agrave;i n&eacute;t về những bước thăng trầm của m&igrave;nh.</p>\r\n\r\n<p>Chuyện vừa xong th&igrave; xe cũng tới qu&aacute;n ăn.- Khốn khổ! Thế anh t&iacute;nh sao b&acirc;y giờ?- T&ocirc;i định t&igrave;m một nơi ở tiện nghi với một c&aacute;i gi&aacute; phải chăng.- Lạ thật! Anh l&agrave; người thứ hai trong ng&agrave;y h&ocirc;m nay ngỏ với t&ocirc;i c&aacute;i &yacute; ấy.- Ai l&agrave; người thứ nhất?- Một anh ch&agrave;ng l&agrave;m việc tại ph&ograve;ng th&iacute; nghiệm h&oacute;a học ở bệnh viện.<br />\r\n<br />\r\nS&aacute;ng nay, anh ta ph&agrave;n n&agrave;n l&agrave; kh&ocirc;ng t&igrave;m được ai để ở chung hầu giảm được một nửa tiền thu&ecirc; nh&agrave;.- T&ocirc;i cũng vậy.<br />\r\n<br />\r\nT&ocirc;i nghĩ ở chung hay hơn ở một m&igrave;nh.Stamford cầm ly rượu, nh&igrave;n t&ocirc;i với một vẻ kh&oacute; hiểu:- Anh chưa biết Sherlock Holmes.<br />\r\n<br />\r\nC&oacute; thể anh sẽ kh&ocirc;ng th&iacute;ch anh ta.- Anh ta c&oacute; g&igrave; đ&aacute;ng ch&ecirc; tr&aacute;ch?- Ồ! Anh ta c&oacute; những &yacute; kiến hơi kỳ quặc.<br />\r\n<br />\r\nAnh ta nghi&ecirc;n cứu say m&ecirc; cuồng nhiệt một v&agrave;i ng&agrave;nh khoa học.<br />\r\n<br />\r\nC&ograve;n ngo&agrave;i ra, anh ta l&agrave; một người lịch sự, đ&uacute;ng mực.- Sinh vi&ecirc;n Y khoa?- Kh&ocirc;ng, t&ocirc;i kh&ocirc;ng hiểu anh ta định học c&aacute;i g&igrave;; rất giỏi về giải phẫu, về h&oacute;a học, nhưng chưa hề theo học một lớp học ch&iacute;nh quy n&agrave;o.<br />\r\n<br />\r\nAnh ta học theo lối c&oacute;c nhảy, song trong nhiều lĩnh vực, anh ta đ&atilde; thu nhập được một số vốn hiểu biết rộng lớn đến nỗi c&aacute;c gi&aacute;o sư phải kinh ngạc.- Anh kh&ocirc;ng hỏi anh ta định theo ng&agrave;nh nghề n&agrave;o sao?- Đ&oacute; l&agrave; một con người kh&ocirc;ng dễ khơi chuyện, tuy rằng những khi cao hứng, anh ta cũng th&iacute;ch chuyện tr&ograve;.- Nếu phải ở chung với ai, t&ocirc;i muốn đ&oacute; l&agrave; một người ham học v&agrave; y&ecirc;n tĩnh.<br />\r\n<br />\r\nHiện nay t&ocirc;i chưa khỏe n&ecirc;n rất sợ tiếng ồn.<br />\r\n<br />\r\nT&ocirc;i gặp bạn anh bằng c&aacute;ch n&agrave;o?- Anh ta hiện đang ở ph&ograve;ng th&iacute; nghiệm.<br />\r\n<br />\r\nĂn xong, ch&uacute;ng ta sẽ đi đến đấy.Tr&ecirc;n đường đi, Stamford cho t&ocirc;i biết th&ecirc;m một v&agrave;i chi tiết nữa về Sherlock Holmes.- Về Holmes, t&ocirc;i kh&ocirc;ng biết g&igrave; hơn ngo&agrave;i những điều t&ocirc;i hiểu qua c&aacute;c buổi gặp gỡ tại ph&ograve;ng th&iacute; nghiệm.<br />\r\n<br />\r\nCh&iacute;nh anh đ&atilde; đề xuất &yacute; kiến ở chung, may nhờ rủi chịu đấy nh&eacute;!- Nếu kh&ocirc;ng hợp, ch&uacute;ng t&ocirc;i sẽ chia tay nhau.<br />\r\n<br />\r\nNhưng, h&igrave;nh như c&oacute; một l&yacute; do n&agrave;o đ&oacute; khiến anh muốn phủi tay khỏi việc n&agrave;y.<br />\r\n<br />\r\n<br />\r\nT&iacute;nh t&igrave;nh người ấy kh&oacute; chịu đến vậy ư?- Kh&ocirc;ng dễ diễn đạt được c&aacute;i kh&ocirc;ng thể diễn đạt nổi.<br />\r\n<br />\r\nSherlock Holmes c&oacute; t&iacute;nh t&igrave;nh gần như lạnh l&ugrave;ng, sắt đ&aacute;.<br />\r\n<br />\r\nAnh ta rất c&oacute; thể cho một người bạn uống thử một nh&uacute;m alkaloide thực vật loại mới nhất, kh&ocirc;ng phải v&igrave; độc &aacute;c m&agrave; chỉ v&igrave; muốn biết hiệu lực của chất độc ấy như thế n&agrave;o.<br />\r\n<br />\r\nC&ocirc;ng bằng m&agrave; n&oacute;i, t&ocirc;i tin rằng bản th&acirc;n anh ta cũng c&oacute; thể sẽ d&ugrave;ng thử một thử một c&aacute;ch sốt sắng kh&ocirc;ng k&eacute;m.- Thế th&igrave; rất tốt chứ sao?- Đ&uacute;ng, nhưng việc lấy gậy đ&aacute;nh v&agrave;o x&aacute;c chết, th&igrave; phải n&oacute;i l&agrave; qu&aacute;i gở.- Anh ta đ&aacute;nh x&aacute;c chết?- Phải, để xem người ta c&oacute; thể g&acirc;y ra những thương t&iacute;ch như thế n&agrave;o tr&ecirc;n cơ thể một người đ&atilde; chết.<br />\r\n<br />\r\nCh&iacute;nh mắt t&ocirc;i đ&atilde; nh&igrave;n thấy anh ta l&agrave;m như thế.- Vậy m&agrave; hồi n&atilde;y anh n&oacute;i Holmes kh&ocirc;ng học ng&agrave;nh Y?- Kh&ocirc;ng m&agrave;! M&agrave; th&ocirc;i, ta đến nơi rồi, anh tự đ&aacute;nh gi&aacute; nh&acirc;n vật ấy.Ch&uacute;ng t&ocirc;i đi theo một lối hẹp, qua chiếc cửa phụ nhỏ, bước v&agrave;o m&eacute; nh&agrave; của khu bệnh viện lớn.<br />\r\n<br />\r\nGần cuối h&agrave;nh lang c&oacute; một lối rẽ nhỏ, dẫn đến ph&ograve;ng th&iacute; nghiệm h&oacute;a học.<br />\r\n<br />\r\nĐấy l&agrave; một gian ph&ograve;ng cao, c&aacute;c gi&aacute; tr&ecirc;n tường để đầy chai lọ.<br />\r\n<br />\r\nĐ&acirc;y đ&oacute; c&oacute; mấy c&aacute;i b&agrave;n rộng v&agrave; thấp, mặt b&agrave;n bề bộn những b&igrave;nh cổ cong, ống nghiệm, đ&egrave;n hơi với ngọn lửa xanh l&egrave;.<br />\r\n<br />\r\nTrong ph&ograve;ng chỉ c&oacute; mỗi một người đang ch&uacute;i mũi xuống một chiếc b&agrave;n.<br />\r\n<br />\r\nNghe tiếng ch&acirc;n ch&uacute;ng t&ocirc;i, anh ta đảo mắt nh&igrave;n quanh rồi reo l&ecirc;n một tiếng v&agrave; vội v&atilde; đứng l&ecirc;n.- T&ocirc;i t&igrave;m ra rồi! T&ocirc;i t&igrave;m ra rồi!&rdquo; Anh ta reo l&ecirc;n với Stamford v&agrave; hấp tấp đi về ph&iacute;a ch&uacute;ng t&ocirc;i, tay cầm một ống nghiệm &ldquo;T&ocirc;i đ&atilde; t&igrave;m ra một thuốc thử c&oacute; đặc t&iacute;nh l&agrave;m kết tủa huyết cầu tố m&agrave; kh&ocirc;ng l&agrave;m kết tủa bất kỳ chất n&agrave;o kh&aacute;c.Gi&aacute; như anh ta c&oacute; thấy một mỏ v&agrave;ng th&igrave; sự vui mừng cũng chỉ đến thế l&agrave; c&ugrave;ng.<br />\r\n<br />\r\nStamford giới thiệu:- Đ&acirc;y l&agrave; b&aacute;c sỹ Watson, đ&acirc;y l&agrave; &ocirc;ng Sherlock Holmes.Holmes th&acirc;n mật bắt tay t&ocirc;i với một sức mạnh m&agrave; t&ocirc;i kh&ocirc;ng nghĩ c&oacute; thể c&oacute; ở anh ta.- Ch&agrave;o &ocirc;ng, &ocirc;ng ở Afghanistan về, phải kh&ocirc;ng?- L&agrave;m sao &ocirc;ng biết? - T&ocirc;i kinh ngạc hỏi lại.- C&oacute; g&igrave; đ&acirc;u.<br />\r\n<br />\r\nC&aacute;i điều quan trọng b&acirc;y giờ l&agrave; huyết cầu tố.<br />\r\n<br />\r\n<br />\r\nChắc &ocirc;ng hiểu được ph&aacute;t minh của t&ocirc;i c&oacute; tầm quan trọng như thế n&agrave;o chứ?- Một ph&aacute;t minh l&yacute; th&uacute; về mặt h&oacute;a học, nhưng về mặt thực tế...- &Ocirc;ng n&oacute;i lạ! Đ&acirc;y l&agrave; ph&aacute;t minh c&oacute; gi&aacute; trị thực tiễn nhất từ bao nhi&ecirc;u năm nay trong ng&agrave;nh ph&aacute;p y.<br />\r\n<br />\r\n&Ocirc;ng kh&ocirc;ng thấy l&agrave; n&oacute; gi&uacute;p ta x&aacute;c định một c&aacute;ch kh&ocirc;ng thể nhầm lẫn những vết m&aacute;u &agrave;? Mời &ocirc;ng lại gần đ&acirc;y! - Trong l&uacute;c h&agrave;o hứng, anh ta nắm lấy tay &aacute;o t&ocirc;i, k&eacute;o lại chiếc b&agrave;n anh ta đang l&agrave;m việc.- Ta lấy một &iacute;t m&aacute;u tươi nh&eacute;.<br />\r\n<br />\r\n- Vừa n&oacute;i anh ta vừa lấy kim đ&acirc;m v&agrave;o đầu ng&oacute;n tay, nặn ra một giọt m&aacute;u v&agrave; lấy ống h&uacute;t h&uacute;t - B&acirc;y giờ, t&ocirc;i h&ograve;a ch&uacute;t x&iacute;u m&aacute;u n&agrave;y v&agrave;o một l&iacute;t nước.<br />\r\n<br />\r\n&Ocirc;ng thấy hỗn hợp ấy tr&ocirc;ng y như nước, tỷ lệ của m&aacute;u trong đ&oacute; kh&ocirc;ng thể qu&aacute; một phần triệu.<br />\r\n<br />\r\nDẫu vậy, t&ocirc;i ho&agrave;n to&agrave;n tin chắc ta sẽ c&oacute; được phản ứng đặc trưng.N&oacute;i xong, Holmes thả v&agrave;o trong b&igrave;nh một v&agrave;i tinh thể trắng rồi r&oacute;t th&ecirc;m v&agrave;i giọt chất lỏng trong suốt.<br />\r\n<br />\r\nMột ph&uacute;t sau, hỗn hợp trong b&igrave;nh chuyển th&agrave;nh m&agrave;u gụ v&agrave; một thứ bụi m&agrave;u n&acirc;u nhạt kết tủa dưới đ&aacute;y b&igrave;nh.- Ha! Ha! &Ocirc;ng n&oacute;i sao? - Holmes vỗ tay reo l&ecirc;n.- Theo t&ocirc;i, đ&acirc;y l&agrave; một c&aacute;ch thử rất tinh tế.- Tuyệt vời! C&aacute;ch thử cũ với chất guaiacone vừa th&ocirc; kệch vừa kh&ocirc;ng chắc.<br />\r\n<br />\r\nC&aacute;ch t&igrave;m c&aacute;c tiểu thể m&aacute;u tr&ecirc;n k&iacute;nh hiển vi cũng vậy, với lại chỉ cần vệt m&aacute;u để l&acirc;u một v&agrave;i giờ l&agrave; phương thức đ&oacute; kh&ocirc;ng &aacute;p dụng được.<br />\r\n<br />\r\nC&ograve;n phương ph&aacute;p n&agrave;y, th&igrave; l&uacute;c n&agrave;o cũng hiệu nghiệm, d&ugrave; với m&aacute;u cũ hay m&aacute;u tươi.- Quả vậy!- T&ocirc;i lẩm bẩm.- Những vụ &aacute;n h&igrave;nh sự nhiều khi chỉ c&ograve;n mắc ở kh&acirc;u n&agrave;y m&agrave; th&ocirc;i.<br />\r\n<br />\r\nMột kẻ bị nghi đ&atilde; nh&uacute;ng tay v&agrave;o một vụ &aacute;n mạng xảy ra trước đ&oacute; c&oacute; khi h&agrave;ng th&aacute;ng.<br />\r\n<br />\r\nXem x&eacute;t quần &aacute;o hắn, người ta ph&aacute;t hiện ra những vết m&agrave;u n&acirc;u nhờ nhờ.<br />\r\n<br />\r\nĐ&acirc;y c&oacute; phải l&agrave; những vết m&aacute;u kh&ocirc;ng, hay l&agrave; vết b&ugrave;n, vết gỉ sắt, vết nhựa tr&aacute;i c&acirc;y.<br />\r\n<br />\r\nC&ograve;n b&acirc;y giờ đ&atilde; c&oacute; phản ứng h&oacute;a học n&agrave;y, việc x&aacute;c định kia kh&ocirc;ng c&ograve;n kh&oacute; khăn g&igrave; nữa.Đ&ocirc;i mắt Holmes ngời l&ecirc;n trong khi n&oacute;i, v&agrave; tay phải đặt l&ecirc;n ngực tr&aacute;i, anh ta c&uacute;i gập người như để ch&agrave;o đ&aacute;p lại những người ngưỡng mộ tưởng tượng của m&igrave;nh.- &Ocirc;ng thật đ&aacute;ng được biểu dương.<br />\r\n<br />\r\n- T&ocirc;i phụ họa.- T&ocirc;i c&oacute; thể kể với &ocirc;ng đến hai chục vụ &aacute;n đ&atilde; qua m&agrave; phản ứng của t&ocirc;i c&oacute; thể đ&oacute;ng vai tr&ograve; quyết định.- &Ocirc;ng kh&aacute;c n&agrave;o một quyển ni&ecirc;n gi&aacute;m h&igrave;nh sự sống.<br />\r\n<br />\r\n&Ocirc;ng c&oacute; thể ra một tờ b&aacute;o được đấy, lấy t&ecirc;n l&agrave; &ldquo;Những vụ &aacute;n h&igrave;nh sự trong qu&aacute; khứ&rdquo;.&rdquo; - Stamford cười n&oacute;i.- V&agrave; đ&oacute; sẽ l&agrave; một tờ b&aacute;o rất bổ &iacute;ch.</p>\r\n\r\n<p>- Holmes tiếp lời trong khi d&aacute;n một miếng băng d&iacute;nh l&ecirc;n vết kim ch&acirc;m vừa rồi ở đầu ng&oacute;n tay.<br />\r\n<br />\r\n<br />\r\nAnh ta quay sang t&ocirc;i giải th&iacute;ch - Phải cẩn thận như vậy v&igrave; t&ocirc;i thao t&aacute;c kh&aacute; nhiều loại chất độc.Stamford ngồi xuống một chiếc ghế đẩu ba ch&acirc;n, đẩy một chiếc kh&aacute;c về ph&iacute;a t&ocirc;i, b&agrave;n v&agrave;o việc:- &Ocirc;ng bạn t&ocirc;i đ&acirc;y đang t&igrave;m chỗ ở.<br />\r\n<br />\r\nThấy &ocirc;ng ph&agrave;n n&agrave;n l&agrave; kh&ocirc;ng kiếm được ai ở chung n&ecirc;n t&ocirc;i thấy kh&ocirc;ng c&oacute; g&igrave; tốt hơn l&agrave; để hai người tiếp x&uacute;c với nhau.Holmes c&oacute; vẻ bằng l&ograve;ng n&oacute;i:- T&ocirc;i t&igrave;m được mấy căn ph&ograve;ng ở phố Baker, rất th&iacute;ch hợp cho ch&uacute;ng ta.<br />\r\n<br />\r\nT&ocirc;i mong rằng &ocirc;ng kh&ocirc;ng sợ m&ugrave;i thuốc l&aacute; nặng.- T&ocirc;i cũng h&uacute;t một thứ thuốc rất nặng.- Thế th&igrave; được rồi.<br />\r\n<br />\r\nT&ocirc;i quan t&acirc;m nhiều đến h&oacute;a học v&agrave; đ&ocirc;i khi phải l&agrave;m những th&iacute; nghiệm tại nh&agrave;.<br />\r\n<br />\r\nĐiều đ&oacute; c&oacute; phiền &ocirc;ng kh&ocirc;ng?- Ho&agrave;n to&agrave;n kh&ocirc;ng.- Xem n&agrave;o! T&ocirc;i c&ograve;n tật xấu n&agrave;o nữa kh&ocirc;ng? Đ&ocirc;i khi t&ocirc;i lầm l&igrave;, mấy ng&agrave;y liền kh&ocirc;ng h&eacute; răng n&oacute;i một lời n&agrave;o.<br />\r\n<br />\r\nNhững khi như vậy, cứ để mặc t&ocirc;i, chẳng bao l&acirc;u t&ocirc;i sẽ lại vui vẻ.<br />\r\n<br />\r\nC&ograve;n &ocirc;ng, &ocirc;ng c&oacute; điều g&igrave; cần n&oacute;i kh&ocirc;ng?- T&ocirc;i cũng c&oacute; một v&agrave;i cố tật nhỏ.<br />\r\n<br />\r\nT&ocirc;i kh&ocirc;ng th&iacute;ch ồn &agrave;o.<br />\r\n<br />\r\nT&ocirc;i dậy v&agrave;o những giờ rất kh&aacute;c thường, ngo&agrave;i ra t&ocirc;i rất lười nh&aacute;c.<br />\r\n<br />\r\nKhi khỏe mạnh, t&ocirc;i lại c&oacute; một loạt những t&iacute;nh xấu nho nhỏ kh&aacute;c.<br />\r\n<br />\r\nHiện thời, đ&oacute; l&agrave; những n&eacute;t ch&iacute;nh.- Trong chữ ồn &agrave;o c&oacute; gộp cả tiếng đ&agrave;n vĩ cầm kh&ocirc;ng?- Tiếng đ&agrave;n của người chơi giỏi chỉ l&agrave;m cho người nghe khoan kho&aacute;i, chơi tồi th&igrave;...- Ồ, thế th&igrave; được rồi! - Holmes cười vui vẻ - Như vậy l&agrave; đ&atilde; ổn thỏa, nghĩa l&agrave; nếu như &ocirc;ng ưng chỗ ở.- Khi n&agrave;o th&igrave; ta đi xem?- Mười hai giờ trưa mai, mời &ocirc;ng đến đ&acirc;y, ch&uacute;ng ta c&ugrave;ng đi xem.- Xin đ&uacute;ng hẹn, mười hai giờ trưa mai.<br />\r\n<br />\r\n- T&ocirc;i n&oacute;i v&agrave; bắt tay anh.Ch&uacute;ng t&ocirc;i để anh l&agrave;m việc tiếp v&agrave; trở về kh&aacute;ch sạn.<br />\r\n<br />\r\nT&ocirc;i bỗng dừng lại, quay sang hỏi Stamford:- N&agrave;y, l&agrave;m thế n&agrave;o m&agrave; anh ta biết l&agrave; t&ocirc;i ở Afghanistan về nhỉ?- Anh ta kh&aacute;c người l&agrave; ở chỗ đ&oacute;.T&ocirc;i xoa hai tay v&agrave;o nhau:- Ồ, một điều b&iacute; mật &agrave;? Th&uacute; vị thật! T&ocirc;i rất c&aacute;m ơn anh cho t&ocirc;i c&oacute; dịp tiếp x&uacute;c với anh ta.<br />\r\n<br />\r\nNhư anh biết đấy, đối tượng trong c&ocirc;ng cuộc nghi&ecirc;n cứu của lo&agrave;i người ch&iacute;nh l&agrave; con người Thế th&igrave; anh phải nghi&ecirc;n cứu anh ta đi th&ocirc;i.<br />\r\n<br />\r\nTh&ocirc;i xin tạm biệt nh&eacute;.- Xin tạm biệt.---[*] Nguy&ecirc;n văn: &ldquo;A STUDY IN SCARLET&rdquo;[1] Đơn vị tiền tệ Anh: 1 Shilling = 12 Penny[2] Đơn vị tiền tệ Anh: 1 Penny = 1/100 Pound.</p>\r\n', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`manguoidung`);

--
-- Chỉ mục cho bảng `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`maquangcao`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`masach`),
  ADD KEY `matheloai` (`matheloai`,`manguoidung`),
  ADD KEY `manguoidung` (`manguoidung`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`matheloai`);

--
-- Chỉ mục cho bảng `trangsach`
--
ALTER TABLE `trangsach`
  ADD PRIMARY KEY (`matrang`),
  ADD KEY `masach` (`masach`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `manguoidung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `quangcao`
--
ALTER TABLE `quangcao`
  MODIFY `maquangcao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `masach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `matheloai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `trangsach`
--
ALTER TABLE `trangsach`
  MODIFY `matrang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`matheloai`) REFERENCES `theloai` (`matheloai`),
  ADD CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`manguoidung`) REFERENCES `nguoidung` (`manguoidung`);

--
-- Các ràng buộc cho bảng `trangsach`
--
ALTER TABLE `trangsach`
  ADD CONSTRAINT `trangsach_ibfk_1` FOREIGN KEY (`masach`) REFERENCES `sach` (`masach`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
