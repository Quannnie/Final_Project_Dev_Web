<?php
include "header.php";
if (isset($_GET['keyword'])) {
    $key_word = $_GET['keyword'];
    echo 'Kết quả tìm kiếm cho \'' . $key_word . '\'';
    include_once("db_module.php");
    $link = NULL;
    taoKetNoi($link);
    if ($link) {
        $query = "SELECT * FROM tbl_product WHERE product_name LIKE '%$key_word%'";
        $result = chayTruyVanTraVeDL($link, $query);
        
        echo '<div class="row">';
        
        while ($row = mysqli_fetch_assoc($result)) {
            $_SESSION['product_id'] = $row['product_id'];
            ?>
            <div class="col-md-3 col-sm-6 col-12">
                <div class="card">
                    <img src="<?php echo $row['product_img']; ?>" class="card-img-top" alt="<?php echo $row['product_img']; ?>">
                    <div class="card-body">
                        <h7 class="card-title"><?php echo $row['product_name']; ?></h7>
                        <p class="card-text"><?php echo number_format($row['product_price'], 0, ',', '.'); ?> <sup>đ</sup></p>
                        <div class="d-flex">
                            <a href="index.php?act=chitiet&product_id=<?php echo $row['product_id']; ?>" class="btn btn-primary mr-2 btn-sm">Chi tiết</a>
                            <a href="index.php?act=giohang&product_id=<?php echo $row['product_id']; ?>" class="btn btn-secondary btn-sm">Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
        
        echo '</div>'; // Đóng div class="row"
        
        giaiPhongBoNho($link, $result);
    } else {
        echo "Không thể kết nối đến cơ sở dữ liệu.";
    }
} else {
    echo "Chưa nhập giá trị tìm kiếm";
}

include "footer.php";
?>
