<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>

</head>
<body>
	<div align="center">
		<font size="5">쇼핑몰</font><br>
		<a href="<%=request.getContextPath()%>/login.jsp">로그인</a> | 
		<a href="<%=request.getContextPath()%>/signup.jsp">회원가입</a>
		<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
		<table border="1" width="80%" height="90%">
			<tr height="10%">
				<th width="20%"><a href="best.jsp">베스트</a></th>				
				<th width="20%">배송</th>
				<th width="20%"><a href="product_list.jsp">상품목록</a></th>  <!-- 상품 목록 링크 -->
				<th width="20%">장바구니</th>
				<th width="20%"><a href="formProduct.jsp">상품 추가</a></th>
				
			</tr>
			<tr height="40%">
				<td colspan="5">
				
					
					 <!-- <h3 id="products">상품 목록</h3>  -->
					 <!-- <a href="formProduct.jsp">상품 추가</a>  -->
					<table border="1" >
					<div align="center" style="background-color: #f8f8f8; padding: 20px;"> </div>
						<%
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						String URL = "jdbc:mysql://localhost:3306/spring5fs";
						String sql = "SELECT * FROM products";

						try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
						     Statement stmt = conn.createStatement();
						     ResultSet rs = stmt.executeQuery(sql);) {
						    while(rs.next()) {
						%>
						<tr>
							<%-- <td><a href="updFormProduct.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("name") %></a></td>
							<td><%= rs.getInt("price") %></td>
							<td><%= rs.getString("description") %></td>
							<td><a href="deleteProduct.jsp?id=<%= rs.getInt("id") %>">삭제</a></td> --%>
						</tr>
						<%
						    }
						} catch (Exception e) {
						    e.printStackTrace();
						}
						%>
						
						
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
