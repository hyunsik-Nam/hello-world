<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1.id �Ķ���� ��ȸ 
    2.login ���� ��ȸ
     -�α׾ƿ�  : "�α����ϼ���"���.lofinForm.jsp ������ �̵�
    3.�� ���� �ƴϸ鼭 ,admin�� �ƴѰ��
     -�� ������ ���������մϴ�. ���. main.jsp������ �̵�
    4.id ������ db�� �о� Member ��ü�� ����
    5.Member ��ü�� ȭ�鿡 ���--%>
<%
String id = request.getParameter("id"); //  1.id �Ķ���� ��ȸ 
String login = (String)session.getAttribute("login"); // 2.login ���� ��ȸ
//getAttribute�� ���ϰ��� ������Ʈ�� String�� ������
if(login == null){%>
<script>
alert("�α��� �ϼ���")
location.href="loginForm.jsp";
</script>
<% } //�α����� �Ȱ��,�����ڰ� �ƴϰ� �ٸ���� ���� ��ȸ �Ұ�
else if(!id.equals(login) && !login.equals("admin")) {%>
<script>
alert("�� ���� ��ȸ�� �����մϴ�.");
location.href="main.jsp";
</script>
<% } else { //�� �����̰ų� admin�� ��� �ٸ� ����� ���� ��ȸ. �������� �ŷ�
//mem : id�� �ش��ϴ� ����� �� ���� ����
Member mem = new MemberDao().selectOne(id);%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel ="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputcheck(f){
	if(f.pass.value == ""){
		alert("��й�ȣ�� �Է��ϼ���");
		f.pass.focus();
		return false;
	}
}
function win_passchg(){
	var op = "width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.jsp","",op);
}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post"
onsubmit="return inputchectk(this)">
<input type ="hidden" name="picture" value="<%=mem.getPicture() %>">
<table><caption>ȸ�� ���� ����</caption>
<tr><td rowspan="4" valign="bottom">
<img src="picture/<%=mem.getPicture() %>"
 width="100" height="120" id="pic"><br>
<font size="1"><a href="javascript:win_upload()">��������</a></font>
</td><th>���̵�</th>
<td><input type="text" name="id" readonly value="<%=mem.getId()%>"></td></tr><%--readonly : �б⸸ ���� --%>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><th>�̸�</th>
<td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
<tr><th>����</th>
<td><input type="radio" name="gender" value="1"
<%=mem.getGender()==1?"checked":"" %>>��
<input type="radio" name="gender" value="2"
<%=mem.getGender()==2?"checked":"" %>>��</td></tr>
<tr><th>��ȭ��ȣ</th>
<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
<tr><th>�̸���</th>
<td colspan="2"><input type="text" name="eamil" value="<%=mem.getEmail()%>"></td></tr>
<tr><td colspan="3"><input type="submit" value="ȸ������">
<%if(!login.equals("admin") || id.equals("admin")) { %> <%--�����ڰ� �ƴϸ� ������~ || �ƴϸ� id�� �����ڸ� ������ �ڽ��̴ϱ� --%>
<input type="button" value="��й�ȣ����" onclick="win_passchg()">
<%} %></td></tr>
</table></form>
</body>
</html>
<% } %>