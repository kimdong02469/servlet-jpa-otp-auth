<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Ký Tài Khoản</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center min-vh-100 py-5">

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-5">
				<div class="card border-0 shadow-sm rounded-4 p-4">
					<div class="text-center mb-4">
						<i class="fa-solid fa-user-plus fa-3x text-warning mb-2"></i>
						<h4 class="fw-bold">Tạo Tài Khoản Mới</h4>
						<p class="small text-muted mb-0">Hệ thống sẽ gửi mã OTP đến
							email để kích hoạt</p>
					</div>

					<c:if test="${not empty error}">
						<div class="alert alert-danger py-2 small">
							<i class="fa-solid fa-circle-exclamation me-1"></i>${error}</div>
					</c:if>

					<form action="<c:url value='/register'/>" method="post">
						<div class="mb-3">
							<label class="form-label small fw-semibold">Tên đăng nhập
								<span class="text-danger">*</span>
							</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-user text-muted"></i></span> <input type="text"
									name="username" class="form-control"
									placeholder="Nhập username" required>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label small fw-semibold">Mật khẩu <span
								class="text-danger">*</span></label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-lock text-muted"></i></span> <input type="password"
									name="password" class="form-control"
									placeholder="Nhập mật khẩu" required>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label small fw-semibold">Email nhận
								OTP <span class="text-danger">*</span>
							</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-envelope text-muted"></i></span> <input
									type="email" name="email" class="form-control"
									placeholder="example@gmail.com" required>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label small fw-semibold">Họ và tên</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-id-card text-muted"></i></span> <input type="text"
									name="fullname" class="form-control" placeholder="Nguyễn Văn A">
							</div>
						</div>

						<div class="mb-4">
							<label class="form-label small fw-semibold">Số điện thoại</label>
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-phone text-muted"></i></span> <input type="text"
									name="phone" class="form-control" placeholder="0901234567">
							</div>
						</div>

						<button type="submit"
							class="btn btn-warning w-100 rounded-pill py-2 fw-semibold">
							<i class="fa-solid fa-paper-plane me-1"></i>Đăng Ký & Nhận OTP
						</button>
					</form>

					<div class="text-center mt-4">
						<span class="small text-muted">Đã có tài khoản?</span> <a
							href="<c:url value='/login'/>"
							class="small fw-semibold text-decoration-none ms-1">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>