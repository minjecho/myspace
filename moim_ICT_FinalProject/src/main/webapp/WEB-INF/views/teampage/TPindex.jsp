<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/index.html  07 Jan 2020 03:37:47 GMT -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />

<title>${ sessionScope.team_name }</title>

<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/bootstrap/css/bootstrap.min.css" />

<!-- Plugins css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/charts-c3/c3.min.css"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css"/>

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

<div id="main_content">
	<c:import url="/WEB-INF/views/teampage/common/tp_menubar.jsp" />
    <div class="page">
    <div id="page_top" class="section-body top_dark">
		<div class="container-fluid">
			<div class="page-header">
				<div class="left">
					<a href="javascript:void(0)" class="icon menu_toggle mr-3"><i
						class="fa  fa-align-left"></i></a>
					<h1 class="page-title">${ team.team_name }</h1>
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
        <div class="section-body mt-3">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="mb-4">
                            <h4>Welcome ${ sessionScope.loginMember.user_nn }</h4>
                        </div>                        
                    </div>
                </div>
                <div class="row clearfix row-deck">
                	<div class="col-xl-4 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">공지</h3>
                                <div class="card-options">
                                    <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fa fa-chevron-up"></i></a>
                                    <a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fa fa-window-maximize"></i></a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-hover table-vcenter text-nowrap table_custom border-style list" id="boardtoptable">
	                                <thead>
	                                    <tr>
	                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제 목</font></font></th>
	                                        <th style="width: 16.66%;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작성 날짜</font></font></th>
	                                        <th style="width: 8.33%;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작성자</font></font></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${ boardtoplist }" var="boardtoplist">
		                                    <tr>
		                                        <td>
		                                            <h6 class="mb-0"><font style="vertical-align: inherit;"><a data-toggle="modal" href="#selecttn" data-tn_no="${ boardtoplist.tn_no }">${ boardtoplist.tn_title }</a></font></h6>
		                                        </td>
		                                        <td>
		                                            <div class="text-muted"><font style="vertical-align: inherit;">${ boardtoplist.tn_date }</font></div>
		                                        </td>
		                                        <td>
		                                            <div class="text-muted"><font style="vertical-align: inherit;">${ boardtoplist.userVO.user_nn }</font></div>
		                                        </td>
		                                    </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
                            </div>
                            <div class="modal fade" id="selecttn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-ml" role="document">
									<div class="modal-content">
										<form action="teamboarddelete.do" method="post">
							    		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">공지자세히보기</h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		<div class="modal-body">
							      		<input type="hidden" name="team_num" value="${ team_num }">
					                	<div class="row">
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>제목</label>
					                                <input class="form-control" type="text" name="tntitle" id="tntitle" value="" >
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>작성자</label>
					                                <input class="form-control" type="text" name="tnwriternn" id="tnwriternn" value="" >
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>작성일</label>
					                                <input class="form-control" type="date" name="tndate" id="tndate" value="" >
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>내용</label>
					                                <textarea class="form-control" name="tncontent" id="tncontent"><c:out value="" /></textarea>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group filetab">
					                                
					                            </div>
					                        </div>
					                	</div>
							      		
							      		</div>
									  	<div class="modal-footer">
					                       	<button class="btn btn-primary" data-dismiss="modal">닫기</button>
									    </div>
										</form>
									</div>
								</div>
							</div>
                        </div>                
                    </div>
                    <div class="col-xl-8 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">팀 정보</h3>
                                <div class="card-options">
                                    <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fa fa-chevron-up"></i></a>
                                    <a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fa fa-window-maximize"></i></a>
                                </div>
                            </div>
                            <div class="card-body">
                            	<div class="row clearfix">
	                    			<div class="col-md-6">
		                                <div class="row">
		                                	<div class="col-sm-12">
		                                        <div class="form-group">
		                                            <label>메인 사진</label>
		                                            <c:if test="${ empty team.team_rename_image }">
		                                            <img class="form-control card-img-top w-100" src="${ pageContext.servletContext.contextPath }/resources/img/pic.jpg" alt="courses">
		                                            </c:if>
		                                            <c:if test="${ !empty team.team_rename_image }">
		                                            <img class="form-control card-img-top w-100" src="${ pageContext.servletContext.contextPath }/resources/team_page/team_images/${ team.team_rename_image }" alt="courses">
		                                            </c:if>
		                                        </div>
		                                    </div>
		                                	<div class="col-sm-12">
		                                        <div class="form-group">
		                                            <label>팀 리더</label>
		                                            <input class="form-control" type="text" name="team_leader_user_nn" value="${ teamleader.userVO.user_nn }" readonly>
		                                        </div>
		                                    </div>
		                                	<div class="col-sm-12">
		                                        <div class="form-group">
		                                            <label>리더 소개</label>
		                                            <textarea class="form-control" name="team_leader_intro" style="height: 75px;" readonly><c:out value="${ team.team_leader_intro }" /></textarea>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <div class="form-group">
		                                            <label>팀 소개</label>
		                                            <textarea class="form-control" name="team_intro" style="height: 110px;" readonly><c:out value="${ team.team_intro }" /></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <div class="form-group">
		                                            <label>레 벨</label>
		                                            <input class="form-control" type="text" name="team_level" value="${ team.team_level }" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <div class="form-group">
		                                            <label>지 역</label>
		                                            <input class="form-control" type="text" name="team_local" value="${ team.team_local }" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <div class="form-group">
		                                            <label>활동요일</label>
		                                            <input class="form-control" type="text" name="team_act_day" value="${ team.team_act_day }" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <div class="form-group">
		                                            <label>활동비</label>
		                                            <input class="form-control" type="text" name="team_fee" value="${ team.team_fee }" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12">
		                                        <div class="form-group">
		                                            <label>활동시간</label>
		                                            <input class="form-control" type="text" name="team_act_time" value="${ team.team_act_time }" readonly>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix row-deck">
                    <div class="col-xl-8 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">일지</h3>
                            </div>
                            <div class="card-body">
                            <div class="row clearfix mt-2">
                                <div class="col-lg-4 col-md-6">
                        			<div class="card plannedcard" id="on">
				                          <div class="card-body text-center">
				                              <h6>Planned</h6>
				                              <input type="text" class="knob" value="${ planned }" data-width="90" data-height="90" data-thickness="0.1" data-fgColor="#6e7687" readonly>
				                          </div>
                        			</div>
                    			</div>
			                    <div class="col-lg-4 col-md-6">
			                        <div class="card inprogresscard" id="on">
			                            <div class="card-body text-center">
			                                <h6>In progress</h6>
			                                <input type="text" class="knob" value="${ inprogress }" data-width="90" data-height="90" data-thickness="0.1" data-fgColor="#6e7687" readonly>
			                            </div>
			                        </div>
			                    </div>
			                   	<div class="col-lg-4 col-md-6">
			                        <div class="card completecard" id="on">
			                            <div class="card-body text-center">
			                                <h6>Completed</h6>
			                                <input type="text" class="knob" value="${ complete }" data-width="90" data-height="90" data-thickness="0.1" data-fgColor="#6e7687" readonly>
			                            </div>
			                        </div>
			                    </div>
			                </div>
                            </div>
                        </div>                
                    </div>
                    <div class="col-xl-4 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">파일</h3>
                                <div class="card-options">
                                    <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fa fa-chevron-up"></i></a>
                                    <a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fa fa-window-maximize"></i></a>
                                </div>
                            </div>
                            <div class="table-responsive" style="height: 210px;">
                                <table class="table table-hover table-vcenter text-nowrap table_custom border-style list" style="table-layout: fixed">
	                                <thead>
	                                    <tr>
	                                        <th style="width: 75%;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 이름</font></font></th>
	                                        <th style="width: 25%;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">업로더</font></font></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${ filerecentlist }" var="filerecentlist">
		                                    <tr>
		                                        <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
		                                        	<c:url value="tfdown.do" var="tfdown">
					                            		<c:param name="ofile" value="${ filerecentlist.file_originalfilename }" />
					                            		<c:param name="rfile" value="${ filerecentlist.file_renamefilename }" />
					                            	</c:url>
		                                            <h6 class="mb-0"><font style="vertical-align: inherit;"><a href="${ tfdown }">${ filerecentlist.file_originalfilename }</a></font></h6>
		                                        </td>
		                                        <td>
		                                            <div class="text-muted"><font style="vertical-align: inherit;">${ filerecentlist.userVO.user_nn }</font></div>
		                                        </td>
		                                    </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/WEB-INF/views/teampage/common/tp_footer.jsp" />
    </div>    
