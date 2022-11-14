/**
 * 
 */


$(function() {
	$('main').on('scroll touchmove mousewheel', function(e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
    });
	
	$('#startBtn').click(function() {
		$('#hint1').css("top", '100%');
		location.href = '#hint1';
	});
	
	$('#hint1Btn').click(function() {
		$('#hint2').css("top", '200%');
		location.href = '#hint2';
	});
	
	$('#hint2Btn').click(function() {
		$('#hint3').css("top", '300%');
		location.href = '#hint3';
	});
	
	$('#hint3Btn').click(function() {
		$('#hint4').css("top", '400%');
		location.href = '#hint4';
	});
	
	$('#hint4Btn').click(function() {
		$('#hint5').css("top", '500%');
		location.href = '#hint5';
	});
	
	$('#hint5Btn').click(function() {
		$('#answer').css("top", '600%');
		location.href = '#answer';
	});
	
	$('#endBtn').click(function() {
		const urlStr = window.location.href;
		const url = new URL(urlStr);
		const urlParams = url.searchParams;
		const type = urlParams.get('type');
		
		location.href = type+'quiz';
	});
});

$(document).ready(function () {
	const urlStr = window.location.href;
	const url = new URL(urlStr);
	const urlParams = url.searchParams;
	const answer = urlParams.get('answer');
	
	if(answer == 1){
		$('input').css('display','none');
	}	
});
