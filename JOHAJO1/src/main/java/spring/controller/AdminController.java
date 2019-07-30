package spring.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CouponDto;
import spring.data.EventDto;
import spring.data.FaqDto;
import spring.data.MemberDto;
import spring.data.MenuDto;
import spring.data.NoticeDto;
import spring.data.StoreDto;
import spring.service.AdminService;
import spring.service.CouponService;
import spring.service.EventService;
import spring.service.FaqService;
import spring.service.MemberService;
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
	@Autowired
	private EventService event_service;
	@Autowired
	private MemberService member_service;
	@Autowired
	private CouponService coupon_service;

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
		System.out.println("path="+path);
		String fileName="/"+photo.getOriginalFilename();
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
		System.out.println("path="+path);
		String fileName="/"+photo.getOriginalFilename();
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
		List<EventDto> alist=event_service.AbleList();
		List<EventDto> unlist=event_service.EndList();
		List<EventDto> relist=event_service.StartList();
		List<MemberDto> mlist=member_service.memberList();
		
		model.addObject("nlist",nlist);
		model.addObject("flist",flist);
		model.addObject("alist",alist);
		model.addObject("unlist",unlist);
		model.addObject("relist",relist);
		model.addObject("mlist",mlist);
		model.setViewName("/ad/Notice/ad_NoticeList");
		
		return model;
	}
	@RequestMapping("/ad_noticeContent.do")
	public ModelAndView noticeContent(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		NoticeDto dto=notice_service.getData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_noticeContent");
		
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
			@RequestParam(value="topnotice",defaultValue="2") String topnotice, 
			@RequestParam(value="hide",defaultValue="0") int hide,
			@RequestParam(value="photo",defaultValue="/noimage.png") MultipartFile photo,
			HttpServletRequest request
			)
	{
		
		System.out.println("컨트롤러 진입");
		
		   	  String path=request.getSession().getServletContext().getRealPath("/noticeImg/");
		      System.out.println(path);
		      String fileName="/"+photo.getOriginalFilename();
		      if(fileName.equals("/")) {
		    	  System.out.println("들어오냐");
		    	  fileName="noimage.png";
		      }
		      System.out.println("뭐냐 진짜:"+fileName);
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
	@RequestMapping("/ad_FaQContent.do")
	public ModelAndView FaQContent(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		FaqDto dto=faq_service.FaQGetData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_FaQContent");
		
		return model;
	}
	
	
	
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
 *  event ******************************************************************************
 */
	@RequestMapping("/ad_eventContent.do")
	public ModelAndView EventContent(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		EventDto dto=event_service.getData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_EventContent");
		
		return model;
	}
	@RequestMapping("/insertCouponMember.do")
	public String EventCouponInsert(@RequestParam int mem_idx,@RequestParam int eve_idx)
	{
		int ch=coupon_service.getCouponId(mem_idx, eve_idx);
		if(ch==0) {
			EventDto edto=event_service.getData(eve_idx);
			CouponDto cdto=new CouponDto();
			cdto.setCoupon_name(edto.getTitle());
			cdto.setEvent_f(eve_idx);
			cdto.setMember_f(mem_idx);
			cdto.setDiscount(edto.getDiscount_rate());
			cdto.setAdd_day(edto.getValidity_month());
			coupon_service.InsertCoupon(cdto);
		}else {
			
		}
		return "redirect:ad_NoticeList.do";
	}
	
// eventInsert============================================================================

	@RequestMapping("/EventInsertForm.do")
	public String insertEventForm()
	{
		return "/ad/Notice/ad_EventInserForm";
	}
	@RequestMapping("/EventInsert.do")
	public String insertEvent(@RequestParam String title,
			@RequestParam String con, @RequestParam Date startday,
			@RequestParam Date endday, @RequestParam int discount_rate,
			@RequestParam int validity_month,
			@RequestParam(value="title_img",defaultValue="/noimage.png") MultipartFile title_img,
			@RequestParam(value="main_img",defaultValue="/noimage.png") MultipartFile main_img,
			HttpServletRequest request)
	{
		
		  String path=request.getSession().getServletContext().getRealPath("/eventImg/");
	      System.out.println(path);
	      String fileName1="/"+title_img.getOriginalFilename();
	      String fileName2="/"+main_img.getOriginalFilename();
	      if(fileName1.equals("/")) {
	    	  System.out.println("들어오냐");
	    	  fileName1="noimage.png";
	      }
	      if(fileName2.equals("/")) {
	    	  fileName2="noimage.png";
	      }
	      String saveFile1=path+fileName1;
	      String saveFile2=path+fileName2;
	      try {   
	         title_img.transferTo(new File(saveFile1));
	         main_img.transferTo(new File(saveFile2));
	      } catch (IllegalStateException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   
		
		EventDto dto=new EventDto();
		dto.setTitle(title);
		dto.setCon(con);
		dto.setStartday(startday);
		dto.setEndday(endday);
		dto.setDiscount_rate(discount_rate);
		dto.setValidity_month(validity_month);
		dto.setMain_img(fileName2);
		dto.setTitle_img(fileName1);
		
		event_service.insertEvent(dto);
		return "redirect:ad_NoticeList.do";
	}
	
// eventUPDATE=============================================================================
	
	@RequestMapping("/updateEventForm.do")
	public ModelAndView updateEventForm(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		EventDto dto=event_service.getData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/ad/Notice/ad_EventUpDataForm");
		return model;
	}
	@RequestMapping("/EventUpData.do")
	public String updateEvent(@RequestParam String title,
			@RequestParam String con, @RequestParam Date startday,
			@RequestParam Date endday, @RequestParam int discount_rate,
			@RequestParam int validity_month,@RequestParam int idx)
	{
		EventDto dto=event_service.getData(idx);
		dto.setTitle(title);
		dto.setCon(con);
		dto.setStartday(startday);
		dto.setEndday(endday);
		dto.setTitle_img("noimage.png");
		dto.setMain_img("noimage.png");
		dto.setValidity_month(validity_month);
		dto.setDiscount_rate(discount_rate);
		dto.setIdx(idx);
		
		event_service.updateEvent(dto);
		return "redirect:ad_NoticeList.do";
	}
	
// eventDELETE=========================================================================
	@RequestMapping("/deleteEvent.do")
	public String deleteEvent(@RequestParam int idx) 
	{
		event_service.deleteEvent(idx);
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
