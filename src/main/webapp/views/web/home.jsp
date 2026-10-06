<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ - Cửa Hàng Trực Tuyến</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
.product-card {
	transition: transform 0.2s, box-shadow 0.2s;
	border-radius: 12px;
	overflow: hidden;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
}

.product-img {
	height: 200px;
	object-fit: cover;
	width: 100%;
}
</style>
</head>
<body class="bg-light">

	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="<c:url value='/home'/>"><i
				class="fa-solid fa-bag-shopping text-warning me-2"></i>KIMDONG STORE</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMenu">
				<span class="navbar-toggler-nav-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navMenu">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value='/home'/>">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/product'/>">Sản phẩm</a></li>
					<c:if
						test="${sessionScope.account != null && sessionScope.account.roleid == 1}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-warning" href="#"
							data-bs-toggle="dropdown">Quản trị Admin</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="<c:url value='/admin/categories'/>">Quản lý Danh mục</a></li>
								<li><a class="dropdown-item"
									href="<c:url value='/admin/products'/>">Quản lý Sản phẩm</a></li>
							</ul></li>
					</c:if>
				</ul>
				<div class="d-flex align-items-center gap-2">
					<c:choose>
						<c:when test="${sessionScope.account != null}">
							<span class="text-white me-2"><i
								class="fa-solid fa-user me-1 text-info"></i>${sessionScope.account.fullname}</span>
							<a href="<c:url value='/logout'/>"
								class="btn btn-outline-danger btn-sm"><i
								class="fa-solid fa-right-from-bracket me-1"></i>Đăng xuất</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value='/login'/>"
								class="btn btn-outline-light btn-sm"><i
								class="fa-solid fa-arrow-right-to-bracket me-1"></i>Đăng nhập</a>
							<a href="<c:url value='/register'/>"
								class="btn btn-warning btn-sm"><i
								class="fa-solid fa-user-plus me-1"></i>Đăng ký</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>

	<!-- Banner -->
	<header class="py-5 bg-primary text-white text-center shadow-sm"
		style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);">
		<div class="container">
			<h1 class="fw-bold">Chào mừng đến với Kim Dong Store</h1>
			<p class="lead mb-0">Khám phá các sản phẩm công nghệ hot nhất với
				giá cực kỳ ưu đãi</p>
		</div>
	</header>

	<!-- Content: Top 10 sản phẩm mới nhất -->
	<main class="container my-5">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h3 class="fw-bold border-start border-4 border-primary ps-3 mb-0">Top
				10 Sản Phẩm Mới Nhất</h3>
			<a href="<c:url value='/product'/>"
				class="text-decoration-none fw-semibold">Xem tất cả <i
				class="fa-solid fa-arrow-right ms-1"></i></a>
		</div>

		<div
			class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-4">
			<c:forEach items="${top10Products}" var="p">
				<div class="col">
					<div class="card h-100 product-card border-0 shadow-sm">
						<c:choose>
							<c:when test="${p.images != null && p.images.startsWith('http')}">
								<img src="${p.images}" class="card-img-top product-img"
									alt="${p.productName}">
							</c:when>
							<c:otherwise>
								<img src="<c:url value='/image?fname=${p.images}'/>"
									class="card-img-top product-img" alt="${p.productName}">
							</c:otherwise>
						</c:choose>
						<div class="card-body d-flex flex-column">
							<span
								class="badge bg-secondary-subtle text-secondary mb-2 w-auto align-self-start">${p.category.categoryName}</span>
							<h6 class="card-title fw-bold text-truncate"
								title="${p.productName}">
								<a href="<c:url value='/product/detail?id=${p.productId}'/>"
									class="text-dark text-decoration-none">${p.productName}</a>
							</h6>
							<p class="text-danger fw-bold fs-5 mt-auto mb-2">${p.price}
								VNĐ</p>
							<a href="<c:url value='/product/detail?id=${p.productId}'/>"
								class="btn btn-outline-primary btn-sm w-100 rounded-pill">Chi
								tiết</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>