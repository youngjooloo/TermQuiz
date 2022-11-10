/**
 * 
 */

$(function(){
	$('.qna_list').click(function(){
		location.href = `qnadetail?${this.id}`;
	});
	
	
});