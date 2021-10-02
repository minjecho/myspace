<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 mb-5 mb-lg-0">
				</div>
				<div class="col-lg-3 mb-5 mb-lg-0">
					<h5 class="footer-heading">Site pages</h5>
					<ul class="list-unstyled">
						<li> <a href="${ pageContext.servletContext.contextPath }/main.do" class="footer-link">Home</a></li>
						<li> <a href="${ pageContext.servletContext.contextPath }/nlist.do?page=1" class="footer-link">공지사항</a></li>
						<li> <a href="${ pageContext.servletContext.contextPath }/rclist.do" class="footer-link">구인게시판</a></li>
						<li> <a href="${ pageContext.servletContext.contextPath }/blist.do?page=1" class="footer-link">게시판</a></li>
						<li> <a href="${ pageContext.servletContext.contextPath }/rvlist.do" class="footer-link">리뷰게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="copyrights">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 text-center text-lg-left">
						<p class="copyrights-text mb-3 mb-lg-0">
							&copy; All rights reserved. Appton.co. Design by 
							<a href="https://bootstrapious.com/p/big-bootstrap-tutorial" class="external footer-link">Bootstrapious </a>
						</p>
						<!-- If you want to remove the backlink, please purchase a license for this template @ https://bootstrapious.com/attribution-free-license. Big thanks!-->
						              
					</div>
					<div class="col-lg-6 text-center text-lg-right">
						<ul class="list-inline social mb-0">
							<li class="list-inline-item">
								<a href="#" class="social-link">
									<i class="fa fa-facebook"></i>
								</a>
								<a href="#" class="social-link">
									<i class="fa fa-twitter"></i>
								</a>
								<a href="#" class="social-link">
									<i class="fa fa-youtube-play"></i>
								</a>
								<a href="#" class="social-link">
									<i class="fa fa-vimeo"></i>
								</a>
								<a href="#" class="social-link">
									<i class="fa fa-pinterest"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>