<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
	<link rel="stylesheet" href="/team/resources/css/map.css">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>당신을 위한 여행</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/team/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/team/resources/vendor/owl.carousel2/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/team/resources/vendor/owl.carousel2/assets/owl.theme.default.min.css">
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:300,400&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/team/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/team/resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/team/resources/img/favicon.png">
</head>


<body>

<div class="input_wrap">
<table border="1">
	<tr><th>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; margin-top: 20px; align:center;" ></div>
	</div>
	</th>

<th>
    <div id="menu_wrap" style="position:static; width:300px; height:300px;"class="bg_white" >
        <div class="option" style="align:center;">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="" id="keyword" size="12"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList" style="padding:0px;"></ul>
        <div id="pagination"></div>
    </div>

</th>
</tr>
	</table>
	
		
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b882b157e7e3d6a5d7b9b2560cd21cd&libraries=services"></script>
<script src="/team/resources/js/kakaomap.js">
</script>

   <footer class="bg-dark py-4">
      <div class="container">
        <div class="row py-2">
          <div class="col-lg-4 text-center text-lg-left mb-2 mb-lg-0">
            <p class="small text-muted text-uppercase mb-0">&copy; copyright 2020 - all rights reserved</p>
          </div>
          <div class="col-lg-4 text-center mb-2 mb-lg-0">
            <ul class="list-inline text-white small mb-0">
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-facebook-f"></i></a></li>
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-twitter"></i></a></li>
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-instagram"></i></a></li>
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-linkedin"></i></a></li>
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-youtube"></i></a></li>
              <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-vimeo-v"></i></a></li>
            </ul>
          </div>
          <div class="col-lg-4 text-center text-lg-right">
            <p class="small text-muted text-uppercase mb-0">Template designed by <a href="https://bootstraptemple.com/p/bootstrap-travel">Bootstrap Temple</a>. </p>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script src="/team/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/team/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</body>

</html>