<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
<title>Insert title here</title>
<script>
	function loginCheck(isLogOn, writeForm, loginForm){
		if(isLogOn == ""){
			alert("로그인 후 글쓰기가 가능합니다")
			location.href=loginForm
		}else{
			location.href = writeForm
		}
	}
</script>
</head>
<body>

   <c:import url="../default/header.jsp"/>
   
    <!-- Hero section -->
    <section class="hero bg-center bg-cover" style="background: url(/team/resources/img/hero-banner.jpg)">
      <div class="dark-overlay py-5">
        <div class="overlay-content">
          <div class="container py-5 text-white text-center">
            <h1>Blog listing</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
          </div>
        </div>
      </div>
    </section>
    <!-- Blog listing -->
    <section class="pt-5">
      <div class="container pt-5">
        <div class="row mb-5">
          <div class="col-lg-8">
            <div class="row text-center">
            
            	<!-- 업로드 한 게시물 올라오는 부분  -->
            <div>
           
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			
				<c:if test="${boardList.size() == 0 }">
					<h3>등록된 글이 없습니다.</h3>
				</c:if>
				
				<c:forEach items="${boardList}" var="dto">
				<div class="col-lg-6 mb-5">
					
					<img class="img-fluid mb-4" id="preview" src=
								"${contextPath}/board/download?write_no=${dto.write_no}&image_file_name=${dto.image_file_name}" >
								
					<!-- 
					<c:choose>
						<c:when test="${not empty contentView.image_file_name && contentView.image_file_name != 'null' }">
							<img class="img-fluid mb-4" id="preview" src=
								"${contextPath}/board/download?write_no=30&image_file_name=KakaoTalk_20201026_230856110.jpg" >
								
						</c:when>
						<c:otherwise>
							<img  class="img-fluid mb-4" id="preview" ><br> 
						</c:otherwise> 
					</c:choose>	-->
					
					<ul class="list-inline small text-uppercase mb-0">
					 <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">No. ${dto.write_no}</a></li>	
						 <li class="list-inline-item mr-0 text-gray align-middle">By ${dto.nickname }</li>
						 <li class="list-inline-item text-gray align-middle">${dto.savedate }</li>	
					</ul>
					  <h3 class="h4 mt-2"> <a class="reset-anchor" href="${contextPath }/board/contentView?write_no=${dto.write_no}">${dto.place_name}</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
               		 <p class="text-small mb-1">${dto.review }</p><a class="btn btn-link" href="index.html">Continue reading</a>
            
				</div>
				</c:forEach>
				
				
				
			</div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-3.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jimmy Roy</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">Guide to best markets</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
            
              </div>
              
              
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-4.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jason Doe</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">A day in Tailand</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-1.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jimmy Roy</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">The complete travel guide</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-2.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jason Doe</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">The top climbing tours</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-5.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jimmy Roy</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">Travel guide to Canada</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-6.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jason Doe</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">Guide to best markets</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-3.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jimmy Roy</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">Guide to best markets</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
              <div class="col-lg-6 mb-5"><a href="post.html"><img class="img-fluid mb-4" src="/team/resources/img/listing-tnumbnail-4.jpg" alt=""/></a>
                <ul class="list-inline small text-uppercase mb-0">
                  <li class="list-inline-item mr-0 text-gray align-middle">By </li>
                  <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jimmy Roy</a></li>
                  <li class="list-inline-item text-gray align-middle mr-0">|</li>
                  <li class="list-inline-item text-gray align-middle">22 Mar 2018</li>
                </ul>
                <h3 class="h4 mt-2"> <a class="reset-anchor" href="post.html">A day in Tailand</a></h3><a class="reset-anchor text-gray text-uppercase small mb-2 d-block" href="#">Travel guide</a>
                <p class="text-small mb-1">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.</p><a class="btn btn-link" href="index.html">Continue reading</a>
              </div>
            </div>
            
            <!-- Listing navigation -->
            <div class="p-4 bg-light mb-5">
              <div class="row">
                <div class="col-sm-6 text-center text-sm-left mb-2 mb-sm-0"><a class="btn btn-outline-secondary btn-sm" href="#"><i class="fas fa-angle-left mr-2"></i>Prev posts</a></div>
                <div class="col-sm-6 text-center text-sm-right text-right"><a class="btn btn-outline-secondary btn-sm" href="#">Next posts<i class="fas fa-angle-right ml-2"></i></a></div>
              </div>
            </div>
          </div>
          
          <!-- Sidebar -->
          <div class="col-lg-4">
           
            <!-- About me widget -->
            <div class="mb-5 text-center"><img class="mb-3 rounded-circle img-thumbnail shadow-sm" src="/team/resources/img/author.jpg" alt="" width="110">
              <h3 class="h4">About me</h3>
              <p class="text-small text-muted px-sm-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p><img class="d-block mx-auto mb-3" src="/team/resources/img/signature.png" alt="" width="60">
              <ul class="list-inline text-small mb-0">
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-facebook-f"></i></a></li>
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-linkedin"></i></a></li>
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-youtube"></i></a></li>
                <li class="list-inline-item"><a class="reset-anchor" href="#"><i class="fab fa-vimeo-v"></i></a></li>
              </ul>
            </div>
            
            <!-- Categories widget -->
            <div class="mb-5 text-center">
            	<a class="category reset-anchor bg-cover bg-center mb-2" href="#" style="background: url(/team/resources/img/category-1.jpg)">
                	<p class="category-title text-uppercase small">Lifestyle</p></a>
                <a class="category reset-anchor bg-cover bg-center mb-2" href="#" style="background: url(/team/resources/img/category-2.jpg)">
                	<p class="category-title text-uppercase small">Travel</p></a>
                <a class="category reset-anchor bg-cover bg-center" href="#" style="background: url(/team/resources/img/category-3.jpg)">
                	<p class="category-title text-uppercase small">Vacation</p></a></div>
           
            <!-- Newsletter widget -->
            <div class="px-4 py-5 bg-light mb-5 text-center">
              <h3 class="h5"><i class="far fa-envelope mr-2"></i>Join the family</h3>
              <p class="text-small text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
              <form action="#">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="email" name="email" placeholder="Emaill address">
                </div>
                <div class="form-group mb-0">
                  <button class="btn btn-dark btn-block btn-sm" type="submit">Subscribe</button>
                </div>
              </form>
            </div>
            
            <!-- Latest posts widget -->
            <div class="mb-5">
              <h3 class="h5">Latest posts</h3>
              <p class="text-small text-muted mb-4">Lorem ipsum dolor sit, consectetur adipisicing elit, sed do eiusmod.</p>
              <ul class="list-unstyled">
                <li class="media mb-1"><a href="post.html"><img src="/team/resources/img/recent-posts-thumb-1.jpg" alt="" width="80"></a>
                  <div class="media-body ml-3">
                    <p class="small text-primary text-uppercase mb-0">5 Aug 2018</p>
                    <h6 class="mb-1"><a class="reset-anchor" href="post.html">The top climbing tours</a></h6>
                    <p class="small text-muted">Lorem ipsum dolor sit, consectetur adipisicing elit, sed.</p>
                  </div>
                </li>
                <li class="media mb-1"><a href="post.html"><img src="/team/resources/img/recent-posts-thumb-2.jpg" alt="" width="80"></a>
                  <div class="media-body ml-3">
                    <p class="small text-primary text-uppercase mb-0">5 Aug 2018</p>
                    <h6 class="mb-1"><a class="reset-anchor" href="post.html">Travel guide to Canada</a></h6>
                    <p class="small text-muted">Lorem ipsum dolor sit, consectetur adipisicing elit, sed.</p>
                  </div>
                </li>
                <li class="media"><a href="post.html"><img src="/team/resources/img/recent-posts-thumb-3.jpg" alt="" width="80"></a>
                  <div class="media-body ml-3">
                    <p class="small text-primary text-uppercase mb-0">5 Aug 2018</p>
                    <h6 class="mb-1"><a class="reset-anchor" href="post.html">A day in Tailand</a></h6>
                    <p class="small text-muted mb-0">Lorem ipsum dolor sit, consectetur adipisicing elit, sed.</p>
                  </div>
                </li>
              </ul>
            </div>
            
            <!-- Instagram widget -->
            <div class="mb-5">
              <h3 class="h5">Follow on Instagram</h3>
              <p class="text-small text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
              <div class="row px-3">
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-1.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-2.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-3.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-4.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-5.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-6.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-8.jpg" alt=""></div></a></div>
                <div class="col-3 px-0"><a class="instagram-item overlay-hover-dark-sm d-block w-100" href="#">
                    <div class="overlay-content"><img class="img-fluid" src="/team/resources/img/instagram-1.jpg" alt=""></div></a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <c:import url="../default/footer.jsp"/>
    
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
