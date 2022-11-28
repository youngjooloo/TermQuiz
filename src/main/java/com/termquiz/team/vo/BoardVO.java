package com.termquiz.team.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;			
	private String bid;			
	private String btitle;		
	private String bcontent;	
	private String btime;			
	private int bcount;
	private int mlevel;
}