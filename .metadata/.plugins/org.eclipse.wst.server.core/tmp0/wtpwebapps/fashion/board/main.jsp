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
<link rel = "stylesheet" href="../css/main2.css">
<script type="text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
	
	function login() {
		alert("로그인해주세요");
	}
	
</script>
</head>
<body>

<table>

		<a href="../board/list.do?btype=1" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    <i class="fa fa-th-large fa-fw w3-margin-right"></i>공지사항 바로가기</a> 
	

<c:if test="${boardcount1 ==0}">
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount1 >0}">
   
<c:forEach var="b" items="${list1}">
   <tr>
   <c:set var="boardnum1" value="${boardnum1 -1}"/>
      <td style = "text-align:left" width="58%">
         <a href="info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
      <td width="14%">${b.nick}</td><td width="17%">
      <%--오늘 등록된 게시물 날짜 format대로 출력하기 --%>
      <fmt:formatDate var="bdate" value="${b.bdate}"
      			pattern="yyyy-MM-dd"/>
      			<c:if test="${today == bdate}">
      			<fmt:formatDate value="${b.bdate }" pattern="HH:mm:ss"/>
      			</c:if>
      			<c:if test="${today != bdate }">
      			<fmt:formatDate value="${b.bdate}" pattern="yyyy-MM-dd HH:mm"/>
      			</c:if></td>
      <td width="11%">${b.readcnt}</td></tr>
   </c:forEach>
</c:if>
    
</table>
<br><br>
<table>
<a href="../board/list.do?btype=2" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>자유게시판 바로가기</a>

<c:if test="${boardcount2 ==0}">
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount2 >0}">
   
<c:forEach var="b" items="${list2}">
   <tr>
   <c:set var="boardnum2" value="${boardnum2 -1}"/>
      <td style = "text-align:left" width="58%">
         <a href="info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
      <td width="14%">${b.nick}</td><td width="17%">
      <%--오늘 등록된 게시물 날짜 format대로 출력하기 --%>
      <fmt:formatDate var="bdate" value="${b.bdate}"
      			pattern="yyyy-MM-dd"/>
      			<c:if test="${today == bdate}">
      			<fmt:formatDate value="${b.bdate }" pattern="HH:mm:ss"/>
      			</c:if>
      			<c:if test="${today != bdate }">
      			<fmt:formatDate value="${b.bdate}" pattern="yyyy-MM-dd HH:mm"/>
      			</c:if></td>
      <td width="11%">${b.readcnt}</td></tr>
   </c:forEach>
   </c:if>
   
  
    
</table>
<br><br>
<table>
<a href="../board/list.do?btype=3" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>OOTD 바로가기</a>

<c:if test="${boardcount2 ==0}">
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount2 >0}">
   
<c:forEach var="b" items="${list3}">
   <tr>
   <c:set var="boardnum2" value="${boardnum2 -1}"/>
      <td style = "text-align:left" width="58%">
         <a href="info.do?num=${b.num}&btype=${b.btype}">${b.subject}</a></td>
      <td width="14%">${b.nick}</td><td width="17%">
      <%--오늘 등록된 게시물 날짜 format대로 출력하기 --%>
      <fmt:formatDate var="bdate" value="${b.bdate}"
      			pattern="yyyy-MM-dd"/>
      			<c:if test="${today == bdate}">
      			<fmt:formatDate value="${b.bdate }" pattern="HH:mm:ss"/>
      			</c:if>
      			<c:if test="${today != bdate }">
      			<fmt:formatDate value="${b.bdate}" pattern="yyyy-MM-dd HH:mm"/>
      			</c:if></td>
      <td width="11%">${b.readcnt}</td></tr>
   </c:forEach>
   </c:if>
</table>
</body>
</html>  