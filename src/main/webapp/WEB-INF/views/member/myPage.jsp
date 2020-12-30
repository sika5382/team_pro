<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>

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
#content {
	margin-top: 10%;
	margin-bottom: 5%;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/default/header.jsp"%>

	<div class="container">
		<div class="col">
			<div id="content">
				<h1>
					여기는 마이페이지입니다.
					아무 내용이 없습니다.
				</h1>
			</div>	
		</div>
	</div>

	<%@ include file="/WEB-INF/views/default/footer.jsp"%>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>