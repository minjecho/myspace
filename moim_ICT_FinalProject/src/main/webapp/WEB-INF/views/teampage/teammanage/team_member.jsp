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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/sweetalert/sweetalert.css"/>
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
                        <h1 class="page-title">팀원 관리</h1>                        
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
        <div class="section-body" style="padding-top: 10px;">
            <div class="container-fluid">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="list" role="tabpanel">
                        <div class="row-vh clearfix" style="height: 800px;">
                            <div class="col-lg-12 h-25">
	                            <div class="card-header">
	                                <h3 class="card-title">신청 목록</h3>
	                            </div>
                                <div class="table-responsive" id="users" style="height: 165px;">
                                    <table class="table table-hover table-vcenter text-nowrap table_custom border-style list">
                       					<thead>
                       						<tr class="text-center">
                                                <td>
                                                    <div class="text-muted">아이디</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">닉네임</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">나이</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">성별</div>
                                                </td>
                                                <td class="hidden-xs">
                                                    <div class="text-muted">이메일</div>
                                                </td>
                                                <td class="text-center" width="150px">
                                                </td>
                                            </tr>
                       					</thead>
                       					<tbody>
                       						<c:forEach items="${ joinlist }" var="joinlist">
                       							<input type="hidden" name="join_num" id="join_num" value="${ joinlist.join_num }">
	                                    		<tr class="joininfo">
	                                                <td>
	                                                    <div class="text-center">${ joinlist.userVO.user_id }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ joinlist.userVO.user_nn }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ joinlist.userVO.age }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ joinlist.userVO.gender }</div>
	                                                </td>
	                                                <td class="hidden-xs">
	                                                    <div class="text-muted">${ joinlist.userVO.email }</div>
	                                                </td>
	                                                <td class="text-center">
	                                                    <button type="button" class="open-selectjoinmember btn btn-primary" data-toggle="modal" data-target="#selectjoinmember" data-join_num="${ joinlist.join_num }">
	                                                    	<font style="vertical-align: inherit;">신청서 확인</font>
	                                                    </button>
	                                                </td>
	                                            </tr>
                           					</c:forEach>
	                                	</tbody>
                                    </table>
                                </div>
                           	</div>
                           	
                           	<!-- Modal -->
							<div class="modal fade" id="selectjoinmember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-ml" role="document">
									<div class="modal-content">
										<form action="tminsert.do" method="post">
							    		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">신청서 확인</h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		<div class="modal-body" id="joinmemberdiv">
							      		<input type="hidden" name="team_num" value="${ team_num }">
							      		<input type="hidden" name="user_no" id="user_no" value="">
							      		<input type="hidden" name="join_num" id="join_num" value="">
							      		<input type="hidden" name="join_rename_filename" id="join_rename_filename" value="">
							      		
					                	<div class="row">
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>아이디</label>
					                                <input class="form-control" type="text" name="user_id" id="user_id" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>닉네임</label>
					                                <input class="form-control" type="text" name="user_nn" id="user_nn" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>나 이</label>
					                                <input class="form-control" type="text" name="age" id="age" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>성 별</label>
					                                <input class="form-control" type="text" name="gender" id="gender" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>이메일</label>
					                                <input class="form-control" type="text" name="email" id="email" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>지원자 소개</label>
					                                <textarea class="form-control" name="join_intro" id="join_intro" readonly><c:out value="" /></textarea>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>첨부 파일</label>
					                                <a><input class="form-control" type="text" name="join_original_filename" id="join_original_filename" value="" readonly></a>
					                            </div>
					                        </div>
					                	</div>
							      		
							      		</div>
									  	<div class="modal-footer">
				                        	<button type="submit" class="btn btn-primary btn-lg" style="position: relative; left: -20px; z-index: 1;">수락</button>
									    </div>
										</form>
										<form action="tjdelete.do" method="post" style="position: relative; top: -53px;">
										<div id="deletefooter">
											<input type="hidden" name="join_num" id="join_num" value="">
											<input type="hidden" name="team_num" id="team_num" value="${ team_num }">
											<button type="submit" class="btn btn-primary btn-lg" style="position: relative; left: 310px; z-index: 1;">거절</button>
										</div>
										</form>
									</div>
								</div>
							</div>
                           	
                          	<div class="col-lg-12 h-75" style="padding-top: 10px">
                            <div class="card-header">
                                <h3 class="card-title">팀원 목록</h3>
                            </div>
                                <div class="table-responsive" id="users" style="height: 550px;">
                                    <table class="table table-hover table-vcenter text-nowrap table_custom border-style list">
                                        <thead>
                                        	<tr class="text-center">
                                                <td>
                                                    <div class="text-muted">아이디</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">닉네임</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">나이</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">성별</div>
                                                </td>
                                                <td class="hidden-xs">
                                                    <div class="text-muted">이메일</div>
                                                </td>
                                                <td>
                                                    <div class="text-muted">등급</div>
                                                </td>
                                                <td class="hidden-ms">
                                                    <div class="text-muted">합류 날짜</div>
                                                </td>
                                                <td class="text-center" width="250px">
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                       						<c:forEach items="${ memberlist }" var="memberlist">
	                                    		<tr class="memberlist">
	                                                <td>
	                                                    <div class="text-center">${ memberlist.userVO.user_id }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ memberlist.userVO.user_nn }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ memberlist.userVO.age }</div>
	                                                </td>
	                                                <td>
	                                                    <div class="text-center">${ memberlist.userVO.gender }</div>
	                                                </td>
	                                                <td class="hidden-xs">
	                                                    <div class="text-muted">${ memberlist.userVO.email }</div>
	                                                </td>
	                                                <td>
	                                                	<c:if test="${ memberlist.team_member_leader eq 'Y' }">
	                                                    	<div class="text-center">팀장</div>
	                                                    </c:if>
	                                                    <c:if test="${ memberlist.team_member_leader eq 'N' }">
	                                                    	<div class="text-center">팀원</div>
	                                                    </c:if>
	                                                </td>
	                                                <td class="hidden-ms">
	                                                    <div class="text-muted">${ memberlist.team_member_date }</div>
	                                                </td>
	                                                <td class="text-center">
	                                                	<c:if test="${ memberlist.team_member_leader eq 'N' }">
		                                                    <button type="button" class="open-changerank btn btn-primary" id="rankchange" data-toggle="modal" data-target="#changerankmodal" data-team_member_no="${ memberlist.team_member_no }">
		                                                    	<font style="vertical-align: inherit;">팀장 위임</font>
		                                                    </button>
		                                                    <button type="button" class="open-deletemember btn btn-primary" id="memberdelete" data-toggle="modal" data-target="#deletemembermodal" data-team_member_no="${ memberlist.team_member_no }">
		                                                    	<font style="vertical-align: inherit;">회원 강퇴</font>
		                                                    </button>
	                                                    </c:if>
	                                                </td>
                                            	</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                           	</div>
                           	
                           	<!-- Modal -->
							<div class="modal fade" id="changerankmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-ml" role="document">
									<div class="modal-content">
										<form action="tmrankupdate.do" method="post">
							    		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">팀장 위임</h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		<div class="modal-body" id="changerankdiv">
							      		<input type="hidden" name="team_num" value="${ team_num }">
							      		<input type="hidden" name="user_no" id="user_no" value="">
							      		<input type="hidden" name="team_member_no" id="team_member_no" value="">
							      		
					                	<div class="row">
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>아이디</label>
					                                <input class="form-control" type="text" name="user_id" id="user_id" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>닉네임</label>
					                                <input class="form-control" type="text" name="user_nn" id="user_nn" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>나 이</label>
					                                <input class="form-control" type="text" name="age" id="age" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>성 별</label>
					                                <input class="form-control" type="text" name="gender" id="gender" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>이메일</label>
					                                <input class="form-control" type="text" name="email" id="email" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>등급</label>
					                                <input class="form-control" type="text" id="team_member_leader" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>가입 날짜</label>
					                                <input class="form-control" type="text" name="team_member_date" id="team_member_date" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group text-center">
					                                <h4><font style="vertical-align: inherit;">정말로 팀장을 위임하시겠습니까?</font></h4>
					                            </div>
					                        </div>
					                	</div>
							      		
							      		</div>
									  	<div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									        <button type="submit" class="btn btn-primary">변경</button>
									    </div>
										</form>
									</div>
								</div>
							</div>
							
							<!-- Modal -->
							<div class="modal fade" id="deletemembermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-ml" role="document">
									<div class="modal-content">
										<form action="tmdelete.do" method="post">
							    		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">팀원 강퇴</h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		<div class="modal-body" id="deletememberdiv">
							      		<input type="hidden" name="team_num" value="${ team_num }">
							      		<input type="hidden" name="user_no" id="user_no" value="">
							      		<input type="hidden" name="team_member_no" id="team_member_no" value="">
							      		
					                	<div class="row">
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>아이디</label>
					                                <input class="form-control" type="text" name="user_id" id="user_id" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>닉네임</label>
					                                <input class="form-control" type="text" name="user_nn" id="user_nn" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>나 이</label>
					                                <input class="form-control" type="text" name="age" id="age" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>성 별</label>
					                                <input class="form-control" type="text" name="gender" id="gender" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>이메일</label>
					                                <input class="form-control" type="text" name="email" id="email" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>등급</label>
					                                <input class="form-control" type="text" id="team_member_leader" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group">
					                                <label>가입 날짜</label>
					                                <input class="form-control" type="text" name="team_member_date" id="team_member_date" value="" readonly>
					                            </div>
					                        </div>
					                        <div class="col-sm-12">
					                            <div class="form-group text-center">
					                                <h4><font style="vertical-align: inherit;">정말로 팀원을 강퇴하시겠습니까?</font></h4>
					                            </div>
					                        </div>
					                	</div>
							      		
							      		</div>
									  	<div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									        <button type="submit" class="btn btn-primary btn-danger">강퇴</button>
									    </div>
										</form>
									</div>
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


