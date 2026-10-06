<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh Sửa Danh Mục</title>
</head>
<body>
	<h2>Chỉnh Sửa Danh Mục #${cate.categoryId}</h2>
	<form action="<c:url value='/admin/category/update'/>" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="categoryid" value="${cate.categoryId}">

		<label>Tên danh mục:</label><br> <input type="text"
			name="categoryname" value="${cate.categoryName}" required
			style="width: 300px;"><br>
		<br> <label>Ảnh hiện tại:</label><br>
		<c:choose>
			<c:when
				test="${cate.images != null && cate.images.startsWith('http')}">
				<img src="${cate.images}" width="120" height="100" />
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/image?fname=${cate.images}'/>" width="120"
					height="100" />
			</c:otherwise>
		</c:choose>
		<br>
		<br> <label>Link ảnh mới (URL):</label><br> <input
			type="text" name="images" value="${cate.images}"
			style="width: 300px;"><br>
		<br> <label>Hoặc Upload ảnh mới thay thế:</label><br> <input
			type="file" name="images1"><br>
		<br> <label>Trạng thái:</label><br> <input type="radio"
			id="st1" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
		<label for="st1">Hoạt động</label> <input type="radio" id="st0"
			name="status" value="0" ${cate.status != 1 ? 'checked' : ''}>
		<label for="st0">Khóa</label><br>
		<br>

		<button type="submit">Cập Nhật</button>
		<a href="<c:url value='/admin/categories'/>">Hủy bỏ</a>
	</form>
</body>
</html>