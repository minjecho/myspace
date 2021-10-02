<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>MoiM</title>
    <link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,600">
    <!-- Lightbox-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/vendor/lightbox2/css/lightbox.css">
    <!-- Custom font icons-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/fontastic.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
  
    <!-- Menubar -->
	<c:import url="/WEB-INF/views/common/excmenubar.jsp" />
	<hr>
    
    <!-- Hero Section-->
    <section class="hero">
      <div class="container text-center">
        <!-- breadcrumb-->
        <nav aria-label="breadcrumb" class="d-flex justify-content-center">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html" class="animsition-link">Home</a></li>
            <li aria-current="page" class="breadcrumb-item active">아이디  찾기</li>
          </ol>
        </nav>
        <h1 class="hero-heading">아이디 찾기</h1>
        <div class="row">
          <div class="col-lg-7 mx-auto">
            <p class="lead text-muted mt-2">가입 결과를 알려드리겠습니다</p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 아이디 찾기 결과 -->
    <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
          
          	<!-- 일치하지 않을 때  -->
            <c:if test="${check == 1 }">
            	<h2 class="mb-3">아이디 검색 결과</h2>
            	<ol class="mb-5 text-left">
            	</ol>
            	<blockquote class="blockquote mb-5 text-left">
            	입력하신 정보로 가입 된 아이디가 없습니다
            	</blockquote>
            	<a href="sid.do" type="button" class="btn btn-primary">Return</a>
            	<a href="enrollPage.do" type="button" class="btn btn-primary">Join</a>
            	<br><br>
            </c:if>
            
            <!-- 결과가 있을 시 -->
            <c:if test="${check == 0 }">
            	<h2 class="mb-3">아이디 검색 결과</h2>
            	<ol class="mb-5 text-left">
            	</ol>
            	<blockquote class="blockquote mb-5 text-left">
            	아이디 찾기에 성공하였습니다
            	<br><br>
            	회원님의 아이디는 &nbsp; ${ result.user_id } &nbsp; 입니다.
            	</blockquote>
            	<a href="spw.do" type="button" class="btn btn-primary">Search Password</a>
            	<a data-toggle="modal" data-target="#login" type="button" class="btn btn-primary">Login</a>
            	<br><br>
            </c:if>
          </div>
        </div>
      </div>
      

    <!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/lightbox2/js/lightbox.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>