<%@page import="dto.EmpDTO"%>
<%@page import="dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
EmpDAO empDao = new EmpDAO();
empDao.connect();

for(EmpDTO empDTO : empDao.selectAll()){
	System.out.print(empDTO.getEmpno());
	System.out.print(empDTO.getEname());
	System.out.println(empDTO.getSal());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>