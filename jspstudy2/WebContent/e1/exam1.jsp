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
	x:<input type="text" name="x" value="${param.x}"><br>
	y:<input type="text" name="y" value="${param.y}">
		<input type="submit" value="���ϱ�">
</form>
�հ� : <c:out value="${param.x+param.y }"/>
�հ� : ${param.x+param.y}
<h3>if �±׸� �̿��Ͽ� ����ϱ�</h3>
<c:if test="${param.x+param.y >0 }">
${param.x + param.y}�� ����Դϴ�.<br>
</c:if>
<c:if test="${param.x+param.y <0 }">
${param.x + param.y}�� �����Դϴ�.<br>
</c:if>
<c:if test="${param.x+param.y ==0 }">
${param.x + param.y}�� 0�Դϴ�.<br>
</c:if>
<h3>choose when �±׸� �̿��Ͽ� ����ϱ�</h3>
<c:choose>
	<c:when test="${param.x + param.y >0}">
	${param.x + param.y }�� ����Դϴ�.<br>
	</c:when>
	<c:when test="${param.x + param.y <0}">
	${param.x + param.y }�� �����Դϴ�.<br>
	</c:when>
	<c:when test="${param.x + param.y ==0}">
	${param.x + param.y }�� 0�Դϴ�.<br>
	</c:when>
</c:choose>
</body>
</html>