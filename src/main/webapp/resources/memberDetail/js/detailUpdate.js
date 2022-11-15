/**
 * 
 */

$(function(){
	$('.nickname').focusout(function() {
		let nicknameCheck = /^[가-힣|a-z|A-Z|0-9|]+$/;
		let nickname = $('.nickname').val();
		let nick = this.id;
		nickname = nickname.toUpperCase();
		nick = nick.toUpperCase()
		if (nickname != '') {
			if (!nickname.match(nicknameCheck)) {
				$('.nickname').val('');
				$('.nickname').attr('placeholder', '한글, 영문자, 숫자만 작성 가능');
				$('.nickname').focus();
			}else if(!nickname.match(nick)){
				nicknameDupCheck();
			}
		}
	});
});


function nicknameDupCheck(){
	$.ajax({
		type: 'POST',
		url: 'nicknamecheck',
		dataType : 'JSON',
		data: {
			'nickname' : $('.nickname').val()
		},
		success: function(result) {
			if(result.dup != 0){
				$('.nickname').val('');
				$('.nickname').attr('placeholder','중복된 닉네임입니다');								
				$('.nickname').focus();
			}
		},
	});
}



