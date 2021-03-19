<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/model1/board/list.jsp--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel = "stylesheet" href="../css/main.css">
<script type="text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
	
	function login() {
		alert("로그인해주세요");
	}
	
	function check() {
		alert("관리자만 가능");
	}
	
</script>
</head>
<body>

<table>
	<c:if test="${param.btype=='1'}">
		<h style = "text-align:left">공지사항</h>
	</c:if>
	<c:if test="${param.btype=='2'}">
		<h style = "text-align:left">자유게시판</h>
	</c:if>
	<c:if test="${param.btype=='3'}">
		<h style = "text-align:left">OOTD</h>
	</c:if>
	<c:if test="${param.btype=='4'}">
		<h style = "text-align:left">라플정보</h>
	</c:if>

<c:if test="${boardcount ==0}">
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount >0}">
   <tr><th width = "8%">번호</th><th width="50%">제목</th>
      <th width="14%">작성자</th><th width="17%">등록일</th>
      <th width="11%">조회수</th></tr>
<c:forEach var="b" items="${list}">
   <tr><td>${boardnum}</td>
   <c:set var="boardnum" value="${boardnum-1}"/>
      <td style = "text-align:left">
         <a href="info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
      <td>${b.nick}</td><td>
      <%--오늘 등록된 게시물 날짜 format대로 출력하기 --%>
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
      
   <tr><td colspan = "5"><%-- 페이지 처리하기 --%>
   	<c:if test="${pageNum <= 1 }">[이전]</c:if>
   	<c:if test="${pageNum > 1 }">
   	<a href="javascript:listdo(${pageNum -1})">[이전]</a></c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
      	<c:if test="${a==pageNum}">[${a}]</c:if>
      	<c:if test="${a!=pageNum}">
      	<a href = "javascript:listdo(${a})">[${a}]</a></c:if>
      </c:forEach>
      <c:if test="${pageNum >= maxpage }">[다음]</c:if>
      <c:if test="${pageNum < maxpage }">
      <a href="javascript:listdo(${pageNum +1})">[다음]</a>
      </c:if>
      </td></tr>
   </c:if>
   <tr><td colspan = "5" style="text-align:right">
   <c:if test="${!empty sessionScope.login}">
   		<c:if test="${param.btype ==1}">
   			<c:if test="${sessionScope.login != 'admin'}">
   				<a href = "list.do?btype=${param.btype}" onclick="check()">[글쓰기]</a></td></tr>
   			</c:if>
   			<c:if test="${sessionScope.login == 'admin'}">
   				<a href = "writeForm.do?btype=${param.btype}" >[글쓰기]</a></td></tr>
   			</c:if>
   		</c:if>
   
   		<c:if test="${param.btype != 1}">
      		<a href = "writeForm.do?btype=${param.btype}" >[글쓰기]</a></td></tr>
      	</c:if>
    </c:if>
    <c:if test="${empty sessionScope.login}">
        <button onclick="login()">글쓰기</button>
    </c:if>
</table>
<form action = "list.do" method ="post" name ="sf">
<div style="display : flex; justify-content: center;">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name ="pageNum" value="1">
<select name="column">
	<option value="">선택하세요</option>
	<option value="subject">제목</option>
	<option value="nick">작성자</option>
	<option value="content">내용</option>
	<option value="subject,nick">제목+작성자</option>
	<option value="subject,content">제목+내용</option>
	<option value="nick,content">작성자+내용</option>
	<option value="subject,nick,content">제목+작성자+내용</option></select>
<script>document.sf.column.value="${param.column}";</script>
<input type="text" name="find" value="${param.find}"
	style="width:50%;"><input type="submit" value="검색"></div>
</form>
</body>
</html>  