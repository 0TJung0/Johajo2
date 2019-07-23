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

import spring.data.MenuDto;
import spring.service.MenuService;


@Controller
public class MenuController {
	@Autowired
	public MenuService service;
	
	/* 메뉴 메인화면에서 kind 선택 */
	@RequestMapping("/menulist.do")
	public ModelAndView list(){
		ModelAndView model=new ModelAndView();
		List<MenuDto> list=service.getData();
		model.addObject("list",list);
		
		model.setViewName("/menu/menuList_sel");
		return model;
	}
	
	/* kind선택한 종류별로 메뉴 출력 */
	@RequestMapping(value={"/menusel.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelect(@RequestParam(defaultValue="1") int kind)
	{
		ModelAndView model = new ModelAndView();
		List<MenuDto> list=service.getDataSel(kind);
		model.addObject("list",list);
		model.setViewName("/menu/menuList_list");
		return model;
	}
	
	/* 메뉴 이미지 클릭하면 상세보기 창 열리도록 */
	@RequestMapping(value={"/menuselpop.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelectIdx(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		MenuDto list2=service.getDataIdx(idx);
		System.out.println(list2.getFname());
		model.addObject("list2",list2);
		model.setViewName("/pop/menu/menuList_list2");
		return model;
	}
	
	/* 메뉴 추가 */
	@RequestMapping("/menuinsert.do")
	public String menuForm()
	{
		return "/menu/menuWriteform";
	}
	@PostMapping("/menuwrite.do")
	public String readmenuData(@ModelAttribute MenuDto dto)
	{
		service.insertMenu(dto);
		return "redirect:menulist.do";
	}
	
	/* 메뉴 수정 */
	@RequestMapping("/menuupdateform.do")
	public ModelAndView menuupdateForm(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		MenuDto dto = service.getDataIdx(idx);
		System.out.println(idx + "idx값");
		model.addObject("dto",dto);
		model.setViewName("/menu/menuUpdateform");
		return model;
	}
	@PostMapping("/menuupdate.do")
	public String menuupdate(@ModelAttribute MenuDto dto,@RequestParam int kind)
	{
		service.updateMenu(dto);
		return "redirect:menusel.do?kind="+kind;
	}
	
	/* 메뉴 삭제 */
	@RequestMapping("/menudelete.do")
	public String menudelete(@RequestParam int idx,@RequestParam int kind)
	{
		service.deleteMenu(idx);
		return "redirect:menusel.do?kind="+kind;
	}

}
