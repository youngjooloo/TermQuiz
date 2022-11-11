$('#bContent').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자/500자');
    } else {
    	$('.textCount').text(content.length + '자/500자');
    } //if
    
    // 글자수 제한
    if (content.length > 500) {
    	// 150자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 500));
        // 150자 넘으면 알림창 뜨도록
        alert('글자수는 150자까지 입력 가능합니다.');
    }; //if
}); //keyup
    // textarea 줄바꿈 제한
$('#bContent').keydown(function(){
	var rows = $('#bContent').val().split('\n').length;
    var maxRows = 10;
    if( rows > maxRows){
        alert('10줄 까지만 가능합니다');
        modifiedText = $('#bContent').val().split("\n").slice(0, maxRows);
        $('#bContent').val(modifiedText.join("\n"));
	} //if
});
///////////////////board insert/////////////




$('#answer_area').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.bdtextCount').text('0자/150자');
    } else {
    	$('.bdtextCount').text(content.length + '자/150자');
    } //if
    
    // 글자수 제한
    if (content.length > 150) {
    	// 150자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 150));
        // 150자 넘으면 알림창 뜨도록
        alert('글자수는 150자까지 입력 가능합니다.');
    }; //if
}); //keyup
    // textarea 줄바꿈 제한
$('#answer_area').keydown(function(){
	var rows = $('#answer_area').val().split('\n').length;
    var maxRows = 3;
    if( rows > maxRows){
        alert('3줄 까지만 가능합니다');
        modifiedText = $('#answer_area').val().split("\n").slice(0, maxRows);
        $('#answer_area').val(modifiedText.join("\n"));
	} //if
});
//////////////////board detail////////////////


$('#answer_area').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.bdtextCount').text('0자/150자');
    } else {
    	$('.bdtextCount').text(content.length + '자/150자');
    } //if
    
    // 글자수 제한
    if (content.length > 150) {
    	// 150자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 150));
        // 150자 넘으면 알림창 뜨도록
        alert('글자수는 150자까지 입력 가능합니다.');
    }; //if
}); //keyup
    // textarea 줄바꿈 제한
$('#answer_area').keydown(function(){
	var rows = $('#answer_area').val().split('\n').length;
    var maxRows = 3;
    if( rows > maxRows){
        alert('3줄 까지만 가능합니다');
        modifiedText = $('#answer_area').val().split("\n").slice(0, maxRows);
        $('#answer_area').val(modifiedText.join("\n"));
	} //if
});

