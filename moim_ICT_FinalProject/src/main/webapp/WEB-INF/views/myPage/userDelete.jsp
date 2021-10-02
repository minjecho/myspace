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
        
    <script>
      function chk(deleteCheck) {
    	  //체크박스 체크여부 확인
    	  var chk1=document.deleteCheck.customCheck1.checked;
    	  var chk2=document.deleteCheck.customCheck2.checked;
    	  var chk3=document.deleteCheck.customCheck3.checked;
    	  
    	  if(!chk1){
    		  alert("모두 동의해 주세요.");
    		  return false;
    	  }
    	  if(!chk2){
    		  alert("모두 동의해 주세요.");
    		  return false;
    	  }
    	  if(!chk3){
    		  alert("모두 동의해 주세요.");
    		  return false; 
    	  } else {
    		  alert("회원 탈퇴가 완료되었습니다.")
    		  return true;
    	  }
      }
    </script>
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
          
          
          
          <!-- Delete -->
          <div class="col-lg-8">   
          
          <blockquote class="blockquote mb-5 text-left">
          <form name="deleteCheck" action="udelete.do" onSubmit="return chk(this)" class="login-form text-left" method="post">
         <!--  MoiM을 탈퇴하려는 이유를 알려주세요
          
          <textarea name="message" placeholder="필수 사항이 아닙니다" class="form-control"></textarea>
          <br>
          <br>
           -->
          <div class="col-sm-11">
            <div class="custom-control custom-checkbox">
          	  <input id="customCheck1" name="customCheck1" type="checkbox" class="custom-control-input">
          		<label for="customCheck1" class="custom-control-label">탈퇴 완료 후에는 모든 데이터가 삭제되어 조회 등이 불가능합니다.</label>
            </div>
          </div>
          <div class="col-sm-11">
            <div class="custom-control custom-checkbox">
          	  <input id="customCheck2" name="customCheck2" type="checkbox" class="custom-control-input">
          		<label for="customCheck2" class="custom-control-label">삭제된 정보는 복구가 불가능하니 신중히 진행해주시기 바랍니다.</label>
            </div>
          </div>
          <div class="col-sm-11">
            <div class="custom-control custom-checkbox">
          	  <input id="customCheck3" name="customCheck3" type="checkbox" class="custom-control-input">
          		<label for="customCheck3" class="custom-control-label">주의 사항을 모두 확인하였습니다.</label>
            </div>
          </div>
          <br><Br>
          	정말 탈퇴하시겠습니까?
          <br><br>
          	<input type="hidden" name="user_no" value="${ loginMember.user_no }">
          	<input type="submit" class="btn btn-lg btn-danger" value="탈퇴하기">
          </form>
          </blockquote>
           
           
            
            
            
            
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