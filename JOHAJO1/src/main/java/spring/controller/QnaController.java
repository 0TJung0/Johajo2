package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jmx.snmp.Timestamp;

import spring.data.QnaDto;
import spring.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	@RequestMapping(value="/myqnaList.do",method=RequestMethod.GET)
	public ModelAndView myqnaList(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage ,
			@RequestParam int idx,
			HttpSession session,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		
		int totalCount;
		totalCount = service.QnaTotalCount(idx);
		
		
		int totalPage; 		//총페이지수
		int startNum; 		//각페이지의 시작번호
		int endNum; 		//각 페이지의 끝번호
		int startPage; 		//블럭의 시작 페이지 
		int endPage; 		//블럭의  끝페에지 
		int no; 				//출력 시작번호
		int perPage = 5; 		//한페이지당 보여질 글의 갯수
		int perBlock = 5;		//한 블럭당 보여질 페이지의 갯수
		
		totalPage = totalCount/perPage+(totalCount%perPage >0 ?1:0);
		
	
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		//각 블럭의 시작페이지와 끝페이지를 구한다.
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage + perBlock-1;
		
		//현재 페이지가 총페이지수보다 크면 안된다.
		if(endPage > totalPage)
			endPage = totalPage;
		
		//각페이지의 시작번화 끝번호를 구한다. 
		//perPage 가 5일 경우 
		//ex)1페이지 : 시작 1, 끝 15
		//   3     :   11    15
		startNum = (currentPage-1)*perPage+1;
		endNum = startNum+perPage-1;
		
		//마지막 페이지 글 번호 체크하기 
		if(endNum > totalCount)
			endNum = totalCount;
	
		//각페이지마다 출력할 시작 번호
		//총갯수가 30일 경우 1페이지는 30,2페이지는 25....
		no = totalCount - ((currentPage-1)*perPage);
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",startNum);
		map.put("end",endNum);
		map.put("idx",idx);
		
		List<QnaDto> list = service.QnaSelectList(map);
	
		Integer midx = (Integer)session.getAttribute("log_idx");
		if(midx == null) {
			System.out.println("로그인해주세요");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 해주세요.');location.href='loginform.do';");
				out.println("</script>");
				out.flush();
				
			}catch(IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
			
		}
		
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		
		model.addObject("list", list);
		model.addObject("totalCount",totalCount);
		model.setViewName("/member/myqnaList");
		return model;
	} 
	
	@RequestMapping("/myqnaForm.do")
	public String qnaForm() {
		return "/member/myqnaForm";
	}
	
	@RequestMapping(value = "/myqnaInsert.do", method = RequestMethod.POST)
	public String myqnaInsert(@ModelAttribute QnaDto dto, HttpServletResponse response) {

		int fid = dto.getMem_f();
		
		int max = service.qnaMaxIdx();
		max +=1;
		
		dto.setIdx(max);
		dto.setGrp(max);
		
		service.myqnaInsert(dto);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('문의완료되었습니다.');");
			out.println("</script>");
			// out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:myqnaList.do?idx=" + fid;
	}
		
		
	@RequestMapping(value = "/myqnaInsert2.do", method = RequestMethod.POST)
	public ModelAndView myqnaInsert2(@ModelAttribute QnaDto dto, HttpServletResponse response) {
		ModelAndView model=new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat day = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
		String anwday = day.format(cal.getTime());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx",dto.getIdx());
		map.put("content2",dto.getContent2());
		map.put("anwday",anwday);
		
		service.myanswerInsert(map);
		
		model.addObject("idx",dto.getIdx());
		model.addObject("content2",dto.getContent2());
		model.addObject("anwday",anwday);
		model.setViewName("/member/myqnaData");
		
		return model;	
	}
	
	@RequestMapping("myqnaDelete.do")
	public String myqnaDelete(
			@RequestParam int idx,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum, 
			HttpSession session,
			HttpServletResponse response
			) {
	
		Integer midx = (Integer)session.getAttribute("log_idx");
		if(midx == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 해주세요.');location.href='loginform.do';");
				out.println("</script>");
				out.flush();
				
			}catch(IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
			
		}
			service.myqnaDelete(idx); 
			return "redirect:myqnaList.do?idx="+midx+"&pageNum="+pageNum;
	}
	
	
	//답변 삭제하기
	@RequestMapping(value="myanwDelete.do",method=RequestMethod.POST)
	public String myanwDelete(@RequestParam int idx) {
		
		service.myanwDelete(idx);
		
		return "/member/myqnaDel";
	}
	
	
	//답변수정하기
	@RequestMapping(value="/myqnaSelect.do",method=RequestMethod.POST)
	public ModelAndView myqnaSelect(@RequestParam int idx) {
		ModelAndView model=new ModelAndView();
		
		QnaDto dto = service.myanwSelect(idx);
		
		model.addObject("idx",idx);
		model.addObject("content2",dto.getContent2());
		model.setViewName("/member/myqnaData");
		
		return model;	
	}
	
	
	
	
}
