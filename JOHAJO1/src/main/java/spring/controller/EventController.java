package spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CouponDto;
import spring.data.EndEventDto;
import spring.data.EventDto;
import spring.service.CouponService;
import spring.service.EventService;

@Controller
public class EventController {
	@Autowired
	public EventService service;
	@Autowired
	private CouponService coupon_service;
	
	//공지사항
	@RequestMapping("/noticeevent.do")
	public ModelAndView list(HttpSession session){
		ModelAndView model=new ModelAndView();
		
		List<EventDto> alist=service.AbleList();
		int totalCount=service.EventShowCount();
		
		model.addObject("alist",alist);
		model.addObject("showCount",totalCount);
		model.setViewName("/notice/noticeEvent");
		return model;
	}
	@RequestMapping("/EventEnd.do")
	public ModelAndView endEvent(@RequestParam(value="pageNum",defaultValue="1") int currentPage)
	{
		int totalCount; //총 데이터 개수
		totalCount=service.getEndTotalCount();
		
		ModelAndView model = new ModelAndView();
		//페이징처리 복붙
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=5;//한페이지당 보여질 글의갯수
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
		List<EndEventDto> list=service.getEndList(startNum, endNum);
		
		model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.setViewName("/notice/noticeEvent_End");
		return model;
	}
	
	@RequestMapping("/noticeEvent_content.do")
	public String content(Model model,@RequestParam int idx,HttpSession session)
	{	
		//데이터 가져오기
		EventDto dto=service.getData(idx);
		dto.setCon(dto.getCon().replace("\n","<br>"));
		
		String mid=(String)session.getAttribute("log_id");
		if(mid != null) {
			int m_idx=(Integer)session.getAttribute("log_idx");
			int ck1=coupon_service.getCouponId(m_idx, idx);
			model.addAttribute("ck1",ck1);
			model.addAttribute("mid", mid);
			
		}
		else {
			model.addAttribute("mid", "nologin");
			model.addAttribute("ck1", 0);
		}
		
				  
		model.addAttribute("dto",dto);
		
		return "/notice/noticeEvent_content";
	}
	
	//이벤트 - 당첨자발표 ( 결과페이지에서 당첨자발표로 돌아가기 위함 )
	@RequestMapping("/event_win.do")
	public ModelAndView NoticeEvent_win(){
		ModelAndView model=new ModelAndView();
		
		List<EventDto> list=service.EndList();
		
		model.addObject("list",list);
		model.setViewName("/notice/noticeEvent_win");
		return model;
	}
	//이벤트 - 당첨자발표 - 결과페이지 
	@RequestMapping("/event_lotto.do")
	public String NoticeEvent_lotto(){
		return "/notice/noticeEvent_lotto";
	}
	
	
	/*
	 *  coupon controllor===============================================================
	 */
	@RequestMapping("/insertCoupon.do")
	public String couponInsert(@RequestParam String mnd,
			@RequestParam int idx,@RequestParam String title,@RequestParam int dis,
			@RequestParam int valid,HttpSession session)
	{
		int m_idx=(Integer)session.getAttribute("log_idx");		
	
		CouponDto dto=new CouponDto();
			dto.setEvent_f(idx);
			dto.setCoupon_name(title);
			dto.setDiscount(dis);
			dto.setMember_f(m_idx);
			dto.setAdd_day(valid);
		coupon_service.InsertCoupon(dto);				
		return "redirect:noticeEvent_content.do?idx="+idx;
	}
}
