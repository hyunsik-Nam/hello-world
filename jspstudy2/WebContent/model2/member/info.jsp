<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>ȸ����������</caption>
<tr><td rowspan = "6" width="30%">
<img src="picture/${mem.picture}" width="200" height="210">
<th width ="20%">���̵�</th><td>${mem.id}</td></tr>
<th>�̸�</th><td>${mem.name}</td></tr>
<th>����</th><td>${mem.gender==1?"��":"��"}</td></tr>
<th>��ȭ</th><td>${mem.tel}</td></tr>
<th>�̸���</th><td>${mem.email}</td></tr>
<tr><td colspan="2">
<a href="updateForm.me?id=${mem.id}">[����]</a>
<c:if test="${param.id !='admin' && sessionScope.login != 'admin'}">
<a href="deleteForm.me?id=${mem.id}">[Ż��]</a>
</c:if>
</td></tr>

</table>
</body>
</html>
