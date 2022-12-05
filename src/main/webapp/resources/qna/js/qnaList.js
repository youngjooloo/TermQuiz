/**
 * 
 */

$(function() {
	$('.qna_list').click(function() {
		console.log(this.id);
		location.href = `qnadetail?${this.id}`;
	});
});