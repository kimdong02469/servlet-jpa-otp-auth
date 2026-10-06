<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${product.productName}- Chi Tiết</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container my-5">
		<a href="javascript:history.back()"
			class="btn btn-outline-secondary mb-4"><i
			class="fa-solid fa-arrow-left me-1"></i>Quay lại</a>

		<div class="card border-0 shadow-sm p-4 rounded-4">
			<div class="row g-4 align-items-center">
				<div class="col-md-5 text-center">
					<c:choose>
						<c:when
							test="${product.images != null && product.images.startsWith('http')}">
							<img src="${product.images}"
								class="img-fluid rounded-4 shadow-sm"
								style="max-height: 400px; object-fit: contain;">
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/image?fname=${product.images}'/>"
								class="img-fluid rounded-4 shadow-sm"
								style="max-height: 400px; object-fit: contain;">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-7">
					<span
						class="badge bg-primary-subtle text-primary mb-2 px-3 py-2 fs-6 rounded-pill">${product.category.categoryName}</span>
					<h2 class="fw-bold mb-3">${product.productName}</h2>
					<h3 class="text-danger fw-bold mb-4">${product.price}VNĐ</h3>

					<h6 class="fw-bold text-uppercase text-secondary mb-2">Mô tả
						sản phẩm</h6>
					<div class="p-3 bg-light rounded-3 mb-4 text-muted"
						style="min-height: 120px; white-space: pre-line;">
						${product.description}</div>

					<div class="d-flex gap-2">
						<button class="btn btn-danger btn-lg px-4 rounded-pill">
							<i class="fa-solid fa-cart-shopping me-2"></i>Mua Ngay
						</button>
						<a href="<c:url value='/product'/>"
							class="btn btn-outline-dark btn-lg px-4 rounded-pill">Tiếp
							tục mua sắm</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>