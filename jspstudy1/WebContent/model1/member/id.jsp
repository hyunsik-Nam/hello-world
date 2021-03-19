<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%--
    1. 파라미터 저장
    2. db에서 email과 tel 을 이용하여 id값을 리턴
    	id=MemberDao.idSearch(email,tel)
    3. id 값이 존재
    	opener의 id에 값을 저장. 현재 화면 닫기
    4. id 값이 없는 경우
    	정보에 맞는 id를 찾을 수 없습니다. 메세지 출력후
    	idForm.jsp로 페이지 이동.
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
<title>id찾기</title>
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
<tr><th>아이디</th>
	<td><%=id.substring(0,id.length()-2)+"**" %></td></tr>
	<tr><td colspan="2">
		<input type="button" value="아이디전송"
		onclick="idsend('<%=id.substring(0,id.length()-2) %>')"></td></tr>
</table>
</body>
</html>
<% } else {%>
<script>
	alert("정보에 맞는 id를 찾을 수 없습니다.");
	location.href="idForm.jsp";
</script><%}%>