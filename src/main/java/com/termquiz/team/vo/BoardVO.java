package com.termquiz.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bNo;			// 번호
	private String bId;			// 작성자
	private String bTitle;		// 제목
	private String bContent;	// 본문
	private Date bTime;			// 등록일
	private int bCount;			// 조회수
}