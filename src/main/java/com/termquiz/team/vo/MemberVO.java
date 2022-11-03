package com.termquiz.team.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	private String nickname;
	private String password;
	private String name;
	private long phoneNumber;
	private int scNumF;
	private int scNumL;
	private int totalScore;
	private int movieScore;
	private int musicScore;
	
}
