<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 관리자 페이지</title>
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<!-- Table -->
	<h1 align="center">회원 관리</h1>
	<div class="card-body">
    	<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
    		<div class="dataTable-top">
    			<div class="dataTable-search">
    				<form action="usearch.do" method="post">
	  					<input type="hidden" name="page" value="1">
	  					<input type="hidden" name="admin_no" value="${ loginMember.user_no }">
	  					<label>검색 카테고리 선택</label>
	   					<label>
		    				<select name="category_no" class="dataTable-selector form-select">
		    					<option value="1" selected>회원이름</option>
			    				<option value="2">닉네임</option>
			    				<option value="3">이메일</option>
			    			</select>
	    				</label>
	  					<label><input type="search" name="keyword" placeholder="Search..."></label>
	  					<input type="submit" value="검색">
	  				</form>
    			</div>
    		</div>
    		<div class="dataTable-container">
    			<table class="table table-striped dataTable-table" id="table1">
			        <thead>
			            <tr>
			            	<th style="width: 100px; text-align: center;">회원번호</th>
			            	<th style="width: 100px; text-align: center;">회원이름</th>
			            	<th style="width: 150px; text-align: center;">닉네임</th>
			            	<th style="width: 100px; text-align: center;">성별</th>
			            	<th style="text-align: center;">Email</th>
			            	<th style="width: 150px; text-align: center;">로그인여부</th>
			            	<th style="width: 150px; text-align: center;">관리자권한</th>
			            	<th style="width: 200px; text-align: center;">강제탈퇴</th>
			            </tr>
			        </thead>
        			<tbody>
        				<c:forEach items="${ list }" var="user">
        					<tr>
        						<td align="center">${ user.user_no }</td>
        						<td align="center">${ user.user_name }</td>
        						<td align="center">${ user.user_nn }</td>
        						<td align="center">${ user.gender }</td>
        						<td>${ user.email }</td>
        						<c:url var="user_login_ok" value="loginOKadmin.do">
        							<c:param name="user_no" value="${ user.user_no }"/>
        							<c:if test="${ user.login_ok == 'Y' }">
        								<c:param name="login_ok" value="N"/>
        								<c:param name="admin_no" value="${ loginMember.user_no }"/>
        							</c:if>
        							<c:if test="${ user.login_ok == 'N' }">
        								<c:param name="login_ok" value="Y"/>
        								<c:param name="admin_no" value="${ loginMember.user_no }"/>
        							</c:if>
        							<c:param name="page" value="${ currentPage }"/>
        						</c:url>
        						<td align="center"><a href="${ user_login_ok }" class="btn btn-primary">${ user.login_ok }</a></td>
        						<c:url var="user_admin" value="userchangeadmin.do">
        							<c:param name="user_no" value="${ user.user_no }"/>
        							<c:if test="${ user.admin == 'Y' }">
        								<c:param name="admin" value="N"/>
        								<c:param name="admin_no" value="${ loginMember.user_no }"/>
        							</c:if>
        							<c:if test="${ user.admin == 'N' }">
        								<c:param name="admin" value="Y"/>
        								<c:param name="admin_no" value="${ loginMember.user_no }"/>
        							</c:if>
        							<c:param name="page" value="${ currentPage }"/>
        						</c:url>
        						<td align="center"><a href="${ user_admin }" class="btn btn-primary">${ user.admin }</a></td>
        						<td align="center">
        							<c:url var="user_delete" value="userdelete.do">
        								<c:param name="user_no" value="${ user.user_no }"/>
        								<c:param name="page" value="${ currentPage }"/>
        								<c:param name="admin_no" value="${ loginMember.user_no }"/>
        							</c:url>
	        						<a href="${ user_delete }" class="btn btn-primary">강제탈퇴</a>
        						</td>
        					</tr>
        				</c:forEach>
					</tbody>
    			</table>
    		</div>
    		<div class="dataTable-bottom">
    			<ul class="pagination pagination-primary float-end dataTable-pagination">
	   				<c:if test="${ currentPage <= 1 }">
	   					<li class="page-item pager"><a>‹‹</a></li>
	   				</c:if>
	   				<c:if test="${ currentPage > 1 }">
	   					<c:url var="first" value="/ulistadmin.do">
	   						<c:param name="page" value="1"/>
	   					</c:url>
	   					<li class="page-item pager"><a href="${ first }" class="page-link">‹‹</a></li>
	   				</c:if>
	   				<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
	   					<li class="page-item pager"><a>‹</a></li>
	   				</c:if>
	   				<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	   					<c:url var="prev" value="/ulistadmin.do">
	   						<c:param name="page" value="${ startPage - 10 }"/>
	   					</c:url>
	   					<li class="page-item pager"><a href="${ prev }" class="page-link">‹</a></li>
	   				</c:if>
	   				<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	   					<c:if test="${ p == currentPage }">
	   						<li class="page-item pager"><a>${ p }</a></li>
	   					</c:if>
	   					<c:if test="${ p != currentPage }">
	   						<c:url var="num" value="/ulistadmin.do">
	   							<c:param name="page" value="${ p }"/>
	   						</c:url>
	   						<li class="page-item pager"><a href="${ num }" class="page-link">${ p }</a></li>
	   					</c:if>
	   				</c:forEach>
	   				<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
	   					<li class="page-item pager"><a>›</a></li>
	   				</c:if>
	   				<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	   					<c:url var="next" value="/ulistadmin.do">
	   						<c:param name="page" value="${ endPage + 10 }"/>
	   					</c:url>
	   					<li class="page-item pager"><a href="${ next }" class="page-link">›</a></li>
	   				</c:if>
	   				<c:if test="${ currentPage >= maxPage }">
	   					<li class="page-item pager"><a>››</a></li>
	   				</c:if>
	   				<c:if test="${ currentPage < maxPage }">
	   					<c:url var="last" value="/ulistadmin.do">
	   						<c:param name="page" value="${ maxPage }"/>
	   					</c:url>
	   					<li class="page-item pager"><a href="${ last }" class="page-link">››</a></li>
	   				</c:if>
	   			</ul>
    		</div>
    	</div>
	</div>
	<hr>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>

<!-- Table에 관련된 js -->
<script src="${ pageContext.servletContext.contextPath }/resources/asset/simple-datatables.js"></script>

</html>