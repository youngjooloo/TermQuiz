$(function() {
	$(".confirmBtn").click(function() {
		Swal.fire({
			title: '경고',
			text: "정말로 실행 하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href=this.id;
			}
		})
	});

	$(".confirmBtn2").click(function() {
		Swal.fire({
			title: '알림',
			text: "이대로 실행 하시겠습니까?",
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href=this.id;
			}
		})
	});
	
});