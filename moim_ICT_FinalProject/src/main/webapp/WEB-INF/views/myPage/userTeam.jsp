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
    <title>MoiM</title>
    <link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/team_page/images/favicon.ico" type="image/x-icon" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,600">
    <!-- Lightbox-->
    <link rel="stylesheet" href="vendor/lightbox2/css/lightbox.css">
    <!-- Custom font icons-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
  
    <!-- Menubar -->
	<c:import url="/WEB-INF/views/common/excmenubar.jsp" />
	<hr>
    
    <!-- My Page index -->
    <section>
      <div class="container">
        <!-- wordPress installation-->
        <header class="section header mb-5">
          <h2>MY Team</h2>
          <p class="lead">${ loginMember.user_name }님 환영합니다</p>
        </header>
        <div class="row"> 
          <!-- index-->
          <aside class="sidebar col-lg-2.3 mt-5 mt-lg-0">
            <div class="sidebar-widget mb-4">
              <h4 class="sidebar-widget-heading">My Page</h4>
              <ul class="list-unstyled pl-0 mt-4">
                <li> <a href="mypage.do" class="categories-link">My Info</a></li>
                <li><a href="upost.do" class="categories-link">My Post</a></li>
                <li><a href="uteam.do" class="categories-link">My Team</a></li>
              </ul>
            </div>
          </aside>
          
          
          
          <!-- My Team List -->
          <div class="col-lg-10">   
            <div id="accordion" class="faq accordion accordion-custom pb-5">
              
              <div class="dataTable-container">
			    			<table class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr>
						            	<th data-sortable="" style="width: 100px;"><a href="#" class="dataTable-sorter">번호</a></th>
						            	<th data-sortable=""><a href="#" class="dataTable-sorter">팀 이름</a></th>
						            	<!-- <th data-sortable="" style="width: 100px;"><a href="#" class="dataTable-sorter">팀 인원</a></th>
						            	<th data-sortable="" style="width: 150px;"><a href="#" class="dataTable-sorter">가입일</a></th>
						            	<th data-sortable="" style="width: 100px;"><a href="#" class="dataTable-sorter">지역</a></th>
						            	<th data-sortable="" style="width: 100px;"><a href="#" class="dataTable-sorter">팀장</a></th> -->
						            </tr>
						        </thead>
						        <tbody>
						        	<c:forEach items="${myteamlist}" var="imyteam" varStatus="status">
						        		<tr>
						        			<td>
						        				<div class="text-center">
													<c:out value="${ mtlistlength - status.index }"/>
												</div>
						        			</td>
						        			<td>
						        				<c:url var="moveTPindex" value="moveTPindex.do">
        											<c:param name="team_num" value="${ imyteam.team_num }"></c:param>
        										</c:url>
       											<a href="${ moveTPindex }">${ teamsettinglist[status.index].team_name } 팀으로 이동</a>
						        			</td>
						        		</tr>
						        	</c:forEach>
						        </tbody>
			    			</table>
			    		</div>
			    		<%-- <div class="dataTable-bottom">
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
			    			</ul>
			    		</div> --%>
              
              
            </div>
          </div>
        </div>
      </div>
    </section>
      
    
    <!-- Footer -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/lightbox2/js/lightbox.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>