
$(function(){
	$('.first_btn').click(function(e){
		e.stopPropagation();
		closeAll();
		$(this).parents('.list_Form').children('.bcommentP').toggleClass('formHidden');
		$(this).parents('.list_Form').children('.modifyForm').toggleClass('formHidden');
	});
	
	$('.cancelBtn').click(function(){
		closeAll();
	});
	
	$('.third_btn').click(function(e){
		e.stopPropagation();
		let $show = $(this).parents('.comments_List').next().children('.reReplyForm');
		let formShow = $show.hasClass('formHidden')
		closeAll();
		if(formShow){
			$show.removeClass('formHidden');
		}else{
			$show.addClass('formHidden');
		}
	});
	
	$('.cancelBtn2').click(function(e){
		e.stopPropagation();
		$(this).parents('.reReplyForm').toggleClass('formHidden');
	});
	
	$('.upBtn').click(function(e){
		e.stopPropagation();
		let updateText = $(this).parents('form').children('textarea');
		$(updateText).val($(updateText).val().trim());
	});
	
	$('.commentAjax2').click(function(){
		let form = $(this).parents('form');
		let formUrl = $(form).attr("action");
		let formData = $(form).serialize();
		let textArea = $(this).parent().prevAll("textarea");
		$(textArea).val($(textArea).val().trim());
		
		if($(textArea).val() != ""){
			$.ajax({
	            cache : false,
	            url : formUrl, // 요기에
	            type : 'POST', 
	            data : formData, 
	            success : function() {
					$(textArea).val("");
	                commentListOn();
	            }
	        });
		}
	});
});

function closeAll(){
	$('.bcommentP').removeClass('formHidden');
	$('.modifyForm').addClass('formHidden');
	$('.reReplyForm').addClass('formHidden');
}