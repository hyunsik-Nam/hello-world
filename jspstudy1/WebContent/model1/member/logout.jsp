<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
//    1.session �α��� ���� ����
//    2.loginForm.jsp ������ �̵� 
    
    
    
    1.session�α��� ���� ����
    2.�α׾ƿ��ϼ̽��ϴ�.�޼��� �����
       loginForm.jsp ������ �̵�
    --%>
<%
session.invalidate(); //session ���� ->session.invalidate() :���� �Է��ߴ� ���� ����.���ο� �������� �ٲ�
//session.removeAttribute("login");//removeAttribute�� invalidate()�� ���� ģ��. �Ӽ����� �����Ѱɷ�
//response.sendRedirect("loginForm.jsp"); //������ �̵��ϸ� alertâ �ȶ�.
%>
<script type="text/javascript">
alert("�α׾ƿ��ϼ̽��ϴ�.")
location.href ="loginForm.jsp";
</script>