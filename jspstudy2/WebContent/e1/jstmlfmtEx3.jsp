<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<%request.setCharacterEncoding("euc-kr"); %>
<form method="post" name="f">
이름:<input type="text" name="name" value="${param.name}"><br>
입사일:<input type="text" name="hiredate" value="${param.hiredate}">
yyyy-MM-dd 형태로 입력<br>
급여:<input type="text" name="salary" value="${param.salary}"><br>
<c:set var ="jobs" value="${fn:join(paramValues.job,',')}"/>
담당업무 : <input type="checkbox" name="job" value="서무"
	<c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무
		<input type="checkbox" name="job" value="개발"
		<c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발
		<input type="checkbox" name="job" value="비서"
		<c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서
		<input type="checkbox" name="job" value="운용"
		<c:if test="${fn:contains(jobs,'운용')}">checked</c:if>>운용
	<input type="submit" value="전송">
</form><hr>
이름:${param.name}<br>
입사일:${param.hiredate}<br>
급여:${param.salary}<br>
담당업무:${param.job}<br>
담당업무:<c:forEach var="j" items="${paramValues.job}">
	${j }&nbsp;&nbsp;&nbsp;
	</c:forEach><br>
<h3>입사일을 yyyy년 MM월 dd일 E요일 형태로 출력, 급여, 연봉 세자리마다, 출력,
	연봉 : 급여 * 12</h3>
이름:${param.name}<br>
<c:catch var="formatexception">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
입사일:
<c:if test="${formatexception ==null}">
<fmt:formatDate value="${hiredate}" pattern="yyyy년MM월dd일E요일"/><br>
</c:if>

<c:if test="${formatexception ==null}">
입사일은 yyyy-MM-dd 형태로 입력하세요
</c:if>

급여 : <fmt:formatNumber value="${param.salary}" pattern="###,###"/><br>
연병 : <fmt:formatNumber value="${param.salary *12 }" pattern="###,###"/><br>
담당업무:<c:forEach var="j" items="${paramValues.job}">
	${j}&nbsp;&nbsp;&nbsp;
</c:forEach><br>
</body>
</html>