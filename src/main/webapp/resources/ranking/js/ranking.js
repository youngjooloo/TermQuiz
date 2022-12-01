/**
 * 
 */

$(function () {

	$('.chart').click(function () {
		let clickOn = $(this);
		let sortType = $(clickOn).attr('id');
		$('.chart').removeClass("sort");
		$(clickOn).addClass("sort");
		sortUrl = "rankingajax?sortName=" + sortType;

		$.ajax({
			type: 'Get',
			url: sortUrl,
			success: function (resultPage) {
				$('#rankingSection').html("");
				$('#rankingSection').html(resultPage);
			},
			error: function () {
				$('#rankingSection').html('Error');
			}
		});
	});


});

$(document).ready(function () {
	$('#total').click();
});