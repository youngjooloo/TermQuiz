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
});