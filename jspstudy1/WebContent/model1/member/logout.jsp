<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
//    1.session 로그인 정보 제거
//    2.loginForm.jsp 페이지 이동 
    
    
    
    1.session로그인 정보 제거
    2.로그아웃하셨습니다.메세지 출력후
       loginForm.jsp 페이지 이동
    --%>
<%
session.invalidate(); //session 종료 ->session.invalidate() :기존 입력했던 세션 만료.새로운 세션으로 바꿈
//session.removeAttribute("login");//removeAttribute도 invalidate()와 같은 친구. 속성값은 지정한걸로
//response.sendRedirect("loginForm.jsp"); //페이지 이동하면 alert창 안뜸.
%>
<script type="text/javascript">
alert("로그아웃하셨습니다.")
location.href ="loginForm.jsp";
</script>