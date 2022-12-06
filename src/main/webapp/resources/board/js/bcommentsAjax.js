
function bcommentsList() {
	$('.bcommentsList').toggleClass('commentOn');

} //bcommentsList1


$(document).ready(function() {
	commentListOn();
	boardListOn();
});

function commentListOn() {
	const url = new URL(window.location.href);
	const check = url.searchParams;
	const bno = check.get("bno");
	const currPage = check.get("currPage");
	$.ajax({
		type: 'Get',
		url: 'commentlist',
		data: {
			bno: bno,
			currPage: currPage			
		},
		success: function(resultPage) {
			$('.bcommentsList').html("");
			$('.bcommentsList').html(resultPage);
			commentLoad = 1;
		}
	}); //ajax
}
function boardListOn() {
	const url = new URL(window.location.href);
	const check = url.searchParams;
	const pageno = check.get("currPage");
	if(pageno == "" || pageno == null || pageno == undefined){
		pageno = 1;
	}
	$.ajax({
		type: 'Get',
		url: 'boardlist',
		data: {
			currPage:pageno
		},
		success: function(result) {
			$('.board_List').html("");
			$('.board_List').html($(result).filter('.notice').html());
		}
	}); //ajax
}


$(function() {
	$('.commentAjax').click(function() {
		let form = $(this).parents('form');
		let formUrl = $(form).attr("action");
		let formData = $(form).serialize();
		let textArea = $(this).prevAll("textarea");
		$(textArea).val($(textArea).val().trim());

		if ($(textArea).val() != "") {
			$.ajax({
				cache: false,
				url: formUrl, // 요기에
				type: 'POST',
				data: formData,
				success: function() {
					$(textArea).val("");
					commentListOn();
					$(".boardCommentP").text("");
				}
			});

		}
	});
	
	$('.board_List').click(function(e){
		if($(e.target).hasClass("blistBtn")){
			e.preventDefault();
			let hrefUrl = $(e.target).prop('href');
			if(hrefUrl != undefined || hrefUrl!=""){
				$.ajax({
					url: hrefUrl,
					type: 'GET',
					success: function(result) {
						$('.board_List').html('');
						$('.board_List').html($(result).filter('.notice').html());
					}
				});
			}
		}
		if(e.target.tagName == "TD"){
			let idUrl = $(e.target).parents('.board_list').prop('id');
			location.href=`boarddetail?${idUrl}`;
		}
	});
});

//	