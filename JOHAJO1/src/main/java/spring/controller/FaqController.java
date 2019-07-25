package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FaqDto;
import spring.service.FaqService;

@Controller
public class FaqController {
	@Autowired
	public FaqService service;
	
	//자주묻는 질문
	@RequestMapping("/noticefaq.do")
	public ModelAndView FaQList(){
		ModelAndView model=new ModelAndView();
		
		List<FaqDto> list=service.FaQList();
		
		model.addObject("list",list);
		model.setViewName("/notice/noticeFaq");
		
		return model;
	}
	
	@RequestMapping("/selFnq.do")
	public ModelAndView FnQData(@RequestParam int kind)
	{
		ModelAndView model=new ModelAndView();
		
		List<FaqDto> list=service.FnQSelKind(kind);
		
		model.addObject("list",list);
		model.setViewName("/notice/noticeFaq_Data");
		return model;
	}
	
}
//