/**
 * 
 */

$(function() {
	$('main').ready(function() {
		$('.moveBox, .answerAfterBox, .innerBox').removeClass('hiddenBox');
		$('#hint1').css("top", '100%')
		$('#hint2').css("top", '200%');
		$('#hint3').css("top", '300%');
		$('#hint4').css("top", '400%');
		$('#hint5').css("top", '500%');
		$('#answer').css("top", '600%');
	});

});