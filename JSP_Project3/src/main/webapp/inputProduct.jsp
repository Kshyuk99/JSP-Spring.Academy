<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "INSERT INTO products (name, price, description, image) VALUES (?,?,?,?)";

    try (Connection conn = DriverManager.getConnection(URL, "root", "1234"); 
         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        stmt.setString(1, request.getParameter("name"));
        stmt.setDouble(2, Double.parseDouble(request.getParameter("price")));
        stmt.setString(3, request.getParameter("description"));
        stmt.setString(4, request.getParameter("image"));

        stmt.executeUpdate();

        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int productId = generatedKeys.getInt(1);
                response.sendRedirect("product_list.jsp?addedProductId=" + productId);
            } else {
                response.sendRedirect("product_list.jsp");
            }
        }

    } catch (Exception e) {
        
        System.err.println("Error adding product: " + e.getMessage());
        e.printStackTrace(); 

        
        %>
        <p>상품을 추가하는 중 오류가 발생했습니다.</p>
        <% 
    }
%>