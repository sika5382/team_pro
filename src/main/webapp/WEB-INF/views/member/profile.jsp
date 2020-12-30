<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
	
<!-- 합쳐지고 최소화된 최신 CSS -->	
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<title>이미지 변경</title>
<script>

</script>
</head>
<body>
	<div class="container">
		<div class="col">
		<c:set var="path" value="${pageContext.request.contextPath }"/>
			<form action="${path}/profile_change" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${userid}">
				<input type="file" name="profile_img">
				<input type="button" onclick="profile_change()" value="확인">
			</form>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>