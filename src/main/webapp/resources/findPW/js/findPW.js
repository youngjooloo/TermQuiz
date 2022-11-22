/**
 * 
 */

"use strict"

$(function() {

	$('#email').focusout(function() {
		let emailCheck = /^[0-9a-zA-Z]*@[0-9a-zA-Z]*.[a-zA-z]{2,3}$/;
		let email = $('#email').val();
		if (email != '') {
			if (!email.match(emailCheck)) {
				$('#email').val('');
				$('#email').attr('placeholder', '이메일을 제대로 입력하세요');
				$('#email').focus();
			}
		}
	});

	$('#password').focusout(function() {
		let passcheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z].{8,20}$/;
		let pw = $('#password').val();
		if (pw != '') {
			if (!pw.match(passcheck)) {
				$('#password').val('');
				$('#password').attr('placeholder', '패턴에 맞게 작성하세요 (숫자, 영문자 포함, 8글자 이상, 20글자 이하)');
				$('#password').focus();
			}
		}
	});

	$('#password2').focusout(function() {
		let pw1 = $('#password').val();
		let pw2 = $('#password2').val();
		if (!(pw1 == '' && pw2 == '')) {
			if (!(pw1 == pw2)) {
				$('#password').val('');
				$('#password2').val('');
				$('#password2').attr('placeholder', '비밀번호가 다릅니다');
				$('#password').focus();
			}
		}
	});

	$('#name').focusout(function() {
		let nameCheck = /^[가-힣|a-z|A-Z|]+$/;
		let name = $('#name').val();
		if (name != '') {
			if (!name.match(nameCheck)) {
				$('#name').val('');
				$('#name').attr('placeholder', '한글, 영문자만 작성 가능');
				$('#name').focus();
			}
		}
	});

}); //ready	
