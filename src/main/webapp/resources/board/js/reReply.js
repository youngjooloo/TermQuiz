

$(function(){
	$('.third_btn').click(function(e){
		e.stopPropagation();
		$(this).parents('.list_Form ').children('.reReplyForm').toggleClass('formHidden');
	});
	
	$('.cancelBtn2').click(function(e){
		e.stopPropagation();
		$(this).parents('.reReplyForm').toggleClass('formHidden');
	});
	
	$('.upBtn2').click(function(e){
		e.stopPropagation();
		let reReply_area = $(this).parents('.reReplyF').children('.reReply_area');
		if($(reReply_area).val().length > 0){
			$(reReply_area).val($(reReply_area).val().trim());
			if($(reReply_area).val().length > 0) {
				$(this).parents('.reReplyF').submit();
			}
		}
	});
});