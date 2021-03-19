<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
  .left-box {
  background: red;
  float: left;
  width: 50%;
  height: 500px;
  display :flex;
  justify-content:center;
}
  .right-box {
  background: blue;
  float: right;
  width: 50%;
  height: 500px;
  display :flex;
  justify-content:center;
}
   
    </style>

</head>
<body>
<form action = "list.do" method ="post" name ="sf">
<div style="display : flex; justify-content: center;">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name ="pageNum" value="1">
<select name="column">
	<option value="">�����ϼ���</option>
	<option value="subject">����</option>
	<option value="name">�ۼ���</option>
	<option value="content">����</option>
	<option value="subject,name">����+�ۼ���</option>
	<option value="subject,content">����+����</option>
	<option value="name,content">�ۼ���+����</option>
	<option value="subject,name,content">����+�ۼ���+����</option></select>
<script>document.sf.column.value="${param.column}";</script>
<input type="text" name="find" value="${param.find}"
	style="width:50%;"><input type="submit" value="�˻�"></div>
</form>
<table>
	<c:if test="${param.btype=='1'}">
		<h style = "text-align:left">��������</h>
	</c:if>
	<c:if test="${param.btype=='2'}">
		<h style = "text-align:left">�����Խ���</h>
	</c:if>
	<c:if test="${param.btype=='3'}">
		<h style = "text-align:left">OOTD</h>
	</c:if>
	<c:if test="${param.btype=='4'}">
		<h style = "text-align:left">��������</h>
	</c:if>

<c:if test="${boardcount ==0}">
   <tr><td colspan = "5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcount >0}">
   <tr><td colspan = "5" style = "text-align:right">�� ����:${boardcount}</td></tr>
   <tr><th width = "8%">��ȣ</th><th width="50%">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
      <th width="11%">��ȸ��</th></tr>
<c:forEach var="b" items="${list}">
   <tr><td>${boardnum}</td>
   <c:set var="boardnum" value="${boardnum-1}"/>
      <td style = "text-align:left">
         <a href="../border/info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
      <td>${b.nick}</td><td>
      <%--���� ��ϵ� �Խù� ��¥ format��� ����ϱ� --%>
      <fmt:formatDate var="bdate" value="${b.bdate}"
      			pattern="yyyy-MM-dd"/>
      			<c:if test="${today == bdate}">
      			<fmt:formatDate value="${b.bdate }" pattern="HH:mm:ss"/>
      			</c:if>
      			<c:if test="${today != bdate }">
      			<fmt:formatDate value="${b.bdate}" pattern="yyyy-MM-dd HH:mm"/>
      			</c:if></td>
      <td>${b.readcnt}</td></tr>

   </c:forEach>
   </c:if>
  
   
    
</table>
</body>
</html>