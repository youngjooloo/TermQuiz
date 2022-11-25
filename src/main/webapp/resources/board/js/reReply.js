

$(function(){
	$('.third_btn').click(function(e){
		e.stopPropagation();
		$(this).parents('.comments_List').next().children('.reReplyForm').toggleClass('formHidden');
	});
	
	$('.cancelBtn2').click(function(e){
		e.stopPropagation();
		$(this).parents('.reReplyForm').toggleClass('formHidden');
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