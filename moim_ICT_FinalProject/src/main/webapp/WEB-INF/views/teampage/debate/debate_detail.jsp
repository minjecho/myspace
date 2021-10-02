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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/css/dropify.min.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css"/>

<!-- Core css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/main.css"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/theme1.css"/>
</head>
<body class="font-montserrat">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
    </div>
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
			                                        <h4 class="title text-muted">${ alertlist.alert_cate }<small class="float-right text-muted">${ alertlist.alert_date }</small></h4><a href="${ alertdelone }" class="float-right"><i class="fa fa-trash-o"></i></a>
			                                        <small class="title text-muted">${ alertlist.alert_content }</small>
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
        <div class="section-body chat_app" style="padding-top: 10px; height: 100%;">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">글 상세</h3>
                            </div>
                            <div class="card-body">
                            	<div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>토론 제목</label>
                                            <input class="form-control" type="text" name="debate_title" value="${ debate.debate_title }" style="height: 50px;" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" type="text" name="user_nn" value="${ debate.userVO.user_nn }" style="height: 50px;" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>토론 내용</label>
                                            <textarea class="form-control" name="debate_content" style="height: 200px;" readonly><c:out value="${ debate.debate_content }" /></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>작성 날짜</label>
                                            <input class="form-control" type="text" name="debate_date" value="${ debate.debate_date }" style="height: 50px;" readonly>
                                        </div>
                                    </div>
                                    <c:set var="sessionUserNn" value="${ loginMember.user_nn }"></c:set>
									<c:set var="debateUserNn" value="${ debate.userVO.user_nn }"></c:set>
                                    <div class="col-sm-12 m-t-20">
                                    	<button type="button" class="btn btn-primary" onclick="javascript:location.href='moveDebate.do'">목록</button>
                                    	<c:if test="${ debateUserNn == sessionUserNn }">
					                	<button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#updateDebateModal" style="margin-left: 20px;">수정</button>
					                	<button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#deleteDebateModal" style="margin-left: 15px;">삭제</button>
					            		</c:if>
					            	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card b-none" style="height: 93%;">
							<div class="card-header bline">
                                <h3 class="card-title">댓글</h3>
                            </div>
                            <div class="chat_windows">
								<div class="chat-message clearfix">
									<form action="tdcinsert.do" method="post">
	                                <div class="input-group mb-0">
	                                	<input type="hidden" name="debate_num" value="${ debate.debate_num }">
	                                    <textarea class="form-control" name="debate_comment_content" onkeydown="resize(this)" onkeyup="resize(this)" style="border: solid 1px grey;margin-bottom: 15px;margin-top: 0px;border-radius: 0.25rem;" required></textarea>
	                                </div>
	                                <button type="submit" class="btn btn-primary float-right">등록</button>
	                                </form>
	                            </div>
								<ul class="mb-0">
									<c:forEach items="${ dcommentlist }" var="dcommentlist">
									<li class="my-message" style="margin-left: 30px; margin-bottom: 0px;">
										<div class="message" style="width: 100%;">
											<p class="bg-light-gray" style="margin-bottom: -18px; position: relative; z-index: 1; width: 100%; text-align: left;">
												<font style="vertical-align: inherit;">${ dcommentlist.debate_comment_content }</font>
											</p>
											<table class="table table-vcenter mb-0 table_custom spacing8 text-nowrap">
												<tbody>
													<tr>
														<c:set var="debateCommentUserNn" value="${ dcommentlist.userVO.user_nn }"></c:set>
														<c:if test="${ sessionUserNn ne debateCommentUserNn }">
														<td style="width: 60%; text-align: left;">${ dcommentlist.userVO.user_nn }</td>
														<td style="width: 40%; text-align: right;">${ dcommentlist.debate_comment_date }</td>
														</c:if>
														<c:url value="tdcdelete.do" var="tdcdelete">
															<c:param name="debate_num" value="${ dcommentlist.debate_num }" />
															<c:param name="debate_comment_num" value="${ dcommentlist.debate_comment_num }" />
														</c:url>
														<c:if test="${ sessionUserNn eq debateCommentUserNn }">
														<td style="width: 65%; text-align: left;">${ dcommentlist.userVO.user_nn }</td>
														<td style="width: 30%; text-align: right;">${ dcommentlist.debate_comment_date }</td>
														<td style="width: 5%;"><a href="${ tdcdelete }"><i class="fa fa-trash-o"></i></a></td>
														</c:if>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
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

<!-- 토론 글 수정 Modal -->
<div class="modal fade" id="updateDebateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-ml" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">토론 글 수정</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="tdeupdate.do" method="post">
				<input type="hidden" name="debate_num" value="${ debate.debate_num }">
				<div class="modal-body" id="changerankdiv">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label>제목</label>
								<input class="form-control" type="text" name="debate_title" value="${ debate.debate_title }">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" name="debate_content" style="height: 78px;"><c:out value="${ debate.debate_content }" /></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 토론 글 삭제 Modal -->
<div class="modal fade" id="deleteDebateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-ml" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">토론 글 삭제</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="tdedelete.do" method="post">
				<input type="hidden" name="debate_num" value="${ debate.debate_num }">
				<div class="modal-body" id="changerankdiv">
					<div class="row">
						<div class="col-sm-12">
						    <div class="form-group text-center">
						        <h3><font style="vertical-align: inherit;">정말로 글을 삭제하시겠습니까?</font></h3><br>
						    </div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">삭제</button>
				</div>
			</form>
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
    });
    
    function resize(obj) {
        obj.style.height = "1px";
      obj.style.height = (12 + obj.scrollHeight) + "px";
    };
</script>
</body>
</html>