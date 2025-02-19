<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
String empno = request.getParameter("empno");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "delete from emp where empno = "+ empno;
Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
		 Statement stmt = conn.createStatement();
			)
	{
		stmt.executeUpdate(sql);
	} catch(Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("index.jsp");
%>