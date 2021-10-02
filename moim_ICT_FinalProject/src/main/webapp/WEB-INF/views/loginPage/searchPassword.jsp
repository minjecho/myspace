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
            <li aria-current="page" class="breadcrumb-item active">비밀번호 찾기</li>
          </ol>
        </nav>
        <h1 class="hero-heading">SEARCH PASSWORD</h1>
        <div class="row">
          <div class="col-lg-7 mx-auto">
            <p class="lead text-muted mt-2">비밀번호를 잊어버리셨나요?</p>
          </div>
        </div>
      </div>
    </section>
    
    
    
    
    
    <!-- search Section-->
    <section>
      <div class="container">
        <!-- wordPress installation-->
        <header class="section header mb-5">
          <h2>비밀번호 찾기</h2>
          <p class="lead">가입시 등록한 정보를 입력해주세요.</p>
        </header>
        <div class="row"> 
          <div class="col-lg-8">   
            <div id="accordion" class="faq accordion accordion-custom pb-5">
              <!-- question-->
              <div class="card">
                <div id="headingOne" class="card-header">
                  <h4 class="mb-0 accordion-heading">
                    <button data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="d-flex align-items-center"><i class="icon-light-bulb"></i><span>핸드폰 번호 + 이메일</span></button>
                  </h4>
                </div>
                <div id="collapseOne" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                <form action="rpwPage.do" method="post">
                  <div class="card-body">가입시 등록한 휴대폰 번호와 이메일을 모두 입력해주세요.</div>
                  
                  <div class="form-group mb-4">
                <label>Id</label>
                <input type="text" name="user_id" id="user_id" placeholder="Id" class="form-control">
              </div>
              
              <div class="form-group mb-4">
                <label>Phone</label>
                <input type="text" name="phone" id="phone" placeholder="01012345678" class="form-control">
              </div>
              
                  <div class="form-group mb-4">
                <label>Email</label>
                <input type="text" name="email" id="email" placeholder="email@company.com" class="form-control">
              </div>
              
              <input type="submit" value="확인" class="btn btn-primary">
                </form>
                </div>
              </div>
              </div>
            </div>  
        </div>
      </div>
    </section>
    
    <!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
    <!-- JavaScript files-->
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/lightbox2/js/lightbox.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/front.js"></script>
  </body>
</html>