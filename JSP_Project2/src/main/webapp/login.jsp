<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2>로그인</h2>
<form action="loginProcess.jsp" method="POST">
    이메일: <input type="email" name="email" required><br/>
    비밀번호: <input type="password" name="password" required><br/>
    <input type="submit" value="로그인">
</form>
</body>
</html>
