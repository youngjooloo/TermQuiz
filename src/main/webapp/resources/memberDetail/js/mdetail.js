/**
 * 
 */

$(function(){
	$('.questionIcon').on('mouseover',function(){
		console.log("t");
		$('.levelInfo').css({"visibility":"visible","opacity":"1"});
	});
	$('.questionIcon').on('mouseout',function(){
		$('.levelInfo').css({"visibility":"hidden","opacity":"0"});
	});
});