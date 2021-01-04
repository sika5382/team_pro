<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>당신을 위한 여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="/team/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="/team/resources/vendor/owl.carousel2/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/team/resources/vendor/owl.carousel2/assets/owl.theme.default.min.css">
<!-- Google fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:300,400&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/team/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/team/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="/team/resources/img/favicon.png">
</head>
<body>

	<!-- Header-->
	<header class="header">
		<!-- Top bar -->
		<div class="py-2 bg-dark text-white">
			<div class="container py-1">
				<div class="row align-items-center">
					<div class="col-lg-4">
						<ul class="list-inline mb-0 text-small">
							<li class="list-inline-item"><a class="reset-anchor"
								href="#">About us</a></li>
							<li class="list-inline-item">|</li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#">Sitemap</a></li>
						</ul>
					</div>
					<div class="col-lg-4 d-none d-lg-block text-center">
						<ul class="list-inline mb-0 small">
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-twitter"></i></a></li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-instagram"></i></a></li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-linkedin"></i></a></li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-youtube"></i></a></li>
							<li class="list-inline-item"><a class="reset-anchor"
								href="#"><i class="fab fa-vimeo-v"></i></a></li>
						</ul>
					</div>
					<div class="col-lg-4 d-none d-lg-block text-right">
						<div class="dropdown text-small">
							<a class="reset-anchor dropdown-toggle" id="destinations"
								href="#" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="fas fa-globe-americas mr-2"></i>Destinations
							</a>
							<div class="dropdown-menu" aria-labelledby="destinations">
								<a class="dropdown-item text-small" href="#">France</a><a
									class="dropdown-item text-small" href="#">Germany</a><a
									class="dropdown-item text-small" href="#">Spain</a><a
									class="dropdown-item text-small" href="#">Egypt</a><a
									class="dropdown-item text-small" href="#">Thailand</a><a
									class="dropdown-item text-small" href="#">Indonesia</a><a
									class="dropdown-item text-small" href="#">Maldives</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar 1 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-white py-4">
			<div class="container text-center">
				<a class="navbar-brand mx-auto" href="index.html"><img
					class="mb-2" src="/team/resources/img/logo.svg" alt="" width="140">
					<p class="text-small text-uppercase text-gray mb-0">당신의 단 하나뿐인
						여행 가이드</p></a>
			</div>
		</nav>
		<!-- Navbar 2 -->
		<nav
			class="navbar navbar-expand-lg navbar-light border-gray py-2 bg-light">
			<div class="container">
				<button class="navbar-toggler navbar-toggler-right mx-auto border-0"
					type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse text-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item px-1">
							<!-- Link--> <a class="nav-link active" href="/team/">Home</a>
						</li>
						<li class="nav-item px-1">
							<!-- Link--> <a class="nav-link" href="/team/board/boardAllList">Listing</a>
						</li>
						<li class="nav-item px-1">
							<!-- Link--> <a class="nav-link" href="/team/board/writeForm">Post</a>
						</li>
						<!-- Link-->
						<c:choose>
							<c:when test="${sessionScope.userid == null }">
								<li class="nav-item px-1"><a class="nav-link"
									href="/team/login">Login</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item px-1"><a class="nav-link"
									href="/team/member/myPage?id=${userid}">MyPage</a></li>
								<li class="nav-item px-1"><a class="nav-link"
									href="/team/logout">Logout</a></li>
								</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<!-- JavaScript files-->
	<script src="/team/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="/team/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/team/resources/vendor/owl.carousel2/owl.carousel.min.js"></script>
	<script src="/team/resources/js/front.js"></script>
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
		crossorigin="anonymous">

</body>
</html>