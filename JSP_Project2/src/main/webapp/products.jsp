<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    // 상품 목록을 가져오는 쿼리
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "SELECT * FROM products";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<a href="formProduct.jsp">상품 추가</a>
<table border="1">
<%
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery(sql);) {
    while(rs.next()) {
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getDouble("price") %></td>
<td><%= rs.getString("description") %></td>
<td><%= rs.getString("image") %></td>
<td>
    <!-- 상품을 장바구니에 담는 링크 -->
    <a href="addToCart.jsp?id=<%= rs.getInt("id") %>&quantity=1">장바구니에 담기</a>
</td>
</tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
</body>
</html>