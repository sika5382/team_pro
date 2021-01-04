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
								class="list-group-item">프로필 사진 변경</a>
							<a href="<%=request.getContextPath() %>/login" 
								class="list-group-item">비밀번호 변경</a> 
							<a href="<%=request.getContextPath() %>/login" 
								class="list-group-item">회원탈퇴</a>
						</c:when>
						<c:otherwise>
							<a href="<%=request.getContextPath() %>/member/myPage?id=${userid}" 
								class="list-group-item">기본정보</a>
							<a href="<%=request.getContextPath() %>/member/profile?id=${userid}" 
								class="list-group-item">프로필 사진 변경</a> 
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
							<div class="card-header"> 비밀번호 변경 </div>
							<div class="card-body">
								<form id="pwfo" action="pwdModify" method="post" name="my-form">
								
									<input type="hidden" id="user_id" class="form-control"
												name="id" value="${userInfo.id }">
								
									<!-- 기본 비밀번호를 입력해서 확인 후 새로운 비밀번호로 변경 -->
									<div class="form-group row">
										<label for="password"
											class="col-md-4 col-form-label text-md-right"> 기존 비밀번호
											입력 </label>
										<div class="col-md-6">
											<input type="password" id="ori_password" class="form-control"
												name="ori_pwd" required>
										</div>
									</div>
									
									<!-- new password -->
									<div class="form-group row">
										<label for="pwd"
											class="col-md-4 col-form-label text-md-right"> 신규 비밀번호
											입력 </label>
										<div class="col-md-6">
											<input type="password" id="pwd" class="form-control"
												name="pwd" onblur="newPwdChk()">
											<div class="check_font" id="pwd_check"></div>
										</div>
									</div>

									<!-- new passwordCheck -->
									<div class="form-group row">
										<label for="pwdChk"
											class="col-md-4 col-form-label text-md-right"> 신규 비밀번호
											확인 </label>
										<div class="col-md-6">
											<input type="password" id="pwdChk" class="form-control"
												name="pwd2" onblur="newPwdSameChk()">
											<div class="check_font" id="pwd2_check"></div>
										</div>
									</div>

									<!-- submit 및 reset 버튼 -->
									<div class="col-md-6 offset-md-4">
										<button type="submit" class="btn btn-primary"
											id="btn_submit">변경완료</button>
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
	
	<!-- js파일 삽입 -->
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/passwordModify.js"></script>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
