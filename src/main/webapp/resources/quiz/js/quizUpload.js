/**
 * 
 */

$(function(){
	$('#quizType').on('change',function(){
		let labels = $('label').get();
		if(this.value == "movie"){
			console.log("t");
			labels[0].innerText = "Hint1 - Scene";
			labels[1].innerText = "Hint2 - Cast";
			labels[2].innerText = "Hint3 - Line";
			labels[3].innerText = "Hint4 - BGM";
			labels[4].innerText = "Hint5 - Poster";
		}else{
			labels[0].innerText = "Hint1";
			labels[1].innerText = "Hint2";
			labels[2].innerText = "Hint3";
			labels[3].innerText = "Hint4";
			labels[4].innerText = "Hint5";
		}
	});
	
	$("input:file").change(function () {
        let str = $(this).val();
        let fileName = str.split('\\').pop().toLowerCase();
 
		if(!checkFileName(fileName)){
			$(this).val("");
		} 
			

    });
});


function checkFileName(str){
    let ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['jpg', 'png', 'mp3', 'jpeg', 'gif']) == -1) {
 
        alert(ext+'파일은 업로드 하실 수 없습니다.');
		return false;
    }
 
    let pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
        alert('파일명에 특수문자를 제거해주세요.');
		return false;
    }
	
	return true;
}
