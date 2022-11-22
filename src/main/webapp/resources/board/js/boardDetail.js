
$(function(){
	$('.board_list').click(function(){
		location.href=`boarddetail?${this.id}`;
	});
	
});

