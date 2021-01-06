<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
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
<!-- theme stylesheet-->
<link rel="stylesheet" href="/team/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- js파일 삽입 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/myRegister.js"></script>

<title>내정보관리</title>

</head>

<body>

	<%@ include file="/WEB-INF/views/default/header.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<h1>내정보</h1>
		<hr>
		<div class="row">
			
			<%@ include file="/WEB-INF/views/default/kategorie.jsp"%>
			
			<div class="col-lg-9">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-header">회원정보 수정</div>
							<div class="card-body">
								<form id="mdfo" action="modifyCheck" method="post">

									<!-- userID 수정불가 설정-->
									<div class="form-group row">
										<label for="user_id"
											class="col-md-4 col-form-label text-md-right"> 아이디 </label>
										<div class="col-md-6">
											<input type="hidden" id="user_id" class="form-control"
												name="id" value="${userInfo.id }"> 
											<label class="col-md-6 col-form-label text-md-left">
												${userInfo.id } </label>

										</div>
									</div>

									<!-- name 수정불가 -->
									<div class="form-group row">
										<label for="name"
											class="col-md-4 col-form-label text-md-right"> 이름 </label>
										<div class="col-md-6">
											<input type="hidden" id="name" class="form-control"
												name="name" value="${userInfo.name }"> 
											<label class="col-md-4 col-form-label text-md-left">
												${userInfo.name } </label>
										</div>
									</div>

									<!-- birth 수정불가-->
									<div class="form-group row">
										<label for="user_birth"
											class="col-md-4 col-form-label text-md-right"> 생년월일 </label>
										<div class="col-md-6">
											<input type="hidden" id="user_birth" class="form-control"
												name="birth" value="${userInfo.birth }"> 
											<label class="col-md-6 col-form-label text-md-left">
												${userInfo.birth} </label>
										</div>
									</div>

									<!-- nickname 기본적으로 변경하지 않는이상 변경금지 -->
									<div class="form-group row">
										<label for="user_nickname"
											class="col-md-4 col-form-label text-md-right"> 닉네임 </label>
										<div class="col-md-6">
											<input type="hidden" id="ori_nickname" class="form-control"
												 value="${userInfo.nickname }">
											<input type="text" id="user_nickname" class="form-control"
												name="nickname" value="${userInfo.nickname }"
												onblur="nicknameSame()">
											<div class="check_font" id="nickname_check"></div>
										</div>
									</div>

									<!-- email 변경가능-->
									<div class="form-group row">
										<label for="user_email"
											class="col-md-4 col-form-label text-md-right"> E-mail
										</label>
										<div class="col-md-6">
											<input type="text" id="user_email" class="form-control"
												name="email" value="${userInfo.email }" 
												onblur="emailChk()">
										</div>
									</div>

									<!-- submit 및 reset 버튼 -->
									<div class="col-md-6 offset-md-4">
										<input class="btn btn-primary" type="button" 
											onclick="user_modify()" id="btn_submit" value="변경완료">
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
