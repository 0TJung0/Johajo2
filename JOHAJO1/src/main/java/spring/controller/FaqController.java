package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FaqDto;
import spring.service.FaqService;

@Controller
public class FaqController {
	@Autowired
	public FaqService service;
	
	//자주묻는 질문
	@RequestMapping("/noticefaq.do")
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
			List<FaqDto> list=service.getList(startNum, endNum);
			
			model.addObject("list", list);
			model.addObject("currentPage", currentPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("no", no);
			model.addObject("totalPage", totalPage);
		
		
		model.addObject("totalCount",totalCount);
		
		model.setViewName("/notice/noticeFaq");
		return model;
	}
	
	@RequestMapping("/noticefaq_content.do")
	public String content(Model model,@RequestParam int idx, @RequestParam int pageNum)
	{	
		//데이터 가져오기
		FaqDto dto=service.getData(idx);
		//dto.setContents(dto.getContents().replace("\n","<br>"));
		//model에 저장
		model.addAttribute("dto",dto);
		model.addAttribute("pageNum",pageNum);
		
		return "/notice/noticeFaq_content";
	}
	
	
}
