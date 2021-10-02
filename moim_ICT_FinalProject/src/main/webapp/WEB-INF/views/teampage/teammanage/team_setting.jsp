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
                        <h1 class="page-title">팀 정보 관리</h1>
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
	                <div class="row clearfix">
	                    <div class="col-md-6">
	                        <div class="card">
	                            <div class="card-header">
	                                <h3 class="card-title">정보</h3>
	                            </div>
	                            <div class="card-body">
	                            	<div class="row">
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>팀명</label>
	                                            <input class="form-control" type="text" name="team_name" value="${ team.team_name }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>팀 소개</label>
	                                            <textarea class="form-control" name="team_intro" style="height: 78px;" readonly><c:out value="${ team.team_intro }" /></textarea>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>리더 소개</label>
	                                            <textarea class="form-control" name="team_leader_intro" style="height: 78px;" readonly><c:out value="${ team.team_leader_intro }" /></textarea>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>메인 사진</label>
	                                            <c:if test="${ empty team.team_original_image }">
	                                            	<input class="form-control" type="text" value="등록된 사진이 없습니다." readonly>
	                                            </c:if>
	                                            <c:if test="${ !empty team.team_original_image }">
	                                            	<input class="form-control" type="text" value="${ team.team_original_image }" readonly>
	                                            </c:if>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>팀 인원 제한</label>
	                                            <input class="form-control" type="number" name="team_limit" value="${ team.team_limit }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>모집 여부</label> <br>
	                                            <input class="form-control" type="text" name="team_recruit" value="${ team.team_recruit }" readonly>
	                                        </div>
	                                    </div>
	                                </div>               
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="card">
	                            <div class="card-header">
	                                <h3 class="card-title">설정</h3>
	                            </div>
	                            <div class="card-body">
	                                <div class="row">
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>레벨</label>
												<input class="form-control" type="text" name="team_level" value="${ team.team_level }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>지역</label>
	                                            <input class="form-control" type="text" name="team_local" value="${ team.team_local }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>분야</label>
                                            	<c:if test="${ team.field_num eq 1 }">
													<input class="form-control" type="text" name="field_num" value="영어" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 2 }">
													<input class="form-control" type="text" name="field_num" value="중국어" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 3 }">
													<input class="form-control" type="text" name="field_num" value="기타 언어" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 4 }">
													<input class="form-control" type="text" name="field_num" value="프로그래밍" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 5 }">
													<input class="form-control" type="text" name="field_num" value="인문학/책" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 6 }">
													<input class="form-control" type="text" name="field_num" value="사진/영상" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 7 }">
													<input class="form-control" type="text" name="field_num" value="음악/악기" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 8 }">
													<input class="form-control" type="text" name="field_num" value="자격증" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 9 }">
													<input class="form-control" type="text" name="field_num" value="공모전" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 10 }">
													<input class="form-control" type="text" name="field_num" value="고시/공무원" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 11 }">
													<input class="form-control" type="text" name="field_num" value="기타학문" readonly>
												</c:if>
												<c:if test="${ team.field_num eq 12 }">
													<input class="form-control" type="text" name="field_num" value="자유주제" readonly>
												</c:if>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>요일</label>
	                                            <input class="form-control" type="text" name="team_act_day" value="${ team.team_act_day }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>기간</label>
	                                            <input class="form-control" type="number" name="team_act_week" value="${ team.team_act_week }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>시간</label>
	                                            <input class="form-control" type="text" name="team_act_time" value="${ team.team_act_time }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-12">
	                                        <div class="form-group">
	                                            <label>팀 활동비</label>
	                                            <input class="form-control" type="number" name="team_fee" value="${ team.team_fee }" readonly>
	                                        </div>
	                                    </div>
	                                </div>                
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="section-body">
	            <div class="container-fluid">
	                <div class="row clearfix">
				        <div class="col-md-12">
				        	<div class="card" style="border: none; background: #f5f5f5;">
					            <div class="col-sm-12 text-right m-t-20">
					                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">수정</button>
					            </div>
				        	</div>
				    	</div>
					</div>
				</div>
			</div>
        
        <!-- Modal -->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
		    	<div class="modal-content">
		      		<form action="tsupdate.do" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="exampleModalLabel">팀 정보 수정</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
					<input type="hidden" name="team_num" value="${ team.team_num }">
					<input type="hidden" name="team_original_image" value="${ team.team_original_image }">
					<input type="hidden" name="team_rename_image" value="${ team.team_rename_image }">
				
		       		<div class="section-body" style="padding-top: 10px;">
						<div class="container-fluid">
						    <div class="row clearfix">
						        <div class="col-md-6">
						            <div class="card">
						                <div class="card-header">
						                    <h3 class="card-title">정보</h3>
						                </div>
						                <div class="card-body">
						                	<div class="row">
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>팀명</label>
						                                <input class="form-control" type="text" name="team_name" value="${ team.team_name }" readonly>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>팀 소개</label>
						                                <textarea class="form-control" name="team_intro" style="height: 78px;"><c:out value="${ team.team_intro }" /></textarea>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>리더 소개</label>
						                                <textarea class="form-control" name="team_leader_intro" style="height: 78px;"><c:out value="${ team.team_leader_intro }" /></textarea>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>메인 사진</label>
						                                <c:if test="${ empty team.team_original_image }">
						                                	<input class="form-control dropify" type="file" name="upfile">
						                                </c:if>
						                                <c:if test="${ !empty team.team_original_image }">
						                                	<input class="form-control" type="text" value="${ team.team_original_image }">
						                                	<input class="form-control dropify" type="file" name="upfile"> <br>
						                                </c:if>
						                            </div>
						                        </div>
						                    </div>               
						                </div>
						            </div>
						        </div>
						        <div class="col-md-6">
						            <div class="card">
						                <div class="card-header">
						                    <h3 class="card-title">설정</h3>
						                </div>
						                <div class="card-body">
						                    <div class="row">
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>레벨</label>
															<c:if test="${ team.team_level eq '초급' }">
																<c:set var="selected0" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_level eq '중급' }">
																<c:set var="selected1" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_level eq '상급' }">
																<c:set var="selected2" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_level eq '최상급' }">
																<c:set var="selected3" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_level eq '전체' }">
																<c:set var="selected4" value='selected="selected"' />
															</c:if>
						                                <select class="form-control" name="team_level">
						                                    <option value="초급" ${ selected0 }>초급</option>
						                                    <option value="중급" ${ selected1 }>중급</option>
						                                    <option value="상급" ${ selected2 }>상급</option>
						                                    <option value="최상급" ${ selected3 }>최상급</option>
						                                    <option value="전체" ${ selected4 }>전체</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>지역</label>
						                                <input class="form-control" type="text" name="team_local" value="${ team.team_local }">
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>분야</label>
						                                	<c:if test="${ team.field_num eq 1 }">
																<c:set var="selected0" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 2 }">
																<c:set var="selected1" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 3 }">
																<c:set var="selected2" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 4 }">
																<c:set var="selected3" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 5 }">
																<c:set var="selected4" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 6 }">
																<c:set var="selected5" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 7 }">
																<c:set var="selected6" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 8 }">
																<c:set var="selected7" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 9 }">
																<c:set var="selected8" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 10 }">
																<c:set var="selected9" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 11 }">
																<c:set var="selected10" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.field_num eq 12 }">
																<c:set var="selected11" value='selected="selected"' />
															</c:if>
						                                <select class="form-control" name="field_num">
						                                    <option value="1" ${ selected0 }>영어</option>
						                                    <option value="2" ${ selected1 }>중국어</option>
						                                    <option value="3" ${ selected2 }>기타 언어</option>
						                                    <option value="4" ${ selected3 }>프로그래밍</option>
						                                    <option value="5" ${ selected4 }>인문학/책</option>
						                                    <option value="6" ${ selected5 }>사진/영상</option>
						                                    <option value="7" ${ selected6 }>음악/악기</option>
						                                    <option value="8" ${ selected7 }>자격증</option>
						                                    <option value="9" ${ selected8 }>공모전</option>
						                                    <option value="10" ${ selected9 }>고시/공무원</option>
						                                    <option value="11" ${ selected10 }>기타학문</option>
						                                    <option value="12" ${ selected11 }>자유주제</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>요일</label>
						                                	<c:if test="${ team.team_act_day eq '항상' }">
																<c:set var="selected0" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '월요일' }">
																<c:set var="selected1" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '화요일' }">
																<c:set var="selected2" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '수요일' }">
																<c:set var="selected3" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '목요일' }">
																<c:set var="selected4" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '금요일' }">
																<c:set var="selected5" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '토요일' }">
																<c:set var="selected6" value='selected="selected"' />
															</c:if>
															<c:if test="${ team.team_act_day eq '일요일' }">
																<c:set var="selected7" value='selected="selected"' />
															</c:if>
						                                <select class="form-control" name="team_act_day">
						                                    <option value="항상" ${ selected0 }>항상</option>
						                                    <option value="월요일" ${ selected1 }>월요일</option>
						                                    <option value="화요일" ${ selected2 }>화요일</option>
						                                    <option value="수요일" ${ selected3 }>수요일</option>
						                                    <option value="목요일" ${ selected4 }>목요일</option>
						                                    <option value="금요일" ${ selected5 }>금요일</option>
						                                    <option value="토요일" ${ selected6 }>토요일</option>
						                                    <option value="일요일" ${ selected7 }>일요일</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>기간</label>
						                                <input class="form-control" type="number" name="team_act_week" value="${ team.team_act_week }">
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>시간</label>
						                                <input class="form-control" type="text" name="team_act_time" value="${ team.team_act_time }">
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>팀 활동비</label>
						                                <input class="form-control" type="number" name="team_fee" value="${ team.team_fee }">
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>팀 인원 제한</label>
						                                <input class="form-control" type="number" name="team_limit" value="${ team.team_limit }">
						                            </div>
						                        </div>
						                        <div class="col-sm-12">
						                            <div class="form-group">
						                                <label>모집 여부</label> <br>
						                                	<c:if test="${ team.team_recruit eq 'Y' }">
						                                		<input type="radio" name="team_recruit" value="Y" checked> Y &nbsp; &nbsp;
						                                		<input type="radio" name="team_recruit" value="N"> N
															</c:if>
															<c:if test="${ team.team_recruit eq 'N' }">
																<input type="radio" name="team_recruit" value="Y"> Y &nbsp; &nbsp;
						                                		<input type="radio" name="team_recruit" value="N" checked> N
															</c:if>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
			      	</div>
				  	<div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button type="submit" class="btn btn-primary">수정</button>
				    </div>
					</form>
				</div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/teampage/common/tp_menubar.jsp" />
		
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
</script>
</body>
</html>