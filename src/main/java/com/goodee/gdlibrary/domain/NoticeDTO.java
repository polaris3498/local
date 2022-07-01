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
public class NoticeDTO {
	   private Long noticeNo;
	   private String noticeTitle;
	   private String noticeContent;
	   private Date noticeCreated;
	   private Date noticeModified;
	   private String noticeIp;
	   private Integer noticeHit;

}
