<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moim</title>
<script type="text/javascript">
const result = "${msg}"
if( result === "delsuccess"){
	alert('삭제 완료.');
}
</script>
<style type="text/css">
.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image:
		url('${ pageContext.servletContext.contextPath }/resources/img/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}
</style>

</head>
<body>
	<!-- navbar-->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section>
		<br> <br> <br>
		<h2 align="center"></h2>
		<hr>
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">${ review.review_title }</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td style="width: 20%;">작성자</td>
							<td colspan="2" style="text-align: left;">${ review.review_writer }</td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2" style="text-align: left;"><fmt:formatDate
									value="${ review.review_date }" type="date"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>분야</td>
							<td colspan="2" style="text-align: left;">${ review.field_name }</td>
						</tr>
						<tr>
							<td>스터디명</td>
							<td colspan="2" style="text-align: left;">${ review.team_name }</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="height: 200px; text-align: left;">${ review.review_content }</td>
						</tr>
						<tr>
							<td>별점</td>
							<td colspan="2" style="text-align: left;">
								<div class="review_rating">

									<div class="rating">
										<c:forEach begin="1" end="${ review.review_grade }">
											<input type="checkbox" name="rating" id="rating1" value="1"
												class="rate_radio" title="1점" checked disabled>
											<label for="rating1"></label>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="2" style="text-align: left;"><c:if
									test="${ !empty review.review_original_filepath }">
									<c:url var="ubf" value="/rvfdown.do">
										<c:param name="ofile"
											value="${ review.review_original_filepath }" />
										<c:param name="rfile"
											value="${ review.review_rename_filepath }" />
									</c:url>
									<a href="${ ubf }">${ review.review_original_filepath }</a>
								</c:if> <c:if test="${ empty review.review_original_filepath }">
		&nbsp;
		</c:if></td>
						</tr>
					</tbody>
				</table>



				<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->

			</div>
			<br>


			<center>
				<c:if test="${ !empty sessionScope.loginMember }">
					<c:if test="${ loginMember.user_nn eq review.review_writer }">
						<c:url var="ubup" value="/rvupview.do">
							<c:param name="review_no" value="${ review.review_no }" />
							<c:param name="page" value="${ currentPage }" />
						</c:url>
						<a href="${ ubup }">수정하기</a>
	    &nbsp; &nbsp; 
	    <c:url var="ubd" value="/rvdelete.do">
							<c:param name="review_no" value="${ review.review_no }" />
							<c:if test="${ !empty review.review_original_filepath }">
								<c:param name="rfile" value="${ review.review_rename_filepath }" />
							</c:if>
						</c:url>
						<a href="${ ubd }">	<button type="button" class="btn btn-default" onclick="return confirm('정말로 삭제하시겠습니까?')">글삭제</button></a>
	    &nbsp; &nbsp; 
    </c:if>
</c:if>
					<button type="button" class="btn btn-primary" onclick="javascript:history.go(-1); return false;">목록</button>
					
			</center>
			<br> <br>


		</div>
		<!-- Footer -->
		<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>