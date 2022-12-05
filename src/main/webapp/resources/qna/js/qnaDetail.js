$(document).ready(function() {
	qnaListOn();
});

function qnaListOn() {
	const url = new URL(window.location.href);
	const check = url.searchParams;
	const pageno = check.get("currPage");
	if (pageno == "" || pageno == null || pageno == undefined) {
		pageno = 1;
	}
	$.ajax({
		type: 'Get',
		url: 'qnaboardlist',
		data: {
			currPage: pageno
		},
		success: function(result) {
			$('.qna_List').html("");
			$('.qna_List').html($(result).filter('.notice').html());
		}
	}); //ajax
}


$(function(){
	$(window).click(function(e){
//		console.log(e.target);
	});
	
	$('.qna_List').click(function(){
		console.log($(this).parents('.qna_list').attr('id'));
//		location.href = `qnadetail?${$(this).parents('.qna_list').attr('id')}`;
	});
	
	$('.qnaListAjax').click(function(e){
		e.preventDefault();
		console.log($(this).attr('href'));
		return false;
	});
});