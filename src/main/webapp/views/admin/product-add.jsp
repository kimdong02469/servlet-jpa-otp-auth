<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Sản Phẩm Mới</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-7">
				<div class="card border-0 shadow-sm rounded-4 p-4">
					<div class="d-flex align-items-center mb-4">
						<a href="<c:url value='/admin/products'/>"
							class="btn btn-sm btn-outline-secondary me-3"><i
							class="fa-solid fa-arrow-left"></i></a>
						<h4 class="fw-bold mb-0">Thêm Sản Phẩm Mới</h4>
					</div>

					<form action="<c:url value='/admin/product/insert'/>" method="post"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label class="form-label fw-semibold">Tên sản phẩm <span
								class="text-danger">*</span></label> <input type="text"
								name="productName" class="form-control"
								placeholder="Ví dụ: iPhone 16 Pro Max..." required>
						</div>

						<div class="row g-3 mb-3">
							<div class="col-md-6">
								<label class="form-label fw-semibold">Giá bán (VNĐ) <span
									class="text-danger">*</span></label> <input type="number" step="0.01"
									name="price" class="form-control" placeholder="0" required>
							</div>
							<div class="col-md-6">
								<label class="form-label fw-semibold">Danh mục <span
									class="text-danger">*</span></label> <select name="categoryId"
									class="form-select" required>
									<c:forEach items="${categories}" var="c">
										<option value="${c.categoryId}">${c.categoryName}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label fw-semibold">Mô tả chi tiết</label>
							<textarea name="description" rows="4" class="form-control"
								placeholder="Nhập thông tin cấu hình, tính năng..."></textarea>
						</div>

						<div class="mb-3">
							<label class="form-label fw-semibold">Link ảnh trực tiếp
								(URL)</label> <input type="text" name="images" class="form-control"
								placeholder="https://...">
						</div>

						<div class="mb-4">
							<label class="form-label fw-semibold">Hoặc tải ảnh từ máy
								tính</label> <input type="file" name="imageFile" class="form-control">
						</div>

						<div class="d-flex gap-2">
							<button type="submit" class="btn btn-primary rounded-pill px-4">
								<i class="fa-solid fa-plus me-1"></i>Thêm Sản Phẩm
							</button>
							<a href="<c:url value='/admin/products'/>"
								class="btn btn-outline-secondary rounded-pill px-4">Hủy bỏ</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>