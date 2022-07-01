package com.goodee.gdlibrary.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QaaDTO {
	   private Long qaaNo;
	   private String memberId;
	   private String qaaTitle;
	   private String qaaContent;
	   private Date qaaCreated;
	   private Date qaaModified;
	   private Integer qaaDepth;
	   private Long qaaGroupNo; 
	   private Integer qaaGroupOrd; 

}
