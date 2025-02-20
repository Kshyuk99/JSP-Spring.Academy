<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String price = request.getParameter("price");
String description = request.getParameter("description");

if (!"".equals(name) && !"".equals(price) && !"".equals(description)) {
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "INSERT INTO products(name, price, description) VALUES('" + name + "', " + price + ", '" + description + "')";
    Class.forName("com.mysql.cj.jdbc.Driver");

    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         Statement stmt = conn.createStatement();) {
        stmt.executeUpdate(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
}
response.sendRedirect("product_list.jsp");
%>
