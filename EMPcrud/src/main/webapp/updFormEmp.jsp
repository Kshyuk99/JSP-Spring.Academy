<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from emp where empno ="+ request.getParameter("empno");
int empno=0;
String ename="";
String job ="";
String mgr ="";
String hiredate ="";
String sal ="";
String comm ="";
String deptno ="";
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		) {
	if(rs.next()){
		empno = rs.getInt("empno");
		ename = rs.getString("ename");
		job = rs.getString("job");
		mgr = rs.getString("mgr");
		hiredate = rs.getString("hiredate");
		sal = rs.getString("sal");
		comm = rs.getString("comm");
		deptno = rs.getString("deptno");
		
	}
}catch(Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
<form action="updateEmp.jsp">
번호: <input type="text" name="empno" value="<%=empno %>" /><br/>
이름: <input type="text" name="ename" value="<%=ename %>" /><br/>
직업: <input type="text" name="job" value="<%=job %>" /><br/>
MGR: <input type="text" name="mgr" value="<%=mgr %>" /><br/>
날짜: <input type="text" name="hiredate" value="<%=hiredate %>" /><br/>
급여: <input type="text" name="sal" value="<%=sal %>" /><br/>
COMM: <input type="text" name="comm" value="<%=comm %>" /><br/>
번호: <input type="text" name="deptno" value="<%=deptno %>" /><br/>
<input type="submit" value="수정" />
</body>
</html>