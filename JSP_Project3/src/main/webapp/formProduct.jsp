<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 입력</title>
</head>
<body>
<form action="inputProduct.jsp" method="post">
상품명: <input type="text" name="name" /><br/>
가격: <input type="text" name="price" /><br/>
수량: <input type="text" name="description" /><br/>
이미지: <input type="image" name="image" /><br/>
<input type="submit" value="상품 추가"/>
</form>
</body>
</html>
<%@ include file="footer.jsp"%>