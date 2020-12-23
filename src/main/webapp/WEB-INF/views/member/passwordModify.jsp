<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="shortcut icon" href="#">

<!-- js파일 삽입 -->
<script type="text/javascript"
	src="<%=request.getContextPath() %>/resources/js/registerForm.js"></script>

<title>아직 미정</title>

<style type="text/css">
body {
	margin-top: 80px;
	margin-bottom: 30px;
	font-size: .9rem;
	font-weight: 400;
	line-height: 1.6;
	color: #212529;
	text-align: left;
	background-color: #f5f8fa;
	font-size: .9rem;
	font-size: .9rem;
}

.my-form {
	padding-top: 1.5rem;
	padding-bottom: 1.5rem;
}

.my-form .row {
	margin-left: 0;
	margin-right: 0;
}
.card{
	margin: 5% 5%;
}
</style>

</head>
<body>

	<c:import url="/default/header" />

	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">회원가입</div>
					<div class="card-body">
						<form action="registerCheck" method="post" name="my-form">

							<!-- userID -->
							<div class="form-group row">
								<label for="user_id"
									class="col-md-4 col-form-label text-md-right"> 사용할 아이디
								</label>
								<div class="col-md-6">
									<input type="text" id="user_id" class="form-control" name="id"
										onblur="idSameChk()" placeholder="ID" required>
									<div class="check_font" id="id_check"></div>
								</div>
							</div>

							<!-- nickname  -->
							<div class="form-group row">
								<label for="user_nickname"
									class="col-md-4 col-form-label text-md-right"> 사용할 닉네임
								</label>
								<div class="col-md-6">
									<input type="text" id="user_nickname" class="form-control"
										name="nickname" onblur="nicknameChk()" placeholder="NICKNAME"
										required>
									<div class="check_font" id="nickname_check"></div>
								</div>
							</div>

							<!-- password -->
							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right"> 비밀번호 입력
								</label>
								<div class="col-md-6">
									<input type="password" id="password" class="form-control"
										name="pwd" onblur="pwdChk()" placeholder="PASSWORD" required>
									<div class="check_font" id="pwd_check"></div>
								</div>
							</div>

							<!-- passwordCheck -->
							<div class="form-group row">
								<label for="passwordChk"
									class="col-md-4 col-form-label text-md-right"> 비밀번호 확인
								</label>
								<div class="col-md-6">
									<input type="password" id="passwordChk" class="form-control"
										name="pwd2" onblur="pwdSameChk()"
										placeholder="Confirm password" required>
									<div class="check_font" id="pwd2_check"></div>
								</div>
							</div>

							<!-- email -->
							<div class="form-group row">
								<label for="user_email"
									class="col-md-4 col-form-label text-md-right"> E-mail </label>
								<div class="col-md-6">
									<input type="text" id="user_email" class="form-control"
										name="email" onblur="emailChk()" placeholder="E-Mail" required>
									<div class="check_font" id="email_check"></div>
								</div>
							</div>

							<!-- name -->
							<div class="form-group row">
								<label for="name" class="col-md-4 col-form-label text-md-right">
									이름 </label>
								<div class="col-md-6">
									<input type="text" id="name" class="form-control" name="name"
										onblur="nameChk()" placeholder="NAME" required>
									<div class="check_font" id="name_check"></div>
								</div>
							</div>

							<!-- birth -->
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
								<button type="submit" class="btn btn-primary" id="btn_submit">회원가입</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger" id="btn_reset">다시입력</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- </container> -->

	<c:import url="/default/footer"></c:import>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>