<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/lib.vendor.bundle.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/bundles/sweetalert.bundle.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/dropify/js/dropify.min.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/core.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/team_page/js/page/sweetalert.js"></script>
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
    
   	$('.joininfo button').on('click', function(){
   		console.log("script run");
   		var join_num = $(this).data("join_num");
   		var join_num_int = parseInt(join_num);
   		console.log("join_num : " + join_num);

        $.ajax({
            url : 'tjselect.do',
            type : 'POST',
            data : {"join_num" : join_num_int},
            dataType : "json",
    		success : function(data) {
    			console.log("success : " + data);
    			
    			//object ==> string 으로 변환
    			var jsonStr = JSON.stringify(data);
    			//string ==> json 객체로 바꿈
    			var json = JSON.parse(jsonStr);
    			
    			$('#selectjoinmember').modal('show');
    			
    			$("#joinmemberdiv #user_no").val( json.list[0].user_no );
    			$("#joinmemberdiv #user_id").val( json.list[0].user_id );
    			$("#joinmemberdiv #user_nn").val( json.list[0].user_nn );
    			$("#joinmemberdiv #age").val( json.list[0].age );
    			$("#joinmemberdiv #gender").val( json.list[0].gender );
    			$("#joinmemberdiv #email").val( json.list[0].email );
    			$("#joinmemberdiv #join_num").val( json.list[0].join_num );
    			$("#joinmemberdiv #join_intro").val( json.list[0].join_intro );
    			$("#joinmemberdiv #join_original_filaname").val( json.list[0].join_original_filaname );
    			$("#joinmemberdiv #join_rename_filaname").val( json.list[0].join_rename_filaname );
    			
    			$("#deletefooter #join_num").val( json.list[0].join_num );
    		},
    		error : function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    		}
    	}); //ajax
   	});
   	
   	$('.memberlist #rankchange').on('click', function(){
   		console.log("script run");
   		var team_member_no_val = $(this).data("team_member_no");
   		var team_member_no = parseInt(team_member_no_val);
   		console.log("team_member_no : " + team_member_no);

        $.ajax({
            url : 'tmselect.do',
            type : 'POST',
            data : {"team_member_no" : team_member_no},
            dataType : "json",
    		success : function(data) {
    			console.log("success : " + data);
    			
    			//object ==> string 으로 변환
    			var jsonStr = JSON.stringify(data);
    			//string ==> json 객체로 바꿈
    			var json = JSON.parse(jsonStr);
    			
    			$('#changerankmodal').modal('show');
    			
    			$("#changerankdiv #user_no").val( json.list[0].user_no );
    			$("#changerankdiv #user_id").val( json.list[0].user_id );
    			$("#changerankdiv #user_nn").val( json.list[0].user_nn );
    			$("#changerankdiv #age").val( json.list[0].age );
    			$("#changerankdiv #gender").val( json.list[0].gender );
    			$("#changerankdiv #email").val( json.list[0].email );
    			$("#changerankdiv #team_member_no").val( json.list[0].team_member_no );
    			$("#changerankdiv #team_member_date").val( json.list[0].team_member_date );
    			
    			console.log(json.list[0].team_member_leader);
    			
    			if(json.list[0].team_member_leader === "Y") {
    				$("#changerankdiv #team_member_leader").val("팀장");
    			} else {
    				$("#changerankdiv #team_member_leader").val("팀원");
    			}
    		},
    		error : function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    		}
    	}); //ajax
   	});
   	
   	$('.memberlist #memberdelete').on('click', function(){
   		console.log("script run");
   		var team_member_no_val = $(this).data("team_member_no");
   		var team_member_no = parseInt(team_member_no_val);
   		console.log("team_member_no : " + team_member_no);

        $.ajax({
            url : 'tmselect.do',
            type : 'POST',
            data : {"team_member_no" : team_member_no},
            dataType : "json",
    		success : function(data) {
    			console.log("success : " + data);
    			
    			//object ==> string 으로 변환
    			var jsonStr = JSON.stringify(data);
    			//string ==> json 객체로 바꿈
    			var json = JSON.parse(jsonStr);
    			
    			$('#deletemembermodal').modal('show');
    			
    			$("#deletememberdiv #user_no").val( json.list[0].user_no );
    			$("#deletememberdiv #user_id").val( json.list[0].user_id );
    			$("#deletememberdiv #user_nn").val( json.list[0].user_nn );
    			$("#deletememberdiv #age").val( json.list[0].age );
    			$("#deletememberdiv #gender").val( json.list[0].gender );
    			$("#deletememberdiv #email").val( json.list[0].email );
    			$("#deletememberdiv #team_member_no").val( json.list[0].team_member_no );
    			$("#deletememberdiv #team_member_date").val( json.list[0].team_member_date );
    			
    			console.log(json.list[0].team_member_leader);
    			
    			if(json.list[0].team_member_leader === "Y") {
    				$("#deletememberdiv #team_member_leader").val("팀장");
    			} else {
    				$("#deletememberdiv #team_member_leader").val("팀원");
    			}
    		},
    		error : function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    		}
    	}); //ajax
   	});
   	
});

function deleteJoinMember() {
	var join_num_val = $('.modal-body #join_num').val();
	var join_num = parseInt(join_num_val);
	var team_num_val = $('.modal-body #team_num').val();
	var team_num = parseInt(team_num_val);
	
	location.href="${ pageContext.servletContext.contextPath }/tjdelete.do?join_num=" + join_num + "&team_num=" + team_num;
}
</script>
</body>
</html>