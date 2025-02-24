<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String productIdStr = request.getParameter("id");

    // 세션에서 장바구니 객체 가져오기
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart != null && productIdStr != null) { // cart와 productIdStr 모두 null 체크
        try {
            int productId = Integer.parseInt(productIdStr); // int로 변환

            // removeIf를 사용하여 조건에 맞는 항목 제거 + NullPointerException 처리
            cart.removeIf(item -> {
                Object itemId = item.get("id");
                if (itemId == null) {
                    return false; // item에 "id" 키가 없는 경우, 제거하지 않음
                }
                // productList.jsp에서 id를 Integer로 저장했다면
                if(itemId instanceof Integer){
                    return itemId.equals(productId);
                }
                //productList.jsp에서 id를 String으로 저장했다면
                else if (itemId instanceof String){
                    try{
                        return itemId.equals(String.valueOf(productId));
                    } catch(NumberFormatException e){
                        return false;
                    }
                }

                return false;

            });

            session.setAttribute("cart", cart); 

        } catch (NumberFormatException e) {
            // productIdStr이 숫자가 아닌 경우 처리.
            // 예: 에러 메시지를 보여주고 cart.jsp로 리다이렉트
            response.sendRedirect("cart.jsp?error=invalidProductId");
            return;
        }
    }

    response.sendRedirect("cart.jsp");
%>