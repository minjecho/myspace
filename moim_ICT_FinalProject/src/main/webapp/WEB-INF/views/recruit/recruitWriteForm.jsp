<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>moim</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var gdata;
function search(){
	
//팀명 유효성 검사(1 = 중복 / 0 != 중복)
$("#team_name").blur(function() {
	
	var team_name = $('#team_name').val();
	$.ajax({
		url : 'searchtname.do?team_name='+ team_name,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			gdata = data;
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#name_check").text("사용중인 팀명입니다. 다시 입력해주세요");
					$("#team_name").val("");
					
				}else if(data == 0){
					$("#name_check").text("");
					
				}
				
			}, error : function() {
					console.log("실패");
			}
		});
	});
}

function content(){
	
    var content = $("#content1").val();
    if (content.length > 1000){
        $("#content1").val(content.substring(0, 1000));
        $("#length_check").text("최대 1000자까지 입력 가능합니다.");
       
    }else {
    	$("#length_check").text("");
	
    }
}

function content_leader(){
	
    var leader = $("#leader").val();

    if (leader.length > 1000){
        $("#leader").val(leader.substring(0, 1000));
        $("#length_check_leader").text("최대 1000자까지 입력 가능합니다.");
        $("#submitform").attr("disabled", true);
    }else {
    	$("#length_check_leader").text("");
		$("#submitform").attr("disabled", false);
    }
}

function fileCheck(){
	
    var fm = document.form1;
	var fname = document.getElementById("fileNm").value; //파일의 풀 경로를 fname에 변수에 저장
	var fext = fname.substr(fname.length-3).toLowerCase();//파일의 풀 경로에서 끝에서 3번째까지의 글자를 잘라 소문자로 변경
	
	

	if(fext == 'jpg' || fext == 'png' || fext==''){
		
		return true;
	}else{
		alert('jpg,png파일만 업로드 가능합니다.')
		return false;
	}
	
	
	
	
	
}


</script>
</head>
<body>
	<!-- navbar-->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
    
    
    
    
   
<!-- FAQ Section-->
<br>
<br>
<section>
	<div class="container" align="center">
		<header class="section-header">
			<h2 class="mb-2">팀 정보 입력</h2>

		</header>
		<div>
			<div class="col-lg-7">
				<form action="rcinsert.do" class="contact-form text-left" method="post" enctype="multipart/form-data" name="form1">
					<div class="form-group mb-4">
						<label>스터디명<sup class="text-primary">✱수정불가</sup></label> <input id="team_name" onkeyup="search()"
							type="text" name="team_name" class="form-control" required>
					<div class="check_font" id="name_check">
					</div>
					</div>

					<div class="form-group mb-4">
						<label>메인사진(jpg,png)<sup class="text-primary">500*250/700*450권장(업로드 하지 않을 시 기본사진으로 올라갑니다.)</sup></label><br> <input
							type="file" name="upfile" id="fileNm">
							<div class="check_font" id="file_check">
					</div>
					</div>
					<div class="form-group mb-4">
						<label>레벨<sup class="text-primary">✱</sup></label> <select
							name="team_level" class="select form-control" style="padding: 0;" required>
							<option value="초급" style="font-size: 10;">초급</option>
							<option value="중급">중급</option>
							<option value="고급">고급</option>
						</select>
					</div>
					<div class="form-group mb-4">
						<label>지역<sup class="text-primary">✱</sup></label> <select
							name="team_local" class="select form-control" style="padding: 0;" required>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="강원">강원</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="제주">제주</option>
							<option value="지역무관">지역무관</option>
						</select>
					</div>
					<div class="form-group mb-4">
						<label>분야<sup class="text-primary">✱</sup></label> <select
							name="field_num" class="select form-control" style="padding: 0;" required>

							<option value="1">영어</option>
							<option value="2">중국어</option>
							<option value="3">기타 언어</option>
							<option value="4">프로그래밍</option>
							<option value="5">인문학/책</option>
							<option value="6">사진/영상</option>
							<option value="7">음악/악기</option>
							<option value="8">자격증</option>
							<option value="9">공모전</option>
							<option value="10">고시/공무원</option>
							<option value="11">기타학문</option>
							<option value="12">자유주제</option>
						</select>
					</div>
					<div class="form-group mb-4">
						<label>요일<sup class="text-primary">✱</sup></label> <select
							name="team_act_day" class="select form-control" style="padding: 0;" required>
							<option value="월">월</option>
							<option value="화">화</option>
							<option value="수">수</option>
							<option value="목">목</option>
							<option value="금">금</option>
							<option value="토">토</option>
							<option value="일">일</option>
							<option value="무관">무관</option>
						</select>
					</div>
					<div class="form-group mb-4">
						<label>인원<sup class="text-primary">✱</sup></label> <input
							type="number" name="team_limit" value="2" min="0"
							class="numberinput form-control" required>
					</div>
					<div class="form-group mb-4">
						<label>시간<sup class="text-primary">✱</sup></label> <input
							type="text" name="team_act_time" placeholder="ex) 14:00~16:00"
							class="form-control" required>
					</div>
					<div class="form-group mb-4">
						<label>기간(주)<sup class="text-primary">✱</sup></label> <input
							type="number" name="team_act_week" value="4" min="0"
							class="numberinput form-control" required>
					</div>
					<div class="form-group mb-4">
						<label>참여비<sup class="text-primary">✱숫자만입력</sup></label> <input
							type="text" name="team_fee" placeholder="ex) 10,000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							class="form-control" required>
					</div>


					<div class="container" align="center">
						<header class="section-header">
							<h2 class="mb-2">구인 정보 입력</h2>

						</header>
					</div>

					<div class="form-group mb-4">
						<label>스터디 소개(1000자이내)<sup class="text-primary">✱</sup></label>
						<textarea name="team_intro" class="form-control" id="content1" onkeyup="content()" required></textarea>
					<div class="check_font" id="length_check">
					</div>
					</div>
					<div class="form-group mb-4">
						<label>리더 소개(1000자이내)<sup class="text-primary">✱</sup></label>
						<textarea name="team_leader_intro" class="form-control" id="leader" onkeyup="content_leader()" required></textarea>
					<div class="check_font" id="length_check_leader">
					</div>
					</div>

					<div class="form-group" align="center">
						<a href=""> <input type="submit" id="submitform" onclick="return fileCheck()"
							value="개설하기" class="btn btn-primary"></a>
					</div>
					
					<input type="hidden" name="user_no" value="${ loginMember.user_no }">
						
				</form>


			</div>

		</div>
	</div>
</section>

<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	

</body>
</html>