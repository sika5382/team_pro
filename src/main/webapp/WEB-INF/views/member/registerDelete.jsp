<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<script type="text/javascript">
		function Delete(){
			var confirmflag = confirm("정말로 회원을 탈퇴하시겠습니까?");
			if(confirmflag){//탈퇴
				alert("정상적으로 탈퇴되셨습니다 \n 지금까지 이용해주셔서 감사합니다");
				$("#delinfo").submit();
	        }else{//전페이지로 돌아감
	        	<% session.removeAttribute("delete"); %>
				history.back();
	        }
	   	}	
	</script>
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
							<a href="<%=request.getContextPath() %>/member/myRegister?id=${userid}" 
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
							<div class="card-header">회원 탈퇴</div>
							<div class="card-body">
								<!-- button으로 탈퇴 넘어가기 -->
									<div style="text-align: center;">
									<br>
										<h3>
											${userid}님 탈퇴하시겠습니까?
										</h3>
										<br>
										<br>
									</div>
									
									<form id="delinfo" action="userdelete" >
										<input type="hidden" name="id" value="${userid}">
										<div class="col-md-6 offset-md-4">
											<button type="button" class="btn btn-primary"
												onclick="Delete()">탈퇴하기</button>
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