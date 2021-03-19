<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%--
1. 이미지파일 업로드. request 객체 사용 불가
   이미지파일 업로드의 위치 : 현재 폴더/picture 폴더로 설정
2. 이미지파일의 3분의1 크기의 섬네일이미지 생성. 이름은 sm_파일이름으로 설정
3. opener 화면에 결과 전달 =>javascript
4. 현재 화면 close() =>javascript
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이미지 파일 업로드</title>
</head>
<body>
   <%
      //업로드 위치  : 현재 폴더/picture
      String path = application.getRealPath("/") + "model1/member/picture/";
      String fname = null;
      File f = new File(path);
      //path가 지정한 폴도가 없는 경우 폴더 생성
      if (!f.exists()) {
         f.mkdirs();
      }
      //request : 파일의 내용 이름 다 들어있음.
      MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "EUC-KR");
      //업로드된 파일의 이름
      fname = multi.getFilesystemName("picture");//파라미터 이름과 같아야함.
      //new File(path+fname) : 업로드된 원본 이미지 파일
      //bi : 메모리에 이미지 저장
      BufferedImage bi = ImageIO.read(new File(path + fname));
      int width = bi.getWidth() / 3;
      int height = bi.getHeight() / 3;
      //섬네일 이미지를 그리기 위한 도화지
      BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
      //g : 그리기 도구
      Graphics2D g = thumb.createGraphics();
      g.drawImage(bi, 0, 0, width, height, null);
      //f : 섬네일 이미지 저장을 위한 파일 설정
      f = new File(path + "sm_" + fname);
      ImageIO.write(thumb, "jpg", f); //thumb이미지를 f파일로 저장
   %>
   <script type="text/javascript">
   img = opener.document.getElementById("pic"); //내가 선택한 이미지의 이름이 출력
   img.src = "picture/<%=fname%>";
   //db 저장을위한 파라미터 설정
   opener.document.f.picture.value="<%=fname%>";
   self.close();
   </script>
</body>
</html>