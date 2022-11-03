"use strict"

$(function(){
		$('.joininput').keydown(function(e){
			if ( e.which==13 ) {
				e.preventDefault();
				$('#submit').click();
			}
		});
		
		$('#email').focusout(function(){
			let emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			let email = $('#email').val();
			if(email != ''){
				if(!email.match(emailCheck)){
					$('#email').val('');
					$('#email').attr('placeholder','이메일을 제대로 입력하세요');
					$('#email').focus();
				}
			}
		});
		
		
		$('#nickname').focusout(function(){
			let nicknameCheck = /^[가-힣|a-z|A-Z|0-9|]+$/;
			let nickname = $('#nickname').val();
			if(nickname != ''){
				if(!nickname.match(nicknameCheck)){
					$('#nickname').val('');
					$('#nickname').attr('placeholder','한글, 영문자, 숫자만 작성 가능');
					$('#nickname').focus();
				}
			}
		});
		
		$('#password').focusout(function(){
			let passcheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z].{8,20}$/;
			let pw = $('#password').val();
			if(pw != ''){
				if(!pw.match(passcheck)){
					$('#password').val('');
					$('#password').attr('placeholder','패턴에 맞게 작성하세요 (숫자, 영문자 포함, 8글자 이상, 20글자 이하)');
					$('#password').focus();
				}
			}
		});
		
		$('#password2').focusout(function(){
			let pw1 = $('#password').val();
			let pw2 = $('#password2').val();
			if(!(pw1 == '' && pw2 == '')){
				if(!(pw1 == pw2)){
					$('#password').val('');
					$('#password2').val('');
					$('#password2').attr('placeholder','비밀번호가 다릅니다');
					$('#password').focus();
				}
			}
		});
		
		$('#name').focusout(function(){
			let nameCheck = /^[가-힣|a-z|A-Z|]+$/;
			let name = $('#name').val();
			if(name != ''){
				if(!name.match(nameCheck)){
					$('#name').val('');
					$('#name').attr('placeholder','한글, 영문자만 작성 가능');
					$('#name').focus();
				}
			}
		});
		
}); //ready	

function numcheck(e){
	if(e.value.length > e.maxLength){
    	e.value = e.value.slice(0, e.maxLength);
    }
	if(e.value.length == e.maxLength){
		
		if(e.id == "socialnuml"){
			if(e.value > 4 || e.value < 1){
				e.value = '';
			}
		}
	
		if(e.id == "socialnumf"){
			let month = e.value.slice(2,4)*1;
			let day = e.value.slice(4,6)*1;
			
			switch(month){
				case 1 : case 3 : case 5 : case 7 : case 8 : case 10 : case 12 :
					if(day > 31 || day < 1){
						e.value = '';
						e.placeholder = "올바른 생년월일을 입력하세요"
						console.log(31);
					}else{
						$('#socialnuml').val('').focus();
					} 
					break;
					
				case 4 : case 6 : case 9 : case 11 : 
					if(day > 30 || day < 1){
						e.value = '';
						e.placeholder = "올바른 생년월일을 입력하세요"
					}else{
						$('#socialnuml').val('').focus();
					} 
					break;
					
				case 2:
					if(day > 29 || day < 1){
						e.value = '';
						e.placeholder = "올바른 생년월일을 입력하세요"
					}else{
						$('#socialnuml').val('').focus();
					}  
					break;
					
				default :
					e.value = '';
					e.placeholder = "올바른 생년월일을 입력하세요"
					break;					
			}
			
		}
	}
}

function agreecheck(){
	if(!$('#agree-term').is(':checked')){
		$('#agreecheck').text("* 이용약관에 동의해주세요 *");
		return false;
	} else{
		$('#agreecheck').text("");
	}
}
