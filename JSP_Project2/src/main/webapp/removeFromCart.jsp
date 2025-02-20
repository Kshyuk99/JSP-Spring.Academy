<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    String productId = request.getParameter("id");

    // 세션에서 장바구니 객체를 가져옵니다. (한 번만 선언)
    // HttpSession session = request.getSession();
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    
    if (cart != null) {
        cart.removeIf(item -> item.get("id").equals(Integer.parseInt(productId)));
        session.setAttribute("cart", cart);
    }
    
    response.sendRedirect("cart.jsp");
%>
