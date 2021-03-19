<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- WebContent/model2/member/list.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ����</title>
<script type="text/javascript">
function allchkbox(chk){
	var allchk =chk.checked //��ü ���� ��, true, false
	//getElementByName(name) : name �Ӽ��� ���� " mailchk"�� �±׵� �迭
	// <input name = "mailchk"...>
	document.getElementsByName("mailchk").forEach
	(function(item,index){
		//item : name="mailchk"�� �±� �Ѱ�
		if(allchk)//��ü ���� t
			item.setAttribute("checked",true);
		else//��ü ���� false
			item.removeAttribute("checked");
	})
}
//jquery�� �̿��Ͽ� allchkbox �����ϱ�
function allchkbox2(chk){
	$("input[name=mailchk]").prop("checked",chk.checked)
}
</script>
</head><body>
<form action = "mailform.me" method="post">
   <table class="w3-table-all w3-border">
      <caption>ȸ�� ���</caption>
      <tr>
         <th>���̵�</th>
         <th>����</th>
         <th>�̸�</th>
         <th>�г���</th>
         <th>�̸���</th>
         <th>&nbsp;</th>
      </tr>
      <c:forEach var="m" items="${list}">
      <tr>
            <td><a href="info.jsp?id=${m.id}">${m.id}</a></td>
            <td><img src="picture/sm_${m.picture}" width="20" height="30"></td>
            <td>${m.name}</td>
            <td>${m.nick}</td>
            <td>${m.email}</td>
            <td><a href="updateForm.me?id=${m.id}">[����]</a> 
            <c:if test="${m.id != 'admin'}">
            <a href="deleteForm.jsp?id=${m.id}">[����Ż��]</a></c:if></td>
            </tr></c:forEach><tr><td colspan="8" align="w3-center">
            </table></form></body></html>