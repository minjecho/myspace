<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />

<title>${ sessionScope.team_name }</title>
<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/sweetalert/sweetalert.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/css/dropify.min.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" />

<!-- Core css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/main.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/theme1.css" />
</head>
<body class="font-montserrat">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader"></div>
	</div>
	<!-- Overlay For Sidebars -->

	<div id="main_content">

		<c:import url="/WEB-INF/views/teampage/common/tp_menubar.jsp" />

		<div class="page">
			<div id="page_top" class="section-body top_dark">
				<div class="container-fluid">
					<div class="page-header">
						<div class="left">
							<a href="javascript:void(0)" class="icon menu_toggle mr-3"><i class="fa  fa-align-left"></i></a>
							<h1 class="page-title">토론 게시판</h1>
						</div>
						<div class="right">
							<div class="notification d-flex">
								<div class="dropdown d-flex show">
			                        <a class="nav-link icon d-none d-md-flex btn btn-default btn-icon ml-2" data-toggle="dropdown" aria-expanded="true">
			                        	<c:set var="alertlistsize" value="${ alertlist.size() }"></c:set>
			                        	<c:if test="${ alertlistsize eq 0 }">
			                        	<i class="fa fa-bell"></i>
			                        	</c:if>
			                        	<c:if test="${ alertlistsize > 0 }">
			                        	<i class="fa fa-bell"></i><span class="badge badge-primary nav-unread"></span>
			                        	</c:if>
			                        </a>
			                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow" x-placement="bottom-end" style="position: absolute; transform: translate3d(-312px, 34px, 0px); top: 0px; left: 0px; will-change: transform;">
										<ul class="list-unstyled feeds_widget">
											<c:forEach items="${ alertlist }" var="alertlist">
												<li>
													<div class="feeds-body">
														<c:url var="alertdelone" value="alertdelone.do">
															<c:param name="alert_num" value="${ alertlist.alert_num }" />
														</c:url>
														<h4 class="title text-muted">${ alertlist.alert_cate }<small class="float-right text-muted">${ alertlist.alert_date }</small>
														</h4>
														<a href="${ alertdelone }" class="float-right"><i class="fa fa-trash-o"></i></a> <small class="title text-muted">${ alertlist.alert_content }</small>
													</div>
												</li>
											</c:forEach>
										</ul>
										<div class="dropdown-divider"></div>
										<c:url var="alertdelall" value="alertdelall.do">
											<c:param name="team_member_no" value="${ teammember.team_member_no }"></c:param>
										</c:url>
										<a href="${ alertdelall }" class="dropdown-item text-center text-muted-dark readall">모든 알람 삭제</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section-light py-3 chat_app" style="height: 100%;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="card bg-none b-none">
								<div class="card-header bline bg-none">
									<div class="card-options">
										<a data-target="#insertdebatemodal" id="insertdebate" class="p-1" data-toggle="modal"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="p-1 chat_list_btn"><i class="fa fa-align-right"></i></a>
									</div>

									<!-- Modal -->
									<div class="modal fade" id="insertdebatemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-ml" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">토론 글 작성</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form action="tdeinsert.do" method="post">
													<div class="modal-body" id="changerankdiv">
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group">
																	<label>제목</label> <input class="form-control" type="text" name="debate_title">
																</div>
															</div>
															<div class="col-sm-12">
																<div class="form-group">
																	<label>내용</label>
																	<textarea class="form-control" name="debate_content" style="height: 78px;"></textarea>
																</div>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">등록</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									
								</div>
								<div class="chat_windows">
									<ul class="mb-0">
										<c:forEach items="${ list }" var="list">
											<c:set var="sessionUserNO" value="${ loginMember.user_no }"></c:set>
											<c:set var="debateUserNO" value="${ list.userVO.user_no }"></c:set>
											<c:url var="moveDebateDetail" value="moveDebateDetail.do">
												<c:param name="debate_num" value="${ list.debate_num }" />
											</c:url>
											<c:if test="${ debateUserNO != sessionUserNO }">
												<li class="other-message">
													<div class="message" style="width: 40%;">
														<p class="bg-light-blue" style="margin-bottom: -18px; position: relative; z-index: 1; width: 100%;">
															<font style="vertical-align: inherit;"><a href="${ moveDebateDetail }">${ list.debate_title }</a></font>
														</p>
														<table
															class="table table-vcenter mb-0 table_custom spacing8 text-nowrap">
															<tbody>
																<tr>
																	<td style="background-color: rgb(248, 249, 250); width: 50%;">${ list.userVO.user_nn }</td>
																	<td style="background-color: rgb(248, 249, 250); width: 20%; text-align: right;">댓글 ${ list.debate_comment_count }</td>
																	<td style="background-color: rgb(248, 249, 250); width: 30%; text-align: right;">${ list.debate_date }</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</c:if>
											<c:if test="${ debateUserNO == sessionUserNO }">
												<li class="my-message">
													<div class="message" style="width: 40%;">
														<p class="bg-light-gray" style="margin-bottom: -18px; position: relative; z-index: 1; width: 100%; text-align: left;">
															<font style="vertical-align: inherit;"><a href="${ moveDebateDetail }">${ list.debate_title }</a></font>
														</p>
														<table class="table table-vcenter mb-0 table_custom spacing8 text-nowrap">
															<tbody>
																<tr>
																	<td style="background-color: rgb(248, 249, 250); width: 50%; text-align: left;">${ list.userVO.user_nn }</td>
																	<td style="background-color: rgb(248, 249, 250); width: 20%; text-align: right;">댓글 ${ list.debate_comment_count }</td>
																	<td style="background-color: rgb(248, 249, 250); width: 30%; text-align: right;">${ list.debate_date }</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/js/dropify.min.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
	<script>
    $(function() {
        "use strict";
        
        $('.dropify').dropify();
    
        var drEvent = $('#dropify-event').dropify();
        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });
    
        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });
    
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });
        
        $('#insertdebate').on('click', function (){
            $('#insertdebatemodal').modal('show');
            
   		 });
    });
</script>
</body>

</html>