<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<decorator:head />

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
</head>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
  <span class="w3-bar-item w3-right">
  	<c:if test="${empty sessionScope.login}">
  		<a href="${path}/model2/member/loginForm.me">로그인</a>
  		<a href="${path}/model2/member/joinForm.me">회원가입</a>
  	</c:if>
  	<c:if test="${!empty sessionScope.login }">
		${sessionScope.login}님이 로그인 하셨습니다.&nbsp;&nbsp;
		<a href="${path}/model2/member/logout.me">로그아웃</a>
		</c:if>
  </span>
  <div class="w3-container">
  <%--ajax을 통해 얻은 환율 정보 내용 출력 --%>
  </div><br>
  <div class="w3-display-container">
  </div>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>

  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="${path}/model2/member/picture/${sessionScope.picture}" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
    	<c:if test="${empty sessionScope.login }">
      	<span><strong>로그인하세요</strong></span><br>
      	</c:if>
      	<c:if test="${!empty sessionScope.login }">
      	<span><strong>Welcome  ${login}</strong></span><br>
      	</c:if>
     	
    </div>
    
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
   
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>Close Menu</a>
    <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-padding w3-white"><i class="fa fa-eye fa-fw"></i>회원관리</a>
    <a href="${path}/model2/board/list.do" class="w3-bar-item w3-button w3-padding w3-white"><i class="fa fa-users fa-fw"></i>게시판</a>
    <a href="${path}/model2/chat/chatform.do" class="w3-bar-item w3-button w3-padding w3-white"><i class="fa fa-bullseye fa-fw"></i>채팅</a>
    <div id="exchange"></div><br>
   <div id="exchange2"></div>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
   <decorator:body />
  </header>

  <div class="w3-row-padding w3-margin-bottom">
   <div class="w3-half">
   	<div class="w3-container w3-padding-16">
   		<div id="piecontainer"
   					style="width:80%; border:1px solid #fffff">
   					<canvas id="canvas1" style="width:100%;"></canvas>
   	</div>
   </div>
  </div>
  <div class="w3-half">
  	<div class="w3-container w3-padding-16">
  		<div id="barcontainer"
  				style="width:80%; border:1px solid #fffff">
  				<canvas id="canvas2" style="width: 100%;"></canvas>
  	</div>
  </div>

  <div class="w3-panel">
    
  </div>
 

  <div class="w3-container">
   
  </div>
  <hr>
  <div class="w3-container">
    
  </div>
  <hr>

  <div class="w3-container">
  </div>

  

  <!-- End page content -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
	var randomColorFactor = function(){
		return Math.round(Math.random() * 255);
	}
	var randomColor = function(opa) {
		return "rgba("+randomColorFactor() +","
				+ randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ (opa || '.3')+")";
	}
	$(function(){
		piegraph();
		exchangeRate();
		exchangeRate2();
	})
	function exchangeRate() {
		$.ajax("${path}/model2/ajax/exchange.do",{
			success : function(data) {
				$("#exchange").html(data);
			},
		error : function(e){
			alert("환율 조회시 서버 오류:"+e.status);
		}
	})
	}
	function exchangeRate2() {
		$.ajax("${path}/model2/ajax/exchange2.do",{
			success : function(data) {
				$("#exchange2").html(data);
			},
		  error : function(e){
			alert("환율 조회시 서버 오류:"+e.status);
		  }
	})
	}
	function piegraph(){
		$.ajax("${path}/model2/ajax/graph.do",{
			success : function(data) {
				pieGraphPrint(data);
			},
			error : function(e){
				alert("서버 오류:" + e.status);
			}
		})
	}
	function pieGraphPrint(data){
		var rows = JSON.parse(data);
		var names = []
		var datas = []
		var colors =[]
		$.each(rows,function(index,item){
			names[index]=item.name;
			datas[index] = item.cnt;
			colors[index] = randomColor(0.7);
		})
		var config = {
			type : 'pie',
			data : {
				datasets : [{
					data : datas,
					backgroundColor:colors
				}],
				labels : names
			},
			options : {
				responsive : true,
				legend : {position : 'top'},
				title : {
					display : true,
					text : '글쓴이 별 게시판 등록 건수',
					position : 'bottom'
				}
			}
		}
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx,config);
	}
</script>
</body>
</html>

