
//모든 공백 체크 정규식
var empJ = /\s/g;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 닉네임 정규식
var nickJ = /^[A-Za-z가-힣0-9]{2,10}$/;



function nicknameSame(){
	var nickname = $("#user_nickname").val();
	var ori = $("#ori_nickname").val();
	console.log(ori +" : "+ nickname);
	if( ori != nickname ){
		nicknameChk(nickname);
	}else{
		$("#nickname_check").text("현재 닉네임입니다");
		$("#nickname_check").css('color',"blue");
		$("#btn_submit").attr("disabled", false);
	}
}

function nicknameChk(nickname) {

	console.log(nickname);
	$.ajax({
		url: 'nicknameCheck?nickname=' + nickname,
		type: 'get',
		success: function(data) {
			var str = null;
			if (data == 1) {
				str = "닉네임 중복값 있음"
			} else {
				str = "닉네임 중복값 체크완료"
			}

			console.log("닉네임 중복값 결과 : " + str);

			if (data == 1) {
				// 1 : 닉네임이 중복되는 문구
				$("#nickname_check").text("사용중인 닉네임입니다");
				$("#nickname_check").css("color", "red");
				$("#btn_submit").attr("disabled", true);
			} else {
				// 0 : 닉네임 길이 / 문자열 검사
				if (nickJ.test(nickname)) {
					$("#nickname_check").text("");
					$("#btn_submit").attr("disabled", false);

				} else if (nickname == "") {
					$("#nickname_check").text("닉네임을 입력해주세요");
					$("#nickname_check").css("color", "red");
					$("#btn_submit").attr("disabled", true);

				} else if (empJ.test(nickname)) {
					$("#nickname_check").text('공백이 포함되었습니다.');
					$("#nickname_check").css('color', 'red');
					$("#btn_submit").attr("disabled", true);

				} else {
					$("#nickname_check").text("닉네임은 2~10자리만 가능합니다");
					$("#nickname_check").css('color', 'red');
					$("#btn_submit").attr("disabled", true);
				}
			}
		},
		error: function() {
			console.log("실패");
		}
	});
}

function emailChk() {

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

function user_modify(){
		alert("수정이 완료 되었습니다");
		mdfo.submit();
	}

