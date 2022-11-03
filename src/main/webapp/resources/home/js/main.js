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
	joinCheck();
});

function joinCheck(){
	const url = window.location.href;
	const urloj = new URL(url);
	const check = urloj.searchParams;
	const join = check.get('join');
	
	if(join){
		$('#afterJoin').removeClass('ajhidden');
		history.replaceState({}, null, location.pathname);
	}
}


	