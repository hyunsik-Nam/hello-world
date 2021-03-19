<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<link rel="stylesheet" href = "../../css/main.css">
<script type="text/javascript">
	function inputcheck() {
		f = document.f;
		if(f.btype.value==""){
			alert("�Խ��� ������ �Է��ϼ���");
			f.name.focus();
			return;
		}
		if(f.subject.value==""){
			alert("������ �Է��ϼ���");
			f.subject.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<table><caption>�Խ��� �۾���</caption>

<tr><td>�Խ��� ����</td><td><select name="btype" style="width:30%;">
	<option value="">�����ϼ���</option>
	<option value="1">��������</option>
	<option value="2">�����Խ���</option>
	<option value="3">OOTD</option>
	<option value="4">��������</option>
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

<tr><td>�г���</td><td><input type="text" name ="nick" class="w3-input w3-border"  readonly value="${sessionScope.nick}"></td></tr>
<c:if test="${param.btype==1}">
<tr><td>����</td><td><input type="text" name ="subject" class="w3-input w3-border" value="[��������] "></td></tr>
</c:if>
<c:if test="${param.btype!=1}">
<tr><td>����</td><td><input type="text" name ="subject" class="w3-input w3-border"></td></tr>
</c:if>
<tr><td>����</td><td><textarea rows="15" name ="content"
	id="content1" class="w3-input w3-border"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>÷������</td><td><input type="file" name ="picture"></td></tr>
<tr><td colspan="2"><a href="javascript:inputcheck()">[�Խù����]</a></td></tr>
</table>
</form>
</body>
</html>