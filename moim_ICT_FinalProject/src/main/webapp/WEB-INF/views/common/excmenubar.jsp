<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- CSS -->
<!-- Template의 모든 페이지의 공통 CSS는 이곳에 작성해주시길 바랍니다. -->
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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.sea.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.png">
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

</head>
<body>
	<!-- 상단 메뉴바 -->
	<header class="header">
      <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
			<a href="./" class="navbar-brand">
				<img src="${ pageContext.servletContext.contextPath }/resources/img/MoimIcon.png" alt="" class="img-fluid">
	        </a>
          	<button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          	aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" 
          	class="navbar-toggler navbar-toggler-right">Menu<i class="fa fa-bars ml-2"></i></button>
          	<div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
				<li class="nav-item"> <a href="main.do" class="nav-link active">Home</a></li>
				<li class="nav-item"> <a href="${ pageContext.servletContext.contextPath }/nlist.do?page=1" class="nav-link">공지사항</a></li>
				<li class="nav-item"> <a href="${ pageContext.servletContext.contextPath }/rclist.do" class="nav-link">구인게시판</a></li>
				<li class="nav-item"> <a href="${ pageContext.servletContext.contextPath }/blist.do?page=1" class="nav-link">게시판</a></li>
				<li class="nav-item"> <a href="${ pageContext.servletContext.contextPath }/rvlist.do" class="nav-link">리뷰게시판</a></li>
				<!-- 관리자 페이지 드롭박스 -->
				<c:if test="${ loginMember.admin == 'Y' }">
					<li class="nav-item dropdown">
						<a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dropdown</a>
		                <div class="dropdown-menu">
			                <a href="${ pageContext.servletContext.contextPath }/ulistadmin.do" class="dropdown-item">회원관리</a>
			                <a href="${ pageContext.servletContext.contextPath }/blistadmin.do" class="dropdown-item">게시판관리</a>
			                <a href="${ pageContext.servletContext.contextPath }/teamlistadmin.do" class="dropdown-item">모임관리</a>
		                </div>
					</li>
				</c:if>
            </ul>
            <!-- 비 로그인 시 : 로그인 창 띄우기 -->
            <c:if test="${ empty loginMember }">
            	<a href="#" data-toggle="modal" data-target="#login" class="btn btn-primary navbar-btn ml-0 ml-lg-3">Login </a>
            </c:if>
          	<!-- 로그인 시 : 로그아웃 하기-->
          	<c:if test="${ !empty loginMember }">
          		<a href="mypage.do">${ loginMember.user_name }님</a>
          		<a href="#" onClick = "javascript:location.href='logout.do';" data-toggle="modal" data-target="#login" class="btn btn-primary navbar-btn ml-0 ml-lg-3">Logout </a>
          	</c:if>
          </div>
        </div>
      </nav>
    </header>
	
	<!-- 로그인 레이어 -->
	<div id="login" tabindex="-1" role="dialog" aria-hidden="true" class="modal fade bd-example-modal-lg">
		<div role="document" class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" data-dismiss="modal" aria-label="Close" class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body p-4 p-lg-5">
					<form action="login.do" class="login-form text-left" method="post">
						<input type="hidden" name="currentUrl" id="currentUrl" value="${requestScope['javax.servlet.forward.servlet_path']}">
						<div class="form-group mb-4">
							<label>Id</label>
							<input type="text" name="user_id" id="user_id" placeholder="id" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>Password</label>
							<input type="password" name="user_pwd" id="user_pwd" placeholder="Password" class="form-control">
						</div>
						
						<table class="form-group">
							<th width="22%">
								<input type="submit" value="Login" class="btn btn-primary">
							</th>
							<th width="48%">
								<a href="enrollPage.do" class="btn btn-primary">Join</a>
							</th>
							<th width="30%">
								<a href="sid.do">아이디 조회</a>
								/
								<a href="spw.do">비밀번호 조회</a>
							</th>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Javascript -->
<!-- Template의 모든 공통 JS는 이곳에 작성해주시길 바랍니다. -->
<%-- <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script> --%>
<script src="${ pageContext.servletContext.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="${ pageContext.servletContext.contextPath }/resources/vendor/lightbox2/js/lightbox.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/front.js"></script>

<script>
$(document).ready(function() {
	var errorMessage = '${ param.message }';
	if(errorMessage == '' || errorMessage == null) {
		///
	} else {
		alert('${ param.message }');
	}
});
</script>

</html>










