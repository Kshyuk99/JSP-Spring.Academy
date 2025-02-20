<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    // 이미 선언된 session 객체를 사용하는 부분 (한 번만 선언)
   // HttpSession session = request.getSession();
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    // 상품 정보 가져오기
    String productId = request.getParameter("id");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "SELECT * FROM products WHERE id = ?";
    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, Integer.parseInt(productId));
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            Map<String, Object> product = new HashMap<>();
            product.put("id", rs.getInt("id"));
            product.put("name", rs.getString("name"));
            product.put("price", rs.getDouble("price"));
            product.put("quantity", quantity);
            cart.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    // 장바구니를 세션에 저장합니다.
    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
%>
