<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미정</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="shortcut icon" href="#">

<style type="text/css">
h1{
	text-align: center;
}
#btn_form{
	margin-top: 15%;
}

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/default/header.jsp" %>

	<div class="containder">
		<div id="content">
			<div>
				<h1>회원님의 신규회원가입을 축하합니다.</h1>
			</div>
			<div id="btn_form" align="center">
				<div class="col-md-6">
					<button type="button" class="btn btn-info"
						onclick="location.href='/team/login'">로그인으로 이동</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-info"
						onclick="location.href='/team/'">홈페이지로 이동</button>
				</div>
			</div>
		</div>
	</div>
	<!-- </container> -->

	<%@ include file="/WEB-INF/views/default/footer.jsp" %>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>