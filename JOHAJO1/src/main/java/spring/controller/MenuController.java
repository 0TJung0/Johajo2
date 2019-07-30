package spring.controller;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.MenuDto;
import spring.service.MenuService;
import upload.util.SpringFileWriter;


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
	public String readmenuData(@ModelAttribute MenuDto dto,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/menuImg");
		System.out.println(path);
		
		//path경로에 이미지 저장
		
		SpringFileWriter fileWriter=new SpringFileWriter();
		String imgname = "";
		//파일명
		MultipartFile mf=dto.getUpfile();
		System.out.println("파일명 : "+mf.getOriginalFilename());
		imgname += mf.getOriginalFilename();
		//이미지 저장 메소드 호출
		fileWriter.writeFile(mf, path, mf.getOriginalFilename());
		
		//dto에 이미지 이름저장
		dto.setImgname(imgname);
		
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
	public String menuupdate(@ModelAttribute MenuDto dto,@RequestParam int kind,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/menuImg");
		System.out.println(path);
		
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		String imgname = "";
		
		//파일명
		MultipartFile mf=dto.getUpfile();
		System.out.println("파일명 : "+mf.getOriginalFilename());
		
		if(mf.getOriginalFilename().length()>0) {
			imgname += mf.getOriginalFilename();
			//이미지 저장 메소드 호출
			fileWriter.writeFile(mf, path, mf.getOriginalFilename());
		}
		//dto에 이미지 이름저장
		dto.setImgname(imgname);
		
		//dto 수정내용 저장
		service.updateMenu(dto);
		return "redirect:menusel.do?kind="+kind;
	}
	
	/* 메뉴 삭제 */
	@RequestMapping("/menudelete.do")
	public String menudelete(@RequestParam int idx,@RequestParam int kind,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/menuImg");
		System.out.println(path);
		
		//이미지부터 지우기
		String imgname=service.getDataIdx(idx).getImgname();
		if(!imgname.equals("noimage"))
		{
			String []myImg=imgname.split(",");
			for(String s:myImg)
			{
				//파일 객체로 생성
				File f=new File(path + "\\" +s);
				//존재할 경우 삭제
				if(f.exists())
					f.delete();
			}
		}
		
		service.deleteMenu(idx);
		return "redirect:menusel.do?kind="+kind;
	}

}