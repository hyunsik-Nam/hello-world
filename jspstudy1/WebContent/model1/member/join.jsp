<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--/WebContent/model1/member/join.jsp
    1.�Ķ���� ������ Member ��ü�� ���� => useBean �׼��±�
      model.Member
    2.Member ��ü ������ db�� �߰�
    3.���� ���� : loginForm.jsp������ �̵�
              ���Խ���  : joinForm.jsp������ �̵�
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="mem" class="model.Member"/>
<%--�Ķ���Ϳ� Member ��ü�� ������Ƽ�� ���� ��� setProperty�� �̿��Ͽ�
Member ��ü�� �Ķ���� ���� ����� --%>
<jsp:setProperty property="*" name="mem"/>
<%
MemberDao dao = new MemberDao();
//insert ������ ������ ����� ����
int result = dao.insert(mem);
String msg = "ȸ������ ����";
String url = "joinForm.jsp";
if(result > 0) {
	msg = mem.getName() + "�� ȸ������ �Ϸ�";
	url = "loginForm.jsp";
}
%>
<script>
alert("<%=msg%>")
location.href="<%=url%>";
</script>
</body>
</html>