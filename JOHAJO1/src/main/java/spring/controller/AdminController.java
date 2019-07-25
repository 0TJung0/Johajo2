package spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FaqDto;
import spring.data.MenuDto;
import spring.data.NoticeDto;
import spring.data.StoreDto;
import spring.service.AdminService;
import spring.service.FaqService;
import spring.service.MenuService;
import spring.service.NoticeService;
import spring.service.StoreService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private StoreService store_service;
	@Autowired
	private MenuService menu_service;
	@Autowired
	private NoticeService notice_service;
	@Autowired
	private FaqService faq_service;

	@RequestMapping("/admain.do")
	public String admain() {
		return "admain.tiles";
	}
/*
 * mainform************************************************************************
 */
	@RequestMapping("/ad_MainForm.do")
	public String mainForm() {
		return "/ad/admin/ad_MainForm";
	}
	
/*
 * menu ************************************************************************
 */
	@RequestMapping("/ad_MenuList.do")
	public ModelAndView menuList() {
		ModelAndView model=new ModelAndView();
		
		List<MenuDto> list=menu_service.getData();
		List<MenuDto> klist=service.getMenuKind();
		
		model.addObject("klist",klist);
		model.addObject("list",list);
		model.setViewName("/ad/menu/ad_MenuList");
		return model;
	}
	
	@RequestMapping("/ad_MenuData.do")
	public ModelAndView menuData(@RequestParam int kind)
	{
		ModelAndView model=new ModelAndView();
		
		List<MenuDto> list=menu_service.getDataSel(kind);
		
		model.addObject("list",list);
		model.setViewName("/ad/menu/ad_MenuData");
		return model;
		
	}
	
/*
 * store ************************************************************************
 */

	@RequestMapping("/ad_StoreList.do")
	public ModelAndView storeList() {
		
		ModelAndView model=new ModelAndView();
		List<StoreDto> list=service.getStore();
		
		model.addObject("list",list);
		model.setViewName("/ad/store/ad_StoreList");
		return model;
	}
	
