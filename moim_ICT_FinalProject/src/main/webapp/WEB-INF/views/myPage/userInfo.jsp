<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,600">
    <!-- Lightbox-->
    <link rel="stylesheet" href="vendor/lightbox2/css/lightbox.css">
    <!-- Custom font icons-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
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
    
    <!-- My Page index -->
    <section>
      <div class="container">
        <!-- wordPress installation-->
        <header class="section header mb-5">
          <h2>MY Page</h2>
          <p class="lead">${ loginMember.user_name }님 환영합니다</p>
        </header>
        <div class="row"> 
          <!-- index-->
          <aside class="sidebar col-lg-2.3 mt-5 mt-lg-0">
            <div class="sidebar-widget mb-4">
              <h4 class="sidebar-widget-heading">My Page</h4>
              <ul class="list-unstyled pl-0 mt-4">
                <li> <a href="mypage.do" class="categories-link">My Info</a></li>
                <li><a href="upost.do" class="categories-link">My Post</a></li>
                <li><a href="uteam.do" class="categories-link">My Team</a></li>
              </ul>
            </div>
          </aside>
          
          
          
          <!-- main -->
          <div class="col-lg-8">   
            <blockquote class="blockquote mb-5 text-left">
            	<h3>내 정보 보기</h3><br><br>
            	<div class="form-group mb-4">
				<label>아이디 : </label>
				<br>
				${ loginMember.user_id }
				<br><br>
				<label>이름 : </label>
				<br>
				${ loginMember.user_name }
				<br><br>
				<label>닉네임 : </label>
				<br>
				${ loginMember.user_nn }
				<br><br>
				<label>이메일 : </label>
				<br>
				${ loginMember.email }
				<br><br>
				<label>핸드폰번호 : </label>
				<br>
				${ loginMember.phone }
				<br><br>
				<label>나이 : </label>
				<br>
				${ loginMember.age }
				<br><br>
				<label>성별 : </label>
				<br>
				${ loginMember.gender }
				<br><br>
				<label>주소 : </label>
				<br>
				${ loginMember.address }
				<br><br>
				<label>관심분야 : </label>
				<br>
				<c:set var="string0" value="${ sessionScope.loginMember.interest }"/>
				<c:set var="string1" value="${ fn:replace(string0, 'english', '영어') }"/>
				<c:set var="string2" value="${ fn:replace(string1, 'chinese', '중국어') }"/>
				<c:set var="string3" value="${ fn:replace(string2, 'etclanguage', '기타 언어') }"/>
				<c:set var="string4" value="${ fn:replace(string3, 'programming', '프로그래밍') }"/>
				<c:set var="string5" value="${ fn:replace(string4, 'literature', '인문학/책') }"/>
				<c:set var="string6" value="${ fn:replace(string5, 'photography', '사진/영상') }"/>
				<c:set var="string7" value="${ fn:replace(string6, 'music', '음악/악기') }"/>
				<c:set var="string8" value="${ fn:replace(string7, 'qualification', '자격증') }"/>
				<c:set var="string9" value="${ fn:replace(string8, 'competition', '공모전') }"/>
				<c:set var="string10" value="${ fn:replace(string9, 'publicofficer', '고시/공무원') }"/>
				<c:set var="string11" value="${ fn:replace(string10, 'etc', '기타학문') }"/>
				<c:set var="string12" value="${ fn:replace(string11, 'free', '자유주제') }"/>
				<c:out value="${ string12 }"/>
			</div>
            	
            </blockquote>
            
            <div class="form-group">
                <a href="uupdate.do" class="btn btn-primary">수정하기</a>
                <a href="udeletePage.do" class="btn btn-primary">탈퇴하기</a>
            </div>
            
            
          </div>
        </div>
      </div>
    </section>
      
    
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