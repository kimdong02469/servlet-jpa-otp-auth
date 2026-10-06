<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đặt Lại Mật Khẩu Mới</title>
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
					<i class="fa-solid fa-lock-open fa-3x text-success mb-3"></i>
					<h4 class="fw-bold">Đặt Mật Khẩu Mới</h4>
					<p class="small text-muted mb-4">Xác thực OTP thành công. Hãy
						nhập mật khẩu mới cho tài khoản</p>

					<form action="<c:url value='/reset-password'/>" method="post">
						<div class="mb-4">
							<div class="input-group">
								<span class="input-group-text bg-white"><i
									class="fa-solid fa-lock text-muted"></i></span> <input type="password"
									name="newPassword" class="form-control"
									placeholder="Nhập mật khẩu mới..." required>
							</div>
						</div>
						<button type="submit"
							class="btn btn-success w-100 rounded-pill py-2 fw-semibold">
							Lưu Mật Khẩu Mới</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>