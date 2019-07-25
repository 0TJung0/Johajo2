package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.EventDto;
import spring.data.NoticeDto;
import spring.service.EventService;
import spring.service.NoticeService;
import spring.service.StoreService;
@Controller
public class AdminEventController {
	@Autowired
	private StoreService store_service;
	@Autowired
	private EventService event_service;
	@Autowired
	public NoticeService notice_service;
	
	@RequestMapping("/ad_eventList.do")
	@ResponseBody
	public ModelAndView eventlist(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
			int totalCount; //총 데이터 개수
			totalCount=notice_service.getTotalCount();
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
			List<NoticeDto> list=notice_service.getList(startNum, endNum);
			
			model.addObject("list", list);
			model.addObject("currentPage", currentPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("no", no);
			model.addObject("totalPage", totalPage);
		
		
			model.addObject("totalCount",totalCount);
			
			List<EventDto> Ev_list = new ArrayList<EventDto>();
			Ev_list=event_service.getAllData();
			model.addObject("list",Ev_list);
			model.setViewName("/ad/Notice/ad_EventList");
			return model;
	}
	@RequestMapping("/ad_eventOneData.do")
	@ResponseBody
	public ModelAndView event3(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		ModelAndView model = new ModelAndView();
		
		return model;
	}
}
