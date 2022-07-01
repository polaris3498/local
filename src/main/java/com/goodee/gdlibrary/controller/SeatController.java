package com.goodee.gdlibrary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.gdlibrary.service.SeatService;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService seatService;

	
	@GetMapping("/seat/seatAgreePage")
	public String seatPage() {
		return "seat/agree";
	}
	
	
	@GetMapping("/seat/seatPage")
	public String findSeatList(Model model) {
		model.addAttribute("seats", seatService.findSeatList());
		return "seat/seat";
	}
	
	
	@ResponseBody
	@GetMapping(value="/seat/seatCheck", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatCheck(@RequestParam Long seatNo) {
		System.out.println("컨트롤러 도착한 seatNo : " + seatNo);
		seatService.addSeatInfo(seatNo);
		return seatService.findSeat(seatNo);
	}
	
	
	@Transactional
	@GetMapping("/seat/upSeatStatus")
	public String upSeatstatus(@RequestParam Long seatNo, Model model) {
		System.out.println("컨트롤러 도착한 상태증가 seatNo : " + seatNo);
		seatService.upSeatStatus(seatNo);
		model.addAttribute("seats", seatService.findSeatList());
		model.addAttribute("code", seatService.randomSeatCode(seatNo));
		return "seat/seat";
	}
	
	
	@ResponseBody
	@GetMapping(value="/seat/seatCheckOut", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatCheckOut(@RequestParam Long memberNo) {
		System.out.println("컨트롤러 도착한 memberNo : " + memberNo);
		return seatService.seatCheckOut(memberNo);
	}

	
	@ResponseBody
	@GetMapping(value="/seat/seatConfirm", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatConfirm(@RequestParam String memberId) {
		System.out.println("컨트롤러 도착한 memberId: " + memberId);
		return seatService.seatConfirm(memberId);
	}
	
	
	@ResponseBody
	@GetMapping(value="/seat/seatRenew", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatRenew(Model model) {
		System.out.println(seatService.seatRenew());
		return seatService.seatRenew();
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
