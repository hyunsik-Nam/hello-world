<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp
   1.한 페이지 당 10건의 게시물을 출력하기.
      pageNum 파라미터값을 저장  => 없는 경우는 1로 설정하기.
   2. 최근 등록된 게시물이 가장 위에서 배치함.
   3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
      게시물을 출력부분.
      페이지 구분 출력 부분
      
  20201123 문제
  1. 첨부파일이 있는 경우 @표시하기
  2. 오늘 등록된 게시물은 시 :분:초로 출력하고
        오늘 등록된 게시물이 아닌 글은 년-월-일 시:분 으로 출력
  3. 답글인 경우 들여쓰기. ㅂ한자-6 
  4. 페이지별 조회번호가 출력되도록 수정하기 
 --%>
<%
   int pageNum = 1;
   try {
      pageNum = Integer.parseInt(request.getParameter("pageNum"));
   } catch (NumberFormatException e) {}
   int limit = 10;//한페이지에 출력할 게시물 건수
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount(); //전체 게시물 등록 건수 리턴
   //pageNum에 출력될 게시물 10개를 list객체로 리턴
   List<Board> list = dao.list(pageNum, limit);
   //페이지 목록
   /*
   maxpage : 전체 필요한 페이지 갯수. 총 페이지 갯수
      게시물 건수          페이지
      11건 :     2
            11.0/10 = 1.1 + 0.95 =>(int)(2.05) =>2
      30건 :     3
            30.0/10 = 3.0 + 0.95 =>(int)(3.95) =>3
   */
   int maxpage = (int)((double)boardcount/limit + 0.95);
   /*
   startpage : 화면에 출력될 시작 페이지 번호
         현재페이지         시작페이지
         2   :   1
      2/10.0 => 0.2+0.9 => (int)(1.1) - 1 => 0*10 => 0+1 =>1
        25   :  21
     25/10.0 => 2.5+0.9 => (int)(3.4) - 1 => 2*10 => 20+1 =>21
        505  :  501
   */
   int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
   /*
   endpage : 화면에 출력될 마지막 페이지 번호
           시작페이지 : 마지막 페이지
         1 : 10
         11 : 20
   */
   int endpage = startpage + 9;
   if(endpage > maxpage) endpage = maxpage;
   
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   String today =sf.format(new Date());
   SimpleDateFormat todayf = new SimpleDateFormat("HH:mm:ss");
   SimpleDateFormat otherf = 
         new SimpleDateFormat("yyyy-MM-dd HH:mm");
   int boardnum = boardcount -(pageNum -1)*limit;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시판 목록</caption>
   <%if(boardcount == 0) {%>
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
   <%} else {  //등록된 게시글이 있는 경우%> 
   <tr><td colspan = "5" style = "text-align:right">글 개수:<%=boardcount %></td></tr>
   <tr><th width = "8%">번호</th><th width="50%">제목</th>
      <th width="14%">작성자</th><th width="17%">등록일</th>
      <th width="11%">조회수</th></tr>
   <% for(Board b : list) { //게시글 조회 시작%> 
   <tr><td><%=b.getNum() %></td>
      <td style = "text-align:left">
      <%--첨부파일 --%>
      <%if(b.getFile1() !=null && !b.getFile1().trim().equals("")){ %>
      <a href ="file/<%=b.getFile1() %>"
      style="text-decoration:none;">@</a>
     <% } else { %> &nbsp; &nbsp; &nbsp; <% } %>
     
     <%if(b.getGrplevel() >0){
    	 		for(int i=1;i<b.getGrplevel();i++){%>
    	 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;
    	 			<%} %>└
    	 		<%} %>
     }
      
         <a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject() %></a></td>
      <td><%=b.getName() %></td>
      <%--오늘 등록된 게시물 날짜 format대로 출력하기 --%>
      <td><%if(today.equals(sf.format(b.getRegdate()))) {%>
      <%=todayf.format(b.getRegdate()) %>
      <%}else { %><%=otherf.format(b.getRegdate()) %><%} %></td>
      
      <td><%=b.getReadcnt()%></td></tr> 
      <% } //for 구문 끝%>
   <tr><td colspan = "5"><%-- 페이지 처리하기 --%>
      <%if(pageNum <= 1)  {%>[이전] <%} else {%>
          <a href="list.jsp?pageNum=<%=pageNum - 1%>">[이전]</a><% } %>
       <%for (int a = startpage; a <= endpage; a++) {%>
          <%if(a==pageNum)  {%>[<%=a %>] <%} else { %>
              <a href = "list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
          <% }
          } %>   
       <%if(pageNum >= maxpage) {%>[다음]
       <%} else {%>
          <a href="list.jsp?pageNum=<%=pageNum + 1 %>">[다음]</a>
       <% } %></td></tr>
   <% } %>
   <tr><td colspan = "5" style="text-align:right">
      <a href = "writeForm.jsp">[글쓰기]</a></td></tr>
</table>
</body>
</html>  