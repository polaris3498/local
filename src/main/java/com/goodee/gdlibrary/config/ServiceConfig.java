package com.goodee.gdlibrary.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.goodee.gdlibrary.service.ManageService;
import com.goodee.gdlibrary.service.ManageServiceImpl;

@Configuration
public class ServiceConfig {
	
	@Bean
	public ManageService manageService() {
		return new ManageServiceImpl();
	}
	
}

