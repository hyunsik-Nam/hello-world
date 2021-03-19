<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- /WebContent/model2/board/deleteForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 삭제 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inputcheck(f){
	   f(confirm("게시글을 삭제하시겠습니까?") == true){
	        alert("삭제되었습니다.");
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
   <caption>게시글 삭제 화면</caption>
      <tr><td colspan="2"><input type="submit" value="게시글 삭제"></td></tr>
</table>
</form>
</body>
</html>