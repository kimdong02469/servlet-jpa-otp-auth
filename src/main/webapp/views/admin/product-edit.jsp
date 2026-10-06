<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-7">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <div class="d-flex align-items-center mb-4">
                        <a href="<c:url value='/admin/products'/>" class="btn btn-sm btn-outline-secondary me-3"><i class="fa-solid fa-arrow-left"></i></a>
                        <h4 class="fw-bold mb-0">Chỉnh Sửa Sản Phẩm #${product.productId}</h4>
                    </div>

                    <form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="productId" value="${product.productId}">

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Tên sản phẩm <span class="text-danger">*</span></label>
                            <input type="text" name="productName" value="${product.productName}" class="form-control" required>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Giá bán (VNĐ) <span class="text-danger">*</span></label>
                                <input type="number" step="0.01" name="price" value="${product.price}" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Danh mục <span class="text-danger">*</span></label>
                                <select name="categoryId" class="form-select" required>
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.categoryId}" ${product.category.categoryId == c.categoryId ? 'selected' : ''}>
                                            ${c.categoryName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Mô tả sản phẩm</label>
                            <textarea name="description" rows="4" class="form-control">${product.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold d-block">Ảnh sản phẩm hiện tại</label>
                            <c:choose>
                                <c:when test="${product.images != null && product.images.startsWith('http')}">
                                    <img src="${product.images}" class="rounded-3 shadow-sm border mb-2" width="120" height="90" style="object-fit: cover;">
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value='/image?fname=${product.images}'/>" class="rounded-3 shadow-sm border mb-2" width="120" height="90" style="object-fit: cover;">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Link ảnh mới (URL)</label>
                            <input type="text" name="images" value="${product.images}" class="form-control">
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">Hoặc tải file ảnh mới</label>
                            <input type="file" name="imageFile" class="form-control">
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-warning rounded-pill px-4"><i class="fa-solid fa-pen-to-square me-1"></i>Cập Nhật</button>
                            <a href="<c:url value='/admin/products'/>" class="btn btn-outline-secondary rounded-pill px-4">Hủy bỏ</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>