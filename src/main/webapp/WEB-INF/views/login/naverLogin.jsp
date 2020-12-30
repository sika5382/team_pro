<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- naver 로그인 라이브러리 -->
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "lghlRZ2x21u9zidXG7JU",
			callbackUrl: "http://localhost:8090/team/naverLogin",
			callbackHandle: true,
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				var birthday = naverLogin.user.getBirthday();			
				var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				console.log(profileImage);
				console.log(birthday);
				console.log(age);
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				alert(email);
				document.getElementById("id").value = uniqId;
				document.getElementById("nickname").value = name;
				var form = document.getElementById("frm");
				form.submit();
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>
<body>
<!-- // 네이버아이디로로그인 초기화 Script -->
<form id="frm" action="naverSuccess" method="post">
<input type="hidden" name="id" id="id">
<input type="hidden" name="nickname" id="nickname" value="">
<input type="hidden" name="email" id="email" value="">
<input type="hidden" name="birth" id="birth" value="">
</form>
</body>
</html>