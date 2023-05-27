<?php
	// Kiểm tra xem có product_id được truyền qua URL hay không
	// Kiểm tra xem có product_id được truyền qua URL hay không
	if (isset($_GET['product_id'])) {
	    // Lấy product_id từ URL
	    $product_id = $_GET['product_id'];
	
	    require_once "db_module.php";
	    $link = NULL;
	    // Kết nối đến cơ sở dữ liệu
	    taoKetNoi($link);
	
	    $query = "SELECT * FROM tbl_product WHERE product_id = " . $product_id;
	
	    $result = chayTruyVanTraVeDL($link, $query);
	
	    if (mysqli_num_rows($result) > 0) {
	        $row = mysqli_fetch_assoc($result);
	        // Lấy thông tin chi tiết sản phẩm từ $row
	        $product_name = $row['product_name'];
	        $product_price = $row['product_price'];
	        $product_description = $row['product_description'];
	        $product_image = $row['product_img'];
	        ?>
<div class="container custom-container">
	<div class="row">
		<div class="col-12">
			<h4>Chi tiết sản phẩm</h4>
		</div>
	</div>
	<div class="row" style="margin-top: 10px">
		<div class="col-md-6">
			<img src="<?php echo $product_image; ?>" alt="<?php echo $product_name; ?>" class="img-fluid">
		</div>
		<div class="col-md-6">
			<h3><?php echo $product_name; ?></h3>
			<p>Giá: <?php echo number_format($product_price, 0, ',', '.'); ?> đ</p>
			<p><?php echo $product_description; ?></p>
			<div class="d-flex">
				<label for="quantity-input">Số lượng:</label>
				<div class="input-group mr-2">
					<input type="number" class="form-control" value="1" min="1" id="quantity-input" name="quantity">
				</div>
				<a href="index.php?act=giohang&product_id=<?php echo $product_id; ?>" class="btn btn-secondary btn-sm">Thêm vào giỏ hàng</a>
			</div>
		</div>
	</div>
</div>
<?php
	} else {
	    echo "Không có dữ liệu.";
	}
	
	// Giải phóng bộ nhớ và đóng kết nối
	giaiPhongBoNho($link, $result);
	} else {
	echo "Không tìm thấy thông tin sản phẩm.";
	}
	?>