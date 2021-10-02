<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>moim</title>


<style type="text/css">
</style>
<script type="text/javascript">
const result = "${msg}"
if( result === "success"){
	alert('지원 완료.');
}


</script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function searchJoin(){
	var checkJoin;
	var checkTeam;
	
	

	$.ajax({
		url : 'searchjoin.do?team_num='+${recruit.team_num}+'&user_no='+${loginMember.user_no},
		type : 'get',
		dataType : 'json',
		success : function(data) {
			
			checkJoin = data["checkJoin"]
			checkTeam = data["checkTeam"]
			console.log(checkJoin, checkTeam);
			
			if(checkJoin > 0){
				alert('이미 지원이 완료되었습니다.');
				return false;
			}else if( checkTeam> 0){
				alert('이미 가입된 팀입니다.');
				return false;
			}else{
				$('#modalBox').modal('show');
			}
	
			
		}, //for in
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});

	
	

}

function content(){
	
    var content = $("#content1").val();
    if (content.length > 1000){
        $("#content1").val(content.substring(0, 1000));
        
       
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
	<section style="margin-top: -21.5rem">
	
		<div class="container">
			<div class="row">
			
				<div class="col-md-8">
					<strong><h1>${ recruit.team_name }</h1></strong>
					<c:if test="${ empty recruit.team_rename_image }">
						<img class="card-img-top w-100"
							src="${ pageContext.servletContext.contextPath }/resources/img/pic.jpg"
							alt="courses" width="700" height="450">
					</c:if>
					<c:if test="${ !empty recruit.team_rename_image }">
						<img class="card-img-top w-100"
							src="${ pageContext.servletContext.contextPath }/resources/recruit_files/${ recruit.team_rename_image }"
							alt="courses" width="700" height="450">
					</c:if>
					
					<h1 class="my-4">스터디 소개</h1>
					<p>${ recruit.team_intro }</p>

					<h1>리더 소개</h1>
					<p>${ recruit.team_leader_intro }</p>
					<br> <br> <br> <br>

					<c:url var="rcup" value="/rcupview.do">
						<c:param name="team_num" value="${ recruit.team_num }" />
						<c:param name="page" value="${ currentPage }" />
					</c:url>
					
					<c:url var="join" value="/searchjoin.do">
						<c:param name="team_num" value="${ recruit.team_num }" />
						<c:param name="user_no" value="${ loginMember.user_no }" />
						
					</c:url>
					<center>

						<c:if test="${ !empty loginMember and loginMember.user_no ne recruit.user_no}">
						<button class="btn btn-primary" onclick="searchJoin()">지원하기</button>
						</c:if>
						<c:if test="${ !empty loginMember and loginMember.user_no eq recruit.user_no}">
						<a href="${ rcup }"><button type="button"
								class="btn btn-primary">수정하기</button></a>
						</c:if>
						<c:url var="out" value="/rclist.do"/>
						<a href="${ out }" ><button class="btn btn-default">목록</button></a>
						
					</center>
					<br> <br> <br>



				</div>
				
				<div class="col-md-4">
				<br><br><br>
					<div class="card">
					
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><strong>분야 </strong>: ${ recruit.field_name }</li>
							<li class="list-group-item"><strong>지역 </strong>: ${ recruit.team_local }</li>
							<li class="list-group-item"><strong>인원 </strong>: ${ recruit.team_limit }명</li>
							<li class="list-group-item"><strong>참가비 </strong>: ${ recruit.team_fee }원</li>
							<li class="list-group-item"><strong>시간 </strong>: ${ recruit.team_act_time }</li>
							<li class="list-group-item"><strong>레벨 </strong>: ${ recruit.team_level }</li>
							<li class="list-group-item"><strong>기간 </strong>: ${ recruit.team_act_week }주</li>
							<li class="list-group-item"><strong>요일 </strong>: ${ recruit.team_act_day }</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->
	</section>

	<!-- 모달 영역 -->
	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">스터디 지원</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body">
					<form action="joininsert.do" class="contact-form text-left"
						method="post" enctype="multipart/form-data">
						<div class="form-group mb-4">
							<input type="hidden" name="team_num"
								value="${ recruit.team_num }"> <input type="hidden"
								name="page" value="${ currentPage }"> 
								<input type="hidden" name="user_no" value=${ loginMember.user_no }>
								<h6>지원자 소개(1000자 이내)</h6>
							<textarea name="join_intro" class="form-control" id="content1" onkeyup="content()" required></textarea>
						</div>
						<div class="form-group mb-4">
							<label>첨부파일</label><br> <input type="file" name="upfile">
						</div>




						<button type="submit" class="btn btn-primary" id="submitBtn">지원하기</button>
						<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>


					</form>
				</div>
			</div>
		</div>
	</div>





	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- JavaScript files-->


	<script>
	
	
// 모달 버튼에 이벤트를 건다.

// 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){
$('#modalBox').modal('hide');
});


</script>

</body>
</html>