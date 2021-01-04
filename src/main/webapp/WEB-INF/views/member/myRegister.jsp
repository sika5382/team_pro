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

<!-- js파일 삽입 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/myRegister.js"></script>

<title>내정보관리</title>

<style>
body {
	padding-top: 56px;
}

#main {
	margin-top: 2%;
	margin-bottom: 3%;
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
			<div class="col-lg-3">
				<h1 class="my-4">회원정보</h1>
				<div class="list-group">
					<c:choose>
						<c:when test="${userid == null }">
							<a href="<%=request.getContextPath() %>/login"
								 class="list-group-item">기본정보</a> 
							<a href="<%=request.getContextPath() %>/login" 
								class="list-group-item">비밀번호 변경</a> 
							<a href="<%=request.getContextPath() %>/login" 
								class="list-group-item">회원탈퇴</a>
						</c:when>
						<c:otherwise>
							<a href="<%=request.getContextPath() %>/member/myRegister?id=${userid}" 
								class="list-group-item">기본정보</a> 
							<a href="<%=request.getContextPath() %>/member/passwordModify?id=${userid}" 
								class="list-group-item">비밀번호 변경</a> 
							<c:choose>
								<c:when test="${delete == null}">
									<a href="<%=request.getContextPath() %>/member/deleteCheck?id=${userid}" 
										class="list-group-item">회원탈퇴</a>
								</c:when>
								<c:otherwise>
									<a href="<%=request.getContextPath() %>/member/registerDelete?id=${userid}" 
										class="list-group-item">회원탈퇴</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-header">회원정보 수정</div>
							<div class="card-body">
								<form id="mdfo" action="modifyCheck" method="post" name="my-form">

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

									<!-- profile img -->
									<!--  -->
									<!-- <div class="form-group row">
										<label for="user_img"
											class="col-md-4 col-form-label text-md-right"> 프로필
											이미지 
										</label>
										<div class="col-md-6">
											<input type="file" id="exampleInputFile">
										</div>
									</div> -->


									<!-- submit 및 reset 버튼 -->
									<div class="col-md-6 offset-md-4">
										<button type="button" class="btn btn-primary" 
											onclick="user_modify()" id="btn_submit">변경완료</button>
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
