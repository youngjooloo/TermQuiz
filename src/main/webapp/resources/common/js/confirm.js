$(function() {
	$(".confirmBtn").click(function() {
		Swal.fire({
			title: '경고',
			text: "정말로 하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href = this.id;
			}
		})
	});

	$(".confirmBtn2").click(function() {
		Swal.fire({
			title: '알림',
			text: "실행 하시겠습니까?",
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href = this.id;
			}
		})
	});

	$(".submit_Confirm").click(function(e) {
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

	$('form').on('submit', function() {
		var invalidInputs = $(":invalid", this);
		if (invalidInputs.length > 0) {
			Swal.fire({
				icon: 'error',
				title: '경고',
				text: '양식에 맞지 않습니다.',
			});
			$(invalidInputs).val('');
			return false;
		}else{
			return true
		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
});
