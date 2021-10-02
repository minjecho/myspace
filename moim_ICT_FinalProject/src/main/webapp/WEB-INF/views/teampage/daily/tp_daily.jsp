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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/nestable/jquery-nestable.css"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" />
<!-- Core css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/main.css"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/theme1.css"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.modal {
	position: absolute;
	float: left;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
</style>
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
                        <h1 class="page-title">할일 페이지</h1>   
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
        <div class="section-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-md-flex justify-content-between align-items-center">
                            <ul class="nav nav-tabs page-header-tab">
                                <li class="nav-item"><a class="nav-link active" id="TaskBoard-tab" data-toggle="tab" href="#TaskBoard-list">List View</a></li>
                            </ul>
                            <div class="header-action d-flex">
                            	<input onkeyup="filter()" type="text" id="value" placeholder="Search for...">
                            	&nbsp;
                                <button id="addbutton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addtask"><i class="fa fa-plus fa-1" aria-hidden="true"></i>추가</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix mt-2">
                    <div class="col-lg-4 col-md-6">
                        <div class="card plannedcard" id="on">
                            <div class="card-body text-center">
                                <h6>Planned</h6>
                                <a href="#">
                                <input type="text" class="knob" value="${ planned }" data-width="90" data-height="90" data-thickness="0.1" data-fgColor="#6e7687" readonly>
                                </a>
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
        <div class="section-body">
            <div class="container-fluid">
                <div class="tab-content taskboard">
                    <div class="tab-pane fade show active" id="TaskBoard-list" role="tabpanel">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-vcenter mb-0 table_custom spacing8 text-nowrap" style="overflow: scroll;">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th style="color:black;">#</th>
                                                <th style="color:black;">작업내용</th>
                                                <th style="color:black;">작성자</th>
                                                <th style="color:black;">작업시작일</th>
                                                <th style="color:black;">작업상태</th>
                                                <th class="w200"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${ tdlist }" var="itdlist" varStatus="status">
                                        	<c:if test="${ itdlist.daily_progress eq 1}">
                                            	<tr class="planned dailytb" style="text-align: center;">
                                            </c:if>
                                            <c:if test="${ itdlist.daily_progress eq 2}">
                                            	<tr class="inprogress dailytb" style="text-align: center;">
                                            </c:if>
                                           	<c:if test="${ itdlist.daily_progress eq 3}">
                                           		<tr class="complete dailytb" style="text-align: center;">
                                           	</c:if>
                                                <td style="width: 5%;">${ tdlistlength - status.index }</td>
                                                <td class="contenttab" style="width: 50%;">
                                                    ${ itdlist.daily_content }
                                                </td>
                                                <td class="usernntab" style="width: 10%;">
                                                    ${ itdlist.userVO.user_nn }
                                                </td>
                                                <td style="width: 10%;">
                                                    <div class="text-info">${ itdlist.daily_date }</div>
                                                </td>
                                                <td style="width: 5%;">
                                                	<c:if test="${ itdlist.daily_progress eq 1}">
                                                    <span class="tag tag-blue">Planned</span>
                                                    </c:if>
                                                    <c:if test="${ itdlist.daily_progress eq 2}">
                                                    <span class="tag tag-green">In Progress</span>
                                                    </c:if>
                                                    <c:if test="${ itdlist.daily_progress eq 3}">
                                                    <span class="tag tag-orange">Complete</span>
                                                    </c:if>
                                                </td >
                                                <td style="width: 20%;">
                                                	<c:if test="${ itdlist.daily_writer eq sessionScope.loginMember.user_no }">
                                                		<c:if test="${ itdlist.daily_progress eq 1}">
                                                		<c:url var="updatedaily" value="/updatedaily.do">
													    	<c:param name="daily_no" value="${ itdlist.daily_no }"/>
													    	<c:param name="daily_progress" value="${ itdlist.daily_progress }"/>
												    	</c:url>
                                                   		<button type="button" onclick="location.href='${ updatedaily }'" class="btn btn-primary">시작하기</button>
                                                    	</c:if>
                                                    	<c:if test="${ itdlist.daily_progress eq 2}">
                                                    	<c:url var="updatedaily" value="/updatedaily.do">
													    	<c:param name="daily_no" value="${ itdlist.daily_no }"/>
													    	<c:param name="daily_progress" value="${ itdlist.daily_progress }"/>
												    	</c:url>
                                                   		<button type="button" onclick="location.href='${ updatedaily }'" class="btn btn-primary" style="background: green;">완료하기</button>
                                                    	</c:if>
                                                	</c:if>
                                                	<c:if test="${ itdlist.daily_writer eq sessionScope.loginMember.user_no || sessionScope.team_leader eq 'Y' }">
                                                		<c:url var="deletedaily" value="/deletedaily.do">
												    		<c:param name="daily_no" value="${ itdlist.daily_no }"/>
												    	</c:url>
                                                    	<button type="button" onclick="location.href='${ deletedaily }'" class="btn btn-primary" style="background: #dc3545;">삭제하기</button>
                                                	</c:if>
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
        </div>
        <c:import url="/WEB-INF/views/teampage/common/tp_footer.jsp" />
    </div>
</div>

<!-- Add New Task -->
<div class="modal fade" id="addtask" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="title" id="defaultModalLabel">할일 추가하기</h6>
            </div>
            <form class="dailyform" action="tdinsert.do" method="POST">
	            <div class="modal-body">
	            	<input type="hidden" name="daily_writer" value=1>
	            	<input type="hidden" name="team_num" value=1>
	                <div class="row clearfix">
	                    <div class="col-12">
	                        <div class="form-group">
	                        	<label>할일</label>   
	                            <textarea class="form-control" placeholder="Description" name="daily_content" required></textarea>
	                        </div>
	                    </div>
	                    <div class="col-12">
	                        <label>시작일</label>
	                        <div class="input-daterange input-group">
	                            <input type="text" id="datepicker" class="form-control" name="daily_date" required>
	                        </div>
	                        <!-- <div class="input-daterange input-group" data-provide="datepicker">
	                            <input type="text" class="form-control" name="start">
	                        </div> -->
	                    </div>                
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="submit" class="btn btn-primary">저장</button>
	                <button type="reset" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
            </form>
        </div>
    </div>
</div>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/knobjs.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/nestable.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/sortable-nestable.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/chart/knobjs.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.plannedcard').css("background-color", "lightgreen");
	$('.inprogresscard').css("background-color", "lightgreen");
	$('.completecard').css("background-color", "lightgreen");
});

