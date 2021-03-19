<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("euc-kr");
    int num = Integer.parseInt(request.getParameter("num"));
    System.out.println(num);
    String pass=request.getParameter("pass");%>
    
    
  <%
    Board board= new Board();
  	BoardDao dao = new BoardDao();
  	Board dbBoard = dao.selectOne(num);
    String msg=null;
  	String url=null;
    
    
    if(pass.equals(dbBoard.getPass())){
    	if(dao.delete(num));
    	msg="삭제성공";
    	url="list.jsp";
    }
    else{
    	msg="삭제실패";
    	url="deleteForm.jsp?num="+num;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

    <script>
    	alert("<%=msg%>")
    	location.href="<%=url%>";
    </script>
</body>
</html>