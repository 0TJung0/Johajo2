package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.AllergyDto;
import spring.data.MenuDto;
import spring.service.AllergyService;



@Controller
public class AllergyController {
	@Autowired
	public AllergyService service;
	
	@RequestMapping("/menuallergy.do")
	public ModelAndView list()
	{
		ModelAndView model = new ModelAndView();
		List<AllergyDto> alist = service.getAnameonly();
		model.addObject("alist",alist);
		//종류탭 출력위해 종류만 받아오기
		List<MenuDto> kind = service.getKindonly();
		model.addObject("kind",kind);
		
		/*전체 탭 내용출력*/
		List<AllergyDto> total = service.getAllergyTotaltap();
		model.addObject("total",total);
		/* 나머지탭 내용 출력 */
		List<AllergyDto> list = service.getAList();
		model.addObject("list",list);
		
		model.setViewName("/menu/menuAllergy");
		return model;
	}
	
	
	/* ------------------------ */
	@RequestMapping("/allergylist.do")
	public ModelAndView allergylist()
	{
		ModelAndView model = new ModelAndView();
		List<AllergyDto> list = service.getAllergyTotalList();
		model.addObject("list",list);
		//종류탭 출력위해 종류만 받아오기
		List<MenuDto> kind = service.getKindonly();
		model.addObject("kind",kind);
		List<AllergyDto> total = service.getAllergyTotaltap();
		model.addObject("total",total);
		model.setViewName("/menu/allergyList");
		return model;
	}
	
	
	
	@RequestMapping("/allergyadd.do")
	public ModelAndView allergyInsert()
	{
		ModelAndView model = new ModelAndView();
		List<AllergyDto> alist = service.getAnameonly();
		model.addObject("alist",alist);
		List<MenuDto> mlist = service.getMenulist();
		model.addObject("mlist",mlist);
		model.setViewName("/menu/allergyWriteform");
		return model;
	}
	
	@PostMapping("/allergywrite.do")
	public String insertAllergy(@ModelAttribute AllergyDto dto)
	{
		service.insertAllergy(dto);
		return "redirect:menuallergy.do";
	}
	
	@RequestMapping("/allergyupdateform.do")
	public ModelAndView allergyupdateForm(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		
		List<AllergyDto> list = service.getAllergyTotaltap();
		model.addObject("list",list);
		
		List<AllergyDto> alist = service.getAnameonly();
		model.addObject("alist",alist);
		
		AllergyDto dto = service.getAllergyDataF(idx);
		model.addObject("dto",dto);
		
		MenuDto mdto = service.getMenuDataIdx(idx);
		model.addObject("mdto",mdto);
		
		model.setViewName("/menu/allergyUpdateform");
		return model;
	}
	
	//수정 foodSelect 읽어오기
	@PostMapping("/foodselect.do")
	public ModelAndView foodselect(@RequestParam int f)
	{
		ModelAndView model = new ModelAndView();
		List<AllergyDto> list = service.foodSelect(f);
		model.addObject("list",list);
		
		model.setViewName("/menu/foodData");
		return model;
	}
	
	@PostMapping("/allergyupdate.do")
	public String allergyupdate(@ModelAttribute AllergyDto dto)
	{
		service.updateAllergy(dto);
		return "redirect:menuallergy.do";
	}
	
	@RequestMapping("/allergychkdelete.do")
	public String allergychkdelete(@RequestParam String idxs)
	{
		//콤마로 분리
		String []dels=idxs.split(",");
		for(String nn:dels)
		{
			int idx=Integer.parseInt(nn);
			service.deleteAllergy(idx);
		}
		return "redirect:menuallergy.do";
	}
	
	
}