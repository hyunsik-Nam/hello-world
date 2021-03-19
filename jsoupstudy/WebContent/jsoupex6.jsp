<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSON 데이터 가져오기</title>
</head>
<body>
<%
	String url = "http://fx.kebhana.com/FER1101M.web";
	String line = "";
	String title = "";
	try{
		String kebhana = Jsoup.connect(url).get().text();
		System.out.println(kebhana);
		String strJson = kebhana.substring(kebhana.indexOf("{"));
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
			JSONArray array = (JSONArray)json.get("리스트");
			String html ="<table><caption>" + json.get("날짜").toString() + "현재 환율</caption>";
			html +="<tr><th>통화명</th><th>매매기준율</th><th>현찰파실때</th>"
					+"<th>현찰사실때</th><th>전신환보내실때</th><th>전신환받으실때</th></tr>";
					
			for(int i =0;i<array.size();i++){
				JSONObject obj = (JSONObject)array.get(i);
				String str = obj.get("통화명").toString();
				html += "<tr><td>" + obj.get("통화명").toString() +"</td>";
				html += "<td>" + obj.get("매매기준율").toString() + "</td>";
				html += "<td>" + obj.get("현찰파실때").toString() + "</td>";
				html += "<td>" + obj.get("현찰사실때").toString() + "</td>";
				html += "<td>" + obj.get("송금_전신환보내실때").toString() + "</td>";
				html += "<td>" + obj.get("송금_전신환받으실때").toString() + "</td></tr>";
			}
			out.print(html +"</table>");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>