//store insert 
//==========================================================================
	
	
	@RequestMapping("/storeInsert.pop")
	public String storeInsert()
	{
		return "/ad/pop/store/ad_StoreForm";
	}
	
	@RequestMapping(value="/storeInsert.do",method=RequestMethod.POST)
	public String s_insert(@RequestParam String name,@RequestParam String xpoint,
			@RequestParam String ypoint,@RequestParam String addr
			,@RequestParam String phone,@RequestParam String ohours
			,@RequestParam String service1,@RequestParam MultipartFile photo,
			HttpServletRequest request)
	{

		String path=request.getSession().getServletContext().getRealPath("/storeImg/");
		System.out.println(path);
		String fileName=photo.getOriginalFilename();
		System.out.println(fileName);
		
		String saveFile=path+fileName;
		
		try {	
			photo.transferTo(new File(saveFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		StoreDto dto=new StoreDto();
		dto.setAddr(addr);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setXpoint(xpoint);
		dto.setYpoint(ypoint);
		dto.setOhours(ohours);
		dto.setService(service1);
		dto.setPhoto(fileName);
		
		service.insertStore(dto);
		
		return "/ad/pop/store/ad_StoreForm";
	}
	
//store UPDATE 
//==========================================================================
	
	@RequestMapping("/storeUpData.pop")
	public ModelAndView storeUpData(@RequestParam int idx)
	{
		System.out.println("들어는 오나?");
		ModelAndView model=new ModelAndView();
		StoreDto dto=store_service.getData(idx);
		
		model.addObject("dto",dto);
		
		model.setViewName("/ad/pop/store/ad_StoreUpData");
		return model;
	}
	
	@RequestMapping("/storeUpdata.do")
	public String so(@RequestParam String name,@RequestParam String xpoint,
			@RequestParam String ypoint,@RequestParam String addr
			,@RequestParam String phone,@RequestParam String ohours
			,@RequestParam String service1,@RequestParam MultipartFile photo,
			HttpServletRequest request,@RequestParam int idx)
	{
		
		String path=request.getSession().getServletContext().getRealPath("/storeImg/");
		System.out.println(path);
		String fileName=photo.getOriginalFilename();
		System.out.println(fileName);
		
		String saveFile=path+fileName;
		
		try {	
			photo.transferTo(new File(saveFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		
		StoreDto dto=new StoreDto();
		dto.setAddr(addr);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setXpoint(xpoint);
		dto.setYpoint(ypoint);
		dto.setOhours(ohours);
		dto.setService(service1);
		dto.setPhoto(fileName);
		dto.setIdx(idx);
		
		service.upDataStore(dto);
		return "/ad/pop/store/ad_StoreUpData";
	}
	
//store DELETE 
//==========================================================================
	
	@RequestMapping("/storeDelete.do")
	public String deleteStore(@RequestParam int idx) 
	{
		System.out.println("들어오나요"+idx);
		service.deleteStore(idx);
		return "redirect:ad_StoreList.do";
	}
/*
 * notice ************************************************************************
 */
	
	@RequestMapping("/ad_NoticeList.do")
	public ModelAndView noticeLIst()
	{
		ModelAndView model=new ModelAndView();
		
		List<NoticeDto> nlist=service.noticeList();
		List<FaqDto> flist=faq_service.FaQList();
		
		model.addObject("nlist",nlist);
		model.addObject("flist",flist);
		model.setViewName("/ad/Notice/ad_NoticeList");
		
		return model;
	}
	
//notice changeState=========================================================================================
	@RequestMapping("/changeNoticeState.do")
	public String noticeState(@RequestParam int idx)
	{
		NoticeDto dto=notice_service.getData(idx);
		if(dto.getHide()==1)
			service.noticeState(idx, 0);
		else
			service.noticeState(idx, 1);
		return "redirect:ad_NoticeList.do";
	}
	
//notice INSERT==================================================================================
	@RequestMapping("/notice_insertform.do")
	public String insertForm()
	{
		return "/ad/Notice/ad_writeform";
	}
	
	
	@RequestMapping(value="/noticeInsert.do",method=RequestMethod.POST)
	public String insertNotice(
			@RequestParam String title,
			@RequestParam String contents,
			@RequestParam String topnotice, 
			@RequestParam int hide,
			@RequestParam(value="photo",defaultValue="noimage") MultipartFile photo,
			@RequestParam HttpServletRequest request
			)
	{
		
		System.out.println("컨트롤러 진입");
		
		   	  String path=request.getSession().getServletContext().getRealPath("/noticeImage/");
		      System.out.println(path);
		      String fileName=photo.getOriginalFilename();
		      System.out.println(fileName);
		      
		      String saveFile=path+fileName;
		      
		      try {   
		         photo.transferTo(new File(saveFile));
		      } catch (IllegalStateException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } catch (IOException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		   
		System.out.println(title);
		System.out.println(contents);
		System.out.println(hide);
		System.out.println(topnotice);
		System.out.println(fileName);
		
	
		NoticeDto dto=new NoticeDto();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setTopnotice(topnotice);
		dto.setHide(hide);
		dto.setPhoto(fileName);
		
		notice_service.insertNotice(dto);
		return "redirect:ad_NoticeList.do";
	}
	
//notice DELETE=================================================================================
	
	@RequestMapping("/noticedelete.do")
	public String noticeDelete(@RequestParam int idx) 
	{
		notice_service.deleteNotice(idx);
		return "redirect:ad_NoticeList.do";
	}
//NOTICE UPDATE======================================================================================================
	@RequestMapping("/noticeUpdataForm.do")
	public ModelAndView noticeUpdataForm(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		NoticeDto dto=notice_service.getData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_UpDataForm");
		
		return model;
	}
	@RequestMapping("/noticeUpData.do")
	public String noticeUpDate(@RequestParam int idx,
			@RequestParam String title,@RequestParam String contents,
			@RequestParam(value="topnotice",defaultValue="2") String topnotice, @RequestParam(value="hide",defaultValue="1") int hide,
			@RequestParam(value="photo",defaultValue="photo") String photo
			)
	{
		NoticeDto dto=notice_service.getData(idx);
		
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setTopnotice(topnotice);
		dto.setHide(hide);
		dto.setPhoto(photo);
			
		service.noticeUpDate(dto);
		
		return "redirect:ad_NoticeList.do";
		
	}
	
/*
 * FaQ ******************************************************************************
 */
	@RequestMapping("/FaQChangeState.do")
	public String FaQchangeState(int idx,int hide)
	{
		if(hide==0)
			faq_service.FaQChangeState(idx, 1);
		else
			faq_service.FaQChangeState(idx, 0);
		return "redirect:ad_NoticeList.do";
	}
	@RequestMapping("/FaQInsertForm.do")
	public String FaQInsertForm()
	{
		return "/ad/Notice/ad_FaQInsertForm";
	}
	@RequestMapping("/FaqInsert.do")
	public String FaQInsert(@ModelAttribute FaqDto dto,@RequestParam(value="hide",defaultValue="0")int hide)
	{
		faq_service.FaQInsert(dto);
		return "redirect:ad_NoticeList.do";
	}
	@RequestMapping("/FaQDelete.do")
	public String FaQDelete(@RequestParam int idx)
	{
		
		faq_service.FaQDelete(idx);
		return "redirect:ad_NoticeList.do";
	}
	@RequestMapping("/FaQUpdataForm.do")
	public ModelAndView FaQUpdataForm(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		FaqDto dto=faq_service.FaQGetData(idx);

		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_FaQUpDataForm");
		return model;
	}
	@RequestMapping("/FaqUpData.do")
	public String FaQUpdata(@ModelAttribute FaqDto dto)
	{
		faq_service.FaQUpData(dto);
		return "redirect:ad_NoticeList.do";
	}
	
/*
 * member ************************************************************************
 */
	@RequestMapping("/ad_MemberList.do")
	public String memberList() {
		return "re/ad/member/ad_MemberList";
	}
/*
 * Q&A ************************************************************************
 */
	@RequestMapping("/ad_QnAList.do")
	public String qnaList() {
		return "/ad/admin/ad_QnAList";
	}
/*
 * res ************************************************************************
 */
	@RequestMapping("/ad_resList.do")
	public String resList() {
		return "/ad/admin/ad_ResList";
	}
	
}
