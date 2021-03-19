<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메일 보내기</title>
<script type="text/javascript">
	function idinputchk(f){
		if(f.naverid.value ==""){
			alert("네이버 아이디를 입력하세요");
			f.naverid.focus();
			return false;
		}
		if(f.naverpw.value ==""){
			alert("네이버 비밀번호를 입력하세요");
			f.naverpw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h2>메일보내기</h2>
<form name="mailform" method="post" action="mail.me"
		onsubmit="return idinputchk(this)">
	본인네이버ID : <input type="text" name ="naverid">
	본인네이버비밀번호 : <input type="password" name="naverpw">
	<table class="w3-table-all">
	<tr><td>받는사람</td>
	<td><input type="text" name="recipient" size="100" value=
	'<c:forEach items="${list}" var="mail">${mail},</c:forEach>'></td></tr>
	<tr><td>제목</td><td><input type="text" name="title" size="100"></td></tr>
	<tr><td>메세지형식</td>
	<%-- MIME 타입 지정
		 text/html : html 태그 사용 가능.
		 text/plain : 순수 text 형식
	 --%>
		<td><select name="mtype">
			<option value="text/html; charset=EUC-KR">HTML</option>
			<option value="text/plain; charset=EUC-KR">TEXT</option>
		</select></td></tr>
	<tr><td colspan="2">
	<textarea name="contents" cols="120" rows="10"></textarea>
	</td></tr>
	<tr><td colspan="2"><input type="submit" value="메일보내기"></td></tr>
</table>
</form>
</body>
</html>