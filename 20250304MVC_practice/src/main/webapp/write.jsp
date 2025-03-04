<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
</head>
<body>
    <h2>글쓰기</h2>
    <form action="write.do" method="post">
        <p>이름: <input type="text" name="username" required></p>
        <p>나이: <input type="text" name="age" required></p>
        
        <p>
            <button type="submit">저장</button>
            <button type="button" onclick="location.href='list.do'">취소</button>
        </p>
    </form>
</body>
</html> 