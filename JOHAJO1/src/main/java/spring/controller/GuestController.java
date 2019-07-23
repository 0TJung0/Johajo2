package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuestController {
	
	@RequestMapping("/guest/list.do")
	public String form()
	{
		return "/guest/guestlist";
	}
}
