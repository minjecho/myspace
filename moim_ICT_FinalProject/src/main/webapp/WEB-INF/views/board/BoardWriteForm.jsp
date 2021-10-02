<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 새로운 글 작성</title>
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<div class="container">
			<div class="row align-items-center mt-5">
				<div class="col-lg-7">
					<form action="binsert.do" class="contact-form text-left" method="post" enctype="multipart/form-data">
						<div class="form-group mb-4">
							<label>글제목<sup class="text-primary">✱</sup></label>
							<input type="text" name="board_title" placeholder="제목을 입력해주세요." class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>작성자<sup class="text-primary">✱</sup></label>
							<input type="text" name="user_name" placeholder="${ loginMember.user_nn }" class="form-control" readonly="readonly">
							<input type="hidden" name="user_no" value="${ loginMember.user_no }">
						</div>
						<div class="form-group mb-4">
							<label>카테고리</label>
							<select name="board_category_no" class="dataTable-selector form-select">
				    			<option value="1">공모전</option>
				    			<option value="2">인턴십</option>
				    			<option value="3">자격증</option>
				    			<option value="4">이벤트</option>
				    			<option value="5" selected>자유글</option>
				    		</select>
						</div>
						<div class="form-group mb-4">
							<label>첨부파일<sup class="text-primary"></sup></label>
							<input type="file" name="upfile" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>글내용<sup class="text-primary">✱</sup></label>
							<textarea name="board_content" placeholder="공지 내용을 입력해주세요." class="form-control"></textarea>
						</div>
						<div class="form-group">
							<c:url var="blist" value="blist.do">
								<c:param name="page" value="${ currentPage }"/>
							</c:url>
							<input type="submit" value="글등록" class="btn btn-primary">
							<a href="${ blist }" class="btn btn-primary">목록</a>
						</div>
					</form>
				</div>
			</div>
    	</div>
    </section>
	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<!-- Table에 관련된 js -->
<script src="${ pageContext.servletContext.contextPath }/resources/asset/simple-datatables.js"></script>
</html>