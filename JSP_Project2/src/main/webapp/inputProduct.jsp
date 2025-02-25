<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<%
    String uploadPath = application.getRealPath("/uploads"); // 이미지 업로드 경로
    int maxSize = 10 * 1024 * 1024; // 최대 파일 크기 (10MB)
    String encoding = "UTF-8";

    MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());

    String name = multi.getParameter("name");
    double price = Double.parseDouble(multi.getParameter("price"));
    String description = multi.getParameter("description");
    String image = multi.getFilesystemName("image"); // 이미지 파일 이름

    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "INSERT INTO products (name, price, description, image) VALUES (?,?,?,?)";

    try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        stmt.setString(1, name);
        stmt.setDouble(2, price);
        stmt.setString(3, description);
        stmt.setString(4, image); // 이미지 파일 이름 저장

        stmt.executeUpdate();

        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int productId = generatedKeys.getInt(1);
                response.sendRedirect("product_list.jsp?addedProductId=" + productId);
            } else {
                response.sendRedirect("product_list.jsp");
            }
        }

    } catch (Exception e) {
        System.err.println("Error adding product: " + e.getMessage());
        e.printStackTrace();
        %>
        <p>상품을 추가하는 중 오류가 발생했습니다.</p>
        <%
    }
%>