<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%--
    	1. num���� �ش��ϴ� �Խù��� ��ȸ
    	2. ��ȸ�� �Խù��� ȭ�鿡 ���
     --%>
<script>
	function file_delete() {
		document.f.file2.value="";
		file_desc.style.display="none";
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<form action="update.do" method="post"
		enctype="multipart/form-data" name = "f">
		
<input type="hidden" name="num" value="${b.num}">
<input type="hidden" name="btype" value="${b.btype}">
<input type="hidden" name="picture" value="${empty b.picture?"":b.picture}">
<table><caption>�Խ��� ���� ȭ��</caption>
<tr><td>�۾���</td><td>
<input type="text" name="nick" value="${b.nick}"></td></tr>
<tr><td>����</td><td>
<input type="text" name="subject" value="${b.subject}"></td></tr>
<tr><td>����</td><td>
<textarea rows="15" name="content" id="content1" class="w3-input w3-border">${b.content}</textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>÷������</td><td style="text-align:left">
<c:if test="${!empty b.picture}">
<div id="file_desc">${picture}
	<a href = "javascript:file_delete()">[÷������ ����]</a></div>
</c:if>
<input type="file" name="file1"></td></tr>
<tr><td colspan="2">
<a href="javascript:document.f.submit()">[�Խù�����]</a></td></tr>
</table>
</form>
</body>
</html>