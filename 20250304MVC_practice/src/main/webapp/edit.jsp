<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
</head>
<body>
    <h2>글 수정</h2>
    <form action="edit.do" method="post">
        <input type="hidden" name="age" value="${Member.age}">
        <p>이름 <input type="text" name="username" value="${Member.username}" required></p>
        
        
        <p>
            <button type="submit">저장</button>
            <button type="button" onclick="location.href='view.do?age=${Member.id}'">취소</button>
        </p>
    </form>
</body>
</html> 