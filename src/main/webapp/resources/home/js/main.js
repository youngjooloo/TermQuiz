/**
 * 
 */
$(function() {
	$('#loginB').click(function(e) {
		e.stopPropagation();

		$('#mainlogin').removeClass('mlhidden');
		$('#mainlogin2').removeClass('mlhidden');
		
		$.ajax({
			type: 'Get',
			url: 'mloginf',
			dataType: "text",
			data:{
				loginUrl : window.location.href
			},
			success: function(resultPage) {
				$('#mainlogin2').html(resultPage);
			},
			error: function() {
				$('#mainlogin2').html('Error');
			}
		});
	});

	$('.mlcheck').click(function(e) {
		$('#mainlogin').addClass('mlhidden');
		$('#mainlogin2').addClass('mlhidden');
		
		$('#mainlogin2').html('');
	});
	
	$('#ajBtn').click(function(){
		$('#afterJoin').addClass('ajhidden');
		$('#loginB').click();
	});

	
});

$(document).ready(function(){
	loginCheck();
});

function loginCheck(){
	const url = new URL(window.location.href);
	const check = url.searchParams;
	const relogin = check.get("relogin");
	if(relogin){
		$('#loginB').click();
	}
}


	