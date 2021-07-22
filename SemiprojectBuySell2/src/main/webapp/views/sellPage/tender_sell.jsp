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
	<%@ include file="../common/sell_banner.html" %>
	
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
						<h3>판매 입찰하기</h3>
						<h4>Faded SkyBlu Denim Jeans</h4>
						<a class="primary-btn" href="/Shoesgone/views/sellPage/now_sell.jsp">즉시 판매가 : $149.99</a><br>
						<a class="primary-btn">최저 구매가 : $159.99</a><br>
						<a class="primary-btn"><span>Size</span> : 255</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="checkout_area section_gap">
		<div class="container">
			<h3>입찰 기간 선택</h3>
			<hr>
			<input type="radio" id="confirm-radio"> 1일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="confirm-radio"></label>
			<input type="radio" id="confirm-radio" checked="checked"> 7일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="confirm-radio"></label>
			<input type="radio" id="confirm-radio"> 14일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="confirm-radio"></label>
			<input type="radio" id="confirm-radio"> 30일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="confirm-radio"></label>
			<input type="radio" id="confirm-radio"> 60일
			<label for="confirm-radio"></label>
			<p>(입찰 마감 기한 : yyyy년 mm월 dd일)</p>
			<hr>
			<div class="cupon_area">
				<div class="check_title">
					<h2>
						포인트 사용하기 <a href="#">(잔여 포인트 조회하기)</a>
					</h2>
				</div>
				<input type="text" placeholder="사용할 포인트를 입력해주세요.">
				<a class="tp_btn" href="#">포인트 적용</a>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>배송지 입력</h3>
						<form class="row contact_form" action="#" method="post" novalidate="novalidate">
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="name" name="name">
								<span class="placeholder" data-placeholder="이름"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="number" name="number">
								<span class="placeholder" data-placeholder="전화번호"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="email" name="email">
								<span class="placeholder" data-placeholder="Email 주소"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<select class="country_select">
									<option>-- 지역 --</option>
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
								</select>
							</div>
							<div class="col-md-12 form-group p_star">
								<select class="country_select">
									<option>-- 시/군/구 --</option>
									<option value="1">District</option>
									<option value="2">District</option>
									<option value="4">District</option>
								</select>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="add1" name="add1">
								<span class="placeholder" data-placeholder="상세주소 입력"></span>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<h3>배송 요청사항</h3>
								</div>
								<textarea class="form-control" name="message" id="message" rows="1" placeholder="배송시 요청사항(예:부재시 문 앞에 놓아주세요.)"></textarea>
							</div>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list">
								<li><a href="#">Product <span>Total</span></a></li>
								<li><a href="#">Fresh Blackberry <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
								<li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
								<li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
							</ul>
							<ul class="list list_2">
								<li><a href="#">Subtotal <span>$2160.00</span></a></li>
								<li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
								<li><a href="#">Total <span>$2210.00</span></a></li>
							</ul>
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="selector">
									<label for="f-option5">Check payments</label>
									<div class="check"></div>
								</div>
								<p>
									Please send a check to Store Name, Store Street, Store
									Town, Store State / County, Store Postcode.
								</p>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="selector">
									<label for="f-option6">Paypal </label>
									<img src="/Shoesgone/resources/img/product/card.jpg" alt="">
									<div class="check"></div>
								</div>
								<p>
									Pay via PayPal; you can pay with your credit card if you
									don’t have a PayPal account.
								</p>
							</div>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" name="selector">
								<label for="f-option4">I’ve read and accept the </label>
								<a href="#">terms & conditions*</a>
							</div>
							<a class="primary-btn" href="/Shoesgone/views/sellPage/sell_complete.jsp">결제하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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