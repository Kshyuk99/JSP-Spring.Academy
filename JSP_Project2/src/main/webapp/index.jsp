<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<style>
    body {
        /* background-color: #f8f8f8; */ /* 아주 연한 회색 배경 */
        font-family: sans-serif; /* 글꼴 (선택 사항) */
    }

    h1 {
      text-align: center; /* 제목 가운데 정렬 */
      margin-bottom: 30px; /* 제목 아래 여백 */
    }

    /* 테이블 스타일 */
    table {
        width: 80%; /* 테이블 너비 */
        margin: 20px auto; /* 가운데 정렬 */
        border-collapse: collapse; /* 테두리 합치기 */
    }

    th, td {
        border: 1px solid #ddd; /* 테두리 스타일 */
        padding: 10px; /* 안쪽 여백 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }

    th {
        background-color: #eee; /* 헤더 배경색 (더 옅은 회색)*/

    }

    /* 링크 스타일 */
    a {
        text-decoration: none; /* 밑줄 제거 */
        color: navy; /* 링크 색상 */
        font-weight: bold; /* 굵게 (선택 사항) */
    }

    a:hover {
      text-decoration: underline; /* 마우스 오버 시 밑줄 */
    }

    /* 최상단 링크 컨테이너 스타일 */
    .top-links {
       text-align: center; /* 가운데 정렬*/
       margin-bottom: 10px;
    }
     .top-links a {
        margin: 0 10px; /* 링크 사이 간격 */

    }


</style>
</head>
<body>
    <div align="center">
        <font size="5">쇼핑몰</font><br>
        <a href="<%=request.getContextPath()%>/login.jsp">로그인</a> | 
        <a href="<%=request.getContextPath()%>/signup.jsp">회원가입</a> |
        <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
        <table border="1" width="80%"> 
            <tr height="10%">
                <th width="20%"><a href="best.jsp">베스트</a></th>                
                <th width="20%"><a href="product_list.jsp">상품목록</a></th> 
                <th width="20%"><a href="cart.jsp">장바구니</a></th>
                <th width="20%"><a href="formProduct.jsp">상품 추가</a></th>
            </tr>
            <tr>
                <td colspan="5"> 
                    <table border="1" width="100%">
                        <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String URL = "jdbc:mysql://localhost:3306/spring5fs";
                        String sql = "SELECT * FROM products";

                        try (Connection conn = DriverManager.getConnection(URL, "root", "1234"); 
                             PreparedStatement pstmt = conn.prepareStatement(sql);
                             ResultSet rs = pstmt.executeQuery();) {
                            while(rs.next()) {
                        %>
                        <tr>
                            <td><a href="updFormProduct.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("name") %></a></td>
                            <td><%= rs.getInt("price") %></td>
                            <td><%= rs.getString("description") %></td>
                            <td><a href="deleteProduct.jsp?id=<%= rs.getInt("id") %>">삭제</a></td> 
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
<%@ include file="footer.jsp"%>	