<div class="form-group col-12">
    <label for="category">Danh mục sản phẩm</label>
    <select class="form-control" id="category" name="category">
        <option value="">Chọn danh mục...</option>
        <option value="1">Thác nước phong thủy</option>
        <option value="2">Tiểu cảnh xông trầm</option>
        <option value="3">Tôn tượng Phật</option>
        <option value="4">Vật phẩm trang trí</option>
        <option value="5">Vòng tay và tràng hạt</option>
    </select>
</div>
<div class="form-group col-12">
    <button type="submit" class="btn btn-primary">Lọc</button>
</div>
<?php
require_once "config.php";

function taoKetNoi()
{
    $link = mysqli_connect(HOST, USER, PASSWORD, DB);
    if (mysqli_connect_errno()) {
        echo "Lỗi kết nối đến máy chủ: " . mysqli_connect_error();
        exit();
    }
    return $link;
}

function chayTruyVanTraVeDL($link, $q)
{
    $result = mysqli_query($link, $q);
    return $result;
}


// Kết nối đến cơ sở dữ liệu
$link = taoKetNoi();

// Xử lý khi nút "Lọc" được nhấn
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["filter-button"]) && $_POST["filter-button"] == "Lọc") {
        // Lấy giá trị danh mục được chọn
        $selectedCategory = $_POST["category"];

        // Kiểm tra và xây dựng điều kiện truy vấn SQL dựa trên giá trị của $selectedCategory
        $condition = "";
        if (!empty($selectedCategory)) {
            $condition = "WHERE category_id = $selectedCategory";
        }

        // Truy vấn sản phẩm theo danh mục và hiển thị kết quả
        $query = "SELECT * FROM tbl_product $condition";
        $result = chayTruyVanTraVeDL($link, $query);

        if (mysqli_num_rows($result) > 0) {
            ob_start(); // Bắt đầu đệm đầu ra
            ?>
            <div class="container custom-container">
                <div class="row">
                    <?php
                    while ($row = mysqli_fetch_assoc($result)) {
                        $_SESSION['product_id'] = $row['product_id'];
                        ?>
                        <div class="col-md-3 col-6">
                            <div class="card">
                                <img src="<?php echo $row['product_img']; ?>" class="card-img-top" alt="<?php echo $row['product_img']; ?>">
                                <div class="card-body">
                                    <h7 class="card-title"><?php echo $row['product_name']; ?></h7>
                                    <p class="card-text"><?php echo number_format($row['product_price'], 0, ',', '.'); ?> <sup>đ</sup></p>
                                    <a href="index.php?act=chitiet&product_id=<?php echo $row['product_id']; ?>" class="btn btn-primary">Chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            </div>
            <?php
            ob_end_flush();
        } else {
            echo "Không có dữ liệu.";
        }
    }
}

// Giải phóng bộ nhớ và đóng kết nối
giaiPhongBoNho($link, $result);
?>




