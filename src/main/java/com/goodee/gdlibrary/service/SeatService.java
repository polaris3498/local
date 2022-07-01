package com.goodee.gdlibrary.service;

import java.util.List;
import java.util.Map;

import com.goodee.gdlibrary.domain.SeatDTO;

public interface SeatService {
	public List<SeatDTO> findSeatList();
	public Map<String, Object> findSeat(Long seatNo);
	public void upSeatStatus(Long seatNo);
	public Map<String, Object> seatCheckOut(Long memberNo);
	public Map<String, Object> seatConfirm(String memberId);
	public void downSeatStatusByScheduled();
	public Map<String, Object> seatRenew();
	public void addSeatInfo(Long seatNo);
	public SeatDTO randomSeatCode(Long seatNo);
}
