<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html lang="en" dir="ltr">
<!-- soccer/project/index.html  07 Jan 2020 03:37:47 GMT -->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />

<title>${ sessionScope.team_name }</title>

<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/bootstrap/css/bootstrap.min.css" />

<!-- Plugins css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" />

<!-- Core css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/main.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/css/theme1.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/fullcalendar/fullcalendar.min.css">

</head>

<body class="font-montserrat">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader"></div>
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
							<h1 class="page-title">팀 캘린더</h1>
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
                	<div class="row clearfix row-deck">
                    	<div class="col-lg-12 col-md-12">
                        	<div class="card">
                            	<div class="card-header bline">
                                	<h3 class="card-title">팀 캘린더</h3>
                                	<div class="card-options">
                                    	<a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fe fe-maximize"></i></a>
                                	</div>
                            	</div>
	                            <div class="card-body">
	                                <div id="calendar"></div>
	                            </div>					
                        	</div>
                    	</div>
                	</div>
            	</div>
       	 	</div>
			<c:import url="/WEB-INF/views/teampage/common/tp_footer.jsp" />
		</div>
	</div>
	
	<!-- Add Direct Event popup -->
	<div class="modal fade" id="addDirectEvent" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">새로운 일정</h4>
	            </div>
	            <div class="modal-body">
                   	<div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4" for="event-name">일정명</label>
                            <input class="inputModal" type="text" name="event-name" id="event-name" required/>
                        </div>
                   	</div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4" for="event-start">시작</label>
                            <input class="inputModal" type="date" name="event-start" id="event-start" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4" for="event-end">끝</label>
                            <input class="inputModal" type="date" name="event-end" id="event-end" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4" for="event-desc">설명</label>
                            <textarea rows="4" cols="50" class="inputModal" name="event-desc" id="event-desc"></textarea>
                        </div>
                    </div>
	            </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-primary" id="saveEvent">저장</button>
                    <button type="reset" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
	        </div>
	    </div>
	</div>
	<!-- Event Edit Modal popup -->
	<div class="modal fade" id="eventEditModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">일정 자세히보기</h4>
	            </div>
	            <form class="caleditform">
	            <input type="hidden" name="cal_no">
	            <input type="hidden" name="cal_writer">
	            <input type="hidden" name="team_leader" value="${ sessionScope.team_leader }">
	            <div class="modal-body">
	                <div class="row">
	                    <div class="col-md-6">
	                        <div class="form-group">
	                            <label>제목</label>
	                            <input class="form-control" name="event-title" type="text" value=""/>
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group">
	                            <label>시작</label>
	                            <input class="form-control" name="event-start" type="date" value=""/>
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group">
	                            <label>끝</label>
	                            <input class="form-control" name="event-end" type="date" value=""/>
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group">
	                            <label>내용</label>
	                            <input class="form-control" name="event-detail" type="text" value=""/>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="modal-footer">
	            	
	            </div>
	            </form>
	        </div>
	    </div>
	</div>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
