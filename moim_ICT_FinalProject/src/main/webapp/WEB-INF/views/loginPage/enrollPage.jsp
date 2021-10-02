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
  <script>
	function validate(){
		//유효성 검사 코드 작성함
		//서버 컨트롤러로 전송할 값들이 요구한 조건을 모두 만족하였는지 검사함

		//암호와 암호 확인이 일치하지 않는지 확인함
		var pwdValue1 = document.getElementById("user_pwd").value;
		var pwdValue2 = document.getElementById("user_pwd2").value;

		if(pwdValue1 !== pwdValue2){
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("user_pwd").select();
			return false;  //전송 취소함
		}

		return true;  //전송함
	}
	
	//아이디 중복 체크 확인
	function dupIdCheck(){
		$.ajax({
			url: "idchk.do",
			type: "POST",
			data: {user_id: $("#user_id").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("사용 가능한 아이디입니다.");
					$("#user_id").focus();
				}else{
					alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
					$("#user_id").select();
				}
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus
						+ ", " + errorthrown);
			}
		});
		
		return false;  //클릭 이벤트가 전달되어서 submit 이 동작되지 않게 함
	}
	//닉네임 중복 체크 확인
	function dupNnCheck(){
		$.ajax({
			url: "nnchk.do",
			type: "POST",
			data: {user_nn: $("#user_nn").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("사용 가능한 닉네임입니다.");
					$("#user_nn").focus();
				}else{
					alert("이미 사용중인 닉네임입니다.\n다시 입력하세요.");
					$("#user_nn").select();
				}
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus
						+ ", " + errorthrown);
			}
		});
		
		return false;  //클릭 이벤트가 전달되어서 submit 이 동작되지 않게 함
	}
  </script>      
        
  </head>
  <body>
  
    <!-- Menubar -->
	<c:import url="/WEB-INF/views/common/enrollmenubar.jsp" />
	<hr>
    
    <!-- Hero Section-->
    <section class="hero">
      <div class="container text-center">
        <!-- breadcrumb-->
        <nav aria-label="breadcrumb" class="d-flex justify-content-center">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html" class="animsition-link">Home</a></li>
            <li aria-current="page" class="breadcrumb-item active">회원가입 </li>
          </ol>
        </nav>
        <h1 class="hero-heading">Join MoiM</h1>
        <div class="row">
          <div class="col-lg-7 mx-auto">
            <p class="lead text-muted mt-2">MoiM의 회원이 되시는걸 환영합니다!</p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 회원가입-->
    <section>
      <div class="container">
        <header class="section-header">
          <h2 class="mb-2">회원가입</h2>
          <p class="lead">회원가입을 위한 정보를 입력해주세요. (* 표시는 필수입력 항목입니다.)</p>
        </header>
        <div class="row align-items-center mt-5">
          <div class="col-lg-7">
            <form method="post" action="enroll.do" class="contact-form text-left" id="contactForm" onsubmit="return validate();">
              <!-- 아이디 -->
              <div class="form-group mb-4 row">
              	<div class="col-md-12">
                <label>Id<sup class="text-primary">&#10033;</sup></label>
                </div>
                <div class="col-md-10">
                <input type="text" name="user_id" id="user_id" placeholder="아이디" class="form-control">
                </div>
                <div class="col-md-2">
                <input type="button" class="tag=link" value="중복체크" onclick="return dupIdCheck();">
                </div>
              </div>
              <!-- 이름 -->
              <div class="form-group mb-4">
                <label>Name<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="user_name" id="user_name" placeholder="홍길동" class="form-control">
              </div>
              <!-- 닉네임  -->
              <div class="form-group mb-4 row">
                <div class="col-md-12">
                <label>Nickname<sup class="text-primary">&#10033;</sup></label>
                </div>
                <div class="col-md-10">
                <input type="text" name="user_nn" id="user_nn" placeholder="닉네임" class="form-control">
                </div>
                <div class="col-md-2">
                <input type="button" class="tag=link" value="중복체크" onclick="return dupNnCheck();">
                </div>
              </div>
              <!-- 비밀번호 -->
              <div class="form-group mb-4">
                <label>Password<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="user_pwd" id="user_pwd" placeholder="비밀번호" class="form-control">
              </div>
              <div class="form-group mb-4">
                <label>Password confirm<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="user_pwd2" id="user_pwd2" placeholder="비밀번호 확인" class="form-control">
              </div>
              <!-- 나이 -->
              <div class="form-group mb-4">
                <label>Age</label>
                <input type="text" name="age" id="age" placeholder="나이" class="form-control">
              </div>
              <!-- 성별 -->
              <div class="form-group mb-4">
                <label>Gender</label>
                <Br>
                <input type="radio" name="gender" id="gender" value="M" checked> 남자 &nbsp; 
	    		<input type="radio" name="gender" id="gender" value="F"> 여자</td>
              </div>
              <!-- 이메일 -->
              <div class="form-group mb-4">
                <label>Email<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="email" id="email" placeholder="email@company.com" class="form-control">
              </div>
              <div class="form-group mb-4">
                <label>Phone<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="phone" id="phone" placeholder="01012345678" class="form-control">
              </div>
              <div class="form-group mb-4">
                <label>Address</label>
                <input type="text" name="address" id="address" placeholder="주소" class="form-control">
              </div>
              <div class="form-group mb-4">
                <label>Interest</label><br>
                <text fontsize="1">*중복체크 가능</text>
					<table width="600">
						<tr>
							<td><input type="checkbox" name="interest" id="interest" value="english">
										영어</td>
							<td><input type="checkbox" name="interest" id="interest" value="Chinese">
										중국어</td>
							<td><input type="checkbox" name="interest" id="interest" value="language">
										기타 언어</td>
							<td><input type="checkbox" name="interest" id="interest" value="programming">
										프로그래밍</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="interest" id="interest" value="humanities">
										인문학/책</td>
							<td><input type="checkbox" name="interest" id="interest" value="picture">
										사진/영상</td>
							<td><input type="checkbox" name="interest" id="interest" value="music">
										음악/악기</td>
							<td><input type="checkbox" name="interest" id="interest" value="license">
										자격증</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="interest" id="interest" value="exhibit">
										공모전</td>
							<td><input type="checkbox" name="interest" id="interest" value=" examination">
										고시/공무원</td>
							<td><input type="checkbox" name="interest" id="interest" value="study">
										기타학문</td>
							<td><input type="checkbox" name="interest" id="interest" value="etc"
										checked> 자유주제</td>
						</tr>
					</table>
			  </div>
              <div class="form-group">
                <input onClick = "alert('회원가입에 성공하였습니다. 로그인 해주세요')" type="submit" value="Sign Up" class="btn btn-primary">
                <input type="reset" value="return" class="btn btn-primary">
              </div>
            </form>
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