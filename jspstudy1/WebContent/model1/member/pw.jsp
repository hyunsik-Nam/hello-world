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
<title>pwã��</title>
<link rel = "stylesheet" href = "css/main.css">

</head>
<body>
<table>
<tr><th>��й�ȣ</th>
	<td><%=pw.substring(0,pw.length()/2)+"**" %></td></tr>
	<tr><td colspan="2">
		<input type="button" value="�ݱ�" onclick="self.close()"></td></tr>
</table>
</body>
</html>
<% } else {%>
<script>
	alert("������ �´� id�� ã�� �� �����ϴ�.");
	location.href="idForm.jsp";
</script><%}%>