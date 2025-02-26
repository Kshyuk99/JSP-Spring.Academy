<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>

	<%	
	String userid = (String)session.getAttribute("userid");	
	%>	
	<!DOCTYPE html>	
	<html>	
	<head>	
	<meta charset="UTF-8">	
	<title>쇼핑몰</title>	
	<style>	
	body {
	
	/* background-color: #f8f8f8; */ /* 아주 연한 회색 배경 */
	
	font-family: sans-serif; /* 글꼴 (선택 사항) */
	
	}
	
	
	
	h1 {	
	text-align: center; /* 제목 가운데 정렬 */	
	margin-bottom: 30px; /* 제목 아래 여백 */	
	}	
	/* 테이블 스타일 */
	
	table {	
	width: 80%; /* 테이블 너비 */	
	margin: 20px auto; /* 가운데 정렬 */	
	border-collapse: collapse; /* 테두리 합치기 */	
	}
	
	th, td {	
	border: 1px solid #ddd; /* 테두리 스타일 */	
	padding: 10px; /* 안쪽 여백 */	
	text-align: center; /* 텍스트 가운데 정렬 */	
	}
	
	th {	
	background-color: #eee; /* 헤더 배경색 (더 옅은 회색)*/	
	}	
	
	/* 링크 스타일 */	
	a {	
	text-decoration: none; /* 밑줄 제거 */	
	color: navy; /* 링크 색상 */	
	font-weight: bold; /* 굵게 (선택 사항) */	
	}	
	
	a:hover {	
	text-decoration: underline; /* 마우스 오버 시 밑줄 */	
	}
		
	/* 최상단 링크 컨테이너 스타일 */	
	.top-links {	
	text-align: center; /* 가운데 정렬*/	
	margin-bottom: 10px;	
	}	
	
	.top-links a {	
	margin: 0 10px; /* 링크 사이 간격 */
	
	}	
	.product-container {
		display: flex;
		justify-content: center;
		gap: 80px;
	}
	</style>	
	</head>	
	<body>	
	<div align="center">
	<font size="5">쇼핑몰</font><br>	
	<a href="<%=request.getContextPath()%>/login.jsp">로그인</a> |	
	<a href="<%=request.getContextPath()%>/signup.jsp">회원가입</a> |	
	<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>	
	<div style="margin-bottom: 20px;">
	
	<form method="get" action="search_result.jsp">	
	<select name="searchType">	
	<option value="name">상품이름</option>	
	<option value="price">가격검색</option>	
	</select>	
	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">	
	<input type="submit" value="검색">	
	</form>	
	</div>
	
	<table border="1" width="80%">	
	<tr height="10%">	
	<th width="20%"><a href="best.jsp">베스트</a></th>	
	<th width="20%"><a href="product_list.jsp">상품목록</a></th>	
	<th width="20%"><a href="cart.jsp">장바구니</a></th>	
	<th width="20%"><a href="formProduct.jsp">상품 추가</a></th>	
	</tr>
	
	<tr>	
	<td colspan="5">	
	<div class="product-container"> <!-- <div class="product-item"> <input type="text" name="sangpum" value="갤럭시북5" class="form-control" style="width: 200px;" required="required"> -->
                        <input type="image" img src="https://shopping-phinf.pstatic.net/main_5225015/52250151618.20250110133314.jpg?type=f640" class="form-control" style="width: 200px;" required="required">
                        <input type="image" img src="https://shopping-phinf.pstatic.net/main_5225015/52250151618.20250110133314.jpg?type=f640" class="form-control" style="width: 200px;" required="required">
                        <input type="image" img src="https://shopping-phinf.pstatic.net/main_5225015/52250151618.20250110133314.jpg?type=f640" class="form-control" style="width: 200px;" required="required">
                        <!-- <input type="text" name="price" value="1899000" class="form-control" style="width: 200px;" required="required">
                        <input type="text" name="amount" value="20" class="form-control" style="width: 200px;" required="required"> -->
                    </div>
                    <div class="product-container">
                    <!-- <div class="product-item"> <input type="text" name="sangpum" value="갤럭시S25" class="form-control" style="width: 200px;" required="required"> -->
                        <input type="image" img src="https://shopping-phinf.pstatic.net/main_5262874/52628743821.20250220111014.jpg?type=f640" class="form-control" style="width: 200px;" required="required">
                        <input type="image" img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fditto-phinf.pstatic.net%2F20240705_255%2F1720162349915Ihe5L_JPEG%2F6687982cb48ee75234d03391.jpg&type=o&size=472x472&ttype=input" class="form-control" style="width: 200px;" required="required">
                        <input type="image" img src="https://shop-phinf.pstatic.net/20241107_255/1730962039680OzIvk_JPEG/16673204874466463_512513810.jpg?type=m510" class="form-control" style="width: 200px;" required="required">
                        <!-- <input type="text" name="price" value="1086000" class="form-control" style="width: 200px;" required="required"> -->
                        <!-- <input type="text" name="amount" value="20" class="form-control" style="width: 200px;" required="required"> -->
                   </div>
                    <!-- </div>
                </div> -->
                </td>
                </tr>
	
	<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String URL = "jdbc:mysql://localhost:3306/spring5fs";	
	String sql = "SELECT * FROM products";
	
	
	
	try (Connection conn = DriverManager.getConnection(URL, "root", "1234");	
	PreparedStatement pstmt = conn.prepareStatement(sql);	
	ResultSet rs = pstmt.executeQuery();) {	
	while(rs.next()) {
	
	%>
	
	<%-- <tr>
	
	<td><a href="updFormProduct.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("name") %></a></td>	
	<td><%= rs.getInt("price") %></td>	
	<td><%= rs.getString("description") %></td>	
	<td><a href="deleteProduct.jsp?id=<%= rs.getInt("id") %>">삭제</a></td>	
	</tr> --%>
	
	
	
	<!--다른 상품 -->
	
	<%
	
	}
	
	} catch (Exception e) {  e.printStackTrace();  }
	
	%>
	
	</table>	
	<!-- </td>	
	</tr>	
	</table>	 -->
	</div>	
	</body>	
	</html>

<%@ include file="footer.jsp"%>