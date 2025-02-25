<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 입력</title>
</head>
<body>
<form action="inputProduct.jsp" method="post" enctype="multipart/form-data">
    <label for="name">상품명:</label>
    <input type="text" name="name" id="name"><br>

    <label for="price">가격:</label>
    <input type="number" name="price" id="price"><br>

    <label for="description">설명:</label>
    <textarea name="description" id="description"></textarea><br>

    <label for="image">이미지:</label>
    <input type="file" name="image" id="image"><br>

    <input type="submit" value="상품 추가">
</form>
</body>
</html>
<%@ include file="footer.jsp"%>