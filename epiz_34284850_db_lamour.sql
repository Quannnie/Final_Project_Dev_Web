-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: sql209.epizy.com
-- Thời gian đã tạo: Th5 25, 2023 lúc 12:03 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `epiz_34284850_db_lamour`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart_item`
--

CREATE TABLE `tbl_cart_item` (
  `cart_item_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'Thác nước phong thủy'),
(2, 'Tiểu cảnh xông trầm'),
(3, 'Tôn tượng Phật'),
(4, 'Vật phẩm trang trí'),
(5, 'Vòng tay và tràng hạt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `order_detail_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_img`, `category_id`) VALUES
(1, 'Lão Tử Thưởng Nguyệt', 'Kích thước sản phẩm: Dài rộng cao: 45x10x40. Kết hợp thác nước và làm đèn trang trí.', '2050000.00', 'images/TN001.jpeg', 1),
(2, 'Dưới Mái Nhà Tranh', 'Kích thước tổng thể: Dài rộng cao: 50x25x53. Kết hợp xông trầm, thác nước, phun sương và làm đèn led trang trí.', '3300000.00', 'images/TN002.jpeg', 1),
(3, 'Đới Nguyệt Thuỷ', 'Kích thước: Dài rộng cao: 53x23x55. Kết hợp xông trầm, thác nước, đèn trang trí và phun sương.', '2950000.00', 'images/TN003.jpeg', 1),
(4, 'Huê Nghiêm Giác', 'Kích thước tổng thể: Dài 40x18x42. Kết hợp xông trầm, thác nước, đèn trang trí và phun sương.', '2450000.00', 'images/TN004.jpeg', 1),
(5, 'Khổng Thuỷ Tước', 'Kích thước sản phẩm: Dài rộng cao: 45x14x45. Kết hợp xông trầm, thác nước và đèn trang trí.', '2500000.00', 'images/TN005.jpeg', 1),
(6, 'Bể cá phong thuỷ', 'Kích thước tổng thể: Dài rộng cao: 40x24x50. Phụ kiện đi kèm: máy bơm, sỏi trang trí.', '2700000.00', 'images/TN006.jpeg', 1),
(7, 'Thác Nước Phật Di Lạc', 'Kích thước sản phẩm: Dài rộng cao: 50x20x52 cm. Kết hợp xông trầm, thác nước, đèn trang trí và phun sương. Tặng kèm 1 sen treo đốt trầm.', '3300000.00', 'images/TN007.jpeg', 1),
(8, 'Thác Nước Chiêu Tài', 'Kích thước tổng thể: Dài rộng cao: 50x25x53. Kết hợp xông trầm, thác nước, phun sương và làm đèn led trang trí.', '3300000.00', 'images/TN008.jpeg', 1),
(9, 'Thác Hươu Tài Lộc', 'Kích thước tổng thể: 40x12x40 cm. Kết hợp phun sương, xông trầm, hiệu ứng thác chảy và làm đèn led trang trí. Ý nghĩa: Hươu tượng trưng cho tài lộc và sức khoẻ. Phù hợp: Làm quà tặng tân gia, quà biếu. Phụ kiện đi kèm như ảnh, không bao gồm phần cây thật phía bên dưới.', '2200000.00', 'images/TN009.jpeg', 1),
(10, 'Sơn Thuỷ Cảnh', 'Kích thước sản phẩm: Dài rộng cao: 40x14x40. Kết hợp xông trầm, thác nước và đèn trang trí.', '2000000.00', 'images/TN010.jpeg', 1),
(11, 'Bái Phật', 'Đế gỗ: Dài 60, ngang 15. Khung đèn: Đường kính 50 cm. Chất tượng: Gốm.', '2800000.00', 'images/TC001.jpeg', 2),
(12, 'Dưới Tán Bồ Đề', 'Kích thước tổng thể: Dài rộng cao: 40x15x45 cm. Kết hợp xông trầm và đèn led trang trí.', '2490000.00', 'images/TC002.jpeg', 2),
(13, 'Nhất Tâm Di Lạc Phật', 'Kích thước tổng thể: Dài rộng cao: 55x20x67 cm. Đường kính đèn: 50 cm. Tượng Phật: Cao 30 cm, chất tượng: gốm sứ. Phụ kiện đi kèm như ảnh. Khánh treo có thể thay đổi màu theo ngũ hành phù hợp, có 5 màu tương ứng cho 5 hành Kim Mộc Thuỷ Hoả Thổ.', '3400000.00', 'images/TC003.jpeg', 2),
(14, 'Phật Thủ', 'Kích thước sản phẩm: Dài 30 Rộng 12 Cao 30 Đơn vị: CM. Kết hợp xông trầm và trang trí nhà.', '990000.00', 'images/TC004.jpeg', 2),
(15, 'Phật Thủ Liên Hoa', 'Kích thước tổng thể: Dài rộng cao: 30x20x32 cm. Phù hợp làm vật phẩm trang trí và xông trầm.', '1600000.00', 'images/TC005.jpeg', 2),
(16, 'Sơn Tiên Bái Nguyệt', 'Kích thước tổng thể: Dài rộng cao: 50x12x53 cm. Kết hợp xông trầm và làm đèn trang trí.', '2490000.00', 'images/TC006.jpeg', 2),
(17, 'Tầm Sư Học Đạo', 'Kích thước sản phẩm: Dài rộng cao: 57x21x60 cm. Kết hợp xông trầm và làm đèn trang trí.', '3490000.00', 'images/TC007.jpeg', 2),
(18, 'Thái Sơn Áp Đỉnh', 'Kích thước tổng thể: Dài rộng cao: 45x8x45 cm. Kết hợp xông trầm và đèn led trang trí.', '990000.00', 'images/TC008.jpeg', 2),
(19, 'Tiểu Cảnh Thích Ca Phật', 'Kích thước tổng thể: Dài rộng cao: 40x20x40. Tượng Phật cao: 32 cm. Chất liệu: Gốm.', '2600000.00', 'images/TC009.jpeg', 2),
(20, 'Tiểu cảnh Địa Tạng Vương Bồ Tát', 'Kích thước tổng thể: Dài rộng cao: 40x8x42 cm. Tượng Phật: Cao 27 cm, được làm từ gốm. Kết hợp xông trầm, làm đèn trang trí.', '2300000.00', 'images/TC010.jpeg', 2),
(21, 'Set tiểu cảnh tượng Phật chibi', 'Một set tiểu cảnh tượng Phật nhỏ nhắn, giản dị mà bình an như vậy sẽ là một món quà thật thích hợp để tặng cho chính mình hay người thương. Set tiểu cảnh này hiện Nhà L’amour đang có 02 mẫu là tiểu cảnh chum cây và tiểu cảnh núi. Quý khách có thể mix với tượng Phật Thích Ca hoặc tượng Phật A Di Đà ạ.', '940000.00', 'images/T001.jpeg', 3),
(22, 'Set tượng Phật Thích Ca thành tựu', 'Lấy cảm hứng từ câu chuyện Đức Phật Thích Ca tìm ra con đường thoát khổ, đạt đến bình an chân thật mà không còn phụ thuộc vào hoàn cảnh bên ngoài, L’amour xin giới thiệu đến quý khách bộ tượng “Phật Thích Ca thành tựu” như sau. – Tượng Đức Phật Thích Ca Mâu Ni tọa thiền trong sắc trắng thanh tịnh với sắc diện tràn đầy yêu thương, trí tuệ. – Bức họa Đức Phật thiền định trên tòa sen trắng, xung quanh chướng khí mịt mù; biểu thị cho tâm và trí huệ Ngài vẫn thanh tịnh, bình an giữa ngũ độc, nghịch cảnh và cám dỗ thế gian. Mong rằng bộ tượng “Phật Thích Ca thành tựu” sẽ phần nào mang đến quý khách những phút giây an yên, nghỉ ngơi và gợi nhắc rằng bình an chân thật thì luôn ở đây, bên trong chính mình rồi! Thông tin sản phẩm: – Chất liệu: gốm – Tranh in trên canvas chất lượng cao – Khung kim loại cùng đèn LED – Kích thước: Ngang 39,6cm, cao 40,5cm', '3600000.00', 'images/T002.jpeg', 3),
(23, 'Tiểu cảnh Tam Phật dáng tự tại', 'Quán Tự Tại Bồ Tát với thiết kế tối giản, mộc mạc; không chỉ tinh tế truyền tải những giá trị tâm linh mà còn đảm bảo tính thẩm mỹ, hài hòa trong cách sắp xếp, bố trí. Thông tin sản phẩm: – Set tượng bao gồm: tượng Phật, núi và hoa sen để đốt trầm. – Kích thước tượng Bồ Tát: Cao 12,5cm * Ngang 8cm * Sâu 7cm – Kích thước đế: Dài 34cm * Rộng 7cm * Cao 2cm', '980000.00', 'images/T003.jpeg', 3),
(24, 'Tượng Địa Tạng vương bồ tát gốm trắng', 'Địa Tạng là một vị Bồ tát đại từ đại bi thệ nguyện độ thế rất rộng lớn, cứu độ tất cả chúng sinh trong luân hồi. Ngài thường được biết đến với lời nguyện lớn lao: “Địa ngục không trống, thề không thành Phật”. L’amour xin giới thiệu đến bạn mẫu tượng Địa Tạng Bồ Tát bằng gốm, diện mặt tượng hài hoà, dáng ngồi ung dung, tổng thể tượng màu trắng đơn giản, dễ dàng bày trí, phù hợp mọi không gian. Thông tin chi tiết: – Chất liệu gốm. – Chiều cao 29cm.', '3200000.00', 'images/T004.jpeg', 3),
(25, 'Tượng An nhiên đốt nến và trầm', 'Cùng thắp lên một ngọn nến, một hương trầm thơm, ngồi xuống và xoa dịu một ngày dài đã qua. L’amour mong chúc bạn luôn cảm nhận được những phút giây tĩnh lặng, bình an tự sâu bên trong mình. Thông tin chi tiết: – Bộ an nhiên nến trầm được làm từ chất liệu composite chịu được nắng mưa. – Kích thước: Đường kính tổng thể 16cm, chiều cao tượng 12cm. – Phù hợp làm quà tặng.', '420000.00', 'images/T005.jpeg', 3),
(26, 'Bộ chú tiểu béo gầy gốm tử sa', 'Bộ tượng hai chú tiểu huynh đệ béo – gầy với dáng hình thong dong tự tại, vừa ngước mặt lên ngắm trời mây vừa chu miệng huýt sáo nhìn thiệt hết sức cảm hứng. Để tượng ở một góc bàn làm việc, ban công, phòng khách nơi ai đến chơi cũng nhìn thấy thì sẽ lan tỏa được thông điệp tốt lành này. Tượng được làm từ gốm, từng đường nét đều được nghệ nhân tạo hình thủ công hết sức tỉ mỉ. Kích thước như sau: – Huynh gầy: cao 20.2cm, rộng 5.5cm – Đệ béo: cao 11.5cm, rộng 8cm – Tặng kèm một chú cún con cao 3.3cm như hình.', '760000.00', 'images/T006.jpeg', 3),
(27, 'Nhà sư gỗ sơn tiêu phong cách Nhật Bản', 'Bức tượng được thiết kế theo phong cách Nhật Bản nhẹ nhàng mà ấn tượng. Với đôi tay chắp lại nguyện cầu mọi sự an bình, nét mặt rạng ngời lan toả hạnh phúc cùng sắc màu trang phục tươi mới, nhà sư bằng gỗ sẽ mang niềm vui phúc lành đến bạn và người thân yêu. Ngắm nhìn nhà sư này để tâm hồn mình được yên lắng lại, đẩy lùi căng thẳng lo âu và đón mời những niềm vui muôn màu muôn vẻ của cuộc sống. Thông tin sản phẩm: – Chất liệu: Gỗ sơn tiêu tự nhiên – loại gỗ này được xếp hạng gỗ quý tự nhiên, cùng nhóm với những cây gỗ quý như gỗ hương, gỗ sưa. Màu vẽ bằng acrylic – Chiều cao 8cm – Phù hợp đặt bàn làm việc, đặt trong xe ô tô, đặt cạnh tượng Phật, bàn trà, trong phòng ngủ trẻ em an bình, hoặc làm quà tặng trẻ em và người lớn', '810000.00', 'images/T007.jpeg', 3),
(28, 'Tượng Nhà sư cầu nguyện', 'Một bức tượng Nhà sư áo nâu đang cầu nguyện với một lòng biết ơn sâu sắc và tràn đầy bình an. Gương mặt ngài hiền hậu, dáng hình thanh thoát thật xúc động. Tượng được làm bằng gốm cát được nghệ nhân sơn màu tỉ mỉ, từng đường nét đều được thực hiện với sự chú tâm cao độ. Chất liệu: Gốm cát sơn màu Kích thước: Cao 15.5cm * Ngang 5.5 cm Thương mời quý khách cùng ngắm và đặt tượng ạ!', '612000.00', 'images/T008.jpeg', 3),
(29, 'Tượng nhà sư má hồng ngộ nghĩnh, đáng yêu', 'Trong phiên bản dáng đứng khoanh tay, gương mặt tròn trịa, tượng nhà sư mang lại cảm giác vừa tĩnh tại mà cũng rất hồn nhiên. Để tượng ở một góc bàn làm việc, bàn trà, kệ sách,… sẽ làm không gian thêm sinh động và khiến lòng mình tươi vui, thả lỏng hơn. Thông tin sản phẩm: – Chất liệu: gốm – Chiều cao tượng nhà sư 11.8cm, ngang 5.9cm, sâu 5.8cm', '540000.00', 'images/T009.jpeg', 3),
(30, 'Tượng nhà sư quét lá', 'Phong thái tĩnh tại, bình an, đang thư thả quét trôi “những ưu phiền” của cuộc đời. Pho tượng này rất dễ trưng bày, hài hòa với nhiều vị trí, phối cảnh nên mình có thể ở nhiều vị trí như bàn làm việc, góc tiểu cảnh, bàn trà,… đều sẽ khiến cho không gian của mình trở nên đẹp đẽ và bình an hơn. Kích thước: Tượng cao 15.5cm, ngang 5.3cm Chất liệu: gốm', '520000.00', 'images/T010.jpeg', 3),
(31, 'Bộ Tượng Tứ Không', 'Chiều cao mỗi tượng: 12 cm. Chất liệu: Gốm tử sa cao. Ý nghĩa sâu sắc của bộ tượng tứ không này khuyên con người ta sống một cách “yếm thế” nghĩa là bịt tai để dùng tâm lắng nghe, bịt mắt để dùng tâm nhìn thấu mọi sự việc, bịt miệng để dùng tâm nói và bịt thân để dùng tâm hành động.', '1200000.00', 'images/TT001.jpeg', 4),
(32, 'Đèn đọc sách phong cách Trung Hoa', 'Chất liệu: Bột đá xanh Quế Lâm kết hợp nhựa thông. Phù hợp: Đèn đọc sách, đèn trang trí trang thờ. Kích thước: Dài 30, ngang 20, cao 55 cm.', '1800000.00', 'images/TT002.jpeg', 4),
(33, 'Khung đèn đặt tượng Phật', 'Khung đèn đặt tượng Phật. Dài x Rộng x Cao: 30x20x50.', '850000.00', 'images/TT003.jpeg', 4),
(34, 'Lộc Thú', 'Lộc Thú. Kích thước tượng: Dài rộng cao: 10x5x23. Phù hợp: Trang trí cùng tiểu cảnh, đặt bàn làm việc, xe hơi.', '445000.00', 'images/TT004.jpeg', 4),
(35, 'Tịnh Sư Phụ', 'Tịnh Sư Phụ (Mẫu 2). Tượng cao 12 cm. Chất liệu: Gốm.', '390000.00', 'images/TT005.jpeg', 4),
(36, 'Tranh Treo Tường Phong Cách Trung Hoa', 'Chất liệu: Bột đá xanh Quế Lâm kết hợp nhựa thông. Cách thức: Khoang – Treo Tường. Phạm Vi Áp Dụng: Khoảng không Dài 265 cm, cao 100 cm.', '4800000.00', 'images/TT006.jpeg', 4),
(37, 'Đồng hồ Treo Tường Phong Cách Trung Hoa', 'Chất liệu: Bột đá xanh Quế Lâm kết hợp nhựa thông. Cách thức: Khoang – Treo Tường. Đường kính hoa sen: 40 cm.', '1250000.00', 'images/TT007.jpeg', 4),
(38, 'Bái Phật', 'Bái Phật. Tượng cao 18 cm. Chất liệu: Bột đá.', '290000.00', 'images/TT008.jpeg', 4),
(39, 'Bái Phật (Mẫu 2)', 'Bái Phật (Mẫu 2). Tượng cao 15 cm. Chất liệu: Gốm.', '350000.00', 'images/TT009.jpeg', 4),
(40, 'Đồng hồ treo tường phong cách Trung Hoa', 'Chất liệu: Bột đá xanh Quế Lâm kết hợp nhựa thông. Cách thức: Khoang – Treo Tường. Đường kính hoa sen: 40 cm.', '1250000.00', 'images/TT010.jpeg', 4),
(41, 'Bồ đề bạch ngọc', 'Chất liệu: Hạt bồ kết. Kích thước hạt: 12 mm. Kết hợp khánh treo và sen trắng.', '265000.00', 'images/VT001.jpeg', 5),
(42, 'Khánh treo bình an (Mệnh Hoả)', 'Chất liệu: Gỗ mun, mã não, mắt hổ. Thích hợp: Treo xe oto giúp cải thiện phong thuỷ. Giúp mang đến bình an và may mắn cho gia chủ.', '290000.00', 'images/VT002.jpeg', 5),
(43, 'Khánh treo bình an (Mệnh Kim)', 'Chất liệu: Gỗ mun, mã não, mắt hổ. Thích hợp: treo xe oto cải thiện phong thuỷ. Giúp mang đến bình an và may mắn cho gia chủ.', '290000.00', 'images/VT003.jpeg', 5),
(44, 'Khánh treo bình an (Mệnh Mộc)', 'Chất liệu: Gỗ mun, mã không, mắt hổ. Thích hợp: treo xe oto cải thiện phong thuỷ. Giúp mang đến bình an và may mắn cho gia chủ.', '290000.00', 'images/VT004.jpeg', 5),
(45, 'Khánh treo bình an (Mệnh Thổ)', 'Chất liệu: Gỗ mun, mã não, mắt hổ. Thích hợp: treo xe oto cải thiện phong thuỷ. Giúp mang đến bình an và may mắn cho gia chủ.', '290000.00', 'images/VT005.jpeg', 5),
(46, 'Khánh treo bình an (Mệnh Thủy)', 'Chất liệu: Gỗ mun, mã não, mắt hổ. Thích hợp: treo xe oto cải thiện phong thuỷ. Giúp mang đến bình an và may mắn cho gia chủ.', '290000.00', 'images/VT006.jpeg', 5),
(47, 'Móc khoá bình an', 'Mặt dây: Đồng thau. Hạt charm: Gỗ đàn hương. Bên trong mỗi sản phẩm đều đi kèm 1 quyển kinh chú tương ứng với tên của dây đeo. Sản phẩm đi kèm hộp đựng sang trọng như ảnh đính kèm, phù hợp làm quà tặng, quà biếu.', '130000.00', 'images/VT007.jpeg', 5),
(48, 'Móc treo điện thoại phong cách Trung Hoa cổ điển', 'Mặt dây: Đồng thau. Hạt charm: Gỗ đàn hương. Bên trong mỗi sản phẩm đều đi kèm 1 quyển kinh chú tương ứng với tên của dây đeo. Sản phẩm đi kèm hộp đựng sang trọng như ảnh đính kèm, phù hợp làm quà tặng, quà biếu.', '95000.00', 'images/VT008.jpeg', 5),
(49, 'Vòng tay chu sa', 'Chất liệu: Chu sa. Vòng tay chu sa, đính kèm hoa tiết hoa anh đào và chỉ vàng. Đường kính vòng: 5.8 cm. Phù hợp với tay nữ.', '365000.00', 'images/VT009.jpeg', 5),
(50, 'Vòng tay gỗ canh châu', 'Chất liệu: Xá xị hay còn được gọi là cây gỗ gù hương, rè hương hay canh châu. Mùi hương: Gỗ xá xị dịu nhẹ. Phù hợp: Không giới hạn. Khuyến cáo: Hạn chế dính nước, ngâm trong nước hoặc đi dưới trời mưa. Sản phẩm kèm theo hộp đựng sang trọng giúp khách hàng có thể dễ dàng lựa chọn làm quà biếu tặng.', '90000.00', 'images/VT010.jpeg', 5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_cart_item`
--
ALTER TABLE `tbl_cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_cart_item`
--
ALTER TABLE `tbl_cart_item`
  MODIFY `cart_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `order_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`);

--
-- Các ràng buộc cho bảng `tbl_cart_item`
--
ALTER TABLE `tbl_cart_item`
  ADD CONSTRAINT `tbl_cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `tbl_cart` (`cart_id`),
  ADD CONSTRAINT `tbl_cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`);

--
-- Các ràng buộc cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`);

--
-- Các ràng buộc cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `tbl_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`),
  ADD CONSTRAINT `tbl_order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`);

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
