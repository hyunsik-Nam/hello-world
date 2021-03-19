<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>두산베어스 선수 정보 가져오기</title>
</head>
<body>
   <%
      String url = "https://www.doosanbears.com/players/batters/20";
      String line = "";
      String title = "";

      try {
         Document doc = Jsoup.connect(url).get();
         Elements div = doc.select(".player_view");
         for (Element src : div) {
            out.println(src.toString());
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
   %>
</body>
</html>