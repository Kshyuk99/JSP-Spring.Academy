<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<form action="signupProcess.jsp" method="POST">
    이름: <input type="text" name="name" required><br/>
    이메일: <input type="email" name="email" required><br/>
    비밀번호: <input type="password" name="password" required><br/>
    주소: <input type="address" name="address" required><br/>
    <input type="submit" value="회원가입">
</form>
</body>
</html>
<%@ include file="footer.jsp"%>	