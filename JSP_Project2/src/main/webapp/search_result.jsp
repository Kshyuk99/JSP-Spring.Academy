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
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    box-sizing: border-box;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

a {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 15px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

a:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
<div class="container">
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
    </div>
</body>
</html>