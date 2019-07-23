package spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import spring.data.MenuDto;
import spring.data.NoticeDto;
import spring.data.StoreDto;
import spring.service.AdminService;
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
		
		return " ";
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
			,@RequestParam String service1,@RequestParam String img,
			@RequestParam int idx)
	{
		StoreDto dto=new StoreDto();
		dto.setAddr(addr);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setXpoint(xpoint);
		dto.setYpoint(ypoint);
		dto.setOhours(ohours);
		dto.setService(service1);
		dto.setIdx(idx);
		
		service.upDataStore(dto);
		return "/ad/pop/store/ad_StoreForm";
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
	public ModelAndView noticeList(@RequestParam(value="pageNum",defaultValue="1") int currentPage) 
	{
		
		ModelAndView model=new ModelAndView();
	
		int totalCount; //총 데이터 개수
		totalCount=notice_service.getTotalCount();
		
		//페이징처리 복붙
			//페이징처리에 필요한 변수들 선언
			int totalPage; //총 페이지수
			int startNum; //각페이지의시작번호
			int endNum; //각페이지의끝번호
			int startPage; //블럭의 시작페이지
			int endPage; //블럭의 끝페이지
			int no;//출력할 시작번호
			int perPage=10;//한페이지당 보여질 글의갯수
			int perBlock=5;//한블럭당 보여질 페이지의 갯수
			
			totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
			
			startPage=(currentPage-1)/perBlock*perBlock+1;
			endPage=startPage+perBlock-1;
			//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
			if(endPage>totalPage)
				endPage=totalPage;
	
			startNum=(currentPage-1)*perPage+1;
			endNum=startNum+perPage-1;
			//마지막 페이지의 글번호 체크하기
			if(endNum>totalCount)
				endNum=totalCount;
			
			no=totalCount-(currentPage-1)*perPage;	
			
			//전체 데이터 가져오기
			List<NoticeDto> list=notice_service.getList(startNum, endNum);
			
			model.addObject("list", list);
			model.addObject("currentPage", currentPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("no", no);
			model.addObject("totalPage", totalPage);
		
		
		model.addObject("totalCount",totalCount);
		
		model.setViewName("/ad/Notice/ad_NoticeList");
		return model;
	}
	
//notice INSERT==================================================================================
	@RequestMapping("/notice_insertform.do")
	public String insertForm()
	{
		return "/ad/Notice/ad_writeform";
	}
	
	
	@RequestMapping("/noticeInsert.do")
	public String insertNotice(
			@RequestParam String title,@RequestParam String contents,
			@RequestParam String selection, @RequestParam(value="hide",defaultValue="1") int hide,
			@RequestParam(value="image_name",defaultValue="noimage") String image_name,
			@RequestParam(value="file_name",defaultValue="nofile") String file_name 
			)
	{
		System.out.println("컨트롤러 진입");
		System.out.println(title);
		System.out.println(contents);
		System.out.println(hide);
		System.out.println(selection);
		System.out.println(image_name);
		System.out.println(file_name);
		
	
		NoticeDto dto=new NoticeDto();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setSelecrtion(selection);
		dto.setHide(hide);
		dto.setFile_name(file_name);
		dto.setImage_name(image_name);
		
		notice_service.insertNotice(dto);
		return "redirect:ad_NoticeList.do";
	}
	
//notice DELETE=================================================================================
	
	@RequestMapping("/noticedelete.do")
	public String noticeDelete(@RequestParam int idx, @RequestParam int pageNum) 
	{
		notice_service.deleteNotice(idx);
		return "redirect:ad_NoticeList.do?pageNum="+pageNum;
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
