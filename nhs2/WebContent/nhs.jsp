<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="nhs.css">
</head>
<body>
<form  name="f" method="post" action="nhs.do">
  <select name="column">
     <option value="">�����ϼ���</option>
     <option value="name">�̸�</option>
     <option value="id">���̵�</option>
     <option value="position">����</option>
     <option value="name,position">�̸�+��������</option>
  </select>
  <script type="text/javascript">
     document.f.column.value ='${param.column}';
  </script>
  <input type="text" name="find" style="width:50%;" value="${param.find}">
  <input type="submit" value="�˻�" >
</form>
<c:if test="${param.column != null}">
<table>
<tr><td colspan="6" style="text-align: right;">��ȸ�Ǽ� : ${recordcnt}</td></tr>
<tr><th>������ȣ</th><th>�̸�</th><th>���̵�</th><th>�޿�</th><th>�Ի���</th><th>����</th></tr>
<c:forEach var="p" items="${list}">
<tr><td>${p.no}</td><td>${p.name}</td>
<td>${p.id}</td><td>${p.salary}</td>
<td><fmt:formatDate value="${p.hiredate}" pattern="yyyy-MM-dd"/></td>
<td>${p.position}</td></tr>
</c:forEach></table>
</c:if>
</body>
</html>