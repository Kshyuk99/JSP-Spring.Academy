<%@page import="dto.DeptDTO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DeptDAO deptDao = new DeptDAO();
deptDao.connect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<%
for(DeptDTO deptDTO : deptDao.selectAll()){
%>
<tr>
	<td><%=deptDTO.getDeptno() %></td>
	<td><%=deptDTO.getDname() %></td>
	<td><%=deptDTO.getLoc() %></td>
</tr>
<%
}
%>
</table>
</body>
</html>