<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Travel | Bootstrap blog</title>
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
     <!-- map style -->
     <link rel="stylesheet" href="/team/resources/css/map.css">   
<title>Insert title here</title>
<style type="text/css">
	.trb { background-color:#FF9933; }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function userCheck(userId, contentId){
		if(userId == contentId){
			document.getElementById("i_title").disabled=false;
			document.getElementById("i_content").disabled=false;
			document.getElementById("i_imageFileName").disabled=false;
		}else{
			document.getElementById("modi_wrap").style.display = "none";			
		}
	}
	function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.readAsDataURL(input.files[0]);
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	     }
	 }
	function replyData(write_no){
		console.log("write_no : "+write_no);
		$.ajax({
			url:"replyData/"+write_no,
			type:"GET",
			success:function(rep){
				let html = ""
				rep.forEach(function(data){
					var w_date = new Date(data.write_date);
					var write_date = w_date.getFullYear()+"년";
					write_date+=w_date.getMonth()+1+"월"
					write_date+=w_date.getDate()+"일"
					write_date+=w_date.getHours()+"시"
					write_date+=w_date.getMinutes()+"분"
					write_date+=w_date.getSeconds()+"초"
					html += "<b>아이디 : </b>"+data.id+" 님";
					html += " | <b>작성일 : </b>"+write_date+"<br>";
					html += "<b>제 목 : </b>"+data.title+"<br>"
					html += "<b>내용 : </b>"+data.content+"<hr>"
				});
				$("#reply").html(html);
			},error:function(){ alert("문제가 발생했습니다.") }
		})
	}
	function deleteContent(){
		console.log("delete content");
		if(confirm("글을 삭제하시겠습니까?")){
			location.href="${contextPath}/board/boardDelete?write_no=${contentView.write_no}";
		}
	}
</script>
</head>
<body onload="userCheck('<%=session.getAttribute("userid") %>','${contentView.id}'),replyData('${contentView.write_no }'), setPlace('${contentView.place_addr }')">
<%@ include file="/WEB-INF/views/default/header.jsp"%>
	<div class="col-lg-6 mb-5" style=" margin:0 auto;" >
		<!-- 수정, 삭제 버튼 -->
		<div id="modi_wrap">		
			<a class="reset-anchor text-small" href="${contextPath }/board/modifyForm?write_no=${contentView.write_no}"><i class="fas fa-share mr-2 text-primary"></i><strong>수정</strong></a>
        	<a id="dt" class="reset-anchor text-small" href="#" onclick="deleteContent()"><i class="fas fa-share mr-2 text-primary"></i><strong>삭제</strong></a>
		</div>
		<!-- map 영역 -->
		<div class="input_wrap" style="margin: 5px 5px 15px 5px;">
			<div class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; margin-top: 20px; align: center;"></div>
			</div>			
		</div>
		<ul class="list-inline small text-uppercase mb-0">
			 <li class="list-inline-item align-middle mr-0"><a class="font-weight-bold reset-anchor" href="#">No. ${contentView.write_no}</a></li>	
			 <li class="list-inline-item mr-0 text-gray align-middle">By ${contentView.nickname }</li><br>
			 <li class="list-inline-item text-gray align-middle">Date ${contentView.savedate }</li>	
		</ul>
		<h3 class="h3 mt-2" id="site_name">${contentView.place_name}</h3>
			<span id="addr">${contentView.place_addr }</span><br>
			<span>비용 : ${contentView.price }</span><br>
			<span>기타 편의시설 : ${contentView.place_etc }</span><br>
			<span>후기<br>${contentView.review }</span><br>
		<img class="img-fluid mb-4" id="preview" src=
				"${contextPath}/board/download?write_no=${contentView.write_no}&image_file_name=${contentView.image_file_name}" style="width=240px; height=320px; margin-top: 20px"><br>
		<a class="reset-anchor text-small" href="${contextPath }/board/boardReplyView?write_no=${contentView.write_no}"><i class="fas fa-share mr-2 text-primary"></i><strong>Reply</strong></a>
        <a class="reset-anchor text-small" href="${contextPath}/board/boardAllList"><i class="fas fa-share mr-2 text-primary"></i><strong>List</strong></a>
	
	</div>

<%@ include file="/WEB-INF/views/default/footer.jsp"%>

    <!-- JavaScript files-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b882b157e7e3d6a5d7b9b2560cd21cd&libraries=services"></script>
	<script src="/team/resources/js/kakaomap.js"></script>
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