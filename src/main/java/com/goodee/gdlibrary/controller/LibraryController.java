package com.goodee.gdlibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.gdlibrary.service.ManageService;

@Controller
public class LibraryController {

	@Autowired
	private ManageService manageService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	
	
	
	
	
}