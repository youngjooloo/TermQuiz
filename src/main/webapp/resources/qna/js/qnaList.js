/**
 * 
 */

$(function(){
	$('.qna_list').click(function(e){
		location.href = `qnadetail?${this.id}`;
	});
	
	
});