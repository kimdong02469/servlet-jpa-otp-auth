<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Danh Mục</title>
</head>
<body>
	<h2>Danh Sách Danh Mục</h2>
	<p>
		<a href="<c:url value='/admin/category/add'/>">+ Thêm Danh Mục Mới</a>
		| <a href="<c:url value='/admin/products'/>">Sang Quản Lý Sản Phẩm</a>
	</p>

	<table border="1" width="100%" cellpadding="8" cellspacing="0">
		<tr bgcolor="#f2f2f2">
			<th>STT</th>
			<th>Hình Ảnh</th>
			<th>Tên Danh Mục</th>
			<th>Trạng Thái</th>
			<th>Hành Động</th>
		</tr>
		<c:forEach items="${listcate}" var="c" varStatus="stt">
			<tr>
				<td align="center">${stt.index + 1}</td>
				<td align="center"><c:choose>
						<c:when test="${c.images != null && c.images.startsWith('http')}">
							<img src="${c.images}" width="100" height="80" />
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/image?fname=${c.images}'/>" width="100"
								height="80" />
						</c:otherwise>
					</c:choose></td>
				<td><b>${c.categoryName}</b></td>
				<td align="center"><c:choose>
						<c:when test="${c.status == 1}">
							<span style="color: green;">Hoạt động</span>
						</c:when>
						<c:otherwise>
							<span style="color: red;">Khóa</span>
						</c:otherwise>
					</c:choose></td>
				<td align="center"><a
					href="<c:url value='/admin/category/edit?id=${c.categoryId}'/>">Sửa</a>
					| <a
					href="<c:url value='/admin/category/delete?id=${c.categoryId}'/>"
					onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>