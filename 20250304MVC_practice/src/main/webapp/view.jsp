<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 보기</title>
</head>
<body>
    <h2>글 보기</h2>
    <table border="1">
        <tr>
            <th>이름</th>
            <td>${Member.username}</td>
        </tr>
        <tr>
            <th>나이</th>
            <td>${Member.age}</td>
        </tr>
       
        
    </table>
    <p>
        <button onclick="location.href='edit.do?age=${Member.age}'">수정</button>
        <button onclick="if(confirm('삭제하시겠습니까?')) location.href='delete.do?age=${Member.age}'">삭제</button>
        <button onclick="location.href='list.do'">목록</button>
    </p>
</body>
</html> 