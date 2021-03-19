<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" method="post" name="f">
<input type=hidden name="num" value="<%=request.getParameter("num")%>">
<table><caption>게시글 삭제 화면</caption>
<tr><td style="font-size: 20px;">게시글비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type=submit value="게시글삭제"></td></tr>
</table>
</form>
</body>
</html>