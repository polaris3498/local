package com.goodee.gdlibrary.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ManageService {
	
	// member 서비스
	public Map<String, Object> memberIdCheck(String id);
	public Map<String, Object> memberEmailCheck(String email);
	public void findMembers(HttpServletRequest request, Model model);
	public void findMemberByNo(HttpServletRequest request, Model model);
	public void saveMember(HttpServletRequest request, HttpServletResponse response);
	public void removeCheckMember(HttpServletRequest request, HttpServletResponse response);
	public void removeMember(HttpServletRequest request, HttpServletResponse response);
	public void changeMember(HttpServletRequest request, HttpServletResponse response, Model model);
	public void findSearchMembers(HttpServletRequest request, Model model);
	public Map<String, Object> memberAutoComplete(HttpServletRequest request);
	
	// dormantMember 서비스 
	public Map<String, Object> dormantMemberIdCheck(String id);
	public Map<String, Object> dormantMemberEmailCheck(String email);
	public void findDormantMembers(HttpServletRequest request, Model model);
	public void findDormantMemberByNo(HttpServletRequest request, Model model);
	public void saveDormantMember(HttpServletRequest request, HttpServletResponse response, Model model);
	public void saveDormantToMember(HttpServletRequest request, HttpServletResponse response, Model model);
	public void removeCheckDormantMember(HttpServletRequest request, HttpServletResponse response);
	public void removeDormantMember(HttpServletRequest request, HttpServletResponse response);
	public void findSearchDormantMembers(HttpServletRequest request, Model model);
	public Map<String, Object> dormantMemberAutoComplete(HttpServletRequest request);
	
	
	// signOutMember 서비스
	public void findSignOutMembers(HttpServletRequest request, Model model);
	public void findSignOutMemberByNo(HttpServletRequest request, Model model);
	public void removeCheckSignOutMember(HttpServletRequest request, HttpServletResponse response);
	public void removeSignOutMember(HttpServletRequest request, HttpServletResponse response);
	public void findSearchSignOutMembers(HttpServletRequest request, Model model);
	public Map<String, Object> signOutMemberAutoComplete(HttpServletRequest request);
	
	
	// book 서비스
	public Map<String, Object> bookIsbnCheck(String isbn);
	
	public void findBooks(HttpServletRequest request, Model model);
	public void findBookByNo(HttpServletRequest request, Model model);
	public void saveBook(HttpServletRequest request, HttpServletResponse response);
	public void removeCheckBook(HttpServletRequest request, HttpServletResponse response);
	public void removeBook(HttpServletRequest request, HttpServletResponse response);
	public void changeBook(HttpServletRequest request, HttpServletResponse response, Model model);
	public void findSearchBooks(HttpServletRequest request, Model model);
	public Map<String, Object> bookAutoComplete(HttpServletRequest request);
}
