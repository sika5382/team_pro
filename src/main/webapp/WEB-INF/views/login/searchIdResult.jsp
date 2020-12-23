<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.background_modal{
	display:none;
	position: fixed;
	box-shadow: 0 4px 8px 0 rgba(0,0,0,2), 0 6px 20px rgba(0,0,0,0.19);
	z-index: 100;
	top: 30%;
	left: 30%;
	width:600px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
</style>
</head>
<body>
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h4>
			<b>입력하신 정보로 조회되는 아이디는 </b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="login_btn" class="btn peach-gradient btn-rounded waves-effect"
			onclick="location.href='<%=request.getContextPath() %>/login'">
		<i class="fa fa-envelope">로그인</i></button>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect"
			onclick="location.href='<%=request.getContextPath() %>/searchForm?menu=pwdinquiry'">
		<i class="fa fa-envelope">비밀번호 찾기</i></button>
	</div>
</div>
</body>
</html>