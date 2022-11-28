package com.termquiz.team.vo;

import lombok.Data;

@Data
public class BoardCommentsVO {
	private int bcNo;			
	private int bno;			
	private String bcId;			
	private String bcomment;		
	private String bcommentTime;
	private int root;
	private int step;
	private int indent;
	private int mlevel;
	private boolean adminRight;
}