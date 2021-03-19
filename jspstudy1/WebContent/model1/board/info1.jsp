<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao dao = new BoardDao();
Board b = dao.selectOne(num);
dao.readcntAdd(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시물 상세 보기</caption>
<tr><th width="20%">글쓴이</th>
<td width="80%" style="text-align:left"><%=b.getName() %></td></tr>
<tr><th>제목</th>
	<td style="text-align:left"><%=b.getSubject() %></td></tr>
<tr><th>내용</th>
	<td><table style="width:100%; height:250px;">
<tr><td
style="border-width:0px; vertical-align:top; text-align:left">
	<%=b.getContent() %></td></tr></table></td></tr>
<tr><th>첨부파일</th>
	<td><% if(b.getFile1()==null || b.getFile1().equals("")){ %>
	&nbsp;
	<%}else { %>
	<a href="file/<%=b.getFile1() %>"><%=b.getFile1() %></a>
	<%} %></td></tr>
<tr><td colspan ="2">
	<a href = "replyForm.jsp?num=<%=b.getNum() %>">[답변]</a>
	<a href = "updateForm.jsp?num=<%=b.getNum() %>">[수정]</a>
	<a href = "deleteForm.jsp?num=<%=b.getNum() %>">[삭제]</a>
	<a href = "list.jsp">[목록]</a></td></tr></table></body></html>