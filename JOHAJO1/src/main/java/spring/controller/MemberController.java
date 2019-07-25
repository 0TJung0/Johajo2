
package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.data.MemberDto;
import spring.service.MemberService;



@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
/*
 * JOIN***********************************************************
 */	
	
	//약간동의
	@RequestMapping("/joinform.do")
	public String form()
	{
		return "/member/memberJoinForm1";
	}
	
	//가입폼
	@RequestMapping("/joinform2.do")
	public String form2()
	{
		return "/member/memberJoinForm2";
	}
	

	//id check
	@ResponseBody
	@RequestMapping(value= {"member","idCheck.pop"},method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberIdCheck( 
			@RequestParam(value="id",defaultValue="") String id 
			) {
		ModelAndView model = new ModelAndView();
		int  result = service.memberIdCheck(id);
		model.addObject("result", result);
		model.addObject("id", id);
		model.setViewName("/pop/member/idCheck");
		return model;
		
	}
	
	//멤버 insert
	@RequestMapping(value="/memberInsert.do",method=RequestMethod.POST)
	public String memberInsert(@ModelAttribute MemberDto dto,HttpServletRequest request){
	
		dto.setHp(dto.getHp1()+'-'+dto.getHp2()+'-'+dto.getHp3());
		
		service.memberInsert(dto);
		return "redirect:joinSuccess.do";
	}
	
	//join success
	@RequestMapping("/joinSuccess.do")
	public String joinSuccess() {
		
		return "/member/memberJoinSuccess";
	}
	
	
/*
 * LOGIN***********************************************************
 */	
	
	//login action
	@RequestMapping(value="/memberlogin.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam String id,
			@RequestParam String pw, 
			@RequestParam (value="chkid",defaultValue="no") String chkid, 
			HttpSession session,@RequestParam(required=false) String path){
		
		
		System.out.println("path"+path);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", pw);
		MemberDto dto = service.userLoginByIdandPW(map);
		if(dto != null && dto.getId().equals(id)) {
			if(chkid.equals("no")) {
				session.setAttribute("saveok","no"); 
			}else {
				session.setAttribute("saveok","yes"); 
			}
			session.setAttribute("log_idx", dto.getIdx()); 
			session.setAttribute("log_id", dto.getId()); //로그인 아이디
			session.setAttribute("log_name", dto.getName());
			session.setAttribute("loginok", "yes");//로그인 여부
			session.setMaxInactiveInterval(60*60*8);
			 
			if(id.equals("manager")) {
                return "redirect:admain.do";
             }else {
            	if(path!=null){
                 	return "redirect:"+path;
                }else{
                return "/member/memberLoginOk";
                }
             }
    }else{
       
       session.setAttribute("log_res","false");
       return "redirect:loginform.do?path="+path;
    }
		
	}
	
	//logout
	@RequestMapping("/userLogout.do")
	public String userLogout(HttpSession session) {
		session.removeAttribute("loginok");
		session.removeAttribute("log_idx");
		session.removeAttribute("log_id");
		
		return "redirect:main.do";
	}
	
	
	//로그인
		@RequestMapping(value="/loginform.do",method=RequestMethod.GET)
		public ModelAndView login(@RequestParam(required=false) String path)
		{
			ModelAndView model=new ModelAndView();
			model.setViewName("/member/memberLoginForm");
			model.addObject("path",path);
			return model;
		}
	
	//아이디 찾기
	@RequestMapping("/selIdform.do")
	public String selIdform() {
		
		return "/member/selIdform";
	}
	
	//id select action
		@RequestMapping(value="/selectid.do", method=RequestMethod.POST)
		public String selectid(
				Model model, 
				@RequestParam String name,
				@RequestParam String hp,
				@RequestParam int hp2,
				@RequestParam int hp3){
			
			String tot_hp = hp+"-"+hp2+"-"+hp3;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("hp", tot_hp);
			
			MemberDto dto = service.selectUserId(map);
			String findId ="", joindate="";
			
			if(dto == null) {
				findId = "";
				joindate = "";
				
			}else {
				 findId = dto.getId();
				 joindate = dto.getJoindate();
			}
			
			
			
			model.addAttribute("findId",findId);
			model.addAttribute("joindate",joindate);
			
			return "/member/selectIdResult";
			
		}
		
		
	//비번찾기
	@RequestMapping("/selPwform.do")
	public String selPwform() {
		
		return "/member/selPwform";
	}
	
	
	
	//pw select action
	@RequestMapping(value="/selectpw.do", method=RequestMethod.POST)
	public String selectpw(
			Model model, 
			@RequestParam String id,
			@RequestParam String hp,
			@RequestParam int hp2,
			@RequestParam int hp3){
		
		String tot_hp = hp+"-"+hp2+"-"+hp3;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("hp", tot_hp);
		
		MemberDto dto = service.selectUserPw(map);
		String findName ="", findPw = "";
		
		if(dto == null) {
			 findName = "";
			 findPw = "";
			
		}else {
			 findName = dto.getName();
			 findPw = dto.getPassword();
		}
		
		
		model.addAttribute("findName",findName);
		model.addAttribute("findPw",findPw);
		
		return "/member/selectPwResult";
		
	}
			
	
	
/*
 * MYPAGE***********************************************************
 */	
	//mygage 이동
	@RequestMapping("/mypageform.do")
	public String myPageForm(HttpSession session,
			HttpServletResponse response) {
		
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
		
		return "/member/mypageMain";
	}
	
	@RequestMapping("/mypassfrom.do")
	public String mypassform(){
		
		return "/member/mypassForm";	
	}
	
	@RequestMapping(value="/myinfoform.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String myinfoform(@RequestParam String password,
			@RequestParam String idx,
			Model model,HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("idx", idx);
		map.put("password", password);
		int cnt = service.getUserCheckCount(map);
		
		if(cnt == 1) {
			MemberDto dto = service.getUserInfoByPass(map);
			
			String[] res = dto.getHp().split("-");
			
			dto.setHp1(res[0]);
			dto.setHp2(res[1]);
			dto.setHp3(res[2]);
			
			model.addAttribute("dto",dto);
			
			return "/member/myUpdateForm";
			
		} else {
			session.setAttribute("log_res","false");
			return "redirect:mypassfrom.do";
		}
	}
	
	//update
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(
			@ModelAttribute MemberDto dto,
			Model model,
			HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response,
			@RequestParam String newpass) {
		
		Map<String, String> map = new HashMap<String, String>(); 
		String nowpass = dto.getPassword();
		map.put("idx", String.valueOf(dto.getIdx()));
		map.put("password", nowpass);
		
		int cnt = service.getUserCheckCount(map);
		if(cnt == 1) {
			dto.setHp(dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3());
			
			if(newpass.length() > 0) {
				//System.out.println("새비번 사용한다"+newpass.length());
				dto.setPassword(newpass);
				service.memberUpdate(dto);
				
				session.setAttribute("mupdate","true");
				session.removeAttribute("loginok");
				session.removeAttribute("log_idx");
				session.removeAttribute("log_name");
				session.removeAttribute("log_id");
				
				return  "redirect:loginform.do";
				
			}else {
				//System.out.println("기존 비번 사용한다.");
				dto.setPassword(nowpass);
				service.memberUpdate(dto);
				session.setAttribute("mupdate","true");
				return  "/member/mypageMain";
			}
			
		}else {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.정확히 입력해주세요');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
	}
	
	
	
}

