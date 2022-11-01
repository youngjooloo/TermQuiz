/**
 * 
 */
$(function() {
	$('#loginB').click(function(e) {
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

	$('#mainlogin').click(function() {
		
		$('#mainlogin').addClass('mlhidden');
		$('#mainlogin2').addClass('mlhidden');
		
		$('#mainlogin2').html('');
	});
});

