<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${ currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - ${ notice.notice_title }</title>
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<h1 align="center">${ notice.notice_title }</h1>
		<br><br>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<p class="lead text-muted mb-5">
						${ notice.notice_content }
					</p>
					<c:if test="${ notice.notice_original_filename != null }">
						<c:url var="nfdown" value="nfiledown.do">
							<c:param name="ofile" value="${ notice.notice_original_filename }"/>
							<c:param name="rfile" value="${ notice.notice_rename_filename }"/>
						</c:url>
						<h3 class="mb-5">첨부파일 : <a href="${ nfdown }">${ notice.notice_original_filename }</a></h3>
					</c:if>
					<c:if test="${ notice.notice_original_filename == null }">
						<h3 class="mb-5">첨부파일 : </h3>
					</c:if>
					<br>
					<a href="javascript:history.go(-1);" class="btn btn-primary">목록</a>
					<c:if test="${ loginMember.admin == 'Y' }">
						<c:url var="nupdate" value="nupdateform.do">
							<c:param name="notice_no" value="${ notice.notice_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ nupdate }" class="btn btn-primary">수정</a>
						<c:url var="ndelete" value="ndelete.do">
							<c:param name="notice_no" value="${ notice.notice_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ ndelete }" class="btn btn-primary">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
    </section>
	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>