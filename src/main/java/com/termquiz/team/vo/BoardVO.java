package com.termquiz.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bNo;			
	private String bId;			
	private String bTitle;		
	private String bContent;	
	private Date bTime;			
	private int bCount;
}