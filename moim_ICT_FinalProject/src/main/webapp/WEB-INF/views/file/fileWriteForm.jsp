<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="javascript:void(0)" type="image/x-icon"/>

<title>File</title>
<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page//plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/css/dropify.min.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css"/>

<!-- Core css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page//css/main.css"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page//css/theme1.css"/>
</head>
<body class="font-montserrat">
<!-- Page Loader -->
<div class="page-loader-wrapper"> 
    <div class="loader">
    </div>
</div>

<div id="main_content">
<c:import url="/WEB-INF/views/teampage/common/tp_menubar.jsp" />
<div class="page">
        <div id="page_top" class="section-body top_dark">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="left">
                        <a href="javascript:void(0)" class="icon menu_toggle mr-3"><i class="fa  fa-align-left"></i></a>
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                    <div class="right">
		                <div class="notification d-flex">
		                    <div class="dropdown d-flex show">
		                        <a class="nav-link icon d-none d-md-flex btn btn-default btn-icon ml-2" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-bell"></i><span class="badge badge-primary nav-unread"></span></a>
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
        <div class="section-body mt-3">
            <div class="container-fluid">
	            <div class="row row-cards">
	                <div class="col-12">
		               	<div class="card">
							<div class="card-body">
		                    	<form action="finsert.do" method="post" enctype="multipart/form-data">
		                        	<div class="row">
		                                <div class="col-sm-12" style="float: none; margin:0 auto;">
		                                	<div class="form-group">
			                                    <label>파일선택</label>
			                                    <input class="form-control dropify" type="file" name="upfile">
		                                    </div>
		                                </div>  
		                            </div>
		                            <div class="row">
		                                <div class="col-sm-6 m-t-20 text-center" style="float: none; margin:0 auto;">
			                                <input type="submit" value="등록하기" class="btn btn-primary"> &nbsp; 
											<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
											<button onclick="javascript:history.go(-1); return false;" class="btn btn-default">목록</button>
		                                </div> 
		                        	</div>        
		                    	</form>
		                	</div>
		                </div>
		            </div>
		        </div>
		        <div class="row row-cards">
					<c:forEach items="${ requestScope.list }" var="f">
	             		<div class="card file_folder col-sm-6 col-lg-4">
							<div class="d-flex align-items-center px-2">
	                            <div class="icon">
						        	<c:set var="filename" value="${ f.file_originalfilename }" />
						        	<c:set var="filetype" value="${ filename.substring(filename.lastIndexOf('.') + 1) }" />
						        	<c:if test="${ filetype eq 'pptx' }">
						            	<i class="fa fa-file-powerpoint-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'pdf' }">
						            	<i class="fa fa-file-pdf-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'xlsx' }">
						            	<i class="fa fa-file-excel-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'jpeg' or filetype eq 'png' or filetype eq 'gif' or filetype eq 'jpg' }">
						            	<i class="fa fa-file-image-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'doc' or filetype eq 'docx' }">
						            	<i class="fa fa-file-word-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'mp4' or filetype eq 'avi' }">
						            	<i class="fa fa-file-video-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'zip' or filetype eq 'egg' }">
						            	<i class="fa fa-file-archive-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'txt' }">
						            	<i class="fa fa-file-text-o"></i>
						            </c:if>
						            <c:if test="${ filetype eq 'hwp' }">
						            	<i class="fa fa-file-code-o"></i>
						            </c:if>
						            <c:if test="${ filetype ne 'pptx' and filetype ne 'pdf' and filetype ne 'xlsx' and filetype ne 'jpeg' and filetype ne 'png' and filetype ne 'gif' and filetype ne 'doc' and filetype ne 'docx' and filetype ne 'mp4' and filetype ne 'avi' and filetype ne 'zip' and filetype ne 'egg' and filetype ne 'txt' and filetype ne 'jpg' and filetype ne 'hwp' }">
						            	<i class="fa fa-file"></i>
						            </c:if>
						        </div>
	                            <div>
	                                <div style="width: 180px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><font class="text-muted" style="vertical-align: inherit;">${ f.file_originalfilename }</font></div>
	                                <small class="d-block text-muted"><font style="vertical-align: inherit;">${ f.userVO.user_nn }</font></small>
	                            </div>
	                        </div>
	                    </div>
            		</c:forEach>
				</div>
        	</div>
		</div>
	</div>
</div>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page//bundles/lib.vendor.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page//js/core.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/js/dropify.min.js"></script>
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
</script>
</body>
</html>