<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="loginPage.model.vo.Login, itemPage.model.vo.Item"%>
<% 
	// 로그인 확인을 위한 session 객체 사용
	// 상품 정보 조회를 위한 session 객체 사용
	// 이 부분은 추후 머지하면서 수정해주세요.
	Login loginmember = new Login();
	Item item = new Item();
%>
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

<!-- jQuery와 Postcodify를 로딩한다. -->
<script>
	/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
	function searchaddress(){
		$("#postcodify_search_button").postcodifyPopUp();
	}
</script>
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
						<h3>즉시 판매하기</h3>
						<h4>Faded SkyBlu Denim Jeans</h4>
						<a class="primary-btn">즉시 판매가 : $149.99</a><br>
						<a class="primary-btn" href="/Shoesgone/views/sellPage/tender_sell.jsp">최저 구매가 : $159.99</a><br>
						<a class="primary-btn"><span>Size</span> : 255</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="checkout_area section_gap">
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<form class="row contact_form" action="/Shoesgone/priceupdate" method="post" novalidate="novalidate">
							<input type="hidden" name="userno" value="<%= loginmember.getUserNo() %>">
							<input type="hidden" name="userid" value="<%= loginmember.getUserId() %>">
							<input type="hidden" name="itemno" value="<%= item.getItemNo() %>">
							<div class="col-md-6 form-group p_star">
								<h3>판매 상품 정보 입력</h3>
								<input type="text" class="form-control" id="itemname" name="itemname" placeholder="제품명" value="이곳에는 선택한 상품의 제품명이 들어갑니다." required><br>
								<input type="number" class="form-control" id="size" name="size" placeholder="Size" required><br>
								<input type="number" class="form-control" id="price" name="price" placeholder="희망 판매가" required>
								<br>
								<h3>반품 배송지 입력</h3>
								<input type="text" class="form-control" id="username" name="username" placeholder="이름" value="<%= loginmember.getUserName() %>" required><br>
								<input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호" required><br>
								<input type="email" class="form-control" id="email" name="email" placeholder="이메일" required><br>
								<input type="text" class="form-control postcodify_postcode5" id="post" name="post" placeholder="우편번호" required>
								<button type="button" id="postcodify_search_button" onclick="searchaddress();">검색</button><br><br>
								<input type="text" class="form-control postcodify_address" id="address" name="address" placeholder="주소" required><br>
								<input type="text" class="form-control postcodify_extra_info" id="detailaddress" name="detailaddress" placeholder="상세주소" required><br>
							</div>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>등록 상품</h2>
							<ul class="list">
								<li><a href="#">제품명 <span>가격</span></a></li>
								<li><a href="#">슈즈곤 신발 1 <span class="last">150000 </span></a></li>
							</ul>
							<ul class="list list_2">
								<li><a>배송비 <span>2500</span></a></li>
								<li><a>Total <span>152500</span></a></li>
							</ul>
							<hr>
							<div class="payment_item">
								<h2>패널티 결제방법</h2>
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="account">
									<label for="f-option5">계좌에서 인출</label>
									<div class="check"></div>
								</div>
								<p>
									Please send a check to Store Name, Store Street, Store
									Town, Store State / County, Store Postcode.
								</p>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="creditcard">
									<label for="f-option6">신용카드 </label>
									<img src="/Shoesgone/resources/img/product/card.jpg" alt="">
									<div class="check"></div>
								</div>
								<p>
									Pay via PayPal; you can pay with your credit card if you
									don’t have a PayPal account.
								</p>
							</div>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" name="selector" required="required">
								<label for="f-option4"><a href="#">검수 기준</a>과 <a href="#">개인 정보 정책</a>에 동의합니다. </label>
							</div>
							<input type="submit" value="상품 등록하기"> &nbsp;
							<input type="reset" value="등록취소">
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
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>