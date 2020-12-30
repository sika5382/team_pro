
//모든 공백 체크 정규식
var empJ = /\s/g;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,16}$/;


function newPwdChk() {

	var pwd = $("#pwd").val();
	if (pwJ.test(pwd)) {
		$("#pwd_check").text("사용가능한 비밀번호입니다");
		$("#pwd_check").css('color', 'green');
		$("#btn_submit").attr("disabled", false);
	} else if (empJ.test(pwd)) {
		$("#pwd_check").text("공백이 포함되어있습니다");
		$("#pwd_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	} else {
		$("#pwd_check").text("비밀번호는 대/소문자와 숫자 4~16자리만 가능합니다");
		$("#pwd_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}
}

function newPwdSameChk() {

	var pwd = $("#pwd").val();
	var pwd2 = $("#pwdChk").val();
	
	if(pwd2 == ""){
		$("#pwd2_check").text("비밀번호를 입력해주세요");
		$("#pwd2_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}else{
		if (pwd === pwd2) {
		$("#pwd2_check").text("");
		$("#btn_submit").attr("disabled", false);
		}else {
		$("#pwd2_check").text("비밀번호와 다릅니다.");
		$("#pwd2_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
		}
	}
}



