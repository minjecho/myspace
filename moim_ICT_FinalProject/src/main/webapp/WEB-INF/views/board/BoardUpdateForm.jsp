<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${ currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 글 수정</title>
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<div class="container">
			<div class="row align-items-center mt-5">
				<div class="col-lg-7">
					<form action="bupdate.do" class="contact-form text-left" method="post" enctype="multipart/form-data">
						<input type="hidden" name="board_no" value="${ board.board_no }">
						<input type="hidden" name="board_readcount" value="${ board.board_readcount }">
						<c:if test="${ !empty board.board_original_filename }">
							<input type="hidden" name="board_original_filename" value="${ board.board_original_filename }">
							<input type="hidden" name="board_rename_filename" value="${ board.board_rename_filename }">
						</c:if>
						<div class="form-group mb-4">
							<label>글제목<sup class="text-primary">✱</sup></label>
							<input type="text" name="board_title" class="form-control" value="${ board.board_title }">
						</div>
						<div class="form-group mb-4">
							<label>작성자<sup class="text-primary">✱</sup></label>
							<input type="text" name="user_nn" placeholder="${ loginMember.user_nn }" class="form-control" readonly="readonly">
							<input type="hidden" name="user_no" value="${ board.user_no }">
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
							<c:if test="${ board.board_original_filename != null }">
								${ board.board_original_filename }
								<input type="checkbox" name="deleteFile" value="yes"> 파일삭제<br>
							</c:if>
							<label>첨부파일<sup class="text-primary"></sup></label>
							<input type="file" name="upfile" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>글내용<sup class="text-primary">✱</sup></label>
							<textarea name="board_content" class="form-control">${ board.board_content }</textarea>
						</div>
						<div class="form-group">
							<c:url var="blist" value="blist.do">
								<c:param name="page" value="${ currentPage }"/>
							</c:url>
							<input type="submit" value="글수정" class="btn btn-primary">
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
</html>