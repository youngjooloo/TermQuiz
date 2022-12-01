/**
 * 
 */
$(function () {
	$('.rankingPage').click(function () {
		let aUrl = this.id;
		let sName = $('#sortName').val();
		sName = sName.replace("Score", "");
		$.ajax({
			type: 'Get',
			url: aUrl,
			dataType: "text",
			data: {
				sortName: sName
			},
			success: function (resultpage) {
				$('#rankingSection').html('');
				$('#rankingSection').html(resultpage);
			},
			error: function () {
				$('#rankingSection').html('Error');
			}

		});
	});
});