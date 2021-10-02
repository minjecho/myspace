<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>MoiM</title>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/resources/team_page/images/favicon.ico" type="image/x-icon" />
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
          <p class="lead">${loginMember.user_name}님 환영합니다</p>
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
          
        <c:forTokens items="${sessionScope.loginMember.interest}" delims="," var="it">
	       	<c:if test="${it eq 'english'}">
	            <c:set var="checked0" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'chinese'}">
	            <c:set var="checked1" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'etclanguage'}">
	            <c:set var="checked2" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'programming'}">
	            <c:set var="checked3" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'literature'}">
	            <c:set var="checked4" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'photography'}">
	            <c:set var="checked5" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'music'}">
	            <c:set var="checked6" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'qualification'}">
	            <c:set var="checked7" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'competition'}">
	            <c:set var="checked8" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'publicofficer'}">
	            <c:set var="checked9" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'etc'}">
	            <c:set var="checked10" value="checked" />
	        </c:if>
	        <c:if test="${it eq 'free'}">
	            <c:set var="checked11" value="checked" />
	        </c:if>
        </c:forTokens>
          <!-- Update -->
          <div class="col-lg-8">   
          <form method="post" action="updateUserinfo.do" class="contact-form text-left" onsubmit="return validate();">
          <input type="hidden" value="${sessionScope.loginMember.user_no}" name="user_no" id="user_no">
          <blockquote class="blockquote mb-5 text-left">
          <!-- 아이디 -->
              <div class="form-group mb-4 row">
              	<div class="col-md-12">
                <label>아이디<sup class="text-primary">&#10033;</sup></label>
                </div>
                <div class="col-md-10">
                <input type="text" name="user_id" id="userid" placeholder="moim" class="form-control" value="${sessionScope.loginMember.user_id}" readonly>
                </div>
              </div>
              <!-- 이름 -->
              <div class="form-group mb-4">
                <label>이름<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="user_name" class="form-control" value="${sessionScope.loginMember.user_name}" required>
              </div>
              <!-- 닉네임  -->
              <div class="form-group mb-4 row">
                <div class="col-md-12">
                <label>닉네임<sup class="text-primary">&#10033;</sup></label>
                </div>
                <div class="col-md-10">
                <input type="text" id="newusernn" name="user_nn" placeholder="닉네임" class="form-control" value="${sessionScope.loginMember.user_nn}">
                </div>
                <div class="col-md-2">
                <input type="button" class="tag=link" value="중복체크" onclick="return dupNnCheck();">
                </div>
              </div>
              <!-- 비밀번호 -->
              <div class="form-group mb-4">
                <label>비밀번호<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="newuser_pwd" id="newuser_pwd" placeholder="비밀번호" class="form-control">
              </div>
              <div class="form-group mb-4">
                <label>비밀번호 확인<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="newuser_pwd2" id="newuser_pwd2" placeholder="비밀번호 확인" class="form-control">
              </div>
              <!-- 이메일 -->
              <div class="form-group mb-4">
                <label>이메일<sup class="text-primary">&#10033;</sup></label>
                <input type="email" name="email" placeholder="email@company.com" class="form-control" value="${sessionScope.loginMember.email}">
              </div>
              <div class="form-group mb-4">
                <label>핸드폰 번호<sup class="text-primary">&#10033;</sup></label>
                <input type="text" name="phone" placeholder="01012345678" class="form-control" value="${sessionScope.loginMember.phone}">
              </div>
              <div class="form-group mb-4">
                <label>주소</label>
                <input type="text" name="address" placeholder="주소" class="form-control" value="${sessionScope.loginMember.address}">
              </div>
              <div class="form-group mb-4">
                <label>나이</label>
                <input type="number" name="age" placeholder="1" class="form-control" value="${sessionScope.loginMember.age}">
              </div>
              <div class="form-group mb-4">
                <label>성별</label><br>
                <c:if test="${loginMember.gender eq 'M'}">
	                남자&nbsp;<input type="radio" name="gender" value="M" checked>
	                여자&nbsp;<input type="radio" name="gender" value="F">
	                미입력&nbsp;<input type="radio" name="gender" value="U">
                </c:if>
                <c:if test="${loginMember.gender eq 'F'}">
	                남자&nbsp;<input type="radio" name="gender" value="M">
	                여자&nbsp;<input type="radio" name="gender" value="F" checked>
	                미입력&nbsp;<input type="radio" name="gender" value="U">
                </c:if>
                <c:if test="${loginMember.gender eq 'U'}">
	                남자&nbsp;<input type="radio" name="gender" value="M">
	                여자&nbsp;<input type="radio" name="gender" value="F">
	                미입력&nbsp;<input type="radio" name="gender" value="U" checked>
                </c:if>
              </div>
              <div class="form-group mb-4">
                <label>Interest</label><br>
                <text fontsize="1">*중복체크 가능</text>
					<table width="600">
						<tr>
							<td><input type="checkbox" name="interest" value="english" ${checked0}>영어</td>
							<td><input type="checkbox" name="interest" value="chinese" ${checked1}>중국어</td>
							<td><input type="checkbox" name="interest" value="etclanguage" ${checked2}>기타 언어</td>
							<td><input type="checkbox" name="interest" value="programming" ${checked3}>프로그래밍</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="interest" value="literature" ${checked4}>인문학/책</td>
							<td><input type="checkbox" name="interest" value="photography" ${checked5}>사진/영상</td>
							<td><input type="checkbox" name="interest" value="music" ${checked6}>음악/악기</td>
							<td><input type="checkbox" name="interest" value="qualification" ${checked7}>자격증</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="interest" value="competition" ${checked8}>공모전</td>
							<td><input type="checkbox" name="interest" value="publicofficer" ${checked9}>고시/공무원</td>
							<td><input type="checkbox" name="interest" value="etc" ${checked10}>기타학문</td>
							<td><input type="checkbox" name="interest" value="free" ${checked11}>자유주제</td>
						</tr>
					</table>
			  </div>
          </blockquote>
            <div class="form-group">
                <input type="submit" value="수정완료" class="btn btn-primary">
            </div>  
          </form>
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
    <!-- <script>
    function dupNnCheck(){
    	var usernn = $('#newusernn').val();
    	console.log(usernn);
		$.ajax({
			url: "nnchk.do",
			type: "post",
			data: {user_nn: usernn},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("사용 가능한 닉네임입니다.");
				}else{
					alert("이미 사용중인 닉네임입니다.\n다시 입력하세요.");
				}
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus
						+ ", " + errorthrown);
			}
		});
		
		return false;  //클릭 이벤트가 전달되어서 submit 이 동작되지 않게 함
	}
    function validate(){
		//유효성 검사 코드 작성함
		//서버 컨트롤러로 전송할 값들이 요구한 조건을 모두 만족하였는지 검사함

		//암호와 암호 확인이 일치하지 않는지 확인함
		var pwdValue = $('#newuser_pwd').val();
		var pwdValue2 = $('#newuser_pwd2').val();
		console.log(pwdValue);
		console.log(pwdValue2);
		if(pwdValue !== pwdValue2){
			alert("암호와 암호 확인의 값이 일치하지 않습니다.");
			document.getElementById("newuser_pwd").select();
			return false;  //전송 취소함
		}

		return true;  //전송함
	}
    </script> -->
  </body>
</html>