<%-- <script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/calendar.js"></script> --%>
<!-- fullcalendar js -->
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/fullcalendar.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/moment.min.js"></script>
<script>
$(function() {
	var eventlist;
	var team_num = ${ sessionScope.team_num };
	$.ajax({
		url: "selectcalendarlist.do",
		async: false,
		type: "post",
		data: {"team_num" : team_num},
		dataType : "json",
		success: function(data){
			console.log("success : " + data);
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			eventlist = json.clist;
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
    	}
	}); //ajax

/*     $(".save-event").on('click', function() {
        var categoryName = $('#addNewEvent form').find("input[name='category-name']").val();
        var categoryColor = $('#addNewEvent form').find("select[name='category-color']").val();
        if (categoryName !== null && categoryName.length != 0) {
            $('#event-list').append('<div class="fc-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '">' + categoryName + '</div>');
            $('#addNewEvent form').find("input[name='category-name']").val("");
            $('#addNewEvent form').find("select[name='category-color']").val("");
            enableDrag();
        }
    }); */
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }
    var current = yyyy + '-' + mm + '-';
    var calendar = $('#calendar');
    // Add direct event to calendar
    var newEvent = function(start) {
        $('#addDirectEvent input[name="event-name"]').val("");
		$('#addDirectEvent input[name="event-start"]').val("");
		$('#addDirectEvent input[name="event-end"]').val("");
		$('#addDirectEvent textarea[name="event-desc"]').val("");
        $('#addDirectEvent').modal('show');
        $('#addDirectEvent #saveEvent').unbind();
        $('#addDirectEvent #saveEvent').on('click', function() {
        	var team_num = ${ sessionScope.team_num };
			var cal_writer = ${ sessionScope.loginMember.user_no };
            var cal_title = $('#addDirectEvent input[name="event-name"]').val();
            var cal_startdate = $('#addDirectEvent input[name="event-start"]').val();
			var cal_enddate = $('#addDirectEvent input[name="event-end"]').val();
			var cal_detail = $('#addDirectEvent textarea[name="event-desc"]').val();
			var eventData = {
				title: cal_title,
				start: cal_startdate,
				end: cal_enddate,
				cal_writer: cal_writer,
				team_num: team_num,
				cal_detail: cal_detail
			}
			
			if (eventData.start > eventData.end){
				alert('끝나는 날짜가 앞설 수 없습니다.');
				return false;
			}
			
			if (eventData.title === ''){
				alert("일정명은 필수입니다.");
				return false;
			}
			
			if (eventData.start === ''){
				alert("시작일은 필수입니다.");
				return false;
			}
			
			if (eventData.end === ''){
				alert("마지막일은 필수입니다.");
				return false;
			}
			
			if (eventData.cal_detail === ''){
				alert("내용은 필수입니다.");
				return false;
			}
			
			eventData.start = moment(eventData.start).format('YYYY-MM-DD');
			eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
			
            calendar.fullCalendar('renderEvent', eventData, true);
            $('#addDirectEvent').modal('hide');
			
			$.ajax({
				type: "post",
				url: "insertCalendar.do",
				data: eventData,
				dataType: "json",
				success: function(result){
					var jsonStr = JSON.stringify(result);
					if(jsonStr === "insert error"){
						alert("일정 저장 실패함.");
					}
					location.href="moveTPcalendar.do?team_num=" + team_num;
				},
				error: function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    			}
			});
			
        });
    }
    // initialize the calendar
    calendar.fullCalendar({
        header: {
	                left   : 'today, prevYear, nextYear',
	                center : 'prev, title, next',
	                right  : 'month'
	            },
        editable: false,
		locale: 'ko',
        droppable: true,
        eventLimit: true, // allow "more" link when too many events
        selectable: true,
        eventRender: function(eventObj, $el) {
	      $el.popover({
	        title: eventObj.title,
	        content: '작성자 : ' + eventObj.username + '<br>' + '내용 : ' + eventObj.description,
	        trigger: 'hover',
	        placement: 'top',
	        container: 'body',
	        html: true
	      });
    	},
		events: eventlist,
        select: function(start, end, allDay) {
            newEvent(start);
        },
        eventClick: function(calEvent, jsEvent, view) {
            //var title = prompt('Event Title:', calEvent.title, { buttons: { Ok: true, Cancel: false} });
            var eventModal = $('#eventEditModal');
            eventModal.modal('show');
            eventModal.find('input[name="cal_no"]').val(calEvent._id);
            eventModal.find('input[name="cal_writer"]').val(calEvent.cal_writer);
            eventModal.find('input[name="event-title"]').val(calEvent.title);
            var startdate = new Date(calEvent.start);
            var enddate = new Date(calEvent.end);
            eventModal.find('input[name="event-start"]').val(dateFormat(startdate));
            eventModal.find('input[name="event-end"]').val(dateFormat(enddate));
            eventModal.find('input[name="event-detail"]').val(calEvent.description);
            
            //사용자에 따라 보이는 페이지가 다른경우
            $('.modal-footer button').remove();
            if (${ sessionScope.loginMember.user_no } == calEvent.cal_writer){
            	var line1 = '<button type="button" class="updateCalendar btn mr-auto btn-danger">수정</button>';
            	eventModal.find('.modal-footer').append(line1);
            }
            if (${ sessionScope.loginMember.user_no } == calEvent.cal_writer  || ${ sessionScope.team_leader eq 'Y' }){
            	var line2 = '<button type="button" class="deleteCalendar btn btn-primary">삭제</button>';
            	eventModal.find('.modal-footer').append(line2);
            }
            var line3 = '<button type="reset" class="btn btn-default" data-dismiss="modal">닫기</button>';
            eventModal.find('.modal-footer').append(line3);
            
        }
    });
    function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day;
	}
    
});

</script>
<script>
$(document).on('click', '#eventEditModal .deleteCalendar', function(){
	var id = $('#eventEditModal input[name="cal_no"]').val();
	var team_num = ${ sessionScope.team_num };
	$.ajax({
		url: "deleteCalendar.do",
		type: "post",
		data: {"cal_no" : id},
		success: function(result){
			var jsonStr = JSON.stringify(result);
			if(jsonStr === "delete error"){
				alert("일정 삭제 실패함.");
			}
			location.href="moveTPcalendar.do?team_num=" + team_num;
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
    	}
	}); //ajax
});

//일정수정용
$(document).on('click', '#eventEditModal .updateCalendar', function(){
	var calno = $('#eventEditModal input[name="cal_no"]').val();
	var calwriter = $('#eventEditModal input[name="cal_writer"]').val();
	var caltitle = $('#eventEditModal input[name="event-title"]').val();
	var teamnum = ${ sessionScope.team_num };
	var calstartdate = $('#eventEditModal input[name="event-start"]').val();
	var calenddate = $('#eventEditModal input[name="event-end"]').val();
	var caldetail = $('#eventEditModal input[name="event-detail"]').val();
	
	//객체생성
	var Calendar = {
			cal_no: calno,
			team_num: teamnum,
			cal_title: caltitle,
			cal_writer: calwriter,
			cal_startdate: calstartdate,
			cal_enddate: calenddate,
			cal_detail: caldetail
	};
	//date 변환
	Calendar.cal_startdate = moment(Calendar.cal_startdate).format('YYYY-MM-DD');
	Calendar.cal_enddate = moment(Calendar.cal_enddate).add(1, 'days').format('YYYY-MM-DD');
	$.ajax({
		url: "updateCalendar.do",
		type: "post",
		data: Calendar,
		success: function(result){
			var jsonStr = JSON.stringify(result);
			if(jsonStr === "update error"){
				alert("일정 수정 실패함.");
			}
			location.href="moveTPcalendar.do?team_num=" + teamnum;
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
    	}
	}); //ajax
});
</script>
</body>
<!-- soccer/project/index.html  07 Jan 2020 03:37:47 GMT -->
</html>
