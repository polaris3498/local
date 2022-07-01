package com.goodee.gdlibrary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.gdlibrary.domain.SeatDTO;

@Mapper
public interface SeatMapper {
	
	public List<SeatDTO> selectSeatList();
	public SeatDTO selectSeatByNo(Long seatNo);
	public int updateUpSeatStatus(Long seatNo);
	public int updateDownSeatStatus(Long memberNo);
	public SeatDTO selectSeatById(String memberId);
	public int updateDownSeatStatusByScheduled();
	public void insertSeatInfo(Long seatNo);
	public int updateRandomCode(SeatDTO seat);
}