/**
 * 
 */

$(function() {
	$('.removeAdmin').click(function() {
		location.href = "removeadmin?nickname=" + this.id;
	});

	$('.addAdmin').click(function() {
		location.href = "addadmin?nickname=" + this.id;
	});

	let curDown = false,
		curXPos = 0;

	$('.table2').on('mousedown', function(e) {
		curXPos = e.pageX;
		curDown = true;
	});

	$(window).mousemove(function(e) {
		if (curDown) {
			$('.table-wrap2').scrollLeft(curXPos - e.pageX)
		}
	});

	$(window).mouseup(function() {
		curDown = false;
	});
	
});
