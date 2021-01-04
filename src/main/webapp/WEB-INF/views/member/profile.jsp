<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/css/shop-homepage.css"
	rel="stylesheet">

<title>내정보관리</title>

<style>
body {
	padding-top: 56px;
}

#main {
	margin-top: 2%;
	margin-bottom: 3%;
}

.btn-file{
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file]{
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity=0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

</head>

<body>

	<%@ include file="/WEB-INF/views/default/header.jsp"%>

	<!-- Page Content -->
	<div class="container" id="main">
		<h1>내정보</h1>
		<hr>
		<div class="row">
		
			<%@ include file="/WEB-INF/views/default/kategorie.jsp"%>

			<div class="col-lg-9">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-header">프로필 사진 변경</div>
							<div class="card-body">
								<form action="userProfile" enctype="multipart/form-data" method="post">

									<!-- userID 수정불가 설정-->
									<div class="form-group row">
										<label for="user_id"
											class="col-md-4 col-form-label text-md-right"> 아이디 </label>
										<div class="col-md-6">
											<input type="hidden" id="user_id" class="form-control"
												name="id" value="${userInfo.id }"> 
											<label class="col-md-4 col-form-label text-md-left">
												${userInfo.id } </label>

										</div>
									</div>

									<!-- profile img -->
									<div class="form-group row">
										<label for="user_img"
											class="col-md-4 col-form-label text-md-right"> 프로필
											이미지 
										</label>
										<div class="col-md-6">
											<span class="btn btn-primary btn-file">
												이미지를 업로드하세요
												<input type="file" name="profile_img">
											</span>
										</div>
									</div>


									<!-- submit 및 reset 버튼 -->
									<div class="col-md-6 offset-md-4">
										<button type="submit" class="btn btn-primary" 
											id="btn_submit">등록</button>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- </.col-lg-9> -->
		</div>
		<!-- </.row> -->
	</div>
	<!-- /.container -->

	<%@ include file="/WEB-INF/views/default/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
