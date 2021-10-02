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
<title>MoiM - 공지사항</title>
<!-- Table에 관련된 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/asset/style.css">
</head>
<body>
	<!-- Menubar -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	<!-- Main Content -->
	<!-- Table -->
	<h1 align="center">공 지 사 항</h1>
	<section>
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="card-body">
			    	<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
			    		<div class="dataTable-top">
			    			<div class="dataTable-search">
			    				<form action="nsearch.do" method="post">
			    					<input type="hidden" name="page" value="1">
			    					<label><input type="search" name="keyword" placeholder="Search..."></label>
			    					<input type="submit" value="검색">
			    				</form>
			    			</div>
			    		</div>
			    		<div class="dataTable-container">
			    			<table class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr>
						            	<th style="width: 100px; text-align: center;">공지번호</th>
						            	<th style="text-align: center;">공지제목</th>
						            	<th style="width: 100px; text-align: center;">작성자</th>
						            	<th style="width: 150px; text-align: center;">작성날짜</th>
						            	<th style="width: 100px; text-align: center;">첨부파일</th>
						            </tr>
						        </thead>
			        			<tbody>
			        				<c:forEach items="${ list }" var="n">
			        					<tr>
				        					<td align="center">${ n.notice_no }</td>
				        					<td>
				        						<c:url var="ndetail" value="ndetail.do">
				        							<c:param name="notice_no" value="${ n.notice_no }"/>
				        							<c:param name="page" value="${ currentPage }"/>
				        						</c:url>
				        						<a href="${ ndetail }">${ n.notice_title }</a>
				        					</td>
				        					<td align="center">${ n.userVO.user_nn }</td>
				        					<td align="center"><fmt:formatDate value="${ n.notice_date }" type="date" pattern="yyyy-MM-dd" /></td>
				        					<c:if test="${ n.notice_original_filename != null }">
				        						<td align="center">◎</td>
				        					</c:if>
				        					<c:if test="${ n.notice_original_filename == null }">
				        						<td>&nbsp;</td>
				        					</c:if>
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
			    					<c:url var="first" value="/nlist.do">
			    						<c:param name="page" value="1"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ first }" class="page-link">‹‹</a></li>
			    				</c:if>
			    				<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
			    					<li class="page-item pager"><a>‹</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
			    					<c:url var="prev" value="/nlist.do">
			    						<c:param name="page" value="${ startPage - 10 }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ prev }" class="page-link">‹</a></li>
			    				</c:if>
			    				<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			    					<c:if test="${ p == currentPage }">
			    						<li class="page-item pager"><a>${ p }</a></li>
			    					</c:if>
			    					<c:if test="${ p != currentPage }">
			    						<c:url var="num" value="/nlist.do">
			    							<c:param name="page" value="${ p }"/>
			    						</c:url>
			    						<li class="page-item pager"><a href="${ num }" class="page-link">${ p }</a></li>
			    					</c:if>
			    				</c:forEach>
			    				<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
			    					<li class="page-item pager"><a>›</a></li>
			    				</c:if>
			    				<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
			    					<c:url var="next" value="/nlist.do">
			    						<c:param name="page" value="${ endPage + 10 }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ next }" class="page-link">›</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage >= maxPage }">
			    					<li class="page-item pager"><a>››</a></li>
			    				</c:if>
			    				<c:if test="${ currentPage < maxPage }">
			    					<c:url var="last" value="/nlist.do">
			    						<c:param name="page" value="${ maxPage }"/>
			    					</c:url>
			    					<li class="page-item pager"><a href="${ last }" class="page-link">››</a></li>
			    				</c:if>
			    				<c:if test="${ !empty loginMember and loginMember.admin == 'Y' }">
			    					<c:url var="write" value="nwriteform.do">
			    						<c:param name="page" value="${ currentPage }"/>
			    					</c:url>
			    					<li><a href="${ write }" class="btn btn-primary">공지작성</a></li>
			    				</c:if>
			    			</ul>
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

<!-- Table에 관련된 js -->
<script src="${ pageContext.servletContext.contextPath }/resources/asset/simple-datatables.js"></script>

</html>