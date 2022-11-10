package com.termquiz.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentsVO {
	private int bcNo;			
	private int bno;			
	private String bcId;			
	private String bcomment;		
	private Date bcommentTime;	
}