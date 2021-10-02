<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${ currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 공지 수정</title>
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<div class="container">
			<div class="row align-items-center mt-5">
				<div class="col-lg-7">
					<form action="nupdate.do" class="contact-form text-left" method="post" enctype="multipart/form-data">
						<input type="hidden" name="notice_no" value="${ notice.notice_no }">
						<c:if test="${ !empty notice.notice_original_filename }">
							<input type="hidden" name="notice_original_filename" value="${ notice.notice_original_filename }">
							<input type="hidden" name="notice_rename_filename" value="${ notice.notice_rename_filename }">
						</c:if>
						<div class="form-group mb-4">
							<label>공지제목<sup class="text-primary">✱</sup></label>
							<input type="text" name="notice_title" class="form-control" value="${ notice.notice_title }">
						</div>
						<div class="form-group mb-4">
							<label>작성자<sup class="text-primary">✱</sup></label>
							<input type="text" name="user_nn" placeholder="${ loginMember.user_nn }" class="form-control" readonly="readonly">
							<input type="hidden" name="user_no" value="${ notice.user_no }">
						</div>
						<div class="form-group mb-4">
							<c:if test="${ notice.notice_original_filename != null }">
								${ notice.notice_original_filename }
								<input type="checkbox" name="deleteFile" value="yes"> 파일삭제<br>
							</c:if>
							<label>첨부파일<sup class="text-primary"></sup></label>
							<input type="file" name="upfile" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>공지내용<sup class="text-primary">✱</sup></label>
							<textarea name="notice_content" class="form-control">${ notice.notice_content }</textarea>
						</div>
						<div class="form-group">
							<c:url var="nlist" value="nlist.do">
								<c:param name="page" value="${ currentPage }"/>
							</c:url>
							<input type="submit" value="공지수정" class="btn btn-primary">
							<a href="${ nlist }" class="btn btn-primary">목록</a>
						</div>
					</form>
				</div>
			</div>
    	</div>
    </section>
	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>