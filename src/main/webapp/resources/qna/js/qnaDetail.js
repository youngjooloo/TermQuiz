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
		if($(e.target).hasClass("qnaListAjax")){
			e.preventDefault();
			let hrefUrl = $(e.target).prop('href');
			if(hrefUrl != undefined || hrefUrl!=""){
				$.ajax({
					url: hrefUrl,
					type: 'GET',
					success: function(result) {
						$('.qna_List').html('');
						$('.qna_List').html($(result).filter('.notice').html());
					}
				});
			}
		}
		if(e.target.tagName == "TD"){
			let idUrl = $(e.target).parents('.qna_list').prop('id');
			location.href=`qnadetail?${idUrl}`;
		}
	});
});