<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1.로그아웃 상태 : 로그인이 필요합니다. 메세지 출력. loginForm.jsp 페이지 이동
    2.로그인 상태
                일반사용자 : 관리자만 가능한 거래입니다.메세지 출력.main.jsp 페이지 이동
    3.관리자 로그인 상태
     db에서 모든 회원 정보를 조회하여 List<Member> 객체로 리턴
     List<Member> MemberDao.list()
    4.List 객체를 화면에 출력하기--%>
<%
String login = (String)session.getAttribute("login");
if(login == null){%>
<script>
alert("로그인이 필요합니다요")
location.href="loginForm.jsp";
</script>
<% }%>
<%if(!login.equals("admin")){%>
<script>
alert("관리자만 가능합니다.")
location.href="main.jsp";
</script>
<% } else{ //관리자로 로그인 한 경우
	//list : db에 저장된 member테이블이 모든 정보가 Member ........
List<Member> list = new MemberDao().list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
<link rel ="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>회원 목록</caption>
<tr><th>아이디</th><th>사진</th><th>이름</th><th>성별</th><th>전화</th><th>이메일</th>
<%for(Member m : list) {%>
<tr>
<td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
<td>
<img src="picture/sm_<%=m.getPicture() %>" width="20" heigh="30">
</td>
<td><%=m.getName()%></td><td><%=m.getGender()==1?"남":"여" %></td>
<td><%=m.getTel()%></td>
<td><a href="updateForm.jsp?id=<%=m.getId()%>">[수정]</a>
<%if(!m.getId().equals("admin")) { %>
<a href="deleteForm.jsp?id=<%=m.getId()%>">[강제탈퇴]</a><%} %>
</td></tr><%} //for 구문 끝 %>
</table>
</body>
</html>
<%} //else 구문 끝%>