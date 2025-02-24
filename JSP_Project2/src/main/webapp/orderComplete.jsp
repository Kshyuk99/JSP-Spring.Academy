<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
    <h3>주문 완료</h3>

    <%
        String orderId = request.getParameter("orderId");
        if (orderId != null) {
    %>
        <p>주문이 성공적으로 완료되었습니다. 주문 번호: <%= orderId %></p>
    <%
        } else {
    %>
        <p>주문 번호를 확인할 수 없습니다.</p>
    <%
        }
    %>
     <a href="product_list.jsp">상품 목록으로</a>
     <a href="index.jsp">쇼핑몰 홈으로</a>
</body>
</html>