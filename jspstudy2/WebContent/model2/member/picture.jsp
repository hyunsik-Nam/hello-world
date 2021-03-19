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
   <script type="text/javascript">
   img = opener.document.getElementById("pic"); //내가 선택한 이미지의 이름이 출력
   img.src = "picture/${fname}";
   //db 저장을위한 파라미터 설정
   opener.document.f.picture.value="${fname}";
   self.close();
   </script>
</body>
</html>