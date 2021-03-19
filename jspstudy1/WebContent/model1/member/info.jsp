<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//1.id 파라미터 값을 조회
String id = request.getParameter("id");
//2.login 상태 검증
String login = (String)session.getAttribute("login");
if(login == null){%>
<script>
alert("로그인 하세요")
location.href="loginForm.jsp";
</script>
<% }
//3.login 상태 검증2
else if(!login.equals("admin") && login.equals("admin")) {%>
<script>
alert("내 정보 조회만 가능합니다.");
location.href="main.jsp";
</script>
<% } else { //내 정보이거나 admin 조회
//4.db에서 id값으로 데이터 조회
Member mem = new MemberDao().selectOne(id);%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>회원정보보기</caption>
<tr><td rowspan = "6" width="30%">
<img src="picture/<%=mem.getPicture() %>" width="200" height="210">
<th width ="20%">아이디</th><td><%=mem.getId() %></td></tr>
<th>이름</th><td><%=mem.getName() %></td></tr>
<th>성별</th><td><%=mem.getGender()==1?"남":"여" %></td></tr>
<th>전화</th><td><%=mem.getTel() %></td></tr>
<th>이메일</th><td><%=mem.getEmail() %></td></tr>
<tr><td colspan="2">
<a href="updateForm.jsp?id=<%=mem.getId() %>">[수정]</a>
<%if(!id.equals("admin") && !login.equals("admin")) { %>
<a href="deleteForm.jsp?id=<%=mem.getId() %>">[탈퇴]</a>
<% } %></td></tr>
</table>
</body>
</html>
<% } %>