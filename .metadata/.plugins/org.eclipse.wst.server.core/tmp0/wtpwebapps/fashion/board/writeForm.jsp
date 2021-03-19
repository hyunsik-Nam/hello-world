<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href = "../../css/main.css">
<script type="text/javascript">
	function inputcheck() {
		f = document.f;
		if(f.btype.value==""){
			alert("게시판 종류를 입력하세요");
			f.name.focus();
			return;
		}
		if(f.subject.value==""){
			alert("제목을 입력하세요");
			f.subject.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<table><caption>게시판 글쓰기</caption>

<tr><td>게시판 종류</td><td><select name="btype" style="width:30%;">
	<option value="">선택하세요</option>
	<option value="1">공지사항</option>
	<option value="2">자유게시판</option>
	<option value="3">OOTD</option>
	<option value="4">라플정보</option>
	</select></td></tr>
<c:if test="${param.btype==1}">
<script>document.f.btype.value="1"</script>
</c:if>

<c:if test="${param.btype==2}">
<script>document.f.btype.value="2"</script>
</c:if>

<c:if test="${param.btype==3}">
<script>document.f.btype.value="3"</script>
</c:if>

<c:if test="${param.btype==4}">
<script>document.f.btype.value="4"</script>
</c:if>

<tr><td>닉네임</td><td><input type="text" name ="nick" class="w3-input w3-border"  readonly value="${sessionScope.nick}"></td></tr>
<c:if test="${param.btype==1}">
<tr><td>제목</td><td><input type="text" name ="subject" class="w3-input w3-border" value="[공지사항] "></td></tr>
</c:if>
<c:if test="${param.btype!=1}">
<tr><td>제목</td><td><input type="text" name ="subject" class="w3-input w3-border"></td></tr>
</c:if>
<tr><td>내용</td><td><textarea rows="15" name ="content"
	id="content1" class="w3-input w3-border"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>첨부파일</td><td><input type="file" name ="picture"></td></tr>
<tr><td colspan="2"><a href="javascript:inputcheck()">[게시물등록]</a></td></tr>
</table>
</form>
</body>
</html>