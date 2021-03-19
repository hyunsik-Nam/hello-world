<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� �±� ���� 2</title>
</head>
<body>
<h3>Format �� ���ڸ� �Ϲ� ���ڷ� ����</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>


���� : 20,000 + 10,000 = 30,000 ����ϱ�<br>

<fmt:formatNumber value="${num1}" pattern="##,###"/>+
<fmt:formatNumber value="${num2}" pattern="##,###"/>+
<fmt:formatNumber value="${num1+num2}" pattern="##,###"/>

<h3>Format �� ��¥�� ��¥������ ����</h3>
<fmt:parseDate value="2020-12-25 12:00:00"
	pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
${day}<br>

���� :	2020-12-25 ���� ���� ���<br>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd E����"/><br>
</body>
</html>