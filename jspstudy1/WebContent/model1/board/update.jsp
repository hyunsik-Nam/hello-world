<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. �Ķ������������ Board ��ü ����.
	2. ��й�ȣ ��ġ
		÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ�
		�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�.
		 boolean BoardDao.update(Board)
		�������� : �������� �޽��� ��� �� info.jsp ������ �̵�
		�������� : �������� �޽��� ��� �� updateForm.jsp ������ �̵�
	3. ��й�ȣ ����ġ
		��й�ȣ ���� �޼��� ����ϰ�, updateForm.jsp�� ������ �̵�
 --%>
 <%
 Board board = new Board();
 String path = application.getRealPath("/")+"model1/board/file/";
 MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
 board.setNum(Integer.parseInt(multi.getParameter("num")));
 board.setName(multi.getParameter("name"));
 board.setPass(multi.getParameter("pass"));
 board.setSubject(multi.getParameter("subject"));
 board.setContent(multi.getParameter("content"));
 board.setFile1(multi.getFilesystemName("file1"));
 //���Ϻκ��� ������ ���°��
 if(board.getFile1()==null || board.getFile1().equals("")){
	 board.setFile1(multi.getParameter("file2"));
 }
 BoardDao dao = new BoardDao();
 Board dbboard = dao.selectOne(board.getNum());
 String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
 String url = "updateForm.jsp?num="+board.getNum();
 if(board.getPass().equals(dbboard.getPass())){
	 if(dao.update(board)){
		 msg = "�Խù� ���� �Ϸ�";
		 url = "info.jsp?num="+board.getNum();
	 } else {
		 msg = "�Խù� ���� ����";
	 }
 }%>
 <script>
 	alert("<%=msg%>")
 	location.href="<%=url%>";
 </script>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

</body>
</html>