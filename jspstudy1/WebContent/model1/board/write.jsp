<%@page import="model.BoardDao"%>
<%@page import="java.io.File"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
    1. �Ķ���� ���� model.Board ��ü ����.
    	useBean ��� �Ұ� : request ������ �Ķ���Ϳ� ��Ŭ������ ������Ƽ ��
    					 request ��ü�� ��� �� �� ����.
    2. �Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 +1 ��ϵ� �Խù��� ��ȣ.
    	db���� maxnum �� ���ؼ� +1 ������ num �����ϱ�
    3. board ������ db�� ����ϱ�.
    	��ϼ��� : �޼��� ���. list.jsp ������ �̵�
    	��Ͻ��� : �޼��� ���. writeForm.jsp ������ �̵�
     --%>
<%
	String path = application.getRealPath("/") + "model1/board/file/";
File f = new File(path);
if (!f.exists())
	f.mkdirs();
MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
Board board = new Board();
board.setName(multi.getParameter("name"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));
BoardDao dao = new BoardDao();
String msg = "�Խù� ��� ����";
String url = "writeForm.jsp";
//board table���� num �÷��� �ִ밪 ����. �ִ밪�� ���� ��� 0���� ����
int num = dao.maxnum();
board.setNum(++num);
board.setGrp(num);
if (dao.insert(board)) {
	msg = "�Խù� ��� ����";
	url = "list.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>
	"
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>