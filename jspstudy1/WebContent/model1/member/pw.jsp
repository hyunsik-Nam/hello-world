<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    MemberDao dao = new MemberDao();
    String pw = dao.pwSearch(id,email,tel);
    if(pw != null){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pw찾기</title>
<link rel = "stylesheet" href = "css/main.css">

</head>
<body>
<table>
<tr><th>비밀번호</th>
	<td><%=pw.substring(0,pw.length()/2)+"**" %></td></tr>
	<tr><td colspan="2">
		<input type="button" value="닫기" onclick="self.close()"></td></tr>
</table>
</body>
</html>
<% } else {%>
<script>
	alert("정보에 맞는 id를 찾을 수 없습니다.");
	location.href="idForm.jsp";
</script><%}%>