/**
 * 
 */

$(function(){
	$('.answer_modify').click(function(e){
		location.href = `qnaanswerdelete?${this.id}`;
	});
	
});