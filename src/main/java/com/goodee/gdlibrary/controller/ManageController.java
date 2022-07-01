package com.goodee.gdlibrary.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.gdlibrary.service.ManageService;

@Controller
public class ManageController {

	@Autowired
	private ManageService manageService;
	
	@GetMapping("/admin/moveManageMain")
	public String moveManageMain() {
		return "manage/manageMain";
	}
	
	@GetMapping("/admin/manageMain")
	public String manageMain() {
		return "manage/manageMain";
	}
	
	
	
	
	// member매핑
	@GetMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		manageService.findMembers(request, model);
		return "manage/memberManage";
	}
	
	@GetMapping("/admin/memberSavePage")
	public String savePage(HttpServletRequest request, Model model) {
		model.addAttribute("value", request.getParameter("value"));
		return "manage/memberSave";
	}
	
	@PostMapping("/admin/memberSave")
	public void memberSave(HttpServletRequest request, HttpServletResponse response) {
		manageService.saveMember(request, response);
	}
	
	@ResponseBody
	@GetMapping(value="/admin/memberIdCheck", produces="application/json")
	public Map<String, Object> memberIdCheck(@RequestParam String id) {
		return manageService.memberIdCheck(id);
		// {"res": null}
		// {"res": {"memberNo":1, ...}}
	}
	
	@ResponseBody
	@GetMapping(value="/admin/memberEmailCheck", produces="application/json")
	public Map<String, Object> memberEmailCheck(@RequestParam String email) {
		return manageService.memberEmailCheck(email);
		// {"res": null}
		// {"res": {"memberNo":1, ...}}
	}
	
	
	@GetMapping("/admin/memberDetail")
	public String memberDetail(HttpServletRequest request, Model model) {
		manageService.findMemberByNo(request, model);
		return "manage/memberDetail";
	}
	@GetMapping("/admin/memberChangePage")
	public String memberChangePage(HttpServletRequest request, Model model) {
		manageService.findMemberByNo(request, model);
		return "manage/memberChange";
	}
	@PostMapping("/admin/memberChange")
	public void memberChange(HttpServletRequest request, HttpServletResponse response, Model model) {
		manageService.changeMember(request, response, model);
	}
	
	@GetMapping("/admin/memberRemove")
	public void memberRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeMember(request, response);
	}
	@PostMapping("/admin/memberCheckRemove")
	public void memberCheckRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeCheckMember(request, response);
	}
	@GetMapping("/admin/memberSearch")
	public String memberSearch(HttpServletRequest request, Model model) {
		manageService.findSearchMembers(request, model);
		return "manage/memberManage";
	}
	@ResponseBody
	@GetMapping(value="/admin/memberAutoComplete", produces="application/json")
	public Map<String, Object> memberAutoComplete(HttpServletRequest request){
		return manageService.memberAutoComplete(request);
	}
	
	
	
	// dormantMember 매핑
	@GetMapping("/admin/dormantMemberList")
	public String dormantMemberList(HttpServletRequest request, Model model) {
		manageService.findDormantMembers(request, model);
		return "manage/dormantMemberManage";
	}
	
	@GetMapping("/admin/dormantMemberSavePage")
	public String dormantMemberSavePage(HttpServletRequest request, Model model) {
		model.addAttribute("value", request.getParameter("value"));
		model.addAttribute("memberNo", request.getParameter("memberNo"));
		return "manage/dorMantMemberSave";
	}
	
	@PostMapping("/admin/dormantMemberSave")
	public void dormantMemberSave(HttpServletRequest request, HttpServletResponse response, Model model) {
		manageService.findMemberByNo(request, model);
		manageService.saveDormantMember(request, response, model);
		manageService.removeMember(request, response);
	}
	
	@PostMapping("/admin/dormantToMemberSave")
	public void dormantToMemberSave(HttpServletRequest request, HttpServletResponse response, Model model) {
		manageService.findDormantMemberByNo(request, model);
		manageService.saveDormantToMember(request, response, model);
		manageService.removeDormantMember(request, response);
	}
	
	@ResponseBody
	@GetMapping(value="/admin/dormantMemberIdCheck", produces="application/json")
	public Map<String, Object> dormantMemberIdCheck(@RequestParam String id) {
		return manageService.dormantMemberIdCheck(id);
		// {"res": null}
		// {"res": {"memberNo":1, ...}}
	}
	
	@ResponseBody
	@GetMapping(value="/admin/dormantMemberEmailCheck", produces="application/json")
	public Map<String, Object> dormantMemberEmailCheck(@RequestParam String email) {
		return manageService.dormantMemberEmailCheck(email);
		// {"res": null}
		// {"res": {"memberNo":1, ...}}
	}
	
	
	@GetMapping("/admin/dormantMemberDetail")
	public String dormantMemberDetail(HttpServletRequest request, Model model) {
		manageService.findDormantMemberByNo(request, model);
		return "manage/dormantMemberDetail";
	}
	
	@GetMapping("/admin/dormantMemberRemove")
	public void dormantMemberRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeDormantMember(request, response);
	}
	@PostMapping("/admin/dormantMemberCheckRemove")
	public void dormantMemberCheckRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeCheckDormantMember(request, response);
	}
	@GetMapping("/admin/dormantMemberSearch")
	public String dormantMemberSearch(HttpServletRequest request, Model model) {
		manageService.findSearchDormantMembers(request, model);
		return "manage/dormantMemberManage";
	}
	@ResponseBody
	@GetMapping(value="/admin/dormantMemberAutoComplete", produces="application/json")
	public Map<String, Object> dormantMemberAutoComplete(HttpServletRequest request){
		return manageService.dormantMemberAutoComplete(request);
	}
	
	
	
	
	// SignOutMember매핑
	@GetMapping("/admin/signOutMemberList")
	public String signOutMemberList(HttpServletRequest request, Model model) {
		manageService.findSignOutMembers(request, model);
		return "manage/signOutMemberManage";
	}
	
	
	@GetMapping("/admin/signOutMemberDetail")
	public String signOutMemberDetail(HttpServletRequest request, Model model) {
		manageService.findSignOutMemberByNo(request, model);
		return "manage/memberDetail";
	}
	
	
	@GetMapping("/admin/signOutMemberRemove")
	public void signOutMemberRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeSignOutMember(request, response);
	}
	@PostMapping("/admin/signOutMemberCheckRemove")
	public void signOutMemberCheckRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeCheckSignOutMember(request, response);
	}
	@GetMapping("/admin/signOutMemberSearch")
	public String signOutMemberSearch(HttpServletRequest request, Model model) {
		manageService.findSearchSignOutMembers(request, model);
		return "manage/memberManage";
	}
	@ResponseBody
	@GetMapping(value="/admin/signOutMemberAutoComplete", produces="application/json")
	public Map<String, Object> signOutMemberAutoComplete(HttpServletRequest request){
		return manageService.signOutMemberAutoComplete(request);
	}
	
	
	
	// book 매핑
	@GetMapping("/admin/bookList")
	public String bookList(HttpServletRequest request, Model model) {
		manageService.findBooks(request, model);
		return "manage/bookManage";
	}
	
	@GetMapping("/admin/bookSavePage")
	public String bookSavePage(HttpServletRequest request, Model model) {
		model.addAttribute("value", request.getParameter("value"));
		return "manage/bookSave";
	}
	
	@PostMapping("/admin/bookSave")
	public void bookSave(HttpServletRequest request, HttpServletResponse response) {
		manageService.saveBook(request, response);
	}
	
	@ResponseBody
	@GetMapping(value="/admin/bookIsbnCheck", produces="application/json")
	public Map<String, Object> bookIsbnCheck(@RequestParam String isbn) {
		return manageService.bookIsbnCheck(isbn);
		// {"res": null}
		// {"res": {"bookNo":1, ...}}
	}
	
	@GetMapping("/admin/bookDetail")
	public String bookDetail(HttpServletRequest request, Model model) {
		manageService.findBookByNo(request, model);
		return "manage/bookDetail";
	}
	@GetMapping("/admin/bookChangePage")
	public String bookChangePage(HttpServletRequest request, Model model) {
		manageService.findBookByNo(request, model);
		return "manage/bookChange";
	}
	@PostMapping("/admin/bookChange")
	public void bookChange(HttpServletRequest request, HttpServletResponse response, Model model) {
		manageService.changeBook(request, response, model);
	}
	@GetMapping("/admin/bookRemove")
	public void bookRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeBook(request, response);
	}
	@PostMapping("/admin/bookCheckRemove")
	public void bookCheckRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeCheckBook(request, response);
	}
	@GetMapping("/admin/bookSearch")
	public String bookSearch(HttpServletRequest request, Model model) {
		manageService.findSearchBooks(request, model);
		return "manage/bookManage";
	}
	@ResponseBody
	@GetMapping(value="/admin/bookAutoComplete", produces="application/json")
	public Map<String, Object> bookAutoComplete(HttpServletRequest request){
		return manageService.bookAutoComplete(request);
	}
	

	
}
