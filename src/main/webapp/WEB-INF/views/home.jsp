<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>당신을 위한 여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel2/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel2/assets/owl.theme.default.min.css">
<!-- Google fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:300,400&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="/resources/img/favicon.png">

</head>
<body>
	
	<c:import url="./default/header.jsp" />

	<!-- Destinations -->
	<section class="pt-5">
	
		<!-- 내용 타이틀 -->
		<div class="container">
			<h1>한 번쯤은 가볼만한 장소</h1>
			<p class="mb-0">내용입력</p>
		</div>
		
		<!-- 상단 슬라이드 모션 -->
		<div
			class="destinations-slider owl-carousel owl-theme nav-center-custom owl-padding">

			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-4.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">서울</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a>
			
			 <a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-2.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">부산</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a> 
			
			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-3.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">제주</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a> 
			
			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-1.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">인천</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a>
			
			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-5.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">강원도</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a>
			
			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="<%=request.getContextPath() %>/board/boardLocalList?local=경기"
				style="background: url(resources/img/travel-home-6.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">경기도</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a>
			
			<a class="destination d-flex align-items-end bg-center bg-cover"
				href="post.html"
				style="background: url(resources/img/travel-home-7.jpg)">
				<div
					class="destination-inner w-100 text-center text-white index-forward has-transition">
					<h2 class="h3 mb-4">대구</h2>
					<div class="btn btn-primary btn-block destination-btn text-white">Discover</div>
				</div>
			</a>	
	</section>
	
	<!-- Divider Section -->
	<section class="py-5">
		<div class="container py-4">
		
			<!-- Home listing -->
			<div class="row align-items-stretch bg-full-left">
			
				<div class="col-lg-6 pr-lg-0 order-2 order-lg-1">
					<div class="h-100 bg-light d-flex align-items-center">
						<div class="py-5 pr-4 pl-3 pl-lg-0">
						
							<p
								class="text-primary font-weight-bold small text-uppercase mb-2">
								Travel guide
							</p>
							
							<h3 class="h4">
								<a class="text-reset" href="post.html">
									Book to inspire your travel
								</a>
							</h3>
							
							<p class="text-muted text-small mb-3">
								Lorem ipsum dolor sit
								amet, consectetur adipisicing elit. Excepturi quam nobis autem
								voluptate illum beatae atque suscipit inventore tenetur,
								perferendis facere sequi optio laudantium obcaecati aliquam,
								dolores ea. Pariatur, repellendus.
							</p>
								
							<p class="text-muted text-small mb-3">
								Lorem ipsum dolor sitamet, consectetur adipisicing elit.
								Excepturi quam nobis autem voluptate illum beatae atque 
								suscipit inventore tenetur, perferendis facere sequi optio 
								laudantium obcaecati aliquam, dolores ea. Pariatur, repellendus.
							</p>
							
							<ul class="list-inline small text-uppercase mb-0">
								<li class="list-inline-item align-middle">
									<img class="rounded-circle shadow-sm"
									src="resources/img/person-1.jpg" alt="" width="30" />
								</li>
								<li class="list-inline-item mr-0 text-gray align-middle"> By </li>
								<li class="list-inline-item align-middle mr-0">
									<a class="font-weight-bold reset-anchor" href="#">Jason Doe</a>
								</li>
								<li class="list-inline-item text-gray align-middle mr-0">|</li>
								<li class="list-inline-item text-gray align-middle">Jan,2019</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 pl-lg-0 order-1 order-lg-2">
					<a class="d-block h-100 bg-center bg-cover" href="post.html"
						style="background: url(/resources/img/travel-home-divider.jpg)"></a>
				</div>
				
			</div>
			
		</div>
	</section>
	
	<!-- Instagram section-->
	<section class="pb-5">
		<div class="container pb-4">
			<header class="text-center mb-5">
				<h2>Backpack traveler</h2>
				<p>A place for your Instagram pictures or gallery.</p>
			</header>
			<div class="row">
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-1.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-2.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-3.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-4.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-5.jpg" alt="">
						<div class="inst
						agram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-6.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-1.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
				<div class="col-lg-3 col-md-6 px-md-1 py-1">
					<a class="instagram-item d-block w-100 reset-anchor text-white"
						href="#"><img class="img-fluid"
						src="resources/img/listing-tnumbnail-2.jpg" alt="">
						<div class="instagram-item-overlay p-5">
							<h6>We travel not to escape life, but for life not to escape
								us.</h6>
						</div></a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Travel essentials section -->
	<section class="py-5 bg-light">
		<div class="container py-4">
			<header class="text-center mb-5">
				<h2>My travel essentials</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
			</header>
			<div class="row text-center">
				<div class="col-lg-3 col-md-6">
					<a class="text-reset text-decoration-none" href="post.html"><img
						class="mb-4" src="resources/img/bag.png" alt="" height="150">
						<h3 class="h5">Backpack</h3>
						<p class="text-small text-muted">Deserunt et ad culpa culpa
							dolore.</p></a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a class="text-reset text-decoration-none" href="post.html"><img
						class="mb-4" src="resources/img/camera.png" alt="" height="150">
						<h3 class="h5">Camera</h3>
						<p class="text-small text-muted">Consectetur ex sunt duis
							minim quis dolor.</p></a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a class="text-reset text-decoration-none" href="post.html"><img
						class="mb-4" src="resources/img/glasses.png" alt="" height="150">
						<h3 class="h5">Sunglasses</h3>
						<p class="text-small text-muted">Deserunt et ad culpa culpa
							dolore.</p></a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a class="text-reset text-decoration-none" href="post.html"><img
						class="mb-4" src="resources/img/headphone.png" alt="" height="150">
						<h3 class="h5">Headphones</h3>
						<p class="text-small text-muted">Elit ad est labore irure qui.</p></a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Subscribe section -->
	<section class="py-5">
		<div class="container py-4">
			<div class="row align-items-center">
				<div class="col-lg-6 position-relative py-4">
					<img class="subscribe-img" src="resources/img/subscribe-img-1.jpg"
						alt=""><img class="subscribe-img"
						src="resources/img/subscribe-img-2.jpg" alt="">
				</div>
				<div class="col-lg-6">
					<h2>Best money saving - Travel tips</h2>
					<p class="text-muted mb-5">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Eos quidem facere aliquam, delectus,
						incidunt ipsum fugit deserunt ducimus quibusdam consequuntur quos
						numquam ipsa suscipit animi dolore. Est beatae inventore voluptas.</p>
					<form action="#">
						<div class="row">
							<div class="form-group col-lg-8">
								<input class="form-control" type="email" name="email"
									placeholder="Enter your email address">
							</div>
							<div class="form-group col-lg-4">
								<button class="btn btn-dark btn-block" type="submit">Subscribe</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Top categories section -->
	<section class="py-5 bg-light">
		<div class="container py-4">
			<header class="mb-5 text-center">
				<h2>Top categories</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
			</header>
			<div class="row text-center">
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> 
						<svg class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                			<use xlink:href="#food-1"> </use>
             			</svg>
             			
						<h3 class="h5">Restaurants</h3>
						<p class="text-muted text-small">3 Destinations</p>
					</a>
				</div>
				
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> <svg
							class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                <use xlink:href="#paper-bag-1"> </use>
              </svg>
						<h3 class="h5 mb-1">Markets</h3>
						<p class="text-muted text-small">7 Destinations</p></a>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> <svg
							class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                <use xlink:href="#special-price-1"> </use>
              </svg>
						<h3 class="h5 mb-1">Low budget</h3>
						<p class="text-muted text-small">2 Destinations</p></a>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> <svg
							class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                <use xlink:href="#movie-camera-1"> </use>
              </svg>
						<h3 class="h5 mb-1">Cinemas</h3>
						<p class="text-muted text-small">4 Destinations</p></a>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> <svg
							class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                <use xlink:href="#beach-1"> </use>
              </svg>
						<h3 class="h5 mb-1">Beaches</h3>
						<p class="text-muted text-small">5 Destinations</p></a>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6 mb-4 mb-lg-0">
					<a class="reset-anchor d-block" href="listing.html"> <svg
							class="svg-icon mb-3 svg-icon-big svg-icon-light text-primary">
                <use xlink:href="#camping-1"> </use>
              </svg>
						<h3 class="h5 mb-1">Camping</h3>
						<p class="text-muted text-small">6 Destinations</p></a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Sponsors section-->
	<section class="py-5">
		<div class="container py-4">
			<header class="text-center mb-4">
				<h2>Our sponsors</h2>
			</header>
			<!-- Brands -->
			<div class="owl-carousel sponsors-slider">
				<a href="#"> <img class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-1.svg" alt=""></a><a href="#"> <img
					class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-2.svg" alt=""></a><a href="#"> <img
					class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-3.svg" alt=""></a><a href="#"> <img
					class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-4.svg" alt=""></a><a href="#"> <img
					class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-5.svg" alt=""></a><a href="#"> <img
					class="d-block mx-auto my-3 sponsor"
					src="resources/img/brand-6.svg" alt=""></a>
			</div>
		</div>
	</section>

	<c:import url="./default/footer.jsp"></c:import>

	<!-- JavaScript files-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/owl.carousel2/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>
	<script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }
      // this is set to BootstrapTemple website as you cannot 
      // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
      // while using file:// protocol
      // pls don't forget to change to your domain :)
      injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg'); 
      
    </script>
	<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
		crossorigin="anonymous" >

</body>

</html>