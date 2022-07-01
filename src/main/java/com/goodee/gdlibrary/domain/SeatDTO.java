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
public class SeatDTO {
	private Long seatNo;				// 좌석번호
	private Long memberNo;
	private Integer seatStatus;			// 좌석상태(공사, 수리 등 사용가능여부)
	private Date seatDate;		// 좌석 사용중 여부
	private String memberId;
	private String memberName;
	private Long seatCode;
}
