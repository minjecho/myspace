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
          <h2>MY Post</h2>
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
          
          
          
          <!-- main -->
          <div class="col-lg-10">   
            <div id="accordion" class="faq accordion accordion-custom pb-5">
            <c:url var="upost" value="/upost.do">
			    	<c:param name="user_no" value="${ loginMember.user_no}"/>
            	</c:url>
            	<c:url var="upost2" value="/upost2.do">
			    	<c:param name="user_nn" value="${ loginMember.user_nn}"/>
            	</c:url>
            	<li class="list-inline-item mr-0"><a href="${ upost }" class="tag-link">일반 게시글</a></li>
            	<li class="list-inline-item mr-0"><a href="${ upost2 }" class="tag-link">후기 게시글</a></li>
            	
            
           </div> 
            <!-- My Post List -->
          
            <div id="accordion" class="faq accordion accordion-custom pb-5">
             
              <div class="dataTable-container">
			    			<table class="table table-striped dataTable-table" id="table1">
						        <thead>
						            <tr>
						            	<th data-sortable="" style="width: 100px; text-align:center;"><a href="#" class="dataTable-sorter">번호</a></th>
						            	<th style="width: 100px; text-align: center;"><a href="#" class="dataTable-sorter">카테고리</a></th>
						            	<th data-sortable=""  style="text-align:center;"><a href="#" class="dataTable-sorter">제목</a></th>
						            		<th data-sortable="" style="width: 200px;  text-align:center;"><a href="#" class="dataTable-sorter">작성날짜</a></th>
						            	<th data-sortable="" style="width: 150px; text-align:center;"><a href="#" class="dataTable-sorter">조회수</a></th>
						        </thead>
			        			 <tbody>
			        				<c:forEach items="${ blist }" var="b">
			        					<tr>
				        					<td align="center">${ b.board_no }</td>
				        					<td align="center">${ b.cateVO.board_category_name }</td>
				        					<td style="text-align:center;">
				        						<c:url var="bdetail" value="bdetail.do">
				        							<c:param name="board_no" value="${ b.board_no }"/>
				        							<c:param name="page" value="${ currentPage }"/>
				        						</c:url>
				        						<a href="${ bdetail }">${ b.board_title }</a>
				        					</td>
				        					
				        					<td align="center"><fmt:formatDate value="${ b.board_date }" type="date" pattern="yyyy-MM-dd" /></td>
				        					<td align="center">${ b.board_readcount }</td>
			        					</tr>
			        				</c:forEach>
								</tbody> 
			    			</table>
			    		</div>
			    		<div align="right">
							
			    				<c:if test="${ currentPage <= 1 }">
	<<&nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
	<c:url var="ubl" value="/upost2.do">
		<c:param name="page" value="1" />
		<c:param name="user_no" value="${ loginMember.user_no }"/>
	</c:url>
	<a href="${ ubl }"><<</a>
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="ubl2" value="/upost2.do">
		<c:param name="page" value="${ startPage - 10 }"/>
		<c:param name="user_no" value="${ loginMember.user_no }"/>
	</c:url>
	<a href="${ ubl2 }" class="page-item pager"><</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
	<&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	<c:if test="${ p eq currentPage }">	
		<font color="#379392" size="4"><b>[${ p }]</b></font>
	</c:if>
	<c:if test="${ p ne currentPage }">
		<c:url var="ubl3" value="/upost2.do">
			<c:param name="page" value="${ p }"/>
			<c:param name="user_no" value="${ loginMember.user_no }"/>
		</c:url>
		<a href="${ ubl3 }">${ p }</a>
	</c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="ubl4" value="/upost2.do">
		<c:param name="page" value="${ endPage + 10 }"/>
		<c:param name="user_no" value="${ loginMember.user_no }"/>
	</c:url>
	<a href="${ ubl4 }">></a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
	>&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
	>>&nbsp;
</c:if>	
<c:if test="${ currentPage < maxPage }">
	<c:url var="ubl5" value="/upost2.do">
		<c:param name="page" value="${ maxPage }"/>
		<c:param name="user_no" value="${ loginMember.user_no }"/>
	</c:url>
	<a href="${ ubl5 }">>></a>
</c:if>
</div>

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