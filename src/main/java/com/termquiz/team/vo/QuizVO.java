package com.termquiz.team.vo;

import lombok.Data;

@Data
public class QuizVO {
	private int movieqNo;
	private String movieqTitle;
	private String movieqAnswer;
	private String movieqHint1;
	private String movieqHint2;
	private String movieqHint3;
	private String movieqHint4;
	private String movieqHint5;
	
	private String movieqId;
	private int score;
}
