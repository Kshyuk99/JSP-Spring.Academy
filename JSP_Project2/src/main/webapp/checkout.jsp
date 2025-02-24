<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 입력</title>
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
                double total = 0;
                for (Map<String, Object> item : cart) {
                    String name = (String) item.get("name");
                    double price = (double)item.get("price");
                    int quantity = (int) item.get("quantity");
                    double subtotal = price * quantity;
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
        </form>
<%
    }
%>
</body>
</html>