<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên Mật Khẩu</title>
</head>
<body>
	<h2>Khôi Phục Mật Khẩu</h2>
	<c:if test="${not empty error}">
		<p style="color: red;">${error}</p>
	</c:if>
	<form action="<c:url value='/forgot-password'/>" method="post">
		<label>Nhập địa chỉ Email đã đăng ký tài khoản:</label><br> <input
			type="email" name="email" required
			style="width: 280px; padding: 6px;"><br>
		<br>
		<button type="submit" style="padding: 6px 15px;">Gửi Mã OTP</button>
	</form>
	<br>
	<a href="<c:url value='/login'/>">Quay lại Đăng nhập</a>
</body>
</html>