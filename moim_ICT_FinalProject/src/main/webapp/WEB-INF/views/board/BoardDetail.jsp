<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${ currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - ${ board.board_title }</title>
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<section>
		<h1 align="center">${ board.board_title }</h1>
		<br><br>
		<div class="container">
			<input type="hidden" id="board_no" name="board_no" value="${ board.board_no }">
			<input type="hidden" id="user_no" name="user_no" value="${ loginMember.user_no }">
			<input type="hidden" id="admin" name="admin" value="${ loginMember.admin }">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<p class="lead text-muted mb-5">
						${ board.board_content }
					</p>
					<c:if test="${ board.board_original_filename != null }">
						<c:url var="bfdown" value="bfiledown.do">
							<c:param name="ofile" value="${ board.board_original_filename }"/>
							<c:param name="rfile" value="${ board.board_rename_filename }"/>
						</c:url>
						<h3 class="mb-5">첨부파일 : <a href="${ bfdown }">${ board.board_original_filename }</a></h3>
					</c:if>
					<c:if test="${ board.board_original_filename == null }">
						<h3 class="mb-5">첨부파일 : </h3>
					</c:if>
					<blockquote class="blockquote mb-5 text-left">
						<div class="dataTable-container">
			    			<table id="reply" class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr>
						            	<th style="width: 100px; text-align: center;">작성자</th>
						            	<th style="text-align: center;">댓글내용</th>
						            	<th style="width: 150px; text-align: center;">삭제</th>
						            </tr>
						        </thead>
			    			</table>
			    		</div>
			    		<c:if test="${ !empty loginMember }">
				    		<form action="rinsert.do" class="contact-form text-left" method="post">
				    			<input type="hidden" name="board_no" value="${ board.board_no }">
				    			<input type="hidden" name="user_no" value="${ loginMember.user_no }">
				    			<input type="hidden" name="page" value="${ currentPage }">
				    			<div class="form-group mb-4">
									<label>댓글내용<sup class="text-primary">✱</sup></label>
									<textarea name="reply_content" placeholder="댓글 내용을 입력해주세요." class="form-control"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" value="댓글등록" class="btn btn-primary">
									<input type="reset" value="취소" class="btn btn-primary">
								</div>
				    		</form>
			    		</c:if>
					</blockquote>
					<br>
					<a href="javascript:history.go(-1);" class="btn btn-primary">목록</a>
					<c:if test="${ loginMember.admin != 'Y' and loginMember.user_no == board.user_no }">
						<c:url var="bupdateform" value="bupdateform.do">
							<c:param name="board_no" value="${ board.board_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ bupdateform }" class="btn btn-primary">수정</a>
						<c:url var="bdelete" value="bdelete.do">
							<c:param name="board_no" value="${ board.board_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ bdelete }" class="btn btn-primary">삭제</a>
					</c:if>
					<c:if test="${ loginMember.admin == 'Y' and loginMember.user_no == board.user_no }">
						<c:url var="bupdateform" value="bupdateform.do">
							<c:param name="board_no" value="${ board.board_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ bupdateform }" class="btn btn-primary">수정</a>
						<c:url var="bdelete" value="bdelete.do">
							<c:param name="board_no" value="${ board.board_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ bdelete }" class="btn btn-primary">삭제</a>
					</c:if>
					<c:if test="${ loginMember.admin == 'Y' and loginMember.user_no != board.user_no }">
						<c:url var="bdelete" value="bdelete.do">
							<c:param name="board_no" value="${ board.board_no }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						&nbsp;&nbsp;<a href="${ bdelete }" class="btn btn-primary">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
    </section>
    <script type="text/javascript">
		$(function(){
			console.log("run");
			var board_no = $(".container #board_no").val();
			var login_user_no = $(".container #user_no").val();
			var admin = $(".container #admin").val();
			
			$.ajax({
				url : "rlist.do", 
				type : "post", 
				dataType : "json", 
				data : {"board_no" : board_no}, 
				success : function(data){
					var str = JSON.stringify(data);
					var json = JSON.parse(str);
					
					values = "";
					
					for(var i in json.list){
						var reply_no = json.list[i].reply_no;
						
						values += "<tbody><tr><td align='center'>"
								+ decodeURIComponent(json.list[i].user_nn).replace(/\+/gi, " ")
								+ "</td><td align='center'>"
								+ decodeURIComponent(json.list[i].reply_content).replace(/\+/gi, " ")
								+ "</td><td align='center'>"
								
						if(login_user_no == json.list[i].user_no){
							values += "<form action='rdelete.do'>"
									+ "<input type='hidden' name='reply_no' value='" + json.list[i].reply_no + "'>"
									+ "<input type='hidden' name='board_no' value='${ board.board_no }'>"
									+ "<input type='hidden' name='page' value='${ currentPage }'>"
									+ "<input type='submit' value='삭제' class='btn btn-primary'></form>"
									+ "</td></tr></tbody>"
						} else if(admin == "Y") {
							values += "<form action='rdelete.do'>"
								+ "<input type='hidden' name='reply_no' value='" + json.list[i].reply_no + "'>"
								+ "<input type='hidden' name='board_no' value='${ board.board_no }'>"
								+ "<input type='hidden' name='page' value='${ currentPage }'>"
								+ "<input type='submit' value='삭제' class='btn btn-primary'></form>"
								+ "</td></tr></tbody>"
						} else if(login_user_no != json.list[i].user_no){
							values += "</td></tr></tbody>"
						}
					}
					
					$('#reply').html($('#reply').html() + values);
				}, 
				
				error : function(jqXHR, textstatus, errorthrown) {
					console.log("error : " + jqXHR + ", " + textstatus + ", "
							+ errorthrown);
				}
			});
		});
	</script>
	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<!-- Table에 관련된 js -->
<script src="${ pageContext.servletContext.contextPath }/resources/asset/simple-datatables.js"></script>
</html>