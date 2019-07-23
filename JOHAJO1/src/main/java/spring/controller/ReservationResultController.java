package spring.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import spring.data.nmSearchDto;
import spring.service.FoodService;
import spring.service.ReservationService;
import spring.service.StoreService;
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
	@Autowired
	private StoreService store_service;
	@Autowired
	private ReservationService res_service;
	
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
		   //dto.setStore(store);
		   dto.setRestime(time);
		   dto.setRestable(sit);
		   dto.setFsingle(fidx);
		   
		   return model;
	   }
	@RequestMapping(value="/reservationfinnm.do",method=RequestMethod.GET)
	 public @ResponseBody List<nmSearchDto> resfinsh(HttpSession session,@RequestParam String nsid){
		String s="nm_number"+nsid;
		//System.out.println("여깈ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		//System.out.println("nsid"+nsid);
		List<nmSearchDto> list = new ArrayList<nmSearchDto>();
		Integer nmid=(Integer)session.getAttribute(nsid);
		//System.out.println("여기2222222222"+nmid);
		
		//int nmidx=Integer.parseInt(nmid);
		list=nmb_service.nmBasketList(nmid);
		//System.out.println("여기33333333333"+list.size());
		
		return list;
		 
	}
	@RequestMapping(value="/reservationfinm.do",method=RequestMethod.GET)
	 public @ResponseBody List<mSearchDto> resfinsh1(HttpSession session){
		List<mSearchDto> list = new ArrayList<mSearchDto>();
		Integer mid=(Integer)session.getAttribute("log_idx");
		list=mb_service.getbasketlist(mid);
		return list;	 
	}
	 
	@RequestMapping(value="/resfinsh.do",method=RequestMethod.GET)	
	public @ResponseBody List<ReservationDto> resfinsh3(String pass,String hp,HttpSession session,String sit,String month,String day,@RequestParam String store,String time,@RequestParam(required=false) String course,@RequestParam(required=false) String sid){
		int storeidx=store_service.getDataName(store);
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR)%100;
		String date=day+"/"+month+"/"+year;
		System.out.println(date);
		ReservationDto dto = new ReservationDto();
		dto.setResdate(date);
		System.out.println(storeidx);
		dto.setStore(storeidx);
		if(course!=null) {
			String[] co=course.split(",");
			if(co.length==1) {
				dto.setF1(co[0]);
			}
			if(co.length==2) {
				dto.setF2(co[1]);
			}
		}
		
		System.out.println("sid="+sid);
		int nmidx=(Integer) session.getAttribute(sid);
		System.out.println(nmidx);
		int price=nmb_service.nmBasketPrice(nmidx);
		dto.setFsingle(nmidx);
		System.out.println(price);
		dto.setTotalprice(price);
		System.out.println(time);
		dto.setRestime(time);
		System.out.println(sit);
		dto.setRestable(sit);
		System.out.println(hp);
		dto.setNm_ph(hp);
		System.out.println(pass);
		dto.setNm_pass(pass);
		res_service.InsertnmRes(dto);
		
		return null;
	}
}
