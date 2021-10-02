<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="javascript:void(0)" type="image/x-icon"/>

<title>File</title>
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
                        <h1 class="page-title">파일</h1>
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
                        <div class="card" style="border: none; background: rgb(245, 245, 245);">
                            <div class="card-body">
                                <div class="page-options d-flex float-right">
                                    <div class="input-icon ml-2">
                                        <input type="text" id="value" class="form-control search" placeholder="Search..." onkeyup="filter()">
                                    </div>
                                    <button type="submit" class="btn btn-primary ml-2" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/fwform.do';">Upload New</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cards">
					<c:forEach items="${ requestScope.list }" var="f">
	             		<div class="filetab card file_folder col-sm-6 col-lg-4">
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
	                            	<c:url value="tfdown.do" var="tfdown">
	                            		<c:param name="ofile" value="${ f.file_originalfilename }" />
	                            		<c:param name="rfile" value="${ f.file_renamefilename }" />
	                            	</c:url>
	                                <div style="width: 180px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><font class="fname text-muted" style="vertical-align: inherit;"><a href="${ tfdown }">${ f.file_originalfilename }</a></font></div>
	                                <small class="d-block text-muted"><font style="vertical-align: inherit;">${ f.userVO.user_nn }</font></small>
	                            </div>
	                            <div class="ml-auto text-muted">
	                            	<c:if test="${ f.file_uploader == loginMember.user_no }">
		                            	<c:url var="fupview" value="fupview.do">
		                            		<c:param name="file_num" value="${ f.file_num }" />
		                            	</c:url>
		                                <a href="#filedelmodal" data-toggle="modal" data-file_num="${ f.file_num }" data-file_renamefilename="${ f.file_renamefilename }" class="open-filedelmodal nav-link d-none d-md-inline-block ml-3" style="width: 15px;"><i class="fa fa-trash-o"></i></a>
	                            	</c:if>
	                            </div>
	                        </div>
	                    </div>
            		</c:forEach>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="filedelmodal" role="dialog">
					<div class="modal-dialog">
			    	<!-- Modal content-->
			    	<div class="modal-content">
			        	<div class="modal-header">
			        		<h5 class="modal-title" id="teamquitModalLabel">파일 삭제</h5>
			        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        			<span aria-hidden="true">&times;</span>
			        		</button>
			        	</div>
			        	<div class="modal-body">
			          		<h3><font style="vertical-align: inherit;">정말로 파일을 삭제하시겠습니까?</font></h3><br>
			        	</div>
				        <div class="modal-footer">
				        	<form action="fdelete.do" method="post">
				        		<input type="hidden" name="file_num" id="file_num" value="">
				        		<input type="hidden" name="file_renamefilename" id="file_renamefilename" value="">
					          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					          	<button type="submit" class="btn btn-primary">삭제</button>
	                         		</form>
				        </div>
			    	</div>
				    </div>
				</div>
				
            </div>
        </div>
    </div>
</div>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/sweetalert.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/js/dropify.min.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/sweetalert.js"></script>
<script type="text/javascript">
$(function() {
	$('.open-filedelmodal').on('click', function(){
		var file_num_val = $(this).data("file_num");
		var file_num = parseInt(file_num_val);
   		var file_renamefilename = $(this).data("file_renamefilename");
   		console.log(file_num);
   		console.log(file_renamefilename);
   		
   		$('#filedelmodal').modal('show');
   		
   		$(".modal-footer #file_num").val( file_num );
		$(".modal-footer #file_renamefilename").val( file_renamefilename );
	});
});

function filter(){
	var value = document.getElementById("value").value.toUpperCase();
	var filetab = document.getElementsByClassName("filetab");
	for(var i = 0; i < filetab.length; i++){
		var fname = filetab[i].getElementsByClassName("fname");
		if(fname[0].childNodes[0].innerText.toUpperCase().includes(value)){
			filetab[i].style.display = ""
		}else{
			filetab[i].style.display = "none"
		}
	}
}
</script>

</body>
</html>