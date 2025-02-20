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
String URL= "jdbc:mysql://localhost:3306/spring5fs";
String sql ="SELECT name, price, description FROM products";
Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		)
{
while(rs.next()){
	 String productName = rs.getString("name");
     int price = rs.getInt("price");
     int quantity = rs.getInt("description");
    // String imageUrl = rs.getString("image_url");
    String imageurl= "https://picsum.photos/250/250" ;
	}	
}catch(Exception e) { e.printStackTrace(); }
%> 
<form name="f" method="POST" action="best.jsp">
<div align="center">
	<h3>베스트 물품 </h3>
	<table width="100%" class="outline">
<table border="1" width="80%" class="outline">
	<caption>상품목록</caption>
	<tr>
		<td style="width: 150px; background-color: gray;">상품명</td>
		<td><input type="text" name="sangpum" class="form-control" style="width: 200px;" required="required"> </td>
	</tr>		
	<tr>
		<td style="width: 150px; background-color: gray;">이미지</td>
		<td><input type="image" img src="https://picsum.photos/250/250" class="form-control" style="width: 300px;" required="required"> </td>
		
	</tr>
	<tr>
		<td style="width: 150px; background-color: gray;">가격</td>
		<td><input type="text" name="price" class="form-control" style="width: 200px;" required="required"> </td>
	</tr>	
	<tr>
		<td style="width: 150px; background-color: gray;">수량</td>
		<td><input type="text" name="amount" class="form-control" style="width: 200px;" required="required"> </td>
		</tr>	
		<td align="center">
			<input type="submit" value="등록">
			<input type="submit" value="취소" onclick="window.location='index.jsp'">
		</td>
</table>
</div>
</form>
<%
	
%>
</table>
</body>
</html>
<%@ include file="footer.jsp"%>	