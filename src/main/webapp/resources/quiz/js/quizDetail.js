/**
 * 
 */

$(function() {
	$('main').on('scroll touchmove mousewheel', function(e) {
		e.preventDefault();
		e.stopPropagation();
		return false;
	});

	$('input').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$(this).next().click();
		}
	});

	$('#startBtn').click(function() {
		$('#startBtn').addClass('hiddenBox');
		$('.moveBox').removeClass('hiddenBox');
		$('#hint1Btn').parent().removeClass('hiddenBtn');
		$('#hint1').css("top", '100%');
		$('#hint1').removeClass('hiddenBtn');
		$('.h1Box').removeClass('hiddenBox');
		location.href = '#hint1';
	});

	$('.endBtn').click(function() {
		const urlStr = window.location.href;
		const url = new URL(urlStr);
		const urlParams = url.searchParams;
		const type = urlParams.get('type');

		location.href = type + 'quiz';
	});

	$(window).resize(function() {
		const urlStr = window.location.href;
		if (urlStr.includes('#')) {
			const url = urlStr.split('#')[1];
			location.href = '#' + url;
		}
	});
	
	$('.h4Box').click(function(){
		$('#movieBgm').trigger('play');
	});
	
});


function justAnswer(e) {
	const answer = $(e).prev().val();
	const quizAnswer = $('.answerBox').children('p').html();
	if (answer == quizAnswer) {
		trueAnswer();
	} else {
		falseAnswer(e);
	}
}

function loginAnswer(e) {
	let answer =(($(e).prev().val()).toLowerCase()).replaceAll(" ","");
	let quizAnswer = (($('#correctAnswer').html()).toLowerCase()).replaceAll(" ","");
	const correct = quizAnswer.includes(answer);
	if (correct) {
		trueAnswer();
	}else{
		falseAnswer(e);
	}
	anwerSubmit(e,correct)
}

function anwerSubmit(e,correct) {
	const urlStr = window.location.href;
	const url = new URL(urlStr);
	const urlParams = url.searchParams;
	const type = urlParams.get('type');
	const no = urlParams.get('qNo');
	const formAction = $(e).parent().attr("action");
	
	const params = {
		quizType : type,
		quizNo : no,
		quizCorrect : correct
	};
	
	$.ajax({
		tpye : "POST",
		url : formAction,
		data : params,
		success : function(){
			console.log('success');
		},
		error : function(){
			console.log('false');
		}
	});
}

function trueAnswer() {
	$('.answerForm').addClass('hiddenBtn');
	$('#hint2').css("top", '200%');
	$('#hint3').css("top", '300%');
	$('#hint4').css("top", '400%');
	$('#hint5').css("top", '500%');
	$('#answer').css("top", '600%');
	$('.innerBox').removeClass('hiddenBox');
	$('.quizDetail ').removeClass("hiddenBtn");
	$('#endBtn').removeClass("hiddenBox");
	$('#correctBox').html("정답입니다!");
	location.href = '#answer';
}

function falseAnswer(e) {
	$('.answerForm').addClass('hiddenBtn');

	switch (e.id) {
		case 'hint1Btn':
			$('#hint2Btn').parent().removeClass('hiddenBtn');
			$('.h2Box').removeClass('hiddenBox');
			$('#hint2').css("top", '200%');
			$('#hint2').removeClass('hiddenBtn');
			location.href = '#hint2'
			break;
		case 'hint2Btn':
			$('#hint3Btn').parent().removeClass('hiddenBtn');
			$('.h3Box').removeClass('hiddenBox');
			$('#hint3').css("top", '300%');
			$('#hint3').removeClass('hiddenBtn');
			location.href = '#hint3'
			break;
		case 'hint3Btn':
			$('#hint4Btn').parent().removeClass('hiddenBtn');
			$('.h4Box').removeClass('hiddenBox');
			$('#hint4').css("top", '400%');
			$('#hint4').removeClass('hiddenBtn');
			$('#movieBgm').trigger('play');
			location.href = '#hint4'
			break;
		case 'hint4Btn':
			$('#hint5Btn').parent().removeClass('hiddenBtn');
			$('.h5Box').removeClass('hiddenBox');
			$('#hint5').css("top", '500%');
			$('#hint5').removeClass('hiddenBtn');
			location.href = '#hint5'
			break;
		default:
			$('#answer').css("top", '600%');
			$('#answer').removeClass('hiddenBtn');
			$('.aBox').removeClass('hiddenBox');
			$('#endBtn').removeClass("hiddenBox");
			location.href = '#answer'
			break;
	}
}

