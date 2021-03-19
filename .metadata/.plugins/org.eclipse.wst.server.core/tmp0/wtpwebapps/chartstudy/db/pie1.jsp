<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>막대/선 그래프로 게시글 작성자의 건수 출력하기</title>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<style>
	canvas { /* 글씨가 선택되지 않도록*/
		-moz-user-select : none;
		-webkit-user-select : none;
		-ms-user-select : none;
		user-select : none;
	}	
</style>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
 url="jdbc:mariadb://localhost:3306/classdb"
 user="scott" password="1234"/>
 <sql:query var="rs" dataSource="${conn}">
 	select name , count(*) cnt from board
 	group by name
 	having count(*) > 1
 	order by cnt desc
 </sql:query>
</head>
<body>
<div id="container" style="width:75%;">
<canvas = id="canvas"></canvas></div>
<script type="text/javascript">
var randomColorFactor = function(){
   return Math.round(Math.random() * 255); //0 ~ 255
}
//색을 랜덤하게 만들기 위해 랜덤
var randomColor = function(opacity){ //opacity : 투명도
   return "rgba("+randomColorFactor()+"," //rgba(0 ~ 255 사이의 수)
         + randomColorFactor() +","
         + randomColorFactor() +","
         + (opacity || '.3')+")";
};
var config ={
      type : 'pie',
      data :{
         datasets:[{
            data: [<c:forEach items="${rs.rows}" var="m">
                "${m.cnt}",</c:forEach>],
         backgroundColor: [<c:forEach items="${rs.rows}" var="m">
                randomColor(1),</c:forEach>]
         }],
         labels:[<c:forEach items="${rs.rows}" var="m">
         "${m.name}",</c:forEach>]
      },
      options:{responsive:true,
         legend:{display:true},
         title:{
            display:true,
            text:'글쓴이 별 게시판 등록 건수',
            position : 'bottom'
         }
         }
};
window.onload = function(){
   var ctx = document.getElementById('canvas').getContext('2d');
   new Chart(ctx,config);
}
</script>
</body>
</html>