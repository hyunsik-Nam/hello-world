<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/medel1/member/password.jsp
1.로그아웃 상태인 경우. 로그인하세요. 메세지 추력
 다른 사용자의 비밀번호 변경 불가-> 로그인된 id값으로만 변경 가능.본인만 변경 가능
 opener페이지를 loginForm.jsp페이지 이동
  현재페이지 닫기
2.pass, chgpass 파라미터 값 저장
3.pass 비밀번호가db에 저장된 비밀번호와 틀리면
   비밀번호 오류 메세지 출력. passwordForm.jsp 페이지 이동
4.pass 비밀번호가 db에 저장된 비밀번호와 같으면
  MemverDao.updatePass(login,chgpass) ->새로운 비밀번호로 수정
  비밀번호 수정 성공
        메세지 출력후 opener 페이지를 info.jsp페이지 이동. 현재페이지 닫기
   비밀번호 수정 실패
       메세지 출력후 opener 페이지를 updateForm.jsp 페이지 이동
  현재페이지 닫기 --%>
<%
String login = (String) session.getAttribute("login");
boolean opener = true;//opener 페이지의 url을 변경
boolean closer = true; //현재페이지 close
 String msg = null;
 String url = null;
 if (login == null) { //로그아웃
    msg = "로그인하세요.";
    url = "loginForm.jsp"; 
 } else {
	 String pass = request.getParameter("pass");
	 String chgpass = request.getParameter("chgpass");
	  MemberDao dao = new MemberDao();
	  Member mem = dao.selectOne(login);
	 if (pass.equals(mem.getPass())){
		 if(dao.updatePass(login,chgpass) >0){
			 msg="비밀번호가 변경되었습니다.";
			 url="info.jsp?id="+login;
		 }else { //비밀번호를 db에서 변경시 오류 발생시
			 msg="비밀번호 변경시 오류가 발생했습니다.";
		 	url="updateForm.jsp?id="+login;
		 }
	 }else {
		 opener=false;
		 closer=false;
		 msg="비밀번호 오류입니다. 확인하세요.";
		 url="passwordForm.jsp";
	 }
 }
   %>
<script>
alert("<%= msg%>");
<% if(opener) {%>
	opener.location.href="<%=url%>";
	<% } else {%>
	location.href="<%=url%>";
	<%}%>
	<%if(closer){%>
	self.close();
<%}%>
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>