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
	$('.qna_List').click(function(e){
		let url = $(e.target).parents('.qna_list').attr('id');
		if(url != undefined){
			location.href = `qnadetail?${url}`;
		}
	});
});