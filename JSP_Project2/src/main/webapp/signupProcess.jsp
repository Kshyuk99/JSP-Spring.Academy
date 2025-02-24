<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String address = request.getParameter("address"); 

if (name != null && email != null && password != null) {
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "INSERT INTO users (name, email, password, address) VALUES (?, ?, ?, ?)";

    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, password);
        stmt.setString(4, address);
        
        stmt.executeUpdate();
        
        response.sendRedirect("login.jsp");  // 회원가입 후 로그인 페이지로 리디렉션
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
