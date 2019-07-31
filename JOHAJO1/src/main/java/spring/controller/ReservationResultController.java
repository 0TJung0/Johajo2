
package spring.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CouponDto;
import spring.data.FoodDto;
import spring.data.NmBasketDto;
import spring.data.ReservationDto;
import spring.data.mSearchDto;
import spring.data.singlebasketDto;
import spring.service.CouponService;
import spring.service.FoodService;
import spring.service.MemberService;
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
	@Autowired
	private CouponService coupon_service;
	@Autowired
	private MemberService member_service;
	
	ReservationDto dto=new ReservationDto();
	//db에있는 선택한 음식 리스트 출력
	@RequestMapping(value="/reservationlist.do",method=RequestMethod.GET)
	public @ResponseBody List<mSearchDto> resresultview(HttpSession session,
			@RequestParam String store,@RequestParam String time,@RequestParam String sit,
			   @RequestParam(required=false,defaultValue="A") String se_nmname){
		System.out.println("123");
		   List<mSearchDto> list = new ArrayList<mSearchDto>();
		   if(se_nmname.equals("A")) {
			   int idx=(Integer)session.getAttribute("log_idx");
			   singlebasketDto sdto=new singlebasketDto();
			   //int midx=Integer.parseInt(id);
			   sdto.setMidx(idx);
			   sdto.setResstore(store);
			   sdto.setRestime(time);
			   sdto.setRestable(sit);
			   System.out.println(sdto.getMidx());
			   System.out.println(sdto.getRestable());
			   System.out.println(sdto.getRestime());
			   System.out.println(sdto.getResstore());
			   list=mb_service.getbasketlist(sdto);
		   }else{
			   int nmid=(Integer)session.getAttribute(se_nmname);
			   NmBasketDto nmdto=new NmBasketDto();
			   nmdto.setNmidx(nmid);
			   nmdto.setRestime(time);
			   nmdto.setRestable(sit);
			   nmdto.setResstore(store);
			   System.out.println(nmdto.getNmidx());
			   System.out.println(nmdto.getRestime());
			   System.out.println(nmdto.getRestime());
			   System.out.println(nmdto.getResstore());
			   list=nmb_service.nmBasketList(nmdto);
		   }
		   return list;
	   }
	//로그인한 아이디 쿠폰 출력
	@RequestMapping(value="/coupongetlist.do",method=RequestMethod.GET)	
	public @ResponseBody List<CouponDto> couponelist(HttpSession session){
		int idx=(Integer)session.getAttribute("log_idx");
		List<CouponDto> list=coupon_service.getCouponlist(idx);
		return list;
	}
	@RequestMapping(value="/coupongetlistcheck.do",method=RequestMethod.GET)
	public @ResponseBody int couponelistcheck(HttpSession session){
		int idx=(Integer)session.getAttribute("log_idx");
		return coupon_service.getCouponCheck(idx);
	}
	//db예약 넣기
	@RequestMapping(value="/resfinsh.do",method=RequestMethod.GET)	
	public @ResponseBody ReservationDto resfinsh3(@RequestParam(required=false)String pass,@RequestParam(required=false)String hp,HttpSession session,String sit,@RequestParam(required=false,defaultValue="0") int usepoint,int totalprice,
			String month,String day,@RequestParam String store,String time,@RequestParam(required=false,defaultValue="A") String sid,@RequestParam(required=false,defaultValue="0") int usecouponidx){
		int storeidx=store_service.getDataName(store);
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR)%100;
		String date=day+"/"+month+"/"+year;
		ReservationDto dto = new ReservationDto();
		dto.setResdate(date);
		dto.setStore(storeidx);
		dto.setTotalprice(totalprice);
		dto.setRestime(time);
		dto.setRestable(sit);
		
		if(usepoint!=0) {
			dto.setUsepoint(usepoint);
		}else {
			dto.setUsepoint(0);
		}
		if(usecouponidx!=0) {
			dto.setCoupon(usecouponidx);
		}else {
			dto.setCoupon(0);
		}

		if(sid.equals("A")) {
			int midx=(Integer)session.getAttribute("log_idx");
			
			dto.setRem(midx);
			System.out.println(dto.getRem());
			if(dto.getUsepoint()!=0&&dto.getCoupon()!=0) {
				res_service.InsertResuseall(dto);
				singlebasketDto sdto=new singlebasketDto();
				sdto.setMidx(midx);
				sdto.setResstore(store);
				sdto.setRestime(time);
				sdto.setRestable(sit);
				sdto.setResidx(res_service.getMaxidx(midx));
				mb_service.mBasketResfin(sdto);
				Map<String, Integer> map=new HashMap<String, Integer>();
				map.put("idx", midx);
				map.put("point", usepoint);
				member_service.usepoint(map);
				coupon_service.useCoupone(usecouponidx);
			}else if(dto.getUsepoint()==0&&dto.getCoupon()!=0) {
				res_service.InsertResusepoint(dto);
				singlebasketDto sdto=new singlebasketDto();
				sdto.setMidx(midx);
				sdto.setResstore(store);
				sdto.setRestime(time);
				sdto.setRestable(sit);
				sdto.setResidx(res_service.getMaxidx(midx));
				mb_service.mBasketResfin(sdto);
				coupon_service.useCoupone(usecouponidx);
			}else if(dto.getUsepoint()!=0&&dto.getCoupon()==0) {
				res_service.InsertResusecoupon(dto);
				singlebasketDto sdto=new singlebasketDto();
				sdto.setMidx(midx);
				sdto.setResstore(store);
				sdto.setRestime(time);
				sdto.setRestable(sit);
				sdto.setResidx(res_service.getMaxidx(midx));
				mb_service.mBasketResfin(sdto);
				Map<String, Integer> map=new HashMap<String, Integer>();
				map.put("idx", midx);
				map.put("point", usepoint);
				member_service.usepoint(map);
			}else {
				res_service.InsertResmember(dto);
				singlebasketDto sdto=new singlebasketDto();
				sdto.setMidx(midx);
				sdto.setResstore(store);
				sdto.setRestime(time);
				sdto.setRestable(sit);
				sdto.setResidx(res_service.getMaxidx(midx));
				System.out.println("getResidx"+sdto.getResidx());
				mb_service.mBasketResfin(sdto);
			}
			
		}else {
			int nmidx=(Integer) session.getAttribute(sid);
			//int price=nmb_service.nmBasketPrice(nmidx);
			//dto.setFsingle(nmidx);
			
			System.out.println("nmidx"+nmidx);
			System.out.println("hp"+hp);
			dto.setNm_ph(hp);
			dto.setNm_pass(pass);
			System.out.println(dto.getNm_pass());
			System.out.println(dto.getStore());
			System.out.println(dto.getRestime());
			System.out.println(dto.getRestable());
			System.out.println(dto.getResdate());
			res_service.InsertnmRes(dto);
			NmBasketDto nmdto=new NmBasketDto();
			nmdto.setNmidx(nmidx);
			res_service.nmSelectMaxIdx();
			session.removeAttribute(sid);
		}
		ReservationDto rdto=new ReservationDto();
		int idx;
		if(sid.equals("A")) {
			int midx=(Integer)session.getAttribute("log_idx");
			idx=res_service.getMaxidx(midx);
		}else {
			idx=res_service.nmSelectMaxIdx();
		}
		return res_service.getresfin(idx);
	}
	@RequestMapping(value="/coupongetdiscount.do",method=RequestMethod.GET)	
	public @ResponseBody int getdiscount(int couponeidx) {
		return coupon_service.getCoupondiscount(couponeidx);
	}
}
