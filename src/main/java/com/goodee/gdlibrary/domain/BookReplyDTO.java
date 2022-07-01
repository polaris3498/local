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
public class BookReplyDTO {
	private Long bookReplyNo;
	private Long bookNo;
	private String memberId;
	private String bookReplyContent;
	private Date bookReplyCreated;
	private Long bookRating;
}