$(function() {
	$('.plannedcard').on("click", function(){
		var status = $('.plannedcard').attr('id');
		if(status == "off"){
			$('.plannedcard').attr('id', 'on');
			$('.plannedcard').css("background-color", "lightgreen");
			$('.planned').css("display", "");
		}else{
			$('.plannedcard').attr('id', 'off');
			$('.plannedcard').css("background-color", "#fff");
			$('.planned').css("display", "none");
		}
	});
	
	$('.inprogresscard').on("click", function(){
		var status = $('.inprogresscard').attr('id');
		if(status == "off"){
			$('.inprogresscard').attr('id', 'on');
			$('.inprogresscard').css("background-color", "lightgreen");
			$('.inprogress').css("display", "");
		}else{
			$('.inprogresscard').attr('id', 'off');
			$('.inprogresscard').css("background-color", "#fff");
			$('.inprogress').css("display", "none");
		}
	});
	
	$('.completecard').on("click", function(){
		var status = $('.completecard').attr('id');
		if(status == "off"){
			$('.completecard').attr('id', 'on');
			$('.completecard').css("background-color", "lightgreen");
			$('.complete').css("display", "");
		}else{
			$('.completecard').attr('id', 'off');
			$('.completecard').css("background-color", "#fff");
			$('.complete').css("display", "none");
		}
	});
});
</script>
<script>
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        beforeShow: function() {
            setTimeout(function(){
                $('.ui-datepicker').css('z-index', 99999999999999);
            }, 0);
        }
    });

    $(function() {
        $("#datepicker").datepicker();
    });
</script>
<script type="text/javascript">
	function filter(){
		var value = document.getElementById("value").value.toUpperCase();
		var tablerow = document.getElementsByClassName("dailytb");
		for(var i=0; i<tablerow.length; i++){
			var contenttab = tablerow[i].getElementsByClassName("contenttab");
			var usernntab = tablerow[i].getElementsByClassName("usernntab");
			if(contenttab[0].innerText.toUpperCase().includes(value) || usernntab[0].innerText.toUpperCase().includes(value)){
				tablerow[i].style.display = ""
			}else{
				tablerow[i].style.display = "none"
			}
		}
	}
</script>
</body>
</html>