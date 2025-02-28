<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL 디렉티브 추가 -->

<html>
<head>
    <title>1부터 10까지 더하기</title>
</head>
<body>
    <h1>1부터 10까지의 합</h1>

<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="10">
<p>${sum = sum + i; ''}</p>
</c:forEach>
<p>합: ${sum}</p>


    <%-- 숫자를 1부터 10까지 담은 배열을 생성 --%>
    <%
        int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        request.setAttribute("numbers", numbers);  // 배열을 request 속성으로 설정
    %>

    <h2>반복문을 이용한 덧셈:</h2>
    <ul>
        <c:set var="sum" value="0" />  <!-- 합을 저장할 변수 초기화 -->

        <c:forEach var="num" items="${numbers}">
            <c:set var="sum" value="${sum + num}" />  <!-- 반복마다 sum에 num을 더하기 -->
            <li>현재 숫자: ${num}, 누적 합: ${sum}</li> <!-- 현재 숫자와 누적 합 출력 -->
        </c:forEach>
    </ul>

    <h3>최종 합:</h3>
    <p>1부터 10까지의 합은: ${sum}</p>

</body>
</html>