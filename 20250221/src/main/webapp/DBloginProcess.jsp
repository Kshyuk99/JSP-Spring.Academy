<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs =null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String URL = "jdbc:mysql://localhost:3306/spring5fs";
		conn = DriverManager.getConnection(URL, "root", "1234");
		 String sql = "SELECT * FROM emp WHERE empno =? AND ename=? ";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1,empno);
		 pstmt.setString(2,ename);
		 rs = pstmt.executeQuery();
		 if(rs.next()){
			 session.setAttribute("empno",empno);
			 session.setAttribute("ename",ename);
			 response.sendRedirect("DBmain.jsp");
		 }else{
			 response.sendRedirect("DBlogin.jsp");
		 }
	}catch (Exception e) { e.printStackTrace(); 
	}finally{
		try{if(rs!=null){rs.close();}}catch (Exception e) { e.printStackTrace(); }
		try{if(pstmt!=null){pstmt.close();}}catch (Exception e) { e.printStackTrace(); }
		try{if(conn!=null){conn.close();}}catch (Exception e) { e.printStackTrace(); }
		
	}
	
   
    

%>