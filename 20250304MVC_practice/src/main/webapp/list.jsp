<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버 목록</title>
</head>
<body>
    <h2>멤버 목록</h2>
    <table border="1">
        <tr>
            <th>이름</th>
            <th>나이</th>
            
        </tr>
        <c:forEach var="Member" items="${list}">
        <tr>
            <td>${Member.username}</td>            
            <td>${Member.age}</td>
            <td><a href="view.do?age=${Member.age}">${Member.username}</a></td>
            
        </tr>
        </c:forEach>
    </table>
    <p><a href="index.do">처음으로</a></p>
    <p><a href="write.do">글쓰기</a></p>
</body>
</html> 