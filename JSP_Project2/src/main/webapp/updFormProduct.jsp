<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String name = "";
double price = 0;
String description = "";

String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "SELECT * FROM products WHERE id = " + id;

try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery(sql);) {
    if (rs.next()) {
        name = rs.getString("name");
        price = rs.getDouble("price");
        description = rs.getString("description");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
<form action="updateProduct.jsp" method="post">
ID: <input type="text" name="id" value="<%= id %>" readonly /><br/>
상품명: <input type="text" name="name" value="<%= name %>" /><br/>
가격: <input type="text" name="price" value="<%= price %>" /><br/>
수량: <input type="text" name="description" value="<%= description %>" /><br/> <!-- 설명을 수량으로 변경 -->
<input type="submit" value="상품 수정"/>
</form>
</body>
</html>
