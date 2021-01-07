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

<title>Kategorie</title>

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


	<!-- Page Content -->

	<div class="col-lg-3">
		<div class="list-group">
			<c:choose>
				<c:when test="${userid == null }">
					<a href="<%=request.getContextPath() %>/login"
						class="list-group-item">기본정보</a>
					<a href="<%=request.getContextPath() %>/login"
						class="list-group-item">비밀번호 변경</a>
					<a href="<%=request.getContextPath() %>/login"
						class="list-group-item">프로필 사진 변경</a>
					<a href="<%=request.getContextPath() %>/login"
						class="list-group-item">회원탈퇴</a>
				</c:when>
				<c:otherwise>
					<a href="<%=request.getContextPath() %>/member/myPage?id=${userid}"
						class="list-group-item">기본정보</a>
					<a
						href="<%=request.getContextPath() %>/member/passwordModify?id=${userid}"
						class="list-group-item">비밀번호 변경</a>
					<a
						href="<%=request.getContextPath() %>/member/profile?id=${userid}"
						class="list-group-item">프로필 사진 변경</a>
					<c:choose>
						<c:when test="${delete == null}">
							<a
								href="<%=request.getContextPath() %>/member/deleteCheck?id=${userid}"
								class="list-group-item">회원탈퇴</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=request.getContextPath() %>/member/registerDelete?id=${userid}"
								class="list-group-item">회원탈퇴</a>
						</c:otherwise>
					</c:choose>
					<a href="<%=request.getContextPath() %>/member/myContent?id=${userid }" 
								class="list-group-item">내가 쓴 글</a>
							<a href="<%=request.getContextPath() %>/member/myReview?id=${userid }" 
								class="list-group-item">내가 쓴 리뷰</a>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<!-- /.col-lg-3 -->
	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
