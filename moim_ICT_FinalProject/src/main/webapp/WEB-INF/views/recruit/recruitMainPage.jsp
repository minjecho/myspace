<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>moim</title>
<style type="text/css">
.row {
    --bs-gutter-x: 2rem;
    --bs-gutter-y: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-top: calc(var(--bs-gutter-y) * -1);
    margin-right: calc(var(--bs-gutter-x) / -2);
    margin-left: calc(var(--bs-gutter-x) / -2);
}
.card{
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #FFFEFE;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,0.125);
    border-radius: .5rem;
}

</style>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<body>
	<!-- navbar-->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />

	
	<!-- FAQ Section-->
	<section class="pb-11 pt-7 bg-600">
		<div class="container">
			<div class="row2">
				<div class="col-12">
					<h6 class="font-sans-serif text-primary fw-bold">Study
						category</h6>
					<h1 class="mb-6">스터디 검색</h1>
					<form action="rcsearch.do" method="post" class="row g-3" style="float: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<div>
							<label class="form-label">분야</label><br>
							<select class="nav-link dropdown-toggle" name="field_name" id="inputCategories" style="width:130px; height:40px;">
								<option selected="selected" value="${ field_name }">${ field_name }</option>
								<option value="영어">영어</option>
								<option value="중국어">중국어</option>
								<option value="기타 언어">기타 언어</option>
								<option value="프로그래밍">프로그래밍</option>
								<option value="인문학/책">인문학/책</option>
								<option value="사진/영상">사진/영상</option>
								<option value="음악/악기">음악/악기</option>
								<option value="자격증">자격증</option>
								<option value="공모전">공모전</option>
								<option value="고시/공무원">고시/공무원</option>
								<option value="기타학문">기타학문</option>
								<option value="자유주제">자유주제</option>
							</select>
						</div>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<div>
							<label class="form-label">레벨</label><br>
							<select class="nav-link dropdown-toggle" name="team_level" id="inputLevel" style="width:130px; height:40px;">
								<option selected="selected" value="${ team_level }">${ team_level }</option>
								<option value="초급">초급</option>
								<option value="중급">중급</option>
								<option value="고급">고급</option>
							</select>
						</div>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<div>
							<label class="form-label">지역</label><br>
							<select class="nav-link dropdown-toggle" name="team_local" id="inputLanguage" style="width:130px; height:40px;">
								<option selected="selected" value="${ team_local }">${ team_local }</option>
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
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<div>
							<label class="form-label">요일</label><br>
							<select class="nav-link dropdown-toggle" name="team_act_day" id="inputInstructor" style="width:130px; height:40px;">
								<option selected="selected" value="${ team_act_day }">${ team_act_day }</option>
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
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

						<div>
							<label class="form-label">스터디명</label><br> <input
								type="search" name="team_name" value="${ team_name }" width="200px" style="width:180px; height:40px;" class="form-control">
						</div>
						<div class="col-auto z-index-2">
							<br>
							<button class="btn btn-primary" type="submit" style="width:120px; height:50px;">검색</button>
						</div>
					</form>


					<br>
					<br>
					<br>

					<div>
						<br>
						
						<br>
						<c:url var="rinsert" value="/rcwrite.do">
										
						</c:url>
						<c:if test="${ !empty loginMember }">			
						 <a href="${ rinsert }"><button class="btn btn-primary"
								style="float: right;">스터디 개설하기</button></a></c:if> <br>
						<br>
						<br>
						</div>
						
						 <div class="container2">
						
						 
						<div class="row" >
						<c:forEach items="${ requestScope.list }" var="rc">
						<c:url var="rde" value="/rcdetail.do">
						<c:param name="team_num" value="${ rc.team_num}" />
						<c:param name="page" value="${ currentPage }" />
						
						</c:url>
							<div class="col-md-4 mb-4">
							
								<div class="card h-100">
									<c:if test="${ empty rc.team_rename_image }">
									<img class="card-img-top w-100" src="${ pageContext.servletContext.contextPath }/resources/img/pic.jpg" alt="courses"
										width="500" height="250">
									</c:if>
									<c:if test="${ !empty rc.team_rename_image }">
									<img class="card-img-top w-100" src="${ pageContext.servletContext.contextPath }/resources/recruit_files/${ rc.team_rename_image }" alt="courses"
										width="500" height="250">
									</c:if>
									<div class="card-body">				
										<h4 class="font-sans-serif fw-bold fs-md-0 fs-lg-1" style="font-weight: 500; text-align:center; color:#379392; 
										font-family: geogia;">${ rc.team_name }</h4>
										<h5 style="text-align:right;">${ rc.field_name }</h5>
										<a class="text-muted fs--1 stretched-link text-decoration-none"
											href="${ rde }"></a>
										<h6>지역&nbsp;&nbsp;&nbsp;  :&nbsp;&nbsp; ${ rc.team_local }</h6>
										<h6>기간&nbsp;&nbsp;&nbsp;  :&nbsp;&nbsp; ${ rc.team_act_week }주</h6>
										<h6>요일&nbsp;&nbsp;&nbsp;  :&nbsp;&nbsp; ${ rc.team_act_day }</h6>
										<h6>레벨&nbsp;&nbsp;&nbsp;  :&nbsp;&nbsp; ${ rc.team_level }</h6>
										<h6>참가비 : &nbsp;&nbsp;${ rc.team_fee }원</h6>
										<h6>인원&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;${ rc.team_limit }명</h6>
										<h6>요일&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;${ rc.team_act_day }</h6>
										<h6>시간&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;${ rc.team_act_time }</h6>
										
									</div>
									
								</div>
								</div>
								</c:forEach>
							</div>
							</div>
						

					</div>	
						</div>
					</div>
				<br><br>
				<c:choose>
		<c:when test="${ empty team_name and empty team_level and empty field_name and empty team_local and empty team_act_day }">
				<div style="text-align:center;">
				
			
