<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 입력</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    font-family: 'Noto Sans KR', sans-serif;
    color: #333;
}

.container {
    width: 80%;
    margin: 40px auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    padding: 20px;
    box-sizing: border-box;
}

h3 {
    margin-top: 0;
    margin-bottom: 20px;
    text-align: center;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"], input[type="number"], textarea, input[type="file"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #87CEEB;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
}

input[type="submit"]:hover {
    background-color: #3e8e41;
}
</style>
</head>
<body>
    <div class="container">
        <h3>상품 입력</h3>
        <form action="inputProduct.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">상품명:</label>
                <input type="text" name="name" id="name"><br>
            </div>
            <div class="form-group">
                <label for="price">가격:</label>
                <input type="number" name="price" id="price"><br>
            </div>
            <div class="form-group">
                <label for="description">설명:</label>
                <textarea name="description" id="description"></textarea><br>
            </div>
            <div class="form-group">
                <label for="image">이미지:</label>
                <input type="file" name="image" id="image"><br>
            </div>
            <input type="submit" value="상품 추가">
        </form>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>