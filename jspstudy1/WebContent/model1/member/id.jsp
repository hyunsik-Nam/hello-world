<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%--
    1. �Ķ���� ����
    2. db���� email�� tel �� �̿��Ͽ� id���� ����
    	id=MemberDao.idSearch(email,tel)
    3. id ���� ����
    	opener�� id�� ���� ����. ���� ȭ�� �ݱ�
    4. id ���� ���� ���
    	������ �´� id�� ã�� �� �����ϴ�. �޼��� �����
    	idForm.jsp�� ������ �̵�.
    --%>
    <%
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    MemberDao dao = new MemberDao();
    String id = dao.idSearch(email,tel);
    System.out.println(email+","+tel + "," + id);
    if(id != null){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>idã��</title>
<link rel = "stylesheet" href = "css/main.css">
<script type="text/javascript">
	function idsend(id) {
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
<table>
<tr><th>���̵�</th>
	<td><%=id.substring(0,id.length()-2)+"**" %></td></tr>
	<tr><td colspan="2">
		<input type="button" value="���̵�����"
		onclick="idsend('<%=id.substring(0,id.length()-2) %>')"></td></tr>
</table>
</body>
</html>
<% } else {%>
<script>
	alert("������ �´� id�� ã�� �� �����ϴ�.");
	location.href="idForm.jsp";
</script><%}%>