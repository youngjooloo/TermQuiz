
$(function(){
	
	$('.first_btn, .cancelBtn').click(function(e){
		e.stopPropagation();
		$(this).parents('.list_Form').children('.bcommentP').toggleClass('formHidden');
		$(this).parents('.list_Form').children('.modifyForm').toggleClass('formHidden');
	});
	
	$('.upBtn').click(function(e){
		e.stopPropagation();
		let updateText = $(this).parents('form').children('textarea');
		$(updateText).val($(updateText).val().trim());
//		if($(updateText).val().length > 0) {
//			$(this).parents('.bcUpdateF').submit();
//		}
	});
	
});
