
$(function() {
	$('.joininput').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			if($(this).val() != ''){
				$('.submit_Confirm2').focus();
			}
		}
	});

	$('#nickname').focusout(function() {
		let nicknameCheck = /^[가-힣|a-z|A-Z|0-9|]+$/;
		let nickname = $('#nickname').val();
		if (nickname != '') {
			if (!nickname.match(nicknameCheck)) {
				$('#nickname').val('');
				$('#nickname').attr('placeholder', '한글, 영문자, 숫자만 작성 가능');
				$('#nickname').focus();
			} else {
				nicknameDupCheck2();
			}
		}
	});
	$(".submit_Confirm2").click(function(e) {
		e.preventDefault();
		Swal.fire({
			title: '알림',
			text: "이대로 하시겠습니까?",
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				$(this).parents("form").submit();
			}
		})
	});

}); //ready	


function nicknameDupCheck2() {
	$.ajax({
		type: 'POST',
		url: 'rest/nicknamecheck',
		dataType: 'text',
		data: {
			'nickname': $('.nickname').val()
		},
		success: function(result) {
			console.log("t");
			if (result != 0) {
				$('.nickname').val('');
				$('.nickname').attr('placeholder', '중복된 닉네임입니다');
				$('.nickname').focus();
			}
		},
		error: function(result){
			
			console.log(result);
		}
	});
}



