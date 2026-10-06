<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Quản Lý Danh Mục</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<!-- Header Navbar Admin -->
	<nav class="navbar navbar-dark bg-dark shadow-sm">
		<div class="container-fluid px-4">
			<span class="navbar-brand fw-bold"><i
				class="fa-solid fa-layer-group text-warning me-2"></i>Bảng Điều
				Khiển Admin</span>
			<div>
				<a href="<c:url value='/admin/categories'/>"
					class="btn btn-warning btn-sm me-2">Danh mục</a> <a
					href="<c:url value='/admin/products'/>"
					class="btn btn-outline-light btn-sm me-2">Sản phẩm</a> <a
					href="<c:url value='/home'/>" class="btn btn-outline-info btn-sm">Xem
					Website</a>
			</div>
		</div>
	</nav>

	<div class="container my-5">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h3 class="fw-bold mb-0">Danh Sách Danh Mục</h3>
			<a href="<c:url value='/admin/category/add'/>"
				class="btn btn-primary rounded-pill"> <i
				class="fa-solid fa-plus me-1"></i>Thêm Danh Mục Mới
			</a>
		</div>

		<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
			<div class="table-responsive">
				<table class="table table-hover align-middle mb-0">
					<thead class="table-light">
						<tr>
							<th class="text-center" style="width: 60px;">STT</th>
							<th class="text-center" style="width: 120px;">Hình ảnh</th>
							<th>Tên danh mục</th>
							<th class="text-center" style="width: 150px;">Trạng thái</th>
							<th class="text-center" style="width: 150px;">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listcate}" var="c" varStatus="stt">
							<tr>
								<td class="text-center fw-bold">${stt.index + 1}</td>
								<td class="text-center"><c:choose>
										<c:when
											test="${c.images != null && c.images.startsWith('http')}">
											<img src="${c.images}" class="rounded-3 shadow-sm" width="80"
												height="60" style="object-fit: cover;">
										</c:when>
										<c:otherwise>
											<img src="<c:url value='/image?fname=${c.images}'/>"
												class="rounded-3 shadow-sm" width="80" height="60"
												style="object-fit: cover;">
										</c:otherwise>
									</c:choose></td>
								<td><span class="fw-bold fs-6">${c.categoryName}</span></td>
								<td class="text-center"><c:choose>
										<c:when test="${c.status == 1}">
											<span
												class="badge bg-success-subtle text-success px-3 py-2 rounded-pill">Hoạt
												động</span>
										</c:when>
										<c:otherwise>
											<span
												class="badge bg-danger-subtle text-danger px-3 py-2 rounded-pill">Đã
												khóa</span>
										</c:otherwise>
									</c:choose></td>
								<td class="text-center"><a
									href="<c:url value='/admin/category/edit?id=${c.categoryId}'/>"
									class="btn btn-sm btn-outline-warning me-1"> <i
										class="fa-solid fa-pen-to-square"></i>
								</a> <a
									href="<c:url value='/admin/category/delete?id=${c.categoryId}'/>"
									onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');"
									class="btn btn-sm btn-outline-danger"> <i
										class="fa-solid fa-trash"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>