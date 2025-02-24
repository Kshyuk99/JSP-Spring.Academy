<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    // 세션에서 장바구니 정보 가져오기
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    String shippingAddress = request.getParameter("shippingAddress");
    String paymentMethod = request.getParameter("paymentMethod");

    if (shippingAddress == null || paymentMethod == null) {
        response.sendRedirect("checkout.jsp");
        return;
    }

    // 데이터베이스 연결 및 주문 정보 저장
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "INSERT INTO orders (shippingAddress, paymentMethod, orderDate) VALUES (?, ?, NOW())";

    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        pstmt.setString(1, shippingAddress);
        pstmt.setString(2, paymentMethod);
        pstmt.executeUpdate();

        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int orderId = generatedKeys.getInt(1);

                // 주문 상세 정보 저장
                String detailSql = "INSERT INTO order_items (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)";
                try (PreparedStatement Stmt = conn.prepareStatement(detailSql)) {
                    for (Map<String, Object> item : cart) {
                    	Stmt.setInt(1, orderId);
                    	Stmt.setInt(2, (int) item.get("id"));
                    	Stmt.setInt(3, (int) item.get("quantity"));
                    	Stmt.setDouble(4, (double) item.get("price"));
                    	Stmt.executeUpdate();
                    }
                }

                // 장바구니 비우기
                session.removeAttribute("cart");
                
                // 주문 완료 페이지로 리다이렉트
                response.sendRedirect("orderComplete.jsp?orderId=" + orderId);
            } else {
                // 주문 실패 시
                response.sendRedirect("checkout.jsp?error=orderFailed");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("checkout.jsp?error=databaseError");
    }
%>