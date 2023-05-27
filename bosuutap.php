<div class="row" style="margin-top: 10px;">
	<div class="col-md-12 col-12">
		<div class="row d-flex flex-wrap">
			<?php
				require_once "db_module.php";
				$link = NULL;
				
				// Kết nối đến cơ sở dữ liệu
				taoKetNoi($link);
				
				// Kiểm tra xem category_id đã được truyền vào từ URL hay chưa
				if (isset($_GET['category_id'])) {
				    $categoryID = $_GET['category_id'];
				    // Lấy tên danh mục từ tbl_category
				    $query1 = "SELECT category_name FROM tbl_category WHERE category_id = $categoryID";
				    $result1 = chayTruyVanTraVeDL($link, $query1);
				    $row1 = mysqli_fetch_assoc($result1);
				    $categoryName = $row1['category_name'];
				    echo "<h2>Tên bộ sưu tập: " . $categoryName . "</h2>";
				    // Khởi tạo câu truy vấn ban đầu
				    $query = "SELECT * FROM tbl_product WHERE category_id = $categoryID";
				
				    $result = chayTruyVanTraVeDL($link, $query);
				
				    if (mysqli_num_rows($result) > 0) {
				        ob_start(); // Bắt đầu đệm đầu ra
				        ?>
			<div class="container custom-container">
				<div class="row">
					<?php
						// In ra tên danh mục
						while ($row = mysqli_fetch_assoc($result)) {
						    $_SESSION['product_id'] = $row['product_id'];
						    ?>
					<div class="col-md-3 col-6">
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
						?>
				</div>
			</div>
			<?php
				ob_end_flush(); // Kết thúc đệm đầu ra và gửi nó đến trình duyệt
				} else {
				echo "Không có dữ liệu.";
				}
				} else {
				echo "Không tìm thấy giá trị category_id";
				}
				?>
		</div>
	</div>
</div>