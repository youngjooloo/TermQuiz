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

	
});

$(document).ready(function(){
	console.log("join");	
	joinCheck();
});

function joinCheck(){
	let url = window.location.href;
	let urloj = new URL(url);
	let check = urloj.searchParams;
	let join = check.get('join');
	console.log(join);	
}


	