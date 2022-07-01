package com.goodee.gdlibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.gdlibrary.domain.SeatDTO;
import com.goodee.gdlibrary.mapper.SeatMapper;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatMapper seatMapper;
	
	
	@Override
	public List<SeatDTO> findSeatList() {
		return seatMapper.selectSeatList();
	}
	
	
	@Override
	public Map<String, Object> findSeat(Long seatNo) {
		System.out.println(seatNo);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("imple에서 찍은 dto : " + seatMapper.selectSeatByNo(seatNo));
		map.put("seats", seatMapper.selectSeatByNo(seatNo));
		return map;
	}
	
	
	@Override
	public void upSeatStatus(Long seatNo) {
		System.out.println("다음 : " + seatNo);
		seatMapper.updateUpSeatStatus(seatNo);
	}
	
	
	@Override
	public Map<String, Object> seatCheckOut(Long memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("임플memberNo : " + memberNo);
		map.put("res", seatMapper.updateDownSeatStatus(memberNo));
		System.out.println("임플에서 찍어본 체크아웃 : " + seatMapper.updateDownSeatStatus(memberNo));
		return map;
	}
	
	
	@Override
	public Map<String, Object> seatConfirm(String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("임플memberId: " + memberId);
		map.put("res", seatMapper.selectSeatById(memberId));
		System.out.println("임플에서 찍어본 seatConfirm :" + seatMapper.selectSeatById(memberId));
		return map;
	}
	
	
	@Override
	public void downSeatStatusByScheduled() {
		seatMapper.updateDownSeatStatusByScheduled();
	}
	
	
	@Override
	public Map<String, Object> seatRenew() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seats", seatMapper.selectSeatList());
		return map;
	}
	
	@Override
	public void addSeatInfo(Long seatNo) {
		seatMapper.insertSeatInfo(seatNo);
	}
	
	@Override
	public SeatDTO randomSeatCode(Long seatNo) {
		String str = "";
		for(int i = 0; i <6; i++) {
			str += ((int)(Math.random() * 9) + 1);
		}
		Long seatCode = Long.parseLong(str);
		SeatDTO seat = new SeatDTO();
		seat.setSeatNo(seatNo);
		seat.setSeatCode(seatCode);
		seatMapper.updateRandomCode(seat);
		System.out.println("seatDTO : " + seat);
		return seat;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

