<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sản Phẩm Mới</title>
</head>
<body>
	<h2>Thêm Sản Phẩm</h2>
	<form action="<c:url value='/admin/product/insert'/>" method="post"
		enctype="multipart/form-data">
		<label>Tên sản phẩm:</label><br> <input type="text"
			name="productName" required style="width: 350px;"><br>
		<br> <label>Giá bán (VNĐ):</label><br> <input type="number"
			step="0.01" name="price" required style="width: 350px;"><br>
		<br> <label>Danh mục sản phẩm:</label><br> <select
			name="categoryId" style="width: 350px; padding: 5px;">
			<c:forEach items="${categories}" var="c">
				<option value="${c.categoryId}">${c.categoryName}</option>
			</c:forEach>
		</select><br>
		<br> <label>Mô tả chi tiết:</label><br>
		<textarea name="description" rows="5" style="width: 350px;"></textarea>
		<br>
		<br> <label>Link ảnh (URL):</label><br> <input type="text"
			name="images" placeholder="https://..." style="width: 350px;"><br>
		<br> <label>Hoặc Upload ảnh từ máy:</label><br> <input
			type="file" name="imageFile"><br>
		<br>

		<button type="submit">Lưu Sản Phẩm</button>
		<a href="<c:url value='/admin/products'/>">Hủy bỏ</a>
	</form>
</body>
</html>