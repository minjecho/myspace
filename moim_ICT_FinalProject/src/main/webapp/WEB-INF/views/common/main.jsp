<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moim</title>
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
    <!-- 모임 만들기-->
    <!-- TODO  -->
	<section>
		<div class="container">
			<div class="text-center">
				<h2>원하는 모임 만들기 </h2>
				<p class="lead text-muted mt-2">찾고있는 팀이 없다면<br> 만들어보세요!</p>
				<!-- 비로그인시 : 회원만 이용할 수 있다는 관련 팝업을 띄우고 OK 클릭 시 로그인 페이지로 이동-->
				<c:if test="${ empty loginMember }">
					<a onClick = "alert('로그인 한 회원만 이용할 수 있습니다')" data-toggle="modal" data-target="#login"  class="btn btn-primary">Create MoiM</a>
				</c:if>
				<!-- 로그인 시 : 모임 만드는 페이지로 이동-->
				<c:if test="${ !empty loginMember }">
					<c:url var="rinsert" value="/rcwrite.do" />
										
					<a href="${ rinsert }" class="btn btn-primary">Create MoiM</a>
				</c:if>
			</div>
			<div class="row">
				<div class="col-lg-7 mx-auto mt-5">
					<img src="${ pageContext.servletContext.contextPath }/resources/img/illustration-1.svg" alt="..." class="intro-image img-fluid">
				</div>
			</div>
		</div>
	</section>
    
    <!-- 지역별 검색-->
	<section>
		<div class="container">
			<div class="text-center">
				<h2>지역별 MoiM 찾기</h2>
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<p class="lead text-muted mt-2">오프라인 모임을 선호하신다면, 가까운 지역의 MoiM들을 찾아보세요.</p>
					</div>
				</div>
			</div>
			<div class="integrations mt-5">
				<div class="row">
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=서울';">
							<h3 class="h4">서울</h3>
							<p class="text-small font-weight-light">${ local[0] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=인천';">
							<h3 class="h4">인천</h3>
							<p class="text-small font-weight-light">${ local[1] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=대전';">
							<h3 class="h4">대전</h3>
							<p class="text-small font-weight-light">${ local[2] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=대구';">
							<h3 class="h4">대구</h3>
							<p class="text-small font-weight-light">${ local[3] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=광주';">
							<h3 class="h4">광주</h3>
							<p class="text-small font-weight-light">${ local[4] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=울산';">
							<h3 class="h4">울산</h3>
							<p class="text-small font-weight-light">${ local[5] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=부산';">
							<h3 class="h4">부산</h3>
							<p class="text-small font-weight-light">${ local[6] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=경기';">
							<h3 class="h4">경기</h3>
							<p class="text-small font-weight-light">${ local[7] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=충북';">
							<h3 class="h4">충북</h3>
							<p class="text-small font-weight-light">${ local[8] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=충남';">
							<h3 class="h4">충남</h3>
							<p class="text-small font-weight-light">${ local[9] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=경북';">
							<h3 class="h4">경북</h3>
							<p class="text-small font-weight-light">${ local[10] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=경남';">
							<h3 class="h4">경남</h3>
							<p class="text-small font-weight-light">${ local[11] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=강원';">
							<h3 class="h4">강원</h3>
							<p class="text-small font-weight-light">${ local[12] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=전북';">
							<h3 class="h4">전북</h3>
							<p class="text-small font-weight-light">${ local[13] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=전남';">
							<h3 class="h4">전남</h3>
							<p class="text-small font-weight-light">${ local[14] }개의 MoiM이 있습니다</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box text-center" onclick="javascript:location.href='rcsearch.do?team_local=제주';">
							<h3 class="h4">제주</h3>
							<p class="text-small font-weight-light">${ local[15] }개의 MoiM이 있습니다</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    
    <!-- 공지사항 -->
	<section class="bg-gray">
		<div class="container">
			<div class="text-center">
				<h2>공지사항</h2>
				<div class="row">
					<div class="col-lg-8 mx-auto" style="float: right; border: 1px solid navy; padding: 5px; margin: 5px">
						<div class="dataTable-container">
			    			<table class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr>
						            	<th style="width: 100px; text-align: center;">공지번호</th>
						            	<th style="text-align: center;">공지제목</th>
						            	<th style="width: 150px; text-align: center;">작성날짜</th>
						            </tr>
						        </thead>
			        			<tbody>
								</tbody>
			    			</table>
			    		</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    
	<hr>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<!-- Table에 관련된 js -->
<script src="${ pageContext.servletContext.contextPath }/resources/asset/simple-datatables.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "ntop5.do", 
			type : "post", 
			dataType : "json", 
			success : function(data){
				var str = JSON.stringify(data);
				var json = JSON.parse(str);
				
				values = "";
				
				for(var i in json.list){
					values += "<tr><td align='center'>"
						+ json.list[i].notice_no
						+ "</td><td><a href='ndetail.do?notice_no="
						+ json.list[i].notice_no
						+ "&page=1' align='center'>"
						+ decodeURIComponent(json.list[i].notice_title).replace(
								/\+/gi, " ") + "</a></td><td align='center'>"
						+ json.list[i].notice_date + "</td></tr>";
				}
				
				$('#table1').html($('#table1').html() + values);
			}
		});
	});
</script>
</html>

