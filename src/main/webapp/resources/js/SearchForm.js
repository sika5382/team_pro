
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,20}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,16}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 닉네임 정규식
var nickJ = /^[A-Za-z가-힣0-9]{2,10}$/;
// 생년월일 정규식
var birthJ = /^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;


// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
function idChk() {
	var user_id = $("#user_id").val();
	console.log(user_id);
	// 0 : 아이디 길이 / 문자열 검사
	if (idJ.test(user_id)) {
		$("#id_check").text("");
		$("#btn_submit").attr("disabled", false);
		
	} else if (user_id == "") {
		$('#id_check').text('아이디를 입력해주세요');
		$('#id_check').css('color', 'red');
		$("#btn_submit").attr("disabled", true);

	} else if (empJ.test(user_id)) {
		$('#id_check').text('공백이 포함되었습니다.');
		$('#id_check').css('color', 'red');
		$("#btn_submit").attr("disabled", true);

	} else {
		$('#id_check').text("아이디는 소문자와 숫자 4~20자리만 가능합니다");
		$('#id_check').css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}
}

function emailChk1() {

	var user_email = $("#id_user_email").val();
	if (mailJ.test(user_email)) {
		$("#id_email_check").text("");
		$("#btn_id").attr("disabled", false);
	} else {
		$("#id_email_check").text("이메일형식을 지켜주십시오");
		$("#id_email_check").css('color', 'red');
		$("#btn_id").attr("disabled", true);
	}
}

function emailChk2() {

	var user_email = $("#user_email").val();
	if (mailJ.test(user_email)) {
		$("#email_check").text("");
		$("#btn_submit").attr("disabled", false);
	} else {
		$("#email_check").text("이메일형식을 지켜주십시오");
		$("#email_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}
}

function nameChk1() {

	var name = $("#id_name").val();
	if (nameJ.test(name)) {
		$("#id_name_check").text("");
		$("#btn_id").attr("disabled", false);
	} else {
		$("#id_name_check").text("정확한 이름을 입력하세요");
		$("#id_name_check").css('color', 'red');
		$("#btn_id").attr("disabled", true);
	}
}

function nameChk2() {

	var name = $("#name").val();
	if (nameJ.test(name)) {
		$("#name_check").text("");
		$("#btn_submit").attr("disabled", false);
	} else {
		$("#name_check").text("정확한 이름을 입력하세요");
		$("#name_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}
}

function birthChk() {

	var birth = $("#user_birth").val();
	if (birthJ.test(birth)) {
		$("#birth_check").text("");
		$("#btn_submit").attr("disabled", false);
	} else {
		$("#birth_check").text("올바른 생년월일이 아닙니다 ex)19000101");
		$("#birth_check").css('color', 'red');
		$("#btn_submit").attr("disabled", true);
	}
}
