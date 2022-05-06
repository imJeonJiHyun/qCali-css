package com.group.exam.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.exam.calendar.service.CalendarServiceImpl;
import com.group.exam.calendar.vo.CalendarBoardVo;
import com.group.exam.utils.Criteria;
import com.group.exam.utils.PagingVo;

@Controller
public class CalendarBoardController {
	private CalendarServiceImpl calendarService;
	
	@Autowired
	public CalendarBoardController(CalendarServiceImpl calendarService) {
		this.calendarService = calendarService;
	}
	
	@RequestMapping(value="/board/listDay", method=RequestMethod.POST)
	@ResponseBody
	public String listDay(@RequestParam String date) {
		System.out.println(date);
		return date;
	}
	
	
	@RequestMapping(value="/board/listDay", method=RequestMethod.GET)
	public String listDay(String date, Model model, Criteria cri) {		

		
		model.addAttribute("date", date);
		
		List<CalendarBoardVo> boards = calendarService.boardByDate(cri, date);
		System.out.println(boards);
		model.addAttribute("boardList", boards);
		
		
		PagingVo pageMaker = new PagingVo();
		pageMaker.setCri(cri);
		int boardTotal = calendarService.boardByDateTotal(date);
		pageMaker.setTotalCount(boardTotal);
		
		model.addAttribute("boardTotal", boardTotal);
		model.addAttribute("pageMaker", pageMaker);
		

		return "/board/boardByDate";
	}
	
	
}
