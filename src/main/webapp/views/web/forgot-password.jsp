<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên Mật Khẩu</title>
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
				<div class="card border-0 shadow-sm rounded-4 p-4 text-center">
					<i class="fa-solid fa-key fa-3x text-primary mb-3"></i>
					<h4 class="fw-bold">Quên Mật Khẩu</h4>
					<p class="small text-muted mb-4">Nhập email tài khoản của bạn
						để nhận mã xác nhận OTP khôi phục</p>

					<c:if test="${not empty error}">
						<div class="alert alert-danger py-2 small text-start">
							<i class="fa-solid fa-circle-exclamation me-1"></i>${error}</div>
					</c:if>

					<form action="<c:url value='/forgot-password'/>" method="post">
						<div class="mb-4">
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-envelope text-muted"></i></span> <input
									type="email" name="email" class="form-control"
									placeholder="Nhập địa chỉ email..." required>
							</div>
						</div>
						<button type="submit"
							class="btn btn-primary w-100 rounded-pill py-2 fw-semibold">
							Gửi Mã OTP</button>
					</form>

					<div class="mt-4">
						<a href="<c:url value='/login'/>"
							class="small text-muted text-decoration-none"><i
							class="fa-solid fa-arrow-left me-1"></i>Quay lại Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>