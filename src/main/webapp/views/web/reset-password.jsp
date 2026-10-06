<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt Lại Mật Khẩu</title>
</head>
<body>
	<h2>Thiết Lập Mật Khẩu Mới</h2>
	<form action="<c:url value='/reset-password'/>" method="post">
		<label>Mật khẩu mới:</label><br> <input type="password"
			name="newPassword" required style="width: 280px; padding: 5px;"><br>
		<br>
		<button type="submit" style="padding: 6px 15px;">Lưu Mật Khẩu
			Mới</button>
	</form>
</body>
</html>