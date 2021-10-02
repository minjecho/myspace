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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/team_page/plugins/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" />
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
                        <h1 class="page-title">팀 공지사항</h1>                        
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
                        <div class="card">
                            <div class="card-body" style="padding-top: 0; background-color: lightsteelblue; ">
                                <div class="d-md-flex justify-content-between">
                                    <ul class="nav nav-tabs b-none">
                                        <li class="nav-item"><a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" style="color: black;"><i class="fa fa-list-ul"></i>목록</a></li>
                                        <c:if test="${ sessionScope.team_leader eq 'Y'}">
                                        <li class="nav-item"><a class="nav-link" id="addnew-tab" data-toggle="tab" href="#addnew" style="color: black;"><i class="fa fa-plus"></i>공지쓰기</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                                <div class="input-group mt-2">
                                    <input type="text" id="value" class="form-control search" placeholder="Search..." onkeyup="filter()">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="container-fluid">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="list" role="tabpanel">
                        <div class="row clearfix">
                            <div class="col-lg-12">
                                <div class="table-responsive" id="users">
                                    <table class="table table-hover table-vcenter text-nowrap table_custom border-style list" style="overflow: scroll;">
                                        <thead>
                                        	<tr>
                                        		<th class="text-center" style="width: 10%;">
                                                    공지번호
                                                </th>
                                                <th class="text-center" style="width: 40%;">
                                                    제목
                                                </th>
                                                <th class="text-center" style="width: 10%;">
                                                    작성자
                                                </th>
                                                <th class="text-center" style="width: 10%;">
                                                    작성일
                                                </th>
                                                <th class="text-center" style="width: 10%;">
                                                   첨부파일
                                                </th>
                                                <th class="text-center" style="width: 20%;">
                                                    내용보기                                                
                                                </th>
                                        	</tr>
                                        <tbody>
                                        	<c:forEach items="${ tblist }" var="itblist" varStatus="status">
                                        	<tr class="tbtable">
                                        		<td class="text-center" style="width: 10%;">
                                                    <div class="text-center">
														<c:out value="${ tblistlength - status.index }"/>
													</div>
                                                </td>
                                                <td class="text-center titletab" style="width: 40%;">
                                                    <div class="text-center">${ itblist.tn_title }</div>
                                                </td>
                                                <td class="text-center usernntab" style="width: 10%;">
                                                    <div class="text-center">${ itblist.userVO.user_nn }</div>
                                                </td>
                                                <td class="text-center" style="width: 10%;">
                                                    <div class="text-center">${ itblist.tn_date }</div>
                                                </td>
                                                <td class="text-center" style="width: 10%;">
                                                	<c:if test="${ itblist.tn_originalfilename != null }">
                                                		<div class="text-center">O</div>
                                                	</c:if>
                                                   	<c:if test="${ itblist.tn_originalfilename == null }">
                                                		<div class="text-center">X</div>
                                                	</c:if>
                                                </td>
                                                <td class="text-center" style="width: 20%;">
                                                    <button type="button" class="open-tndetail btn btn-primary" data-toggle="modal" data-target="#selecttn" data-tn_no="${ itblist.tn_no }">
                                                    	<font style="vertical-align: inherit;">자세히보기</font>
                                                    </button>
                                                    <c:url var="deletetb" value="/teamboarddelete.do">
												    	<c:param name="tn_no" value="${ itblist.tn_no }"/>
												    	<c:param name="team_num" value="${ itblist.team_num }"/>
												    	<c:if test="${ !empty itblist.tn_originalfilename }">
															<c:param name="tn_renamefilename" value="${itblist.tn_renamefilename }" />
														</c:if>
												    </c:url>
												    <c:if test="${ sessionScope.team_leader eq 'Y' }">
												    	<button class="btn btn-primary" onclick="javascript:location.href='${ deletetb }';">글삭제</button>
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
                    <div class="tab-pane fade" id="addnew" role="tabpanel">
                        <div class="row clearfix">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row clearfix">
                                        	<form action="teamboardinsert.do" method="post" enctype="multipart/form-data" style="width: 100%;">
                                        	<input type="hidden" name="team_num" value=1>
                                        	<input type="hidden" name="tn_writer" value="1">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="tn_title" placeholder="제목을 입력하세요...">
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12">
                                                <div class="form-group">
                                                    <textarea class="form-control" name="tn_content" rows="4" placeholder="내용을 입력하세요...."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <input type="file" class="dropify" name="upfile">
                                            </div>
                                            <div class="col-lg-12 mt-3">
                                                <button type="submit" class="btn btn-primary">등록</button>
                                                <button type="reset" class="btn btn-default">취소</button>
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
    
    $('.tbtable button').on('click', function(){
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
<script type="text/javascript">
	function filter(){
		var value = document.getElementById("value").value.toUpperCase();
		var tablerow = document.getElementsByClassName("tbtable");
		for(var i=0; i<tablerow.length; i++){
			var titletab = tablerow[i].getElementsByClassName("titletab");
			var usernntab = tablerow[i].getElementsByClassName("usernntab");
			if(titletab[0].innerText.toUpperCase().includes(value) || usernntab[0].innerText.toUpperCase().includes(value)){
				tablerow[i].style.display = ""
			}else{
				tablerow[i].style.display = "none"
			}
		}
	}
</script>
</body>
<!-- soccer/project/app-contact.html  07 Jan 2020 03:40:35 GMT -->
</html>