<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html lang="vi">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Thêm Danh Mục Mới</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
		</head>

		<body class="bg-light">

			<div class="container my-5">
				<div class="row justify-content-center">
					<div class="col-md-7 col-lg-6">
						<div class="card border-0 shadow-sm rounded-4 p-4">
							<div class="d-flex align-items-center mb-4">
								<a href="<c:url value='/admin/categories'/>"
									class="btn btn-sm btn-outline-secondary me-3"><i
										class="fa-solid fa-arrow-left"></i></a>
								<h4 class="fw-bold mb-0">Thêm Danh Mục Mới</h4>
							</div>

							<form action="<c:url value='/admin/category/insert'/>" method="post"
								enctype="multipart/form-data">
								<div class="mb-3">
									<label class="form-label fw-semibold">Tên danh mục <span
											class="text-danger">*</span></label>
									<input type="text" name="categoryname" class="form-control"
										placeholder="Nhập tên danh mục..." required>
								</div>

								<div class="mb-3">
									<label class="form-label fw-semibold">Link ảnh ngoài (URL)</label>
									<input type="text" name="images" class="form-control"
										placeholder="https://example.com/image.jpg">
								</div>

								<div class="mb-3">
									<label class="form-label fw-semibold">Hoặc tải ảnh từ máy tính</label>
									<input type="file" name="images1" class="form-control">
								</div>

								<div class="mb-4">
									<label class="form-label fw-semibold d-block">Trạng thái</label>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" id="st1" value="1"
											checked>
										<label class="form-check-label text-success fw-semibold" for="st1">Hoạt
											động</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" id="st0" value="0">
										<label class="form-check-label text-danger fw-semibold" for="st0">Khóa</label>
									</div>
								</div>

								<div class="d-flex gap-2">
									<button type="submit" class="btn btn-primary rounded-pill px-4"><i
											class="fa-solid fa-save me-1"></i>Lưu Danh Mục</button>
									<a href="<c:url value='/admin/categories'/>"
										class="btn btn-outline-secondary rounded-pill px-4">Hủy bỏ</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</body>

		</html>