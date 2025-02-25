<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
 String email = request.getParameter("email");
String password = request.getParameter("password");

if (email != null && password != null) {
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    
    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, email);
        stmt.setString(2, password);
        
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            // 로그인 성공 시 세션을 만들거나 리디렉션
            session.setAttribute("user", rs.getString("name"));
            response.sendRedirect("index.jsp");  
        } else {
        	%>         	
        	<script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back();
        </script>
 <%          
        }
 %>          
       <!--  response.sendRedirect("login.jsp"); -->
       <% 
    } catch (Exception e) {
        e.printStackTrace();
    }
} 




%> 
