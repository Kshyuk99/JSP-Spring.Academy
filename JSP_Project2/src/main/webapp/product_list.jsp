<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";  // 데이터베이스 주소
String sql = "SELECT * FROM products";  // 상품 목록을 가져오는 SQL 쿼리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<h2>상품 목록</h2>
<!-- <a href="formProduct.jsp">상품 추가</a> -->  <!-- 상품 추가 페이지로 이동하는 링크 -->
<table border="1">
    <thead>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th> <!-- 설명을 수량으로 변경 -->
            <!-- <th>수정</th>
            <th>삭제</th> -->
        </tr>
    </thead>
    <tbody>
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
            <%-- <td><a href="updFormProduct.jsp?id=<%= rs.getInt("id") %>">수정</a></td> <!-- 수정 링크 -->
            <td><a href="deleteProduct.jsp?id=<%= rs.getInt("id") %>">삭제</a></td> <!-- 삭제 링크 --> --%>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </tbody>
</table>
</body>
</html>
