<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">

 <!--  추가 -->
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
     
<title>글쓰기창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
	   var file = input.files[0] //파일에 대한 정보
      if (file != '') {
	      var reader = new FileReader();
	      reader.readAsDataURL(file); //읽고 
	      reader.onload = function (e) { // 로드한 값을 표현한다
	        $('#preview').attr('src', e.target.result);
          }
      }
  }
</script>
<title>글쓰기창</title>
</head>

 <body>
 
  	<c:import url="../default/header.jsp"/>
    
    <section class="py-5">
      <div class="container text-center">
        <p class="h6 mb-0 text-uppercase text-primary">Lifestyle</p>
        <h1>The secret to find a amusing place</h1>
        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis aliquid</p>
        <ul class="list-inline small text-uppercase mb-0">
          <li class="list-inline-item align-middle"><img class="rounded-circle shadow-sm" src="/team/resources/img/person-1.jpg" alt="" width="40"/></li>
          <li class="list-inline-item mr-0 text-muted align-middle">By </li>
          <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">Jason Doe</a></li>
          <li class="list-inline-item text-muted align-middle mr-0">|</li>
          <li class="list-inline-item text-muted align-middle mr-0">June 15, 2019</li>
          <li class="list-inline-item text-muted align-middle mr-0">|</li>
          <li class="list-inline-item text-muted align-middle">20 Comments</li>
        </ul>
      </div><img class="w-100 py-5" src="/root/resources/img/post-banner.jpg" alt="">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mb-5 mb-lg-0">
            <p class="lead first-letter-styled line-height-lg"></p>
            <div class="px-lg-5 mb-5">
              <blockquote class="blockquote-custom"></blockquote>
            </div>
        
            <p></p>
            <p class="mb-5"></p>
            <div class="p-4 bg-light mb-5">
              <ul class="list-inline mb-0">
                <li class="list-inline-item mr-2 pr-lg-2"><a class="tag reset-anchor" href="#"><i class="fas fa-bookmark text-primary mr-2"></i>Travel</a></li>
                <li class="list-inline-item mr-2 pr-lg-2"><a class="tag reset-anchor" href="#"><i class="fas fa-bookmark text-primary mr-2"></i>Lifestyle</a></li>
                <li class="list-inline-item mr-2 pr-lg-2"><a class="tag reset-anchor" href="#"><i class="fas fa-bookmark text-primary mr-2"></i>Vacation</a></li>
              </ul>
            </div>
            <h3 class="h4 mb-4">Share this post</h3>
            <ul class="list-inline mb-5">
              <li class="list-inline-item mr-1 mb-3"><a class="social-link-share facebook" href="#"><i class="fab fa-facebook-f mr-2"></i>Share</a></li>
              <li class="list-inline-item mr-1 mb-3"><a class="social-link-share twitter" href="#"><i class="fab fa-twitter mr-2"></i>Tweet</a></li>
              <li class="list-inline-item mr-1 mb-3"><a class="social-link-share instagram" href="#"><i class="fab fa-instagram mr-2"></i>Share</a></li>
            </ul>
            
            <!-- 파일 업로드  -->
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<c:set var="path" value="${pageContext.request.contextPath }"/>  
			
            <h3 class="h4 mb-4">당신의 경험을 공유해 주세요</h3>
            
            
            <form class="mb-5" action="${contextPath}/board/writeSave" method="post" enctype="multipart/form-data">
              <div class="row">
                <div class="form-group col-lg-6">
                  <input class="form-control" type="text" name="id" placeholder="Full Name e.g. Jason Doe" value="${userId }">
                </div>
                <div class="form-group col-lg-6">
                  <input class="form-control" type="text" name="title" placeholder="Email Address e.g. Jason@email.com">
                </div>
                <div class="form-group col-lg-12">
                  <textarea class="form-control" name="content" rows="5" placeholder="Leave your message"></textarea>
                </div>
                
                <div>
              		 <b>이미지파일 첨부</b><br>
       				 <input type="file" name="image_file_name" onchange="readURL(this);" />
       				 <img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"/>
       				 <!-- 
       				 <%=request.getRealPath("/") %>
       				  -->
                </div>
              
                <div class="form-group col-lg-12">
                  <button class="btn btn-dark" type="submit">Submit your comment</button>
                </div>
              </div>
            </form>
            
            <h3 class="h4 mb-4 d-flex align-items-center"><span>Comments</span><span class="text-small ml-3 text-gray">- 3 Comments</span></h3>
            <ul class="list-unstyled comments">
              <li>
                <div class="d-flex mb-4">
                  <div class="pr-2 flex-grow-1" style="width: 75px; min-width: 75px;"><img class="rounded-circle shadow-sm img-fluid img-thumbnail" src="/team/resources/img/person-1.jpg" alt=""></div>
                  <div class="pl-2">
                    <p class="small mb-0 text-primary">15 Aug 2019</p>
                    <h5>Jimmy Roy</h5>
                    <p class="text-muted text-small mb-2">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At.</p><a class="reset-anchor text-small" href="#"><i class="fas fa-share mr-2 text-primary"></i><strong>Reply</strong></a>
                  </div>
                </div>
                <ul class="list-unstyled">
                  <li> 
                    <div class="d-flex mb-4">
                      <div class="pr-2 flex-grow-1" style="width: 75px; min-width: 75px;"><img class="rounded-circle shadow-sm img-fluid img-thumbnail" src="/team/resources/img/person-2.jpg" alt=""></div>
                      <div class="pl-2">
                        <p class="small mb-0 text-primary">19 Sep 2019</p>
                        <h5>Melissa Johanson</h5>
                        <p class="text-muted text-small mb-2">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At.</p><a class="reset-anchor text-small" href="#"><i class="fas fa-share mr-2 text-primary"></i><strong>Reply</strong></a>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
              <li>
                <div class="d-flex mb-4">
                  <div class="pr-2 flex-grow-1" style="width: 75px; min-width: 75px;"><img class="rounded-circle shadow-sm img-fluid img-thumbnail" src="/team/resources/img/person-3.jpg" alt=""></div>
                  <div class="pl-2">
                    <p class="small mb-0 text-primary">10 Oct 2019</p>
                    <h5>David Nguyen</h5>
                    <p class="text-muted text-small mb-2">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At.</p><a class="reset-anchor text-small" href="#"><i class="fas fa-share mr-2 text-primary"></i><strong>Reply</strong></a>
                  </div>
                </div>
              </li>
            </ul>
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
    <script src="/root/resources/js/front.js"></script>
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