<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/Shoesgone/resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">

<%-- 페이지 이름 --%>
<title>Shoe's Gone</title>

<!-- CSS -->
<link rel="stylesheet" href="/Shoesgone/resources/css/linearicons.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/themify-icons.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/bootstrap.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/owl.carousel.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/nice-select.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/nouislider.min.css">
<link rel="stylesheet" href="/Shoesgone/resources/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="/Shoesgone/resources/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="/Shoesgone/resources/css/main.css">
</head>
<body>
	<%-- Menubar --%>
	<%@ include file="../common/menubar.html" %>
		
	<%-- Banner --%>
	<%@ include file="../common/buy_banner.html" %>
	
	<%-- Main Content --%>
	<!-- Start body Area -->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="/Shoesgone/resources/img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="/Shoesgone/resources/img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="/Shoesgone/resources/img/category/s-p1.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>구매하시기 전에 꼭 확인하세요.</h3>
						<h4>Faded SkyBlu Denim Jeans</h4>
						<h2>$149.99</h2>
						<ul class="list">
							<li>
								<div class="default-select" id="default-select"">
									<select>
										<option selected="selected">-- Size --</option>
										<option value="230">230</option>
										<option value="235">235</option>
										<option value="240">240</option>
										<option value="245">245</option>
										<option value="250">250</option>
										<option value="255">255</option>
										<option value="260">260</option>
										<option value="265">265</option>
										<option value="270">270</option>
										<option value="275">275</option>
										<option value="280">280</option>
										<option value="285">285</option>
										<option value="290">290</option>
									</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="/Shoesgone/views/buyPage/now_buy.jsp" class="genric-btn primary circle">즉시 구매</a>
								</div>
							</li>
						</ul>
						<div class="switch-wrap d-flex justify-content-between">
							<p>구매하려는 상품이 맞습니다.
								<input type="checkbox" id="primary-checkbox" checked>
								<label for="primary-checkbox"></label><br>
								국내/해외에서 발매한 정품 상품입니다.
								<input type="checkbox" id="primary-checkbox" checked>
								<label for="primary-checkbox"></label><br>
								제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.
								<input type="checkbox" id="primary-checkbox" checked>
								<label for="primary-checkbox"></label><br>
								슈즈곤의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.
								<input type="checkbox" id="primary-checkbox" checked>
								<label for="primary-checkbox"></label>
							</p>
						</div>
						<div class="card_area d-flex align-items-center">
							<a href="/Shoesgone/views/buyPage/check_buy_standard.jsp" class="genric-btn primary circle">검수기준</a> &nbsp; &nbsp;
							<a href="/Shoesgone/views/buyPage/tender_buy.jsp" class="genric-btn primary circle">구매 입찰</a> &nbsp; &nbsp;
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End body Area -->
	
	<%-- Footer --%>
	<%@ include file="../common/footer.html" %>
	
	<%-- JS --%>
	<script src="/Shoesgone/resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="/Shoesgone/resources/js/vendor/bootstrap.min.js"></script>
	<script src="/Shoesgone/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/Shoesgone/resources/js/jquery.nice-select.min.js"></script>
	<script src="/Shoesgone/resources/js/jquery.sticky.js"></script>
	<script src="/Shoesgone/resources/js/nouislider.min.js"></script>
	<script src="/Shoesgone/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/Shoesgone/resources/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="/Shoesgone/resources/js/gmaps.min.js"></script>
	<script src="/Shoesgone/resources/js/main.js"></script>
</body>
</html>