<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM</title>
</head>
<body>
<!-- jstl 의 절대경로 표기 : / == /context-root명 -->
<c:import url="/WEB-INF/views/common/excmenubar.jsp" />
<hr>
<h1>에러 페이지</h1>
<c:set var="e" value="<%= exception %>" />
<c:if test="${ !empty e }">
<h3>jsp 페이지 오류 발생 : ${ message }</h3>
</c:if>
<c:if test="${ empty e }">
<h3>Servlet 메세지 : ${ message }</h3>
</c:if>
<br>
<c:url var="movemain" value="/main.do" />
<a href="${ movemain }">시작페이지로 이동</a>

<hr>
<!-- 상대경로는 기존의 표기방식 그대로 사용하면 됨 -->
<c:import url="footer.jsp" />

</body>
</html>