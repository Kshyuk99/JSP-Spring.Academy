<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    String searchType = request.getParameter("searchType");
    String searchKeyword = request.getParameter("searchKeyword");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>
    <div align="center">
        <h1>검색 결과</h1>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String URL = "jdbc:mysql://localhost:3306/spring5fs";
                String sql = "";

                if (searchType.equals("name")) {
                    sql = "SELECT * FROM products WHERE name LIKE ?";
                } else if (searchType.equals("price")) {
                    sql = "SELECT * FROM products WHERE price = ?";
                }

                try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
                     PreparedStatement pstmt = conn.prepareStatement(sql)) {

                    if (searchType.equals("name")) {
                        pstmt.setString(1, "%" + searchKeyword + "%");
                    } else if (searchType.equals("price")) {
                        pstmt.setInt(1, Integer.parseInt(searchKeyword));
                    }

                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        out.println("<table border='1' width='80%'>");
                        out.println("<tr><th>상품명</th><th>가격</th><th>설명</th><th>이미지</th></tr>");
                        do {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("name") + "</td>");
                            out.println("<td>" + rs.getInt("price") + "</td>");
                            out.println("<td>" + rs.getString("description") + "</td>");
                            out.println("<td>" + rs.getString("image") + "</td>");
                            out.println("</tr>");
                        } while (rs.next());
                        out.println("</table>");
                    } else {
                        out.println("<p>검색 결과가 없습니다.</p>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <br>
        <a href="product_list.jsp">상품 목록으로 돌아가기</a>
    </div>
</body>
</html>