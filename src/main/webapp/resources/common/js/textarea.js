$(function(){
	$('.boardText').keyup(function() {
		let content = $(this).val();
		let countBox = $(this).next('p');
		// 글자수 세기
		if (content.length == 0 || content == '') {
			$(countBox).text('0자/500자');
		} else {
			$(countBox).text(content.length + '자/500자');
		} //if
		
		let rows = $(this).val().split('\n').length;
		let maxRows = 30;
		if (rows > maxRows) {
			Swal.fire({
				icon: 'error',
				title: '알림',
				text: '30줄 까지만 가능합니다'
			});
			let modifiedText = $(this).val().split("\n").slice(0, maxRows);
			$(this).val(modifiedText.join("\n"));
		} //if
	});

	$('.boardComment').keyup(function() {
		let content = $(this).val();
		let countBox = $(this).next('p');
		// 글자수 세기
		if (content.length == 0 || content == '') {
			$(countBox).text('0자/150자');
		} else {
			$(countBox).text(content.length + '자/150자');
		} //if
		
		let rows = $(this).val().split('\n').length;
		let maxRows = 3;
		if (rows > maxRows) {
			Swal.fire({
				icon: 'error',
				title: '알림',
				text: '3줄 까지만 가능합니다'
			});
			let modifiedText = $(this).val().split("\n").slice(0, maxRows);
			$(this).val(modifiedText.join("\n"));
		} //if
	});
});