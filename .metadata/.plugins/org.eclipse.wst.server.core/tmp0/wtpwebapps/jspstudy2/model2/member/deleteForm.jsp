<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1.id �Ķ���� �����ϱ�
2.login ���� �����ϱ�
  �α׾ƿ������� ���
          �α��� �ϼ���.�޼��� ����� loginForm.jsp ������ �̵�
     �����ڰ� �ƴϸ鼭 id �Ķ���� ������ login ������ �ٸ� ���
     ���θ� Ż�� �����մϴ�. �޼��� ����� main.jsp�������� �̵�
3.����ȭ�� ����ϱ�
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel ="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputchect(f){
	if(f.pass.value ==""){
		alert("��й�ȣ�� �Է��ϼ���")
		f.pass.focus();
		return false;
	}
	return true;
	}
</script>
</head>
<body>
<form action="delete.me" method="post"
onsubmit="return inputchect(this)">
<input type="hidden" name="id" value="${param.id}">
<table>
<caption>ȸ����й�ȣ �Է�</caption>
<tr><th>��й�ȣ</th>
<td><input type="password" name ="pass" /></td></tr>
<tr><td colspan="2">
<input type="submit" value="Ż���ϱ�" /></td></tr>
</table>
</body>
</html>
