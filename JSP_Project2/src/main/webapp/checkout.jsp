<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 입력</title>
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
    margin-top: 100;
    margin-bottom: 20px;
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    font-size: 14px;
}
table th {
    background-color: #f2f2f2;
    font-weight: 600;
}
table tr:nth-child(even) {
    background-color: #fafafa;
}

.btn {
    display: inline-block;
    padding: 8px 14px;
    margin-right: 10px;
    text-decoration: none;
    border-radius: 4px;
    color: white;
    background-color: gray;
    transition: background-color 0.2s ease;
    font-size: 14px;
}
.btn:hover {
    background-color: #0056b3;
}
.links a {
    margin-right: 10px;
    color: #007bff;
    text-decoration: none;
}
.links a:hover {
    text-decoration: underline;
}

.right-align {
    text-align: right;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"], select {
    width: 40%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    box-sizing: border-box;
}
input[type="submit"]{
    background-color: lightblue; 
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
<h3>주문 정보 입력</h3>

<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
        <p>장바구니에 상품이 없습니다. 장바구니를 확인하고 주문을 진행하세요.</p>
        <a href="cart.jsp">장바구니로 가기</a>
<%
    } else {
%>
        <form action="placeOrder.jsp" method="post">
        <table border="1">
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>합계</th>
            </tr>
            <%
                int total = 0;
                for (Map<String, Object> item : cart) {
                    String name = (String) item.get("name");
                    int price = (int)item.get("price");
                    int quantity = (int) item.get("quantity");
                    int subtotal = price * quantity;
                    total += subtotal;
            %>
            <tr>
                <td><%= name %></td>
                <td><%= price %></td>
                <td><%= quantity %></td>
                <td><%= subtotal %></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3" align="right">총합</td>
                <td><%= total %></td>
            </tr>
        </table>

        <br>
        <label for="shippingAddress">배송 주소:</label>
        <input type="text" id="shippingAddress" name="shippingAddress" required/><br/><br/>

        <label for="paymentMethod">결제 방법:</label>
        <select name="paymentMethod" id="paymentMethod" required>
            <option value="creditCard">신용카드</option>
            <option value="paypal">페이팔</option>
            <option value="bankTransfer">계좌이체</option>
        </select><br/><br/>

        <input type="submit" value="주문하기"/>
        <a class="btn" href="cart.jsp">장바구니</a>
        </form>
<%
    }
%>
</body>
</html>