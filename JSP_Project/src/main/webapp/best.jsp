<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
//String URL= "jdbc:mysql://localhost:3306/spring5fs";
//String sql ="SELECT product_name, price, quantity, image_url FROM products";
//Class.forName("com.mysql.cj.jdbc.Driver");
//try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
//		Statement stmt = conn.createStatement();
//		ResultSet rs = stmt.executeQuery(sql);
//		)
///{
//while(rs.next()){
//	 String productName = rs.getString("product_name");
//     double price = rs.getDouble("price");
//     int quantity = rs.getInt("quantity");
 //    String imageUrl = rs.getString("image_url");
//	}	
//}catch(Exception e) { e.printStackTrace(); }
%>
<table border="1" width="80%" class="outline">
	<caption>상품목록</caption>
	<th>상품명</th>
	<th>가격</th>
	<th>수량</th>
	<th>이미지</th>
<%
	
%>
</table>
</body>
</html>