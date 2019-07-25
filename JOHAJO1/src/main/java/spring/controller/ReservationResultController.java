package spring.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FoodDto;
import spring.data.NmBasketDto;
import spring.data.ReservationDto;
import spring.data.mSearchDto;
import spring.service.FoodService;
import spring.service.nm_basketService;
import spring.service.singlebasketService;
@Controller
public class ReservationResultController {
	@Autowired
	private FoodService food_service;
	@Autowired
	private nm_basketService nmb_service;
	@Autowired
	private singlebasketService mb_service;
	
	ReservationDto dto=new ReservationDto();
	@RequestMapping("/reservation.do")
	   public ModelAndView resresultview(HttpServletRequest session,@RequestParam int month,@RequestParam int day,@RequestParam String store,
			   @RequestParam String time,@RequestParam String sit,@RequestParam int fidx,@RequestParam String course,@RequestParam(required=false) String se_nmname){
		   ModelAndView model=new ModelAndView();
		   
		   String id=(String)session.getAttribute("log_idx");
		   int midx=Integer.parseInt(id);
		   Calendar cal =Calendar.getInstance();
		   int year=cal.get(Calendar.YEAR)%100;
		   
		   dto.setRem(midx);
		   String date=day+"/"+month+"/"+year;
		   dto.setResdate(date);
		   dto.setStore(store);
		   dto.setRestime(time);
		   dto.setRestable(sit);
		   dto.setFsingle(fidx);
		   
		   return model;
	   }
	@RequestMapping(value="/reservationfinnm.do",method=RequestMethod.GET)
	 public @ResponseBody List<NmBasketDto> resfinsh(HttpServletRequest session,@RequestParam String nsid){
		System.out.println("nsid"+nsid);
		List<NmBasketDto> list = new ArrayList<NmBasketDto>();
		String nmid=(String)session.getAttribute(nsid);
		int nmidx=Integer.parseInt(nmid);
		list=nmb_service.nmBasketList(nmidx);
		
		return list;
		 
	}
	@RequestMapping(value="/reservationfinm.do",method=RequestMethod.GET)
	 public @ResponseBody List<mSearchDto> resfinsh1(HttpServletRequest session){
		List<mSearchDto> list = new ArrayList<mSearchDto>();
		Integer mid=(Integer)session.getAttribute("log_idx");
		list=mb_service.getbasketlist(mid);
		return list;	 
	}
}