<c:if test="${ currentPage <= 1 }">
	<<&nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
	<c:url var="ubl" value="/rclist.do">
		<c:param name="page" value="1" />
	</c:url>
	<a href="${ ubl }"><<</a>
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="ubl2" value="/rclist.do">
		<c:param name="page" value="${ startPage - 10 }"/>
	</c:url>
	<a href="${ ubl2 }" class="page-item pager"><</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
	<&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	<c:if test="${ p eq currentPage }">	
		<font color="#379392" size="4"><b>[${ p }]</b></font>
	</c:if>
	<c:if test="${ p ne currentPage }">
		<c:url var="ubl3" value="/rclist.do">
			<c:param name="page" value="${ p }"/>
		</c:url>
		<a href="${ ubl3 }">${ p }</a>
	</c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="ubl4" value="/rclist.do">
		<c:param name="page" value="${ endPage + 10 }"/>
	</c:url>
	<a href="${ ubl4 }">></a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
	>&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
	>>&nbsp;
</c:if>	
<c:if test="${ currentPage < maxPage }">
	<c:url var="ubl5" value="/rclist.do">
		<c:param name="page" value="${ maxPage }"/>
	</c:url>
	<a href="${ ubl5 }">>></a>
</c:if>
</div>

</c:when>	
<c:otherwise>
			<div style="text-align:center;">
				
			
<c:if test="${ currentPage <= 1 }">
	<<&nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
	<c:url var="ubl" value="/rcsearch.do">
		<c:param name="page" value="1" />
		<c:param name="team_level" value="${ team_level }" />
		<c:param name="field_name" value="${ field_name }" />
		<c:param name="team_local" value="${ team_local }" />
		<c:param name="team_name" value="${team_name }" />
		<c:param name="team_act_day" value="${ team_act_day }" />
	</c:url>
	<a href="${ ubl }"><<</a>
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="ubl2" value="/rcsearch.do">
		<c:param name="page" value="${ startPage - 10 }"/>
		<c:param name="team_level" value="${ team_level }" />
		<c:param name="field_name" value="${ field_name }" />
		<c:param name="team_local" value="${ team_local }" />
		<c:param name="team_name" value="${team_name }" />
		<c:param name="team_act_day" value="${ team_act_day }" />
	</c:url>
	<a href="${ ubl2 }" class="page-item pager"><</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
	<&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	<c:if test="${ p eq currentPage }">	
		<font color="#379392" size="4"><b>[${ p }]</b></font>
	</c:if>
	<c:if test="${ p ne currentPage }">
		<c:url var="ubl3" value="/rcsearch.do">
			<c:param name="page" value="${ p }"/>
			<c:param name="team_level" value="${ team_level }" />
		<c:param name="field_name" value="${ field_name }" />
		<c:param name="team_local" value="${ team_local }" />
		<c:param name="team_name" value="${team_name }" />
		<c:param name="team_act_day" value="${ team_act_day }" />
		</c:url>
		<a href="${ ubl3 }">${ p }</a>
	</c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="ubl4" value="/rcsearch.do">
		<c:param name="page" value="${ endPage + 10 }"/>
		<c:param name="team_level" value="${ team_level }" />
		<c:param name="field_name" value="${ field_name }" />
		<c:param name="team_local" value="${ team_local }" />
		<c:param name="team_name" value="${team_name }" />
		<c:param name="team_act_day" value="${ team_act_day }" />
	</c:url>
	<a href="${ ubl4 }">></a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
	>&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
	>>&nbsp;
</c:if>	
<c:if test="${ currentPage < maxPage }">
	<c:url var="ubl5" value="/rcsearch.do">
		<c:param name="page" value="${ maxPage }"/>
		<c:param name="team_level" value="${ team_level }" />
		<c:param name="field_name" value="${ field_name }" />
		<c:param name="team_local" value="${ team_local }" />
		<c:param name="team_name" value="${team_name }" />
		<c:param name="team_act_day" value="${ team_act_day }" />
	</c:url>
	<a href="${ ubl5 }">>></a>
</c:if>
</div>

<c:url var="out" value="/rclist.do"/><br>
<center><a href="${ out }" ><button class="btn btn-primary">목록</button></a></center>
</c:otherwise>


</c:choose>
		<!-- end of .container-->
	</section>


	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	

</body>
</html>