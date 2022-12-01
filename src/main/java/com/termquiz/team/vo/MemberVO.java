package com.termquiz.team.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	private String nickname;
	private String password;
	private String name;
	private String phoneNumber;
	private String scNumF;
	private String scNumL;
	private boolean adminRight;
	private int totalScore;
	private int movieScore;
	private int musicScore;
	private int mlevel;
	private int gage;
	
	public void level(){
		this.mlevel = this.totalScore/10;
		this.gage = this.totalScore%10;
	}
	
	

//	private String sortName;
}
