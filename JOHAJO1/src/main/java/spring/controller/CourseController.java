package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CourseDto;
import spring.data.FoodDto;
import spring.service.CourseService;


@Controller
public class CourseController {
	@Autowired
	public CourseService service;
	
	@RequestMapping(value={"/menucourse.do"},method={RequestMethod.GET})
	public ModelAndView list(@RequestParam(value="idx",defaultValue="1") int idx){
		ModelAndView model=new ModelAndView();
		CourseDto dto=service.getCourseData(idx);
		model.addObject("dto",dto);
		model.setViewName("/menu/menuCourse");
		return model;
	}
	
	/* 관리자용 */
	
	@RequestMapping("/courselist.do")
	public ModelAndView list()
	{
		ModelAndView model = new ModelAndView();
		List<CourseDto> list=service.getList();
		model.addObject("list",list);
		model.setViewName("/menu/courseList");
		return model;
	}
	
	/*@RequestMapping("courseinsert.do")
	public String courseForm()
	{
		return "/menu/courseWriteform";
	}*/
	@RequestMapping("courseinsert.do")
	public ModelAndView courseWriteForm()
	{
		ModelAndView model = new ModelAndView();
		List<FoodDto> list1=service.getKindData(1);
		model.addObject("list1",list1);
		List<FoodDto> list2=service.getKindData(2);
		model.addObject("list2",list2);
		List<FoodDto> list3=service.getKindData(3);
		model.addObject("list3",list3);
		List<FoodDto> list4=service.getKindData(4);
		model.addObject("list4",list4);
		List<FoodDto> list5=service.getKindData(5);
		model.addObject("list5",list5);
		List<FoodDto> list6=service.getKindData(6);
		model.addObject("list6",list6);
		model.setViewName("/menu/courseWriteform");
		return model;
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
		List<FoodDto> list1=service.getKindData2(1);
		model.addObject("list1",list1);
		List<FoodDto> list2=service.getKindData2(2);
		model.addObject("list2",list2);
		List<FoodDto> list3=service.getKindData2(3);
		model.addObject("list3",list3);
		List<FoodDto> list4=service.getKindData2(4);
		model.addObject("list4",list4);
		List<FoodDto> list5=service.getKindData2(5);
		model.addObject("list5",list5);
		List<FoodDto> list6=service.getKindData(6);
		model.addObject("list6",list6);
		
		CourseDto dto = service.getCourseformData(idx);
		model.addObject("dto",dto);
		
		model.setViewName("/menu/courseUpdateform");
		return model;
	}
	
	/*@RequestMapping("/courseupdateform.do")
	public ModelAndView courseupdateForm(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		CourseDto dto = service.getCourseformData(idx);
		System.out.println(idx + "idx값");
		model.addObject("dto",dto);
		model.setViewName("/menu/courseUpdateform");
		return model;
	}*/
	
	@PostMapping("/courseupdate.do")
	public String courseupdate(@ModelAttribute CourseDto dto)
	{
		service.updateCourse(dto);
		return "redirect:courselist.do";
	}
	
	@RequestMapping("/coursedelete.do")
	public String coursedelete(@RequestParam int idx)
	{
		service.deleteCourse(idx);
		return "redirect:courselist.do";
	}
	@RequestMapping("/coursechkdelete.do")
	public String coursechkdelete(@RequestParam String idxs)
	{
		//콤마로 분리
		String []dels=idxs.split(",");
		for(String nn:dels)
		{
			int idx=Integer.parseInt(nn);
			service.deleteCourse(idx);
		}
		return "redirect:courselist.do";
	}

}