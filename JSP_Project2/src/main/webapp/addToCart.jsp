<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder" %>
<%
    // 1. productList.jsp에서 전달받은 상품 정보 (이름은 URL 디코딩)
    int productId = Integer.parseInt(request.getParameter("productId"));
    String productName = URLDecoder.decode(request.getParameter("productName"), "UTF-8");
    int productPrice = Integer.parseInt(request.getParameter("productPrice")); // int 타입으로 유지
    int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));

    // 2. 세션에서 cart 가져오기 (없으면 새로 생성)
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // 3. 이미 장바구니에 있는 상품인지 확인 (id로 비교)
    boolean found = false;
    for (Map<String, Object> item : cart) {
        if ((int) item.get("id") == productId) {
            // 이미 있으면 수량만 증가
            item.put("quantity", (int) item.get("quantity") + productQuantity);
            found = true;
            break;
        }
    }

    // 4. 장바구니에 없으면 새로 추가
    if (!found) {
        Map<String, Object> newItem = new HashMap<>();
        newItem.put("id", productId);
        newItem.put("name", productName);
        newItem.put("price", productPrice);
        newItem.put("quantity", productQuantity);
        cart.add(newItem);
    }

    // 5. 장바구니 페이지로 리다이렉트
    response.sendRedirect("cart.jsp");
%>