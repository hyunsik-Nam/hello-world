<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%--
    1.id 파라미터 조회 
    2.login 정보 조회
     -로그아웃  : "로그인하세요"출력.lofinForm.jsp 페이지 이동
    3.내 정보 아니면서 ,admin도 아닌경우
     -내 정보만 수정가능합니다. 출력. main.jsp페이지 이동
    4.id 정보를 db에 읽어 Member 객체에 저장
    5.Member 객체를 화면에 출력--%> 
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
	open("passwordForm.me","",op);
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.me","",op);
}
</script>
</head>
<body>
<form action="update.me" name="f" method="post"
onsubmit="return inputchectk(this)">
<input type ="hidden" name="picture" value="${mem.picture}">
<table><caption>회원 정보 수정</caption>
<tr><td rowspan="4" valign="bottom">
<img src="picture/${mem.picture}"
 width="100" height="120" id="pic"><br>
<font size="1"><a href="javascript:win_upload()">사진수정</a></font>
</td><th>아이디</th>
<td><input type="text" name="id" readonly value="${mem.id}"></td></tr><%--readonly : 읽기만 가눙 --%>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><th>이름</th>
<td><input type="text" name="name" value="${mem.name}"></td></tr>
<tr><th>성별</th>
<td><input type="radio" name="gender" value="1"
${mem.gender==1?"checked":""}>남
<input type="radio" name="gender" value="2"
${mem.gender==2?"checked":""}>여</td></tr>
<tr><th>전화번호</th>
<td colspan="2"><input type="text" name="tel" value="${mem.tel}"></td></tr>
<tr><th>이메일</th>
<td colspan="2"><input type="text" name="email" value="${mem.email}"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원수정">
<c:if test="${sessionScope.login != 'admin' || param.id == 'admin' }">
<input type="button" value="비밀번호수정" onclick="win_passchg()">
</c:if>
</td></tr>
</table></form>
</body>
</html>
