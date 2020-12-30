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
<script src="<%=request.getContextPath() %>/resources/js/SearchForm.js"></script>

<link rel="shortcut icon" href="#">

<title>아이디/비밀번호 찾기</title>

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
.search-nav { float: left; }
		.search-link {
			display: block;
			color: #000000;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
			font-size: 1.5em;
		}
		.search-link:hover {
			color: red;
		}
</style>

<script type="text/javascript">
	function searchChk(){
		var menu = '<%= request.getAttribute("menu")%>';
		if(menu == 'idinquiry'){
			document.getElementById("searchPwd").style.display="none";
			document.getElementById("searchId").style.display="";
			console.log(menu);
		}else{
			document.getElementById("searchId").style.display="none";
			document.getElementById("searchPwd").style.display="";
			console.log(menu);
		}
	}
	function changeMenu(menu){
		console.log(menu);
		if(menu == 'idinquiry'){
			document.getElementById("searchPwd").style.display="none";
			document.getElementById("searchId").style.display="";
			console.log(menu);
		}else{
			document.getElementById("searchId").style.display="none";
			document.getElementById("searchPwd").style.display="";
			console.log(menu);
		}
	}
	$(document).ready(function(){
		var zIndex = 99;
		var bg = $('<div>');
		//모달 기능
		//1. 모달 불러오기
		$("#btn_id").click(function(){
			var idv="";//비밀번호 찾기에서 아이디 자동입력 되도록 따로 저장한 아이디
			bg
				.css({
					position: 'fixed',
					zIndex: zIndex,
					left: '0px',
					top: '0px',
					width: '100%',
					height: '100%',
					overflow: 'auto',
					backgroundColor: 'rgba(0,0,0,0.4)'
				})
				.appendTo('body');
			$("#background_modal").show();

			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/searchId?name="+$('#id_name').val()+
						"&birth="+$('#user_birth').val()+"&email="+$('#id_user_email').val(),
				success: function(data){
					console.log(data);
					if(data == 0){
						$("#id_value").text("존재하지 않습니다.\n입력하신 정보를 다시 확인해주시기 바랍니다.");
					}else{
						data = data+" 입니다.";
						$("#id_value").text(data);
						idv = data;
					}
				}
			});
			
		});
		//2. 모달창 닫기
		$(".close").on('click', function(){
			bg.remove();
			$("#background_modal").hide();
		});
		
	});
</script>
</head>
<body onload="searchChk()">
	<%@ include file="/WEB-INF/views/default/header.jsp" %>
<%@ include file= "/WEB-INF/views/login/searchIdResult.jsp" %>

	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">  
						<ul style="float:left; list-style-type:none; width:100%;">
							<li class="search-nav">
								<a class="search-link" href="javascript:void(0);" onclick="changeMenu('idinquiry')">아이디 찾기</a></li>
							<li class="search-nav">
								<a class="search-link" href="javascript:void(0);" onclick="changeMenu('pwdinquiry')">비밀번호 찾기</a></li>
						</ul>
						<div align="center">
								<label>회원가입 시 등록한 회원정보를 입력하시기 바랍니다.</label>
						</div>
					</div>

					<div class="card-body">
					<!-- id찾기 -->
						<div id="searchId">
						<!-- 안내 멘트 -->
							<div align="center">
								<h3>아이디 찾기</h3><br>
							</div>
							
							<!-- name -->
							<div class="form-group row">
								<label for="name" class="col-md-4 col-form-label text-md-right">
									이름 </label>
								<div class="col-md-6">
									<input type="text" id="id_name" class="form-control" name="name"
										onblur="nameChk1()" placeholder="NAME" required>
									<div class="check_font" id="id_name_check"></div>
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

							<!-- email -->
							<div class="form-group row">
								<label for="user_email"
									class="col-md-4 col-form-label text-md-right"> E-mail </label>
								<div class="col-md-6">
									<input type="text" id="id_user_email" class="form-control"
										name="email" onblur="emailChk1()" placeholder="E-Mail" required>
									<div class="check_font" id="id_email_check"></div>
								</div>
							</div>

							<!-- submit 및 reset 버튼 -->
							<div class="col-md-6 offset-md-4">
								<button type="button" class="btn btn-primary" id="btn_id" >아이디 찾기</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger" id="btn_reset">다시입력</button>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary" id="btn_cancel" 
										onclick="location.href='<%=request.getContextPath() %>/login'">취소</button>
							</div>
						</div>
					<!-- 비밀번호 찾기 -->	
						<div id="searchPwd" style="display:none;">
						<!-- 안내 멘트 -->
							<div align="center">
								<h3>비밀번호 찾기</h3><br>
							</div>
							<form id="pwdfrm" action="searchPwd" method="post">
							<!-- userID -->
							<div class="form-group row">
								<label for="user_id"
									class="col-md-4 col-form-label text-md-right">아이디
								</label>
								<div class="col-md-6">
									<input type="text" id="user_id" class="form-control" name="id"
										 onblur="idChk()" placeholder="ID" required>
									<div class="check_font" id="id_check"></div>
								</div>
							</div>
							
							<!-- name -->
							<div class="form-group row">
								<label for="name" class="col-md-4 col-form-label text-md-right">
									이름 </label>
								<div class="col-md-6">
									<input type="text" id="name" class="form-control" name="name"
										onblur="nameChk2()" placeholder="NAME" required>
									<div class="check_font" id="name_check"></div>
								</div>
							</div>

							<!-- email -->
							<div class="form-group row">
								<label for="user_email"
									class="col-md-4 col-form-label text-md-right"> E-mail </label>
								<div class="col-md-6">
									<input type="text" id="user_email" class="form-control"
										name="email" onblur="emailChk2()" placeholder="E-Mail" required>
									<div class="check_font" id="email_check"></div>
								</div>
							</div>

							<!-- submit 및 reset 버튼 -->
							<div class="col-md-6 offset-md-4">
								<button type="submit" class="btn btn-primary" id="btn_submit">비밀번호 찾기</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger" id="btn_reset">다시입력</button>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary" id="btn_cancel" onclick="location.href='<%=request.getContextPath() %>/login'">취소</button>
							</div>
							</form>
						</div>
						
					</div>
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