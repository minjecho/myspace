<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="listCount" value="${ listCount }" />
<c:set var="startPage" value="${ startPage }" />
<c:set var="endPage" value="${ endPage }" />
<c:set var="maxPage" value="${ maxPage }" />
<c:set var="currentPage" value="${ currentPage }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoiM - 리뷰게시판</title>
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<hr>
	<!-- Main Content -->
	<!-- Table Test -->
<!-- Main Content -->
	<!-- Table -->
	<h1 align="center">리뷰 게시판</h1>
	<section>
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="card-body">
			    	<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
			    		<div class="dataTable-top">
			    			<div class="dataTable-search">
			    				<form action="rvsearch.do" method="post">
			    					<input type="hidden" name="page" value="1">
			    					<label><input type="search" name="keyword" placeholder="분류, 제목, 작성자 검색" class="form-control" value="${ keyword }"></label>
			    					<input type="submit" value="검색">
			    				</form>
			    			</div>
			    		</div>
			    		<div class="dataTable-container">
			    			<table class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr style="text-align:center;">
						            	<th data-sortable="" style="width: 100px; text-align:center;">번호</th>
						            	<th data-sortable="" style="width: 170px; text-align:center;">분류</th>
						            	<th data-sortable="" style="text-align:center;">글제목</th>
						            	<th data-sortable="" style="width: 100px; text-align:center;">작성자</th>
						            	<th data-sortable="" style="width: 150px; text-align:center;">작성날짜</th>
						            	<th data-sortable="" style="width: 100px; text-align:center;">조회수</th>
						            </tr>
						        </thead>
			        			<tbody>
			        				<c:forEach items="${ list }" var="rv">
			        					<tr style="text-align:center;">
				        					<td>${ rv.review_no }</td>
				        					<td>${ rv.field_name }</td>
				        					<td>
				        						<c:url var="rvdetail" value="rvdetail.do">
				        							<c:param name="review_no" value="${ rv.review_no }"/>
				        							<c:param name="page" value="${ currentPage }"/>
				        						</c:url>
				        						<a href="${ rvdetail }">${ rv.review_title }</a>
				        					</td>
				        					<td>${ rv.review_writer }</td>
				        					<td><fmt:formatDate value="${ rv.review_date }" type="date" pattern="yyyy-MM-dd" /></td>
				        					<td>${ rv.review_readcount }</td>
			        					</tr>
			        				</c:forEach>
								</tbody>
			    			</table>
			    		</div>
			    		<c:url var="rvwirte" value="/rvwrite.do">
			    						<c:param name="user_no" value="${ loginMember.user_no }"/>
			    					</c:url>
						    		<div class="dataTable-bottom">
			    			<c:if test="${ empty keyword }">
			    			<ul class="pagination pagination-primary float-end dataTable-pagination">
			    				<c:if test="${ currentPage <= 1 }">
			    					<li class="page-item pager"><a>‹‹</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage > 1 }">
			    					<c:url var="first" value="/rvlist.do">
			    						<c:param name="page" value="1"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ first }" class="page-link">‹‹</a></li>
			    				</c:if>
			    				<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
			    					<li class="page-item pager"><a>‹</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
			    					<c:url var="prev" value="/rvlist.do">
			    						<c:param name="page" value="${ startPage - 10 }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ prev }" class="page-link">‹</a></li>
			    				</c:if>
			    				<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			    					<c:if test="${ p == currentPage }">
			    						<li class="page-item pager"><a>${ p }</a></li>
			    					</c:if>
			    					<c:if test="${ p != currentPage }">
			    						<c:url var="num" value="/rvlist.do">
			    							<c:param name="page" value="${ p }"/>
			    						</c:url>
			    						<li class="page-item pager"><a href="${ num }" class="page-link">${ p }</a></li>
			    					</c:if>
			    				</c:forEach>
			    				<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
			    					<li class="page-item pager"><a>›</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
			    					<c:url var="next" value="/rvlist.do">
			    						<c:param name="page" value="${ endPage + 10 }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ next }" class="page-link">›</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage >= maxPage }">
			    					<li class="page-item pager"><a>››</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage < maxPage }">
			    					<c:url var="last" value="/rvlist.do">
			    						<c:param name="page" value="${ maxPage }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ last }" class="page-link">››</a></li>
			    				</c:if>
			    				<c:if test="${ !empty loginMember }">
			    					
			    					<li><a href="${ rvwirte }" class="btn btn-primary">글작성</a></li>
			    				</c:if>
			    			</ul>
			    			</c:if>
			    			<c:if test="${!empty keyword }">
			    			<ul class="pagination pagination-primary float-end dataTable-pagination">
			    				<c:if test="${ currentPage <= 1 }">
			    					<li class="page-item pager"><a>‹‹</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage > 1 }">
			    					<c:url var="first" value="/rvsearch.do">
			    						<c:param name="page" value="1"/>
			    						<c:param name="keyword" value="${ keyword }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ first }" class="page-link">‹‹</a></li>
			    				</c:if>
			    				<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
			    					<li class="page-item pager"><a>‹</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
			    					<c:url var="prev" value="/rvsearch.do">
			    						<c:param name="page" value="${ startPage - 10 }"/>
			    						<c:param name="keyword" value="${ keyword }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ prev }" class="page-link">‹</a></li>
			    				</c:if>
			    				<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			    					<c:if test="${ p == currentPage }">
			    						<li class="page-item pager"><a>${ p }</a></li>
			    					</c:if>
			    					<c:if test="${ p != currentPage }">
			    						<c:url var="num" value="/rvsearch.do">
			    							<c:param name="page" value="${ p }"/>
			    							<c:param name="keyword" value="${ keyword }"/>
			    						</c:url>
			    						<li class="page-item pager"><a href="${ num }" class="page-link">${ p }</a></li>
			    					</c:if>
			    				</c:forEach>
			    				<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
			    					<li class="page-item pager"><a>›</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
			    					<c:url var="next" value="/rvsearch.do">
			    						<c:param name="page" value="${ endPage + 10 }"/>
			    						<c:param name="keyword" value="${ keyword }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ next }" class="page-link">›</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage >= maxPage }">
			    					<li class="page-item pager"><a>››</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage < maxPage }">
			    					<c:url var="last" value="/rvsearch.do">
			    						<c:param name="page" value="${ maxPage }"/>
			    						<c:param name="keyword" value="${ keyword }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ last }" class="page-link">››</a></li>
			    				</c:if>
			    				
			    					<c:url var="out" value="/rvlist.do"/>
			    					<li><a href="${ out }" class="btn btn-primary">목록</a></li>
			    				
			    			</ul>
			    			
			    			</c:if>
			    		</div>
			    	</div>
				</div>
			</div>
		</div>
	</section>
	<hr>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>