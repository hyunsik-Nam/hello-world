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
	<option value="">선택하세요</option>
	<option value="subject">제목</option>
	<option value="name">작성자</option>
	<option value="content">내용</option>
	<option value="subject,name">제목+작성자</option>
	<option value="subject,content">제목+내용</option>
	<option value="name,content">작성자+내용</option>
	<option value="subject,name,content">제목+작성자+내용</option></select>
<script>document.sf.column.value="${param.column}";</script>
<input type="text" name="find" value="${param.find}"
	style="width:50%;"><input type="submit" value="검색"></div>
</form>
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
   <tr><td colspan = "5" style = "text-align:right">글 개수:${boardcount}</td></tr>
   <tr><th width = "8%">번호</th><th width="50%">제목</th>
      <th width="14%">작성자</th><th width="17%">등록일</th>
      <th width="11%">조회수</th></tr>
<c:forEach var="b" items="${list}">
   <tr><td>${boardnum}</td>
   <c:set var="boardnum" value="${boardnum-1}"/>
      <td style = "text-align:left">
         <a href="../border/info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
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
   </c:if>
  
   
    
</table>
</body>
</html>