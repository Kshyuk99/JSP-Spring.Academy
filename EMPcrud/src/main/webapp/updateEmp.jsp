<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
String mgr = request.getParameter("mgr");
String hiredate = request.getParameter("hiredate");
String sal = request.getParameter("sal");
String comm = request.getParameter("comm");
String deptno = request.getParameter("deptno");

if(!"".equals(empno) && !"".equals(ename) && !"".equals(job) && !"".equals(mgr)
		&& !"".equals(hiredate) && !"".equals(sal) && !"".equals(comm) && !"".equals(deptno)
		){
	String URL = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "update emp set ename ='"+ename+"',job='"+job+"',mgr='"+mgr+"',hiredate='"+hiredate+"',sal='"+sal+"',comm='"+comm+"',deptno='"+deptno+"'";
	Class.forName("com.mysql.cj.jdbc.Driver");
	
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
	 Statement stmt = conn.createStatement();
		)
{
	stmt.executeUpdate(sql);
} catch(Exception e) { e.printStackTrace(); }
}
response.sendRedirect("index.jsp");
%>