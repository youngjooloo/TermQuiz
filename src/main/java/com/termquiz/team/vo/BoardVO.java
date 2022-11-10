package com.termquiz.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;			
	private String bid;			
	private String btitle;		
	private String bcontent;	
	private Date btime;			
	private int bcount;
}