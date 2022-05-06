package com.group.exam.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.exam.admin.command.AdminRankCommand;
import com.group.exam.admin.service.AdminService;

@Controller
public class AdminMainController {
	
	private AdminService adminService;
	
	@Autowired
	public AdminMainController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping("/admin/main")
	public String main(Model model) {
		List<AdminRankCommand> rank = adminService.memberRank();
		model.addAttribute("rank", rank);
		
		List<AdminRankCommand> rankReply = adminService.memberRankReply();
		model.addAttribute("reply", rankReply);

		List<AdminRankCommand> diary = adminService.memberRankDiary();
		model.addAttribute("diary", diary);
		
		return "/admin/main";
	}

}
