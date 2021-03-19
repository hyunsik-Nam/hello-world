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
<link rel = "stylesheet" href="../css/mainn.css">
</head>
<body>
<table><caption>내정보</caption>
<tr><td rowspan = "6" width="30%">
<img src="picture/${mem.picture}" width="200" height="210">
<th width ="20%">아이디</th><td>${mem.id}</td></tr>
<th>이름</th><td>${mem.name}</td></tr>
<th>닉네임</th><td>${mem.nick}</td></tr>
<th>이메일</th><td>${mem.email}</td></tr>
<tr><td colspan="2">
<a href="updateForm.me?id=${mem.id}">[수정]</a>
<c:if test="${param.id !='admin' && sessionScope.login != 'admin'}">
<a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
</c:if>
</td></tr>
</table>
</body>
</html>