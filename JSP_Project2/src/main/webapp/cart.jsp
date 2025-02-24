<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<h3>장바구니</h3>

<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
        <p>장바구니에 상품이 없습니다.</p>
<%
    } else {
%>
        <table border="1">
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>합계</th>
                <th>삭제</th>
            </tr>
            <%
                double total = 0;
                for (Map<String, Object> item : cart) {
                    String name = (String) item.get("name");
                    double price = (double) item.get("price");
                    int quantity = (int) item.get("quantity");
                    double subtotal = price * quantity;
                    total += subtotal;
            %>
            <tr>
                <td><%= name %></td>
                <td><%= price %></td>
                <td><%= quantity %></td>
                <td><%= subtotal %></td>
                <td><a href="removeFromCart.jsp?id=<%= item.get("id") %>">삭제</a></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="4" align="right">총합</td>
                <td><%= total %></td>
            </tr>
        </table>
        <br>
        <a href="checkout.jsp">주문하기</a>
<%
    }
%>
    <a href="product_list.jsp">상품 목록으로</a>
</body>
</html>