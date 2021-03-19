<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--<link rel="stylesheet" href="../css/main.css"> --%>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<script type="text/javascript"
src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<decorator:head />
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:200px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <c:if test="${empty sessionScope.login}">
    <img src="${path}/member/picture/guest.PNG" style="width:45%;" class="w3-round"><br><br>    
    </c:if>
    <c:if test="${!empty sessionScope.login}">
    <img src="${path}/member/picture/${sessionScope.picture}" style="width:45%;" class="w3-round"><br><br>
    </c:if>
    <h4><b>
    <c:if test="${empty sessionScope.login}">
    	guest<br>
  		<a href="${path}/member/loginForm.me" style="text-decoration:none">로그인</a>
  		<a href="${path}/member/joinForm.me" style="text-decoration:none">회원가입</a>
  	</c:if>
  	<c:if test="${!empty sessionScope.login}">
		<font size="5">${sessionScope.nick}</font>
		<font size="1"><a href="${path}/member/logout.me" style="text-decoration:none">로그아웃</a><br></font>
  	<font size="1"><a href="${path}/member/info.me?id=${sessionScope.login}" style="text-decoration:none">내 정보</a></font>
  	<c:if test = "${sessionScope.login == 'admin'}">
  	<font size="1"><a href = "${path}/member/list.me" style="text-decoration:none">회원목록</a></h3></font>
  	</c:if>
  	
	</c:if>
  	</b></h4>
  </div>
  <div class="w3-bar-block">
    <a href="../board/list.do?btype=1" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    <i class="fa fa-th-large fa-fw w3-margin-right"></i>공지사항</a> 
    <a href="../board/list.do?btype=2" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>자유게시판</a> 
    <a href="../board/list.do?btype=3" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>OOTD</a>
    <a href="../board/list.do?btype=4" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>라플정보</a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:200px">

  <!-- Header -->
  <header id="portfolio">

    
    <div class="w3-container">
    <h1><button class="w3-button w3-light-gray"><i class="fa fa-diamond w3-margin-right"></i>
    <a href="${path}/board/main.do" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">패션 커뮤니티</a></button></h1>
    
      <decorator:body />
    </div>
  </header>
  
  
<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
