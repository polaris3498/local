package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookDTO {
		private Long bookNo;
		private String bookIsbn;
		private String bookTitle;
		private String bookAuthor;
		private String bookPublisher;
		private String bookPubdate;
		private String bookDescription;
		private String bookImage;
		private String bookField;		
}
