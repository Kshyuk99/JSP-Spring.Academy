<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
</style>
</head>
<body>
<div class="container">
    <h3>장바구니</h3>

    <%
        response.setContentType("text/html;charset=UTF-8");
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
            <p style="text-align:center;">장바구니에 상품이 없습니다.</p>
    <%
        } else {
    %>
            <table>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                    <th>삭제</th>
                </tr>
                <%
                    int total = 0;
                    for (Map<String, Object> item : cart) {
                        String name = (String) item.get("name");
                        int price = (int) item.get("price");
                        int quantity = (int) item.get("quantity");
                        int subtotal = price *quantity;
                        total += subtotal;
                %>
                <tr>
                    <td><%= name %></td>
                    <td class="right-align"><%= price %>원</td>
                    <td><%= quantity %></td>
                    <td class="right-align"><%= subtotal %>원</td>
                    <td>
                        <a class="btn" href="removeFromCart.jsp?id=<%= item.get("id") %>">삭제</a>
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3" class="right-align"><strong>총합</strong></td>
                    <td class="right-align"><%= total %>원</td>
                    <td></td>
                </tr>
            </table>
            <a class="btn" href="checkout.jsp">주문하기</a>
    <%
        }
    %>
    <div class="links">
        <a href="product_list.jsp">상품 목록으로</a>
        <a href="index.jsp">쇼핑몰 홈</a>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>