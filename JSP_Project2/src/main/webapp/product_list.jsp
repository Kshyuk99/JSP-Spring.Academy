<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
    <h3>상품 목록</h3>

    <%
    // 데이터베이스 연결 정보
    String URL = "jdbc:mysql://localhost:3306/spring5fs";

    // SQL 쿼리
    String sql = "SELECT id, name, price, image FROM products";

    // 상품 목록을 저장할 리스트
    List<Map<String, Object>> productList = new ArrayList<>();

    // 데이터베이스에서 상품 목록 가져오기
    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {

        while (rs.next()) {
            Map<String, Object> product = new HashMap<>();
            product.put("id", rs.getInt("id"));
            product.put("name", rs.getString("name"));
            product.put("price", rs.getDouble("price"));
            product.put("image", rs.getString("image"));
            productList.add(product);
        }
    } catch (SQLException e) {
        // 예외 처리
        out.println("<p>상품 목록을 가져오는 중 오류가 발생했습니다.</p>");
    }
    %>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>상품명</th>
            <th>가격</th>
            <th>이미지</th>
            <th>장바구니에 담기</th>
        </tr>
        <% for (Map<String, Object> product: productList) { %>
        <tr>
            <td><%= product.get("id") %></td>
            <td><%= product.get("name") %></td>
            <td><%= product.get("price") %></td>
            <td><img src="<%= product.get("image") %>" alt="<%= product.get("name") %>" width="100"></td>
            <td>
                <form action="addToCart.jsp" method="post">
                    <input type="hidden" name="productId" value="<%= product.get("id") %>">
                    <input type="hidden" name="productName" value="<%= product.get("name") %>">
                    <input type="hidden" name="productPrice" value="<%= product.get("price") %>">
                    <label for="quantity<%= product.get("id") %>">수량:</label>
                    <input type="number" name="productQuantity" id="quantity<%= product.get("id") %>" value="1" min="1" required>
                    <input type="submit" value="추가">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <a href="cart.jsp">장바구니로 가기</a>

    <!-- <div style="margin-bottom: 20px;">
        <form method="get" action="search_result.jsp">
            <select name="searchType">
                <option value="name">상품이름</option>
                <option value="price">가격비교</option>
            </select>
            <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div> -->
</body>
</html>
<%@ include file="footer.jsp"%>