<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--/WebContent/medel1/member/password.jsp
1.�α׾ƿ� ������ ���. �α����ϼ���. �޼��� �߷�
 �ٸ� ������� ��й�ȣ ���� �Ұ�-> �α��ε� id�����θ� ���� ����.���θ� ���� ����
 opener�������� loginForm.jsp������ �̵�
  ���������� �ݱ�
2.pass, chgpass �Ķ���� �� ����
3.pass ��й�ȣ��db�� ����� ��й�ȣ�� Ʋ����
   ��й�ȣ ���� �޼��� ���. passwordForm.jsp ������ �̵�
4.pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
  MemverDao.updatePass(login,chgpass) ->���ο� ��й�ȣ�� ����
  ��й�ȣ ���� ����
        �޼��� ����� opener �������� info.jsp������ �̵�. ���������� �ݱ�
   ��й�ȣ ���� ����
       �޼��� ����� opener �������� updateForm.jsp ������ �̵�
  ���������� �ݱ� --%>
<script>
alert("${msg}");
<c:if test="${opener}">
	opener.location.href="${url}";
</c:if>
<c:if test="${!opener}">
	location.href="${url}";
</c:if>
<c:if test="${closer}">
	self.close();
</c:if>
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