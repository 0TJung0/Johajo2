package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BrandController {
	
	@RequestMapping("/brand.do")
	public String brand()
	{
		return "/brand/brandList";
	}
	@RequestMapping(value="/branddata.do",produces = "application/text; charset=utf8")
	public @ResponseBody ModelAndView branddata(@RequestParam int num)
	{
		ModelAndView model=new ModelAndView();
		String msg="";
		String part="";
		String work="";
		String imgs="";
		String workPage="";
		
		if(num==4) {
			part="팀장";
			work="STORE, NOTICE, BRAND PAGE 제작";
			imgs="FaQ_img.PNG,notice_img.PNG,sotre_img.PNG";
			msg="에이스 이팀장";
			workPage="";
		}
		System.out.println(msg);
		model.addObject("msg",msg);
		model.addObject("part",part);
		model.addObject("work",work);
		model.addObject("imgs",imgs);
		
		model.setViewName("/brand/BrandData");
		return model;
	}
}
