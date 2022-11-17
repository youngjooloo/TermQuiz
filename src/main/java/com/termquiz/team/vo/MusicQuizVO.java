package com.termquiz.team.vo;

import lombok.Data;

@Data
public class MusicQuizVO {
   private int musicqNo;
   private String musicqAnswer;
   private String musicqHint1;
   private String musicqHint2;
   private String musicqHint3;
   private String musicqHint4;
   private String musicqHint5;
//movie quiz   
   private String musicqId;
   private int score;
//movie quiz score

}