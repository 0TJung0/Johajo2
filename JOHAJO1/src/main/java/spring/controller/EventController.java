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

		String mid=(String)session.getAttribute("log_id");
		
		
		List<EventDto> alist=service.AbleList();
		List<EventDto> unlist=service.EndList();
		
		model.addObject("alist",alist);
		model.addObject("unlist",unlist);
		model.setViewName("/notice/noticeEvent");
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
