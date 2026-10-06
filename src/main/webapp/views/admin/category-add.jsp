<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Thêm Danh Mục Mới</title>
		</head>

		<body>
			<h2>Thêm Danh Mục</h2>
			<form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
				<label>Tên danh mục:</label><br>
				<input type="text" name="categoryname" required style="width: 300px;"><br><br>

				<label>Link ảnh (URL):</label><br>
				<input type="text" name="images" placeholder="https://..." style="width: 300px;"><br><br>

				<label>Hoặc Upload ảnh từ máy:</label><br>
				<input type="file" name="images1"><br><br>

				<label>Trạng thái:</label><br>
				<input type="radio" id="st1" name="status" value="1" checked>
				<label for="st1">Hoạt động</label>
				<input type="radio" id="st0" name="status" value="0">
				<label for="st0">Khóa</label><br><br>

				<button type="submit">Thêm Danh Mục</button>
				<a href="<c:url value='/admin/categories'/>">Hủy bỏ</a>
			</form>
		</body>

		</html>