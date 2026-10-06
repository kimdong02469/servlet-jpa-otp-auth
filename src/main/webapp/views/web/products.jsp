<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh Sách Sản Phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
.product-card {
	transition: all 0.2s ease;
	border-radius: 10px;
}

.product-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
}

.product-img {
	height: 220px;
	object-fit: cover;
	width: 100%;
}
</style>
</head>
<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="<c:url value='/home'/>"><i
				class="fa-solid fa-bag-shopping text-warning me-2"></i>KIMDONG STORE</a>
			<div class="d-flex">
				<a href="<c:url value='/home'/>"
					class="btn btn-outline-light btn-sm"><i
					class="fa-solid fa-house me-1"></i>Về Trang Chủ</a>
			</div>
		</div>
	</nav>

	<div class="container my-5">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h3 class="fw-bold border-start border-4 border-primary ps-3 mb-0">Tất
				Cả Sản Phẩm</h3>
			<span class="text-muted">Hiển thị 6 sản phẩm mỗi trang</span>
		</div>

		<!-- Lưới 6 sản phẩm -->
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach items="${products}" var="p">
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
								class="badge bg-secondary-subtle text-secondary mb-2 align-self-start">${p.category.categoryName}</span>
							<h5 class="card-title fw-bold text-truncate">${p.productName}</h5>
							<p class="text-danger fw-bold fs-5 mt-auto mb-3">${p.price}
								VNĐ</p>
							<a href="<c:url value='/product/detail?id=${p.productId}'/>"
								class="btn btn-primary rounded-pill w-100"> <i
								class="fa-solid fa-eye me-1"></i>Xem Chi Tiết
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Phân trang Bootstrap 5 -->
		<nav class="mt-5 d-flex justify-content-center">
			<ul class="pagination pagination-md shadow-sm">
				<c:forEach begin="1" end="${totalPages}" var="i">
					<li class="page-item ${currentPage == i ? 'active' : ''}"><a
						class="page-link" href="<c:url value='/product?page=${i}'/>">${i}</a>
					</li>
				</c:forEach>
			</ul>
		</nav>
	</div>

</body>
</html>