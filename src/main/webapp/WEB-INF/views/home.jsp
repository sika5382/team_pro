
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage -  투어 Template</title>

   <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Custom styles for this template -->
  <link href="resources/css/shop-homepage.css" rel="stylesheet">

  <style>
	  .gray_window {
		display: inline-block;
		width: 500px; height: 40px;
		border: 3px solid #8f8f8f;
		background: white;
		margin-top:20px;
	}
	.input_text {
		width: 348px; height: 21px;
		margin: 6px 0 0 9px;
		border: 0;
		line-height: 21px;
		font-weight: bold;
		font-size: 16px;
		outline: none;
	}
	.sch_smit {
		width: 54px; height: 40px;
		margin: 0; border: 0;
		vertical-align: top;
		background: #000000;
		color: white;
		font-weight: bold;
		border-radius: 1px;
		cursor: pointer;
		margin-top:20px;
	}
	.sch_smit:hover {
		background: #8f8f8f;
	}
	  
  </style>
</head>

<body>
<%@ include file="/WEB-INF/views/default/header.jsp" %>
  <!-- Page Content -->

  <div class="container">

    <div class="row">

      <div class="col-lg-3">

		<h1 class="my-4">카테고리</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">인기</a>
          <a href="#" class="list-group-item">신규</a>
          <a href="#" class="list-group-item">지역</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

		<div>
			<span class='gray_window'>
			<input type='text' class='input_text' placeholder="여행지를 입력하세요"/>
			</span>
			<button type='submit' class='sch_smit'>검색</button>
		
		</div>

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/img/a.jpg" alt="First slide">
              
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/img/b.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/img/c.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">여기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용 들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">요기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용 들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">요기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">요기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">요기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용 들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">요기</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">내용들어갈곳</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
<%@ include file="/WEB-INF/views/default/footer.jsp" %>
<%@include file="default/footer.jsp" %>
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>

</html>
