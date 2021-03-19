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
   <%
      //���ε� ��ġ  : ���� ����/picture
      String path = application.getRealPath("/") + "model1/member/picture/";
      String fname = null;
      File f = new File(path);
      //path�� ������ ������ ���� ��� ���� ����
      if (!f.exists()) {
         f.mkdirs();
      }
      //request : ������ ���� �̸� �� �������.
      MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "EUC-KR");
      //���ε�� ������ �̸�
      fname = multi.getFilesystemName("picture");//�Ķ���� �̸��� ���ƾ���.
      //new File(path+fname) : ���ε�� ���� �̹��� ����
      //bi : �޸𸮿� �̹��� ����
      BufferedImage bi = ImageIO.read(new File(path + fname));
      int width = bi.getWidth() / 3;
      int height = bi.getHeight() / 3;
      //������ �̹����� �׸��� ���� ��ȭ��
      BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
      //g : �׸��� ����
      Graphics2D g = thumb.createGraphics();
      g.drawImage(bi, 0, 0, width, height, null);
      //f : ������ �̹��� ������ ���� ���� ����
      f = new File(path + "sm_" + fname);
      ImageIO.write(thumb, "jpg", f); //thumb�̹����� f���Ϸ� ����
   %>
   <script type="text/javascript">
   img = opener.document.getElementById("pic"); //���� ������ �̹����� �̸��� ���
   img.src = "picture/<%=fname%>";
   //db ���������� �Ķ���� ����
   opener.document.f.picture.value="<%=fname%>";
   self.close();
   </script>
</body>
</html>