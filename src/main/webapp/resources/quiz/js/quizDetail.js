/**
 * 
 */

const urlStr = window.location.href;
	const url = new URL(urlStr);
	const urlParams = url.searchParams;
	const type = urlParams.get('type');
	const quizNo = urlParams.get('qNo');

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
		$('.quizDetail').removeClass('hiddenBtn');
		$('.moveBox').removeClass('hiddenBox');
		$('#hint1Btn').parent().removeClass('hiddenBtn');
		$('#hint1').css("top", '100%');
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
	const answer = $(e).prev().val();
	const quizAnswer = $('.answerBox').children('p').html();
	const correct = answer == quizAnswer;
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
	$('#endBtn').removeClass("hiddenBox");
	location.href = '#answer';
}

function falseAnswer(e) {
	$('.answerForm').addClass('hiddenBtn');

	switch (e.id) {
		case 'hint1Btn':
			$('#hint2Btn').parent().removeClass('hiddenBtn');
			$('.h2Box').removeClass('hiddenBox');
			$('#hint2').css("top", '200%');
			location.href = '#hint2'
			break;
		case 'hint2Btn':
			$('#hint3Btn').parent().removeClass('hiddenBtn');
			$('.h3Box').removeClass('hiddenBox');
			$('#hint3').css("top", '300%');
			location.href = '#hint3'
			break;
		case 'hint3Btn':
			$('#hint4Btn').parent().removeClass('hiddenBtn');
			$('.h4Box').removeClass('hiddenBox');
			$('#hint4').css("top", '400%');
			location.href = '#hint4'
			break;
		case 'hint4Btn':
			$('#hint5Btn').parent().removeClass('hiddenBtn');
			$('.h5Box').removeClass('hiddenBox');
			$('#hint5').css("top", '500%');
			location.href = '#hint5'
			break;
		default:
			$('#answer').css("top", '600%');
			$('#endBtn').removeClass("hiddenBox");
			location.href = '#answer'
			break;
	}
}

