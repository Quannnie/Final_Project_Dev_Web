<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA_Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://kit.fontawesome.com/52777d2094.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<title>L'Amour Tâm Linh</title>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<body class="container-fluid">
			<!-- banner -->
			<div class="row">
				<div class="banner col-12" style="background-color: #960404; text-align: center;">
					<img src="images/top.png" class="img-fluid" alt="Banner">
				</div>
			</div>
			<!-- nav-1 -->
			<div class="row" style="background-color: black;">
			<div class="search col-md-8 col-12 d-flex align-items-center">
				<form action="ketquatimkiem.php" method="GET" class="d-flex">
					<input class="form-control mr-2" name="keyword" type="text" placeholder="Bạn tìm gì..." style="margin-top: 10px;">
					<button type="submit" class="btn btn-primary btn-block">Tìm kiếm</button>
				</form>
			</div>
				<div class="infor col-md-2">
					<div class="row">
						<div class="adress col-md-12 col-12" style="font-size: 12px; color: white;">
							Địa chỉ: 279, Nguyễn Tri Phương, Phường 5, Quận 10, TP.HCM
						</div>
						<div class="adress col-md-12 col-12" style="font-size: 12px; color: white">
							Số điện thoại: 0909 909 999
						</div>
					</div>
				</div>
				<div class="cart col-md-1 col-6">
					<button class="btn btn-lg" id="cart-btn" style="border: 1px solid white" id="cart-button" data-toggle="modal" data-target="#cart-modal"><i class="fa-sharp fa-solid fa-cart-shopping" style="color: white;"></i></button>
				</div>
				<div class="modal fade" id="cart-modal" tabindex="-1" role="dialog" aria-labelledby="cart-modal-label" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="cart-modal-label">Giỏ hàng</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">Hình ảnh</th>
											<th scope="col">Tên sản phẩm</th>
											<th scope="col">Số lượng</th>
											<th scope="col">Đơn giá</th>
											<th scope="col">Thành tiền</th>
											<th scope="col">Xóa</th>
										</tr>
									</thead>
									<tbody>
										<!-- Dữ liệu sản phẩm trong giỏ hàng -->
										<tr>
											<td><img src="path/to/image1.jpg" alt="Hình ảnh sản phẩm"></td>
											<td>Tên sản phẩm 1</td>
											<td>2</td>
											<td>100.000 <sup>đ</sup></td>
											<td>200.000 <sup>đ</sup></td>
											<td><button class="btn btn-danger btn-delete-row">Xóa</button></td>
										</tr>
										<tr>
											<td><img src="path/to/image2.jpg" alt="Hình ảnh sản phẩm"></td>
											<td>Tên sản phẩm 2</td>
											<td>1</td>
											<td>150.000 <sup>đ</sup></td>
											<td>150.000 <sup>đ</sup></td>
											<td><button class="btn btn-danger btn-delete-row">Xóa</button></td>
										</tr>
										<!-- Các sản phẩm khác trong giỏ hàng -->
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">Mua hàng</button>
								<button type="button" class="btn btn-danger" id="clear-cart">Xóa giỏ hàng</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- nav2  -->
			<nav class="navbar navbar-expand-md navbar-light" style="background-color: #960404;">
				<a class="navbar-brand" href="index.php"><img src="images/logo.png"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarContent">
					<div class="navbar-nav">
						<a class="nav-item nav-link text-white" href="index.php?act=gioithieu">Giới thiệu</a>
						<div class="dnavbar-nav">
							<a class="nav-item nav-link text-white" href="index.php?act=danhmuc">Sản phẩm</a>
						</div>
					</div>
					<div class="navbar-nav ml-auto">
						<a class="nav-item nav-link text-white" href="index.php?act=chinhsach">Chính sách</a>
						<a class="nav-item nav-link text-white" href="index.php?act=lienhe">Liên hệ</a>
					</div>
				</div>
			</nav>