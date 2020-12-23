<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>내정보관리</title>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/css/shop-homepage.css"
	rel="stylesheet">

<style>
</style>

</head>

<body>

	<c:import url="/default/header"></c:import>

	<!-- Page Content -->
	<div class="container">
		<h1>내정보</h1>
		<hr>
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">회원정보</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">기본정보</a> <a href="#"
						class="list-group-item">비밀번호 변경</a> <a href="#"
						class="list-group-item">회원탈퇴</a>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">회원정보 수정</div>
						<div class="card-body">
							<form action="modifyCheck" method="post" name="my-form">

								<!-- userID 수정불가 설정-->
								<div class="form-group row">
									<label for="user_id"
										class="col-md-4 col-form-label text-md-right"> 아이디 </label>
									<div class="col-md-6">
										<input type="text" id="user_id" class="form-control" name="id"
											onblur="idSameChk()" placeholder="ID" required>
										<div class="check_font" id="id_check"></div>
									</div>
								</div>

								<!-- nickname 기본적으로 변경하지 않는이상 변경금지 -->
								<div class="form-group row">
									<label for="user_nickname"
										class="col-md-4 col-form-label text-md-right"> 닉네임 </label>
									<div class="col-md-6">
										<input type="text" id="user_nickname" class="form-control"
											name="nickname" onblur="nicknameChk()" placeholder="NICKNAME"
											required>
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
											name="email" onblur="emailChk()" placeholder="E-Mail"
											required>
										<div class="check_font" id="email_check"></div>
									</div>
								</div>

								<!-- name 수정불가 -->
								<div class="form-group row">
									<label for="name" class="col-md-4 col-form-label text-md-right">
										이름 </label>
									<div class="col-md-6">
										<input type="text" id="name" class="form-control" name="name"
											onblur="nameChk()" placeholder="NAME" required>
										<div class="check_font" id="name_check"></div>
									</div>
								</div>

								<!-- birth 수정불가-->
								<div class="form-group row">
									<label for="user_birth"
										class="col-md-4 col-form-label text-md-right"> 생년월일 </label>
									<div class="col-md-6">
										<input type="text" id="user_birth" class="form-control"
											name="birth" onblur="birthChk()"
											placeholder="BIRTHDAY (ex)19000101" required>
										<div class="check_font" id="birth_check"></div>
									</div>
								</div>

								<!-- submit 및 reset 버튼 -->
								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary" id="btn_submit">변경완료</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<c:import url="/default/footer"></c:import>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
