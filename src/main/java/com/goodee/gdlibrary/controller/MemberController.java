package com.goodee.gdlibrary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/member/loginPage")
	public String loginPage() {
		return "member/login";
	}
}