</div>


<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/apexcharts.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/counterup.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/knobjs.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/c3.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/project-index.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/chart/knobjs.js"></script>
<script>
$(function() {
    $('#boardtoptable a').on('click', function(){
   		var tn_no = $(this).data("tn_no");
   		tn_no = parseInt(tn_no);

        $.ajax({
            url : 'selectTN.do',
            type : 'POST',
            data : {"tn_no" : tn_no},
            dataType : "json",
    		success : function(data) {
    			console.log("success : " + data);
    			//object ==> string 으로 변환
    			var jsonStr = JSON.stringify(data);
    			//string ==> json 객체로 바꿈
    			var json = JSON.parse(jsonStr);
    			
    			var ogfilename = json.list[0].tn_originalfilename;
    			var rnfilename = json.list[0].tn_renamefilename;
    			
    			$('#selecttn').modal('show');
    			$(".modal-body #tntitle").val( json.list[0].tn_title );
    			$(".modal-body #tnwriternn").val( json.list[0].tn_writer );
    			$(".modal-body #tndate").val( json.list[0].tn_date );
    			$(".modal-body #tncontent").val( json.list[0].tn_content );
    			
    			if(ogfilename != null){
    				var line = '<label>첨부 파일</label><br>'+'<a href="tndown.do?ofile='+ogfilename+'&'+'rfile='+rnfilename+'"></a>';
    				$('.modal-body .filetab').html(line);
        			$('.modal-body a').text( json.list[0].tn_originalfilename )
        			$('.modal-body #ofile').val(ogfilename);
        			$('.modal-body #rfile').val(rnfilename);
    			}else{
    				var line = '<label>첨부 파일</label><br>등록된 파일이 없습니다';
    				$(".modal-body #filetab").html(line);
    			}
	
    		},
    		error : function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    		}
    	}); //ajax
   	});
});
</script>
</body>
<!-- soccer/project/index.html  07 Jan 2020 03:37:47 GMT -->
</html>
