<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="result.jsp">
번호: <input type="text" name="deptno" /><br>
부서명: <input type="text" name="dname" /><br>
도시: <input type="text" name="loc" /><br>
<input type="submit" />
<%
String sql = "insert into dept(no, name, loc) values(?,?,?)";
%>
</form>
</body>
</html>

	