/**
 * 
 */

$(function(){
	$(document).ready(function(){
		$('#total_desc').click();
	});
	
	$('.chart').click(function(){
		let clickOn = $(this);
		let sortType = $(clickOn).attr('id');
		sortType = sortType.split('_');
		
		let category = sortType[0];
		let sort = sortType[1];
		
		sortUrl = "rankingajax?cname="+category+"&adType="+sort;
		
		let newID;
		
		if("desc" == sort ){
			newID = category+"_asc"	
		}else{
			newID = category+"_desc"	
		}
		
		console.log(sortUrl);
		$.ajax({
			type: 'Get',
			url: sortUrl,
			success: function(resultPage) {
				$(clickOn).attr('id',newID);
				$('#rankingSection').html("");
				$('#rankingSection').html(resultPage);
			},
			error: function() {
				$('#rankingSection').html('Error');
			}
		});
	});
});
