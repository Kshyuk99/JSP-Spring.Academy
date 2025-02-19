<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from dept where deptno ="+ request.getParameter("deptno");
int deptno=0;
String dname="";
String loc="";
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		) {
	if(rs.next()){
		deptno = rs.getInt("deptno");
		dname = rs.getString("dname");
		loc = rs.getString("loc");
		//System.out.println(deptno + "," + dname + "," + loc);
	}
}catch(Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dept 입력</title>
</head>
<body>
<form action="updateDept.jsp">
번호: <input type="text" name="deptno" value="<%=deptno%>"/><br/>
부서: <input type="text" name="dname" value="<%=dname%>"/><br/>
도시: <input type="text" name="loc" value="<%=loc%>"/><br/>
<input type="submit" value="수정"/>
</body>
</html>