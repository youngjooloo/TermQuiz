/**
 * 
 */

$(function(){
	$(document).ready(function(){
		$('#total').click();
	});
	
	$('.chart').click(function(){
		let clickOn = $(this);
		let sortType = $(clickOn).attr('id');
		$('.chart').removeClass("sort");
		$(clickOn).addClass("sort");
		sortUrl = "rankingajax?sortName="+sortType;
		
		console.log(sortUrl);
		$.ajax({
			type: 'Get',
			url: sortUrl,
			success: function(resultPage) {
				$('#rankingSection').html("");
				$('#rankingSection').html(resultPage);
			},
			error: function() {
				$('#rankingSection').html('Error');
			}
		});
	});
});
