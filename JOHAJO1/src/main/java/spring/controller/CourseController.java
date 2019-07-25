package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CourseDto;
import spring.service.CourseService;


@Controller
public class CourseController {
	@Autowired
	public CourseService service;
	
	@RequestMapping(value={"/menucourse.do"},method={RequestMethod.GET})
	public ModelAndView list(@RequestParam(value="idx",defaultValue="4") int idx){
		ModelAndView model=new ModelAndView();
		CourseDto dto=service.getCourseData(idx);
		model.addObject("dto",dto);
		model.setViewName("/menu/menuCourse");
		return model;
	}
	
	/* 관리자용 */
	@RequestMapping("courseinsert.do")
	public String courseForm()
	{
		return "/menu/courseWriteform";
	}
	@PostMapping("/coursewrite.do")
	public String readcourseData(@ModelAttribute CourseDto dto)
	{
		service.insertCourse(dto);
		return "redirect:menucourse.do";
	}
	
	@RequestMapping("/courseupdateform.do")
	public ModelAndView courseupdateForm(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		CourseDto dto = service.getCourseformData(idx);
		System.out.println(idx + "idx값");
		model.addObject("dto",dto);
		model.setViewName("/menu/courseUpdateform");
		return model;
	}
	@PostMapping("/courseupdate.do")
	public String courseupdate(@ModelAttribute CourseDto dto)
	{
		service.updateCourse(dto);
		return "redirect:menucourse.do";
	}

}
