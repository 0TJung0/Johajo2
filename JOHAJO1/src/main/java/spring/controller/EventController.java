package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.EventDto;
import spring.service.EventService;

@Controller
public class EventController {
	@Autowired
	public EventService service;
	
	//공지사항
	@RequestMapping("/noticeevent.do")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1") int currentPage){
		ModelAndView model=new ModelAndView();
		
		int totalCount; //총 데이터 개수
		totalCount=service.getTotalCount();
		
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
			List<EventDto> list=service.getList(startNum, endNum);
			
			model.addObject("list", list);
			model.addObject("currentPage", currentPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("no", no);
			model.addObject("totalPage", totalPage);
		
		
		model.addObject("totalCount",totalCount);
		
		model.setViewName("/notice/noticeEvent");
		return model;
	}
	
	@RequestMapping("/noticeEvent_content.do")
	public String content(Model model,@RequestParam int idx, @RequestParam int pageNum)
	{	
		//데이터 가져오기
		EventDto dto=service.getData(idx);
		dto.setContent(dto.getContent().replace("\n","<br>"));
		//model에 저장
		model.addAttribute("dto",dto);
		model.addAttribute("pageNum",pageNum);
		
		return "/notice/noticeEvent_content";
	}
	
	//이벤트 - 당첨자발표 ( 결과페이지에서 당첨자발표로 돌아가기 위함 )
	@RequestMapping("/event_win.do")
	public String NoticeEvent_win(){
		return "/notice/noticeEvent_win";
	}
	//이벤트 - 당첨자발표 - 결과페이지 
	@RequestMapping("/event_lotto.do")
	public String NoticeEvent_lotto(){
		return "/notice/noticeEvent_lotto";
	}
	
}
