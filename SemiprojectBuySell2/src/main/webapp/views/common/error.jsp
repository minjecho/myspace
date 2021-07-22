<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shoe's Gone</title>
</head>
<body>
	<h1>오류발생 : </h1>
	<%-- jsp 내장객체중 exception 객체 사용
	   : page 지시자 태그에 isErrorPage="true" 라고 지정했을 때만
	   이 페이지에서 사용할 수 있음. jsp 페이지에서 발생한 에러(예외)를
	   자동으로 받는 객체임 --%>
	<%-- jsp 파일 안에서 일반 소스 로직을 작성하려면 스크립트릿 태그를
	사용하면 됨 --%>  
	<% if(exception != null){  //jsp 페이지에서 발생한 에러일 때 %>
		<h3>jsp 페이지 오류 : <%= exception.getMessage() %></h3>	
	<% }else{ %> 
		<h3>servlet 메세지 : <%= request.getAttribute("message") %></h3>
	<% } %>
	<a href="/Shoesgone/index.html">시작페이지 가기</a>
</body>
</html>