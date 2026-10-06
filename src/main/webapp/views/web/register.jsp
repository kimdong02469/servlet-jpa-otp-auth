<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký Tài Khoản</title>
</head>
<body>
    <h2>Đăng Ký Tài Khoản</h2>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <form action="<c:url value='/register'/>" method="post">
        <label>Tên đăng nhập:</label><br>
        <input type="text" name="username" required style="width: 280px; padding: 5px;"><br><br>

        <label>Mật khẩu:</label><br>
        <input type="password" name="password" required style="width: 280px; padding: 5px;"><br><br>

        <label>Email nhận OTP:</label><br>
        <input type="email" name="email" required style="width: 280px; padding: 5px;"><br><br>

        <label>Họ và tên:</label><br>
        <input type="text" name="fullname" required style="width: 280px; padding: 5px;"><br><br>

        <label>Số điện thoại:</label><br>
        <input type="text" name="phone" style="width: 280px; padding: 5px;"><br><br>

        <button type="submit" style="padding: 6px 15px;">Đăng Ký & Nhận OTP</button>
    </form>
    <br>
    <a href="<c:url value='/login'/>">Đã có tài khoản? Đăng nhập</a>
</body>
</html>F