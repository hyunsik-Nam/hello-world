<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- /WebContent/model2/board/deleteForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inputcheck(f){
	   f(confirm("�Խñ��� �����Ͻðڽ��ϱ�?") == true){
	        alert("�����Ǿ����ϴ�.");
	    }
	    else{
	        return ;
	    }

   }
</script>
</head>
<body>
<form action="delete.do" method="post" onsubmit="return inputcheck(this)">
<input type="hidden" name="num" value="${param.num}">
<table>
   <caption>�Խñ� ���� ȭ��</caption>
      <tr><td colspan="2"><input type="submit" value="�Խñ� ����"></td></tr>
</table>
</form>
</body>
</html>