package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.NoticeDto;
import spring.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	public NoticeService service;
	
	
	//공지사항
	@RequestMapping("/noticelist.do")
	public ModelAndView noticeList()
	{
		ModelAndView model=new ModelAndView();
		
		List<NoticeDto> list=service.noticeShowList();
		
		model.addObject("list",list);
		model.setViewName("/notice/noticeList");
		return model;
	}
	
	@RequestMapping("/noticelist_content.do")
	public ModelAndView content(@RequestParam int idx, @RequestParam int pageNum)
	{	
		ModelAndView model=new ModelAndView();
		//데이터 가져오기
		NoticeDto dto=service.getData(idx);
		dto.setContents(dto.getContents().replace("\n","<br>"));
		//model에 저장
		
		model.addObject("dto",dto);
		model.addObject("pageNum",pageNum);
		model.setViewName("/notice/noticeList_content");
		
		return model;
	}
}
