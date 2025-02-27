<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f5f5f5; /* 밝은 회색 배경 */
    font-family: 'Noto Sans KR', sans-serif; /* Noto Sans KR 글꼴 사용 */
    color: #333; /* 어두운 회색 글자색 */
}

.container {  /* 컨테이너 스타일 */
    width: 80%;
    margin: 40px auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    padding: 20px;
    box-sizing: border-box;
}

h3 {  /* 제목 스타일 */
    margin-top: 0;
    margin-bottom: 20px;
    text-align: center;
}

table {  /* 테이블 스타일 */
    width: 50%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {  /* 테이블 셀 스타일 */
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left; /* 텍스트 왼쪽 정렬 */
    font-size: 14px;
}

table th {  /* 테이블 헤더 스타일 */
    background-color: #f2f2f2;
    font-weight: 600;
    width: 150px; /* 헤더 너비 고정 */
}

table tr:nth-child(even) {  /* 짝수 행 배경색 */
    background-color: #fafafa;
}

input[type="text"], input[type="image"] {  /* 입력 필드 스타일 */
    width: calc(100% - 12px); /* 테두리와 패딩을 고려한 너비 */
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

a {  /* 링크 스타일 */
    display: inline-block;
    padding: 8px 14px;
    margin-right: 10px;
    text-decoration: none;
    border-radius: 4px;
    color: white;
    background-color: gray;
    transition: background-color 0.2s ease;
    font-size: 14px;
}

a:hover {  /* 링크 호버 스타일 */
    background-color: #0056b3;
}
</style>

</head>
<body>
 <% 
String URL= "jdbc:mysql://localhost:3306/spring5fs";
String sql ="SELECT name, price, description FROM products";
Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		)
{
while(rs.next()){
	 String productName = rs.getString("name");
     int price = rs.getInt("price");
     int quantity = rs.getInt("description");
    // String imageUrl = rs.getString("image_url");
   // String imageurl= "https://picsum.photos/250/250" ;
	}	
}catch(Exception e) { e.printStackTrace(); }
%> 
<div class="container">
    <h3>베스트 물품</h3>
    <form name="f" method="POST" action="best.jsp">
        <table width="100%" class="outline">
            <caption>상품목록</caption>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="sangpum" value="갤럭시북5" class="form-control" required></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="image" img src="https://shopping-phinf.pstatic.net/main_5225015/52250151618.20250110133314.jpg?type=f640" class="form-control" required></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="price" value="1899000" class="form-control" required></td>
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="text" name="amount" value="20" class="form-control" required></td>
            </tr>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="sangpum" value="갤럭시S25" class="form-control" required></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="image" img src="https://shopping-phinf.pstatic.net/main_5262874/52628743821.20250220111014.jpg?type=f640" class="form-control" required></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="price" value="1086000" class="form-control" required></td>
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="text" name="amount" value="20" class="form-control" required></td>
            </tr>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="sangpum" value="갤럭시워치7" class="form-control" required></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="image" img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fditto-phinf.pstatic.net%2F20240705_255%2F1720162349915Ihe5L_JPEG%2F6687982cb48ee75234d03391.jpg&type=o&size=472x472&ttype=input" class="form-control" required></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="price" value="1899000" class="form-control" required></td>
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="text" name="amount" value="20" class="form-control" required></td>
            </tr>
             <tr>
                <th>상품명</th>
                <td><input type="text" name="sangpum" value="아이폰16" class="form-control" required></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="image" img src="https://shop-phinf.pstatic.net/20241107_255/1730962039680OzIvk_JPEG/16673204874466463_512513810.jpg?type=m510" class="form-control" required></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="price" value="1899000" class="form-control" required></td>
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="text" name="amount" value="20" class="form-control" required></td>
            </tr>
        </table>
        <a href="index.jsp">쇼핑몰 홈</a>
    </form>
</div>
<%@ include file="footer.jsp"%>	