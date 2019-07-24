package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;







import spring.data.AllergyDto;
import spring.service.AllergyService;



@Controller
public class AllergyController {
	@Autowired
	public AllergyService service;
	
	/*
	@RequestMapping("/menuallergy.do")
	public ModelAndView list(){
		ModelAndView model=new ModelAndView();
		List<AllergyDto> list=service.getData();
		model.addObject("list",list);
		
		model.setViewName("/menu/menuAllergy");
		return model;
	}*/
	
	@RequestMapping("/menuallergy.do")
	public ModelAndView list(@RequestParam(defaultValue="11") String aname)
	{
		ModelAndView model = new ModelAndView();
		List<AllergyDto> list = service.getList(aname);
		model.addObject("list",list);
		model.setViewName("/menu/menuAllergy");
		return model;
	}
	


}
