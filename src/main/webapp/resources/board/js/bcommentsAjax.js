
function bcommentsList() {
	$('.bcommentsList').toggleClass('commentOn');

} //bcommentsList1


$(document).ready(function() {
	commentListOn();
});

function commentListOn() {
	const url = new URL(window.location.href);
	const check = url.searchParams;
	const bno = check.get("bno");
	
	console.log(bno);
	$.ajax({
		type: 'Get',
		url: 'commentlist',
		data: {
			bno: bno
		},
		success: function(resultPage) {
			$('.bcommentsList').html(resultPage);
			commentLoad = 1;
		},
		error: function() {
			$('#resultArea2').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
		}
	}); //ajax
}



//	