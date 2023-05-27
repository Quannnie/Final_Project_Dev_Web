<div class="row" style="margin-top: 10px;">
	<div class="col-md-4">
		<div class="col-12 text-white bg-dark">
			<h3>Lọc</h3>
		</div>
		<div class="col-12">
			<form id="product-filter-form" method="POST" action="">
				<div class="form-row">
					<div class="form-group col-12">
						<label for="sort-by">Sắp xếp theo</label>
						<select class="form-control" id="sort-by" name="sort-by">
							<option selected>Chọn...</option>
							<option value="price-asc" <?php if(isset($_POST['sort-by']) && $_POST['sort-by'] == 'price-asc') echo 'selected'; ?>>Giá tăng dần</option>
							<option value="price-desc" <?php if(isset($_POST['sort-by']) && $_POST['sort-by'] == 'price-desc') echo 'selected'; ?>>Giá giảm dần</option>
						</select>
					</div>
					<div class="form-group col-6">
						<label for="price-from">Giá từ</label>
						<input type="text" class="form-control" id="price-from" name="price-from" placeholder="VD: 100000" value="<?php if(isset($_POST['price-from'])) echo $_POST['price-from']; ?>">
					</div>
					<div class="form-group col-6">
						<label for="price-to">Giá đến</label>
						<input type="text" class="form-control" id="price-to" name="price-to" placeholder="VD: 500000" value="<?php if(isset($_POST['price-to'])) echo $_POST['price-to']; ?>">
					</div>
					<div class="form-group col-12">
						<label for="category">Danh mục sản phẩm</label>
						<select class="form-control" id="category" name="category">
							<option value="">Chọn danh mục...</option>
							<option value="1" <?php if(isset($_POST['category']) && $_POST['category'] == '1') echo 'selected'; ?>>Thác nước phong thủy</option>
							<option value="2" <?php if(isset($_POST['category']) && $_POST['category'] == '2') echo 'selected'; ?>>Tiểu cảnh xông trầm</option>
							<option value="3" <?php if(isset($_POST['category']) && $_POST['category'] == '3') echo 'selected'; ?>>Tôn tượng Phật</option>
							<option value="4" <?php if(isset($_POST['category']) && $_POST['category'] == '4') echo 'selected'; ?>>Vật phẩm trang trí</option>
							<option value="5" <?php if(isset($_POST['category']) && $_POST['category'] == '5') echo 'selected'; ?>>Vòng tay và tràng hạt</option>
						</select>
					</div>
					<div class="form-group col-md-6 col-6">
						<button type="submit" name="apply" class="btn btn-primary">Áp dụng</button>
					</div>
					<div class="form-group col-md-6 col-6">
						<button type="reset" class="btn btn-secondary" onclick="resetFilters()">Hủy lọc</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-8 col-12">
		<h3 class="text-white bg-dark">Kết quả</h3>
		<div class="row d-flex flex-wrap">
			<?php
				require_once "db_module.php";
				$link = NULL;
				// Kết nối đến cơ sở dữ liệu
				taoKetNoi($link);
				if (isset($_POST['reset'])) {
				unset($_SESSION['selected_category']);
				unset($_SESSION['price_from']);
				unset($_SESSION['price_to']);
				}
				
				// Kiểm tra xem tham số apply đã được truyền vào hay chưa
				if (isset($_POST['apply'])) {
				    // Lưu các giá trị lọc vào biến session
				    $_SESSION['selected_category'] = $_POST['category'];
				    $_SESSION['price_from'] = $_POST['price-from'];
				    $_SESSION['price_to'] = $_POST['price-to'];
				
				    $selectedCategory = $_SESSION['selected_category'];
				    $priceFrom = $_SESSION['price_from'];
				    $priceTo = $_SESSION['price_to'];
				
				    // Xây dựng điều kiện truy vấn SQL dựa trên các giá trị lọc
				    $conditions = array();
				
				    if (!empty($selectedCategory)) {
				        $conditions[] = "category_id = $selectedCategory";
				    }
				
				    if (!empty($priceFrom) && is_numeric($priceFrom)) {
				        $conditions[] = "product_price >= $priceFrom";
				    }
				
				    if (!empty($priceTo) && is_numeric($priceTo)) {
				        $conditions[] = "product_price <= $priceTo";
				    }
				
				$sortOption = $_POST['sort-by'];
				if ($sortOption == 'price-asc') {
				$orderBy = 'ORDER BY product_price ASC';
				} else {
				$orderBy = 'ORDER BY product_price DESC'; // Sắp xếp theo mặc định nếu không được chọn
				}
				
				    // Xây dựng điều kiện truy vấn SQL từ các điều kiện được lưu trong mảng $conditions
				    $condition = '';
				    if (!empty($conditions)) {
				        $condition = "WHERE " . implode(" AND ", $conditions);
				    }
				
				    // Chuỗi truy vấn SQL để lấy dữ liệu từ bảng với điều kiện lọc
				$query = "SELECT * FROM tbl_product $condition $orderBy";
				} else {
				    // Chuỗi truy vấn SQL để lấy toàn bộ dữ liệu từ bảng
				    $query = "SELECT * FROM tbl_product";
				}
				
				// Chạy truy vấn và nhận kết quả trả về
				$result = chayTruyVanTraVeDL($link, $query);
				
				// Kiểm tra xem có dữ liệu trả về hay không
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
				
				// Giải phóng bộ nhớ và đóng kết nối
				giaiPhongBoNho($link, $result);
				?>
		</div>
	</div>
</div>