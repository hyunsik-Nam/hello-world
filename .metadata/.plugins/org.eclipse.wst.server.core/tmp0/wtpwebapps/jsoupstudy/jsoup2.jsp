<%@page import="java.io.IOException" %>
<%@page import="org.jsoup.nodes.Element" %>
<%@page import="org.jsoup.select.Elements" %>
<%@page import="org.jsoup.Jsoup" %>
<%@page import="org.jsoup.nodes.Document" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/jsoup2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링 예제</title>
<style type="text/css">
table,td,th {border:2px solid grey;}
</style>
</head>
<body>
<%
String url ="https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
String line = "";
Document doc = null;
try{
   doc = Jsoup.connect(url).get(); //url 정보의 html(소스보기) 정보리턴
   Elements e1 = doc.select("table"); //table 태그들 선택
   for(Element ele : e1){ //ele : table태그 한개
      Elements e2 = ele.select("tr");
         for(Element ele2 : e2) {
            String temp = ele2.html();
              System.out.println(temp);
              line += "<tr>" + temp + "</tr>";
         }
     }
   }catch(IOException e){
      e.printStackTrace();
   }
%><table><%=line %></table>
</body>
</html>