<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${ currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 새로운 공지 작성</title>
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<div class="container">
			<div class="row align-items-center mt-5">
				<div class="col-lg-7">
					<form action="ninsert.do" class="contact-form text-left" method="post" enctype="multipart/form-data">
						<div class="form-group mb-4">
							<label>공지제목<sup class="text-primary">✱</sup></label>
							<input type="text" name="notice_title" placeholder="제목을 입력해주세요." class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>작성자<sup class="text-primary">✱</sup></label>
							<input type="text" name="user_nn" placeholder="${ loginMember.user_nn }" class="form-control" readonly="readonly">
							<input type="hidden" name="user_no" value="${ loginMember.user_no }">
						</div>
						<div class="form-group mb-4">
							<label>첨부파일<sup class="text-primary"></sup></label>
							<input type="file" name="upfile" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>공지내용<sup class="text-primary">✱</sup></label>
							<textarea name="notice_content" placeholder="공지 내용을 입력해주세요." class="form-control"></textarea>
						</div>
						<div class="form-group">
							<c:url var="nlist" value="nlist.do">
								<c:param name="page" value="${ currentPage }"/>
							</c:url>
							<input type="submit" value="공지등록" class="btn btn-primary">
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