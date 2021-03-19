<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<style type="text/css">
a.button {
      -webkit-appearance: button;
      -moz-appearance: button;
      appearance: button;
    }
    
    input.submitLink {
    background-color: transparent;
    border: none;
	text-decoration:none;
    cursor: pointer;
    }
</style>
<script type="text/javascript">
function removeCheck() {
	 if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
	     document.removefrm.submit();
	 }else{   //���
	     return false;
	 }
}

function removeCheck1() {
	 if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
	     document.removefrm.submit();
	 }else{   //���
	     return false;
	 }
}

function inputcheck() {
	f = document.f;
	if(f.content.value==""){
		alert("������ �Է��ϼ���");
		f.name.focus();
		return;
	}
	
	f.submit();
}

function check() {
	alert("�α����� ��밡��");
}
</script>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<table colspan="2" style="width:60%; margin: auto;">
	<c:if test="${param.btype}==1"><caption>��������</caption></c:if>
	<c:if test="${param.btype}==2">�����Խ���</c:if>
	<c:if test="${param.btype}==3">OOTD</c:if>
	<c:if test="${param.btype}==4">��������</c:if>
<tr>
	<td colspan="2" style="text-align:left; font-size:30px" >${b.subject}</td></tr>
<tr>
<td colspan="2" width="80%" style="text-align:left; font-size:10px">${b.nick}</td></tr>
<tr>
	<td colspan="2"><table style="width:100%; height:250px;">
<tr><td
style="border-width:0px; vertical-align:top; text-align:left">
	${b.content}</td></tr></table></td></tr>
<tr>
	<td colspan="2">
	<c:if test="${empty b.picture} ">&nbsp;</c:if>
	<c:if test="${!empty b.picture}"><a href="file/${b.picutre}">${b.picutre}</a></c:if>
	</td>
</tr>
<tr><td style="text-align:right" colspan ="2" >


<c:if test="${sessionScope.nick eq b.nick}">
<c:if test="${sessionScope.login !='admin'}">
<form action="delete.do" method="post" onsubmit="return removeCheck(this)">
<a href = "updateForm.do?num=${b.num}&btype=${b.btype}" style="text-decoration:none" >���� </a>
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="btype" value="${param.btype}">
	<input type="submit" value="����" class="submitLink">
	</form>
</c:if>
</c:if>


<c:if test="${sessionScope.login =='admin'}">
<form action="delete.do" method="post" onsubmit="return removeCheck(this)">
<a href = "updateForm.do?num=${b.num}&btype=${b.btype}" style="text-decoration:none" >���� </a>
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="btype" value="${param.btype}">
	<input type="submit" value="����" class="submitLink">
	</form>
</c:if>
	<a href = "list.do?btype=${param.btype}" style="text-decoration:none">���</a>


</td></tr>



</table>

<table colspan="2" style="width:60%; margin: auto;">

   
<c:forEach var="r" items="${rlist1}">
	<c:if test="${empty sessionScope.login}">
   		<tr><td style = "text-align:left" width="95%">${r.nick}<br>${r.content}<br><font size="1">${r.rdate}</font></td>
	</c:if>
   <c:if test="${sessionScope.login !='admin'}">
   <c:if test="${sessionScope.nick == r.nick}">
   		<tr><td style = "text-align:left" width="95%">${r.nick}<br>${r.content}<br><font size="1">${r.rdate}</font></td>
   	 <td width="7%">
   			<font size="1">
    			 <a href="javascript:$('#updateform${r.no}').toggle()" style="text-align:rignt; text-decoration:none;">����</a>
   		    </font>
     </td>
     
   <form action="rdelete.do" method="post" onsubmit="return removeCheck1(this)">
   	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="btype" value="${param.btype}">
	<input type="hidden" name="no" value="${r.no}">
   <td width="2%">
   		<font size="1">
   			<input type="submit" value="����" class="submitLink">
   		</font>
   </td>
   </form>
   </c:if>
   </c:if>
   <c:if test="${sessionScope.login =='admin'}">
   	<tr><td style = "text-align:left" width="95%">${r.nick}<br>${r.content}<br><font size="1">${r.rdate}</font></td>
   
   	 <td width="7%">
   			<font size="1">
    			 <a href="javascript:$('#updateform${r.no}').toggle()" style="text-align:rignt; text-decoration:none;">����</a>
   		    </font>
     </td>
     
   <form action="rdelete.do" method="post" onsubmit="return removeCheck1(this)">
   	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="btype" value="${param.btype}">
	<input type="hidden" name="no" value="${r.no}">
   <td width="2%">
   		<font size="1">
   			<input type="submit" value="����" class="submitLink">
   		</font>
   </td>
   </form>
   </c:if>
</tr>
   
   
<tr style = "text-align:left; display:none;" id="updateform${r.no}"><td colspan="3"  width="95%">
<form action="rupdate.do" method="post" name="d" onsubmit="return removeCheck1(this)">
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="no" value="${r.no}">
<table colspan="2" style="width:60%; margin: auto;">
	<tr><td colspan="0.5" width="80%"><textarea rows="5" name ="content"
	id="content1" class="w3-input w3-border">${r.content}</textarea></td>
	
	<td colspan="0.5" width="20%"><a href="javascript:document.d.submit()">��ۼ���</a></td></tr>

</table>
</form>
</td></tr>

</c:forEach>
</table>


<form action="reply.do" method="post" name="f">
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="nick" value="${sessionScope.nick}">
<table colspan="2" style="width:60%; margin: auto;">
	<tr><td colspan="0.5" width="80%"><textarea rows="5" name ="content"
	id="content1" class="w3-input w3-border"></textarea></td>
	<c:if test="${empty sessionScope.login}">
	<td colspan="0.5" width="20%"><a href = "info.do?num=${b.num}&btype=${b.btype}" onclick="check()">��۵��</a></td></tr>
	</c:if>
	<c:if test="${!empty sessionScope.login}">
	<td colspan="0.5" width="20%"><a href="javascript:inputcheck()">��۵��</a></td></tr>
	</c:if>
</table>
</form>
</body></html>