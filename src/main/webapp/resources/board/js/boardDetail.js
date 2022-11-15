
$(function(){
	$('.board_list').click(function(){
		location.href=`boarddetail?${this.id}`;
	});
	
	$('.first_btn').click(function(e){
		e.stopPropagation();
		let modify = e.target.parentNode.parentNode.children[1];
		
		let comment = modify.children[1].children[0];
		
		$(comment).val($(comment).val().replaceAll('<br>','\r\n'));
		
		if(modify.children[0].classList.contains('formHidden')){
			modify.children[0].classList.remove('formHidden');
			modify.children[1].classList.add('formHidden');
		}else{
			$('.bcUpdateF').addClass('formHidden');
			$('.contentp').removeClass('formHidden');
			modify.children[0].classList.add('formHidden');
			modify.children[1].classList.remove('formHidden');
		}
	});
	
	$('.upBtn').click(function(e){
		let textarea = e.target.parentNode.children[0];

		$(textarea).val($(textarea).val().trim());
		if($(textarea).val().length > 0){
			$(e.target.parentNode).submit();
		}
	});
});

