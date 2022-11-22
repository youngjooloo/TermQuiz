/**
 * 
 */

$(function(){
	$('#confirmBtn, #confirmCancelBtn, #alertBtn').click(function(e){
		$(e.target).parents('.confirmBox, .alertBox').addClass('noneBox');
		
	});
});

function alertBox(){
	$('.alertBox').removeClass('noneBox');
};

function confirmBox(){
	$('.confirmBox').removeClass('noneBox');
};