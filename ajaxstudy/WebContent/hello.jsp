<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	ajax을 통한 파라미터는 utf-8로 인코딩되어 요청됨.
     --%>
<% request.setCharacterEncoding("UTF-8"); %>
<h3>안녕하세요 <font color="blue">${param.name}</font>입니다.</h3>