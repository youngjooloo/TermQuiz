/**
 * 
 */


$(function() {
	$('main').on('scroll touchmove mousewheel', function(e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
    });
	
	$('#startBtn, .h1Box, #before2Btn').click(function() {
		if($('.moveBox').hasClass('hiddenBox')){
			$('.moveBox').removeClass('hiddenBox');
		}
		$('#hint1').css("top", '100%');
		$('.h1Box').removeClass('hiddenBox');
		location.href = '#hint1';
	});
	
	$('#hint1Btn, .h2Box, #before3Btn, #next1Btn').click(function() {
		$('#hint2').css("top", '200%');
		$('.h2Box').removeClass('hiddenBox');
		location.href = '#hint2';
	});
	
	$('#hint2Btn, .h3Box, #before4Btn, #next2Btn').click(function() {
		$('#hint3').css("top", '300%');
		$('.h3Box').removeClass('hiddenBox');
		location.href = '#hint3';
	});
	
	$('#hint3Btn, .h4Box, #before5Btn, #next3Btn').click(function() {
		$('#hint4').css("top", '400%');
		$('.h4Box').removeClass('hiddenBox');
		location.href = '#hint4';
	});
	
	$('#hint4Btn, .h5Box, #next4Btn').click(function() {
		$('#hint5').css("top", '500%');
		$('.h5Box').removeClass('hiddenBox');
		location.href = '#hint5';
	});
	
	$('#hint5Btn, #next5Btn').click(function() {
		$('#answer').css("top", '600%');
		location.href = '#answer';
	});
	
	$('.endBtn').click(function() {
		const urlStr = window.location.href;
		const url = new URL(urlStr);
		const urlParams = url.searchParams;
		const type = urlParams.get('type');
		
		location.href = type+'quiz';
	});
	
	$('#startBtn').click(function(){
		$('#hint1Btn').parent().removeClass('hiddenBox');
	});
	
	$('#hint1Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint2Btn').parent().removeClass('hiddenBox');
	});
	
	$('#hint1Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint2Btn').parent().removeClass('hiddenBox');
	});
	$('#hint1Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint2Btn').parent().removeClass('hiddenBox');
	});
	$('#hint1Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint2Btn').parent().removeClass('hiddenBox');
	});
	$('#hint2Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint3Btn').parent().removeClass('hiddenBox');
	});
	$('#hint3Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint4Btn').parent().removeClass('hiddenBox');
	});
	$('#hint4Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
		$('#hint5Btn').parent().removeClass('hiddenBox');
	});
	$('#hint5Btn').click(function(){
		$(this).parent().addClass('hiddenBox');
	});
});

$(window).resize(function() { 
	const urlStr = window.location.href;
	if(urlStr.includes('#')){
		const url = urlStr.split('#')[1];
		location.href = '#'+url;
	}
});
//
//window.document.oncontextmenu = new Function("return false");
//window.document.onselectstart = new Function("return false");
//window.document.ondragstart = new Function("return false");
