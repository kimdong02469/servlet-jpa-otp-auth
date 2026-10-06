<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Nhập Tài Khoản</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center min-vh-100">

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5 col-lg-4">
				<div class="card border-0 shadow-sm rounded-4 p-4">
					<div class="text-center mb-4">
						<i class="fa-solid fa-circle-user fa-3x text-primary mb-2"></i>
						<h4 class="fw-bold">Đăng Nhập</h4>
					</div>

					<c:if test="${not empty message}">
						<div class="alert alert-success py-2 small">
							<i class="fa-solid fa-check me-1"></i>${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger py-2 small">
							<i class="fa-solid fa-triangle-exclamation me-1"></i>${error}</div>
					</c:if>

					<form action="<c:url value='/login'/>" method="post">
						<div class="mb-3">
							<label class="form-label small fw-semibold">Tài khoản</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-user text-muted"></i></span> <input type="text"
									name="username" class="form-control"
									placeholder="Nhập username" required>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label small fw-semibold">Mật khẩu</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-lock text-muted"></i></span> <input type="password"
									name="password" class="form-control"
									placeholder="Nhập mật khẩu" required>
							</div>
						</div>

						<div
							class="d-flex justify-content-between align-items-center mb-4">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="remember"
									id="rem"> <label class="form-check-label small"
									for="rem">Ghi nhớ tôi</label>
							</div>
							<a href="<c:url value='/forgot-password'/>"
								class="small text-decoration-none">Quên mật khẩu?</a>
						</div>

						<button type="submit"
							class="btn btn-primary w-100 rounded-pill py-2 fw-semibold">Đăng
							Nhập</button>
					</form>

					<div class="text-center mt-4">
						<span class="small text-muted">Chưa có tài khoản?</span> <a
							href="<c:url value='/register'/>"
							class="small fw-semibold text-decoration-none">Đăng ký ngay</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>