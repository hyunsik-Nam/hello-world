<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post">
	����:<input type="text" name="num" value="${param.num}">
		<input type="submit" value="���ڱ����� �� ���ϱ�">
</form>

<c:forEach var="i" begin="1" end="${param.num}">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
�հ�:${sum}

<h3>if �±׸� �̿��Ͽ� ����ϱ�</h3>
<c:if test="${sum%2==0}">
	${sum}�� ¦���Դϴ�.<br>
</c:if>
<c:if test="${sum%2!=0}">
	${sum}�� Ȧ���Դϴ�.<br>
</c:if>
<h3>choose when �±׸� �̿��Ͽ� ����ϱ�</h3>
<c:choose>
	<c:when test="${sum%2==0}">
		${sum}�� ¦���Դϴ�.<br>
	</c:when>
	<c:when test="${sum%2!=0}">
		${sum}�� Ȧ���Դϴ�.<br>
	</c:when>
</c:choose>
</body>
</html>