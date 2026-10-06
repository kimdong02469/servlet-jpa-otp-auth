<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh Sửa Sản Phẩm</title>
</head>
<body>
    <h2>Chỉnh Sửa Sản Phẩm #${product.productId}</h2>
    <form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="${product.productId}">

        <label>Tên sản phẩm:</label><br>
        <input type="text" name="productName" value="${product.productName}" required style="width: 350px;"><br><br>

        <label>Giá bán (VNĐ):</label><br>
        <input type="number" step="0.01" name="price" value="${product.price}" required style="width: 350px;"><br><br>

        <label>Danh mục sản phẩm:</label><br>
        <select name="categoryId" style="width: 350px; padding: 5px;">
            <c:forEach items="${categories}" var="c">
                <option value="${c.categoryId}" ${product.category.categoryId == c.categoryId ? 'selected' : ''}>
                    ${c.categoryName}
                </option>
            </c:forEach>
        </select><br><br>

        <label>Mô tả chi tiết:</label><br>
        <textarea name="description" rows="5" style="width: 350px;">${product.description}</textarea><br><br>

        <label>Ảnh hiện tại:</label><br>
        <c:choose>
            <c:when test="${product.images != null && product.images.startsWith('http')}">
                <img src="${product.images}" width="120" height="100" />
            </c:when>
            <c:otherwise>
                <img src="<c:url value='/image?fname=${product.images}'/>" width="120" height="100" />
            </c:otherwise>
        </c:choose>
        <br><br>

        <label>Link ảnh mới (URL):</label><br>
        <input type="text" name="images" value="${product.images}" style="width: 350px;"><br><br>

        <label>Hoặc Upload ảnh mới thay thế:</label><br>
        <input type="file" name="imageFile"><br><br>

        <button type="submit">Cập Nhật</button>
        <a href="<c:url value='/admin/products'/>">Hủy bỏ</a>
    </form>
</body>
</html>F