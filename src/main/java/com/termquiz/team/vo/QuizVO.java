package com.termquiz.team.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuizVO {
	private String quizType;
	
	private String answer;
	private String hint1;
	private String hint2;
	private String hint3;
	private String hint4;
	private String hint5;
	
	private MultipartFile hint1up;
	private MultipartFile hint2up;
	private MultipartFile hint3up;
	private MultipartFile hint4up;
	private MultipartFile hint5up;
}
 