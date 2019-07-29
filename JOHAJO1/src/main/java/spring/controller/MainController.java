package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.data.EventDto;
import spring.service.EventService;

@Controller
public class MainController {
	
	@Autowired
	private EventService event_service;
	
	@RequestMapping("/main.do")
	public String mainGo(Model model)throws Exception
	{
		List<EventDto> elist=event_service.AbleList();
		model.addAttribute("elist", elist);
		
		return "main.tiles";//tiles name 반환
	}
}
