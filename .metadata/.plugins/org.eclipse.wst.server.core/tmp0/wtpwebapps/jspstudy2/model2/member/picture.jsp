<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%--
1. �̹������� ���ε�. request ��ü ��� �Ұ�
   �̹������� ���ε��� ��ġ : ���� ����/picture ������ ����
2. �̹��������� 3����1 ũ���� �������̹��� ����. �̸��� sm_�����̸����� ����
3. opener ȭ�鿡 ��� ���� =>javascript
4. ���� ȭ�� close() =>javascript
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�̹��� ���� ���ε�</title>
</head>
<body>
   <script type="text/javascript">
   img = opener.document.getElementById("pic"); //���� ������ �̹����� �̸��� ���
   img.src = "picture/${fname}";
   //db ���������� �Ķ���� ����
   opener.document.f.picture.value="${fname}";
   self.close();
   </script>
</body>
</html>