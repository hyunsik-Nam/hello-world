<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1.id 파라미터 조회 
    2.login 정보 조회
     -로그아웃  : "로그인하세요"출력.lofinForm.jsp 페이지 이동
    3.내 정보 아니면서 ,admin도 아닌경우
     -내 정보만 수정가능합니다. 출력. main.jsp페이지 이동
    4.id 정보를 db에 읽어 Member 객체에 저장
    5.Member 객체를 화면에 출력--%>
<%
String id = request.getParameter("id"); //  1.id 파라미터 조회 
String login = (String)session.getAttribute("login"); // 2.login 정보 조회
//getAttribute는 리턴값이 오브젝트라서 String이 들어가야함
if(login == null){%>
<script>
alert("로그인 하세요")
location.href="loginForm.jsp";
</script>
<% } //로그인이 된경우,관리자가 아니고 다른사람 정보 조회 불가
else if(!id.equals(login) && !login.equals("admin")) {%>
<script>
alert("내 정보 조회만 가능합니다.");
location.href="main.jsp";
</script>
<% } else { //내 정보이거나 admin인 경우 다른 사용자 정보 조회. 정상적인 거래
//mem : id에 해당하는 사용자 상세 정보 저장
Member mem = new MemberDao().selectOne(id);%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel ="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputcheck(f){
	if(f.pass.value == ""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
}
function win_passchg(){
	var op = "width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.jsp","",op);
}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post"
onsubmit="return inputchectk(this)">
<input type ="hidden" name="picture" value="<%=mem.getPicture() %>">
<table><caption>회원 정보 수정</caption>
<tr><td rowspan="4" valign="bottom">
<img src="picture/<%=mem.getPicture() %>"
 width="100" height="120" id="pic"><br>
<font size="1"><a href="javascript:win_upload()">사진수정</a></font>
</td><th>아이디</th>
<td><input type="text" name="id" readonly value="<%=mem.getId()%>"></td></tr><%--readonly : 읽기만 가눙 --%>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><th>이름</th>
<td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
<tr><th>성별</th>
<td><input type="radio" name="gender" value="1"
<%=mem.getGender()==1?"checked":"" %>>남
<input type="radio" name="gender" value="2"
<%=mem.getGender()==2?"checked":"" %>>여</td></tr>
<tr><th>전화번호</th>
<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
<tr><th>이메일</th>
<td colspan="2"><input type="text" name="eamil" value="<%=mem.getEmail()%>"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원수정">
<%if(!login.equals("admin") || id.equals("admin")) { %> <%--관리자가 아니면 내정보~ || 아니면 id가 관리자면 관리자 자신이니까 --%>
<input type="button" value="비밀번호수정" onclick="win_passchg()">
<%} %></td></tr>
</table></form>
</body>
</html>
<% } %>