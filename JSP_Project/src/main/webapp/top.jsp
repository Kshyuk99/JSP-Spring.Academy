<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰(관리자)</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body>
	<div align="center">
		<font size="5">쇼핑몰</font><br>
		<a href="<%=request.getContextPath()%>/login.jsp">로그인</a> | 
		<a href="<%=request.getContextPath()%>/register.jsp">회원가입</a>
		<table border="1" width="60%" height="70%">
			<tr height="10%">
				<th width="20%"><a href="best.jsp">베스트<a></th>				
				<th width="20%">배송</th>
				<th width="20%">상품목록</th>
				<th width="20%">장바구니</th>
			</tr>
			<tr height="40%">
				<td colspan="5">
</body>
</html>