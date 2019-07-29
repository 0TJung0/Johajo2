
package spring.controller;

import java.io.Console;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Vector;


import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CourseDto;
import spring.data.FoodDto;
import spring.data.NmBasketDto;
import spring.data.ReservationDto;
import spring.data.StoreDto;
import spring.data.TableDto;
import spring.data.mSearchDto;
import spring.data.singlebasketDto;
import spring.service.CourseService;
import spring.service.FoodService;
import spring.service.MemberService;
import spring.service.StoreService;
import spring.service.TableService;
import spring.service.nm_basketService;
import spring.service.singlebasketService;

import javax.servlet.http.HttpSession;

@Controller
public class ReservationController {
	  @Autowired
	  private StoreService service;
	  @Autowired
	  private FoodService fservice;
	  @Autowired
	  private TableService tservice;
	  @Autowired
	  private CourseService cou_service;
	  @Autowired
	  private MemberService mservice;
	  @Autowired
	  private singlebasketService basket_service;
	  @Autowired
	  private nm_basketService nm_basket_service;
	  int year2=0;
	  int n=0;
      List<FoodDto> list2=new ArrayList<FoodDto>();
      
	  
   //�삁�빟�럹�씠吏�   
   @RequestMapping("/reslist.do")
   public ModelAndView ReservationList(HttpSession session,@RequestParam(required=false) String se_name)throws Exception {
	   ModelAndView model = new ModelAndView();
	   Integer nmid=null;
	   int check=1;
	   if(se_name!=null){
		  nmid=(Integer)session.getAttribute(se_name); 
		  model.addObject("se_name",se_name);
	  }
	  String mid=(String)session.getAttribute("log_id");
	  //System.out.println("no_memeber"+nmid);
	  //System.out.println("mid"+mid);
	 
	  if(nmid==null&&mid==null){
		  //System.out.println("no_memeber"+nmid);
		  //System.out.println("mid"+mid);
		  check=0;
	  }
	  //System.out.println("check"+check);
	  list2.clear();
      
      List<StoreDto> list=new ArrayList<StoreDto>();
      list=service.getList();
      //System.out.println("check"+check);
      model.addObject("list",list);
      model.addObject("check",check);
      model.setViewName("/res/reservationList");
      return model;
   }
   //�떖�젰
   @RequestMapping(value="/reslist2.do",method=RequestMethod.GET)
   public ModelAndView ReservationList2(HttpServletRequest req,@RequestParam int month)throws Exception {
	   Calendar cal=Calendar.getInstance();
	
	   int currentMonth=cal.get(Calendar.MONTH);
	   int year=cal.get(Calendar.YEAR);
	   if(n==0){
		   year2=cal.get(Calendar.YEAR);
		   n++;
	   }
	   int today=0;
	   today=cal.get(Calendar.DATE);
	   int week=cal.get(Calendar.DAY_OF_WEEK);
	   cal.set(year2, currentMonth, today+90);
	   
	   int lastmonth=cal.get(Calendar.MONTH);
	   int lastmday=cal.get(Calendar.DATE);
	   
	   //System.out.println("留덉�留됰떖"+cal.get(Calendar.MONTH));
	   //System.out.println("留덉�留됰궇"+cal.get(Calendar.DATE));
	   int mon=month;
	   
	   //System.out.println(year2);
	   ModelAndView model = new ModelAndView();
	  //month++;
      if(mon<0){
    	  mon=11;
    	  year2--;
      }
	  if(mon>11){
    	  mon=0;
    	  year2++;
      }
//      for(int i=1;i<=lastday;i++){
//    	  day.add(i);
//      }
//      model.addObject("day",day);
      cal.set(year2,mon,1);
      week=cal.get(Calendar.DAY_OF_WEEK);
      int lastday=cal.getActualMaximum(cal.DAY_OF_MONTH);
      //System.out.println(week);
      cal.set(year2, mon, 0);
      //System.out.println(year2);
      //System.out.println(lastday);
      model.addObject("lastmonth",lastmonth);
      model.addObject("lastmday",lastmday);
      model.addObject("currentMonth",currentMonth+1);
      model.addObject("currentyear",year);
      model.addObject("year",year2);
      model.addObject("today",today+1);
      model.addObject("lastday",lastday);
      model.addObject("month",mon+1);
      model.addObject("week",week);
      model.setViewName("/res/resCal");
      return model;
      
   }
   //硫붾돱 媛��졇�삤�뒗
   @RequestMapping(value="/resAppetizer.do",method=RequestMethod.GET)
   public ModelAndView app(@RequestParam int kind)
   {
      ModelAndView model=new ModelAndView();
      List<FoodDto> list=null;
      //System.out.println("kind="+kind);
      list=fservice.getKindFood(kind);
      model.addObject("list",list);
      model.setViewName("/res/resApp");
      //System.out.println("�뜲�씠�꽣 2");
      return model;
   }
   @RequestMapping("/resAppetizer2.do")
   public ModelAndView addlist2(@RequestParam int idx,@RequestParam String name,HttpServletRequest req)throws Exception
   {

      ModelAndView model=new ModelAndView();
      FoodDto dto=new FoodDto();
      dto=fservice.getOneFood(idx);
      //System.out.println(count);
      
      //if(count==1){
    	 // model.addObject("count", count+1);
    	  //System.out.println("�씠怨�3");
      list2.add(dto);
      //}
      model.addObject("list",list2);
      model.setViewName("/res/resApp");
      return model;
   }
   @RequestMapping(value="/resAppetizer3.do",method=RequestMethod.GET)
   public ModelAndView removelist2(@RequestParam int idx,HttpServletRequest req)throws Exception
   {
	
	  System.out.println(idx);
      ModelAndView model=new ModelAndView();
      list2.remove(idx);
      
      System.out.println("3");
      int size = list2.size();
      System.out.println("size"+size);
      if(size==0){
    	  model.setViewName("redirect:/reslist.do");
      }else{
    	  model.addObject("list",list2);
    	  model.setViewName("/res/resApp");
      }
      return model;
   }
   @RequestMapping("/resAppetizer4.do")
   public ModelAndView app4(){
	   ModelAndView model=new ModelAndView();
	   model.addObject("list",list2);
	   model.setViewName("/res/resApp");
	   
	   return model;
   }
   //�떎�쓬 �삁�빟李쎌쑝濡� �꽆湲곌린
   @RequestMapping("/resAppetizer5.do")
   public ModelAndView app5(HttpSession session,@RequestParam int hmonth,@RequestParam int hday,
	   @RequestParam(value="hstore") String hstore,@RequestParam(value="htime") String htime,@RequestParam(value="hsit") String hsit,
	   @RequestParam(required=false,defaultValue ="0")String se_nmname,@RequestParam(value="hcourse", required=false,defaultValue ="0") String hcourse){
	   Integer mid=(Integer)session.getAttribute("log_idx");
	   int check=mid!=null?1:2;
	   ModelAndView model=new ModelAndView();
	   //System.out.println("check"+check);
	   //System.out.println("se_nmname"+se_nmname);
	  
	   model.addObject("check",check);
	   model.addObject("hmonth",hmonth);
	   model.addObject("hday",hday);
	   model.addObject("hstore",hstore);
	   model.addObject("htime",htime);
	   model.addObject("hsit",hsit);
	   model.addObject("hcourse",hcourse);
	   if(check==1){
	   //System.out.println("idx="+id);
	  // int midx=Integer.parseInt(mid);
	   int point = mservice.usePoint(mid);
	   //System.out.println("point="+point);
	   model.addObject("point",point);
	   }else {
		   model.addObject("se_name",se_nmname);
	   }
	   model.setViewName("/res/reservationResult");
	   return model;
	   
	   
	   
   }
  
   //吏��젏異쒕젰
   @RequestMapping("/reservation2.do")
   public ModelAndView tableshow(@RequestParam String store,@RequestParam String time,HttpSession session){
	   String se_name=store+time;
	   session.setAttribute(se_name,1 );
	   ModelAndView model=new ModelAndView();
	   List<TableDto> list=new ArrayList<TableDto>();
	   int idx=service.getDataName(store);
	   //System.out.println("吏��젏idx :"+idx);
	   list=tservice.getList(idx);
//	   for(TableDto dto:list){
//		   System.out.println(dto.getTbname());
//	   }
	   model.addObject("list",list);
	   model.setViewName("/res/resTablelo");
	   return model;
   }
   //�옣諛붽뎄�땲 異붽�
//   @RequestMapping("/basketadd.do")
//	   public ModelAndView basket(@RequestParam int fidx,HttpServletRequest session)throws Exception{
//		   ModelAndView model = new ModelAndView();
//		   String mid = (String)session.getAttribute("log_id");
//		   if(mid!=null){
//			   int midx=Integer.parseInt(mid);
//		   }
//		   return model;
//	   }
   //濡쒓렇�씤 �븞�븯怨� �삁�빟�븳�떎�뒗 �궗�엺
   @RequestMapping(value="/nomember.do",method=RequestMethod.GET)
   public String nomember(HttpSession session)throws Exception{
	   //System.out.println("nmember");
	   int count=nm_basket_service.getnMembercount();
	   int nm_number=0;
	   if(count==0){
		   nm_number=1;
	   }else{
		   nm_number=nm_basket_service.getMaxNMCount()+1;
		   while(true){
			   Integer nmid=(Integer)session.getAttribute("no_member"+nm_number); 
			   if(nmid!=null){
				   nm_number++;
			   }else{
				   break;
			   }
		   }
	   }
	   //System.out.println(nm_number);
	   String se_name="nm_number"+nm_number;
	   session.setAttribute(se_name,nm_number );
	   return "redirect:/reslist.do?se_name="+se_name;
	}
   //�옣諛붽뎄�땲�뿉 異붽��븯�뒗 肄붾뱶
   @RequestMapping(value="/nmbasketadd.do",method=RequestMethod.GET)
   public ModelAndView addbasket(HttpSession session,@RequestParam(defaultValue="A",required=false)String se_nmname,
		    String restable, int fidx, String restime,String resstore)throws Exception{
	   ModelAndView model = new ModelAndView();
	   Map<String, Integer> map=new HashMap<String, Integer>();
	   //System.out.println("restime"+restime);
	   if(!se_nmname.equals("A")){ 
		   Integer se_n=(Integer)session.getAttribute(se_nmname);
		   NmBasketDto dto=new NmBasketDto();
		   dto.setFidx(fidx);
		   dto.setNmidx(se_n);
		   dto.setRestime(restime);
		   dto.setRestable(restable);
		   dto.setResstore(resstore);
		   //System.out.println("stroe dto"+dto.getRestable());
		   if(nm_basket_service.insertCheck(dto)<=0){
			   System.out.println("stro1");
			   nm_basket_service.insertnMemberBasket(dto);
		   }else{
			   System.out.println("stro2");
			   nm_basket_service.updatenMemberBasket(dto);
		   }
		   
	   }else{

		   Integer midx=(Integer)session.getAttribute("log_idx");
		   singlebasketDto dto=new singlebasketDto();
		   dto.setFidx(fidx);
		   dto.setMidx(midx);
		   dto.setRestime(restime);
		   dto.setRestable(restable);
		   dto.setResstore(resstore);
		   //System.out.println("stroe dto"+dto.getRestable());
		   if(basket_service.checkmbasket(dto)<=0) {
			   basket_service.insertmbasket(dto);
		   }else {
			   basket_service.updatembasket(dto);
		   }		   
	   }
	   model.setViewName("/res/reservationList");
	   return model;
   }
 
	
	@RequestMapping(value="/sitsession.do",method=RequestMethod.GET)
	public ModelAndView sitsession(@RequestParam String sit,HttpSession session){
		ModelAndView model = new ModelAndView();
		Integer n=(Integer)session.getAttribute(sit);
		int check=0;
		if(n==null){
			session.setAttribute(sit, 1);
			check=1;
		}
		model.addObject("check",check);
		model.setViewName("/res/reservationList");
		return model;
	}
	
	//코스 리스트 출력
	@RequestMapping(value="/rescoursesellist.do",method=RequestMethod.GET)
	 public @ResponseBody List<CourseDto> rescourselist(HttpSession session){	
		List<CourseDto> list = new ArrayList<CourseDto>(); 
		list=cou_service.resCourselist();
		return list;
		
	 }
	//베스트 메뉴 탭 선택시
	@RequestMapping(value="/resbestsel.do",method=RequestMethod.GET)
	 public @ResponseBody List<FoodDto> resHotlist(HttpSession session){
		List<FoodDto> list = new ArrayList<FoodDto>(); 
		list=fservice.getBestfive();
		return list;
	}
	//장바구니에 있는 선택한 메뉴 출력 
	@RequestMapping(value="/ressellist.do",method=RequestMethod.GET)
	 public @ResponseBody List<mSearchDto> ressellist(HttpSession session,@RequestParam(required=false,defaultValue="A") String se_nmname,
			 @RequestParam String restable,@RequestParam String restime,@RequestParam String resstore)throws Exception{
		List<mSearchDto> list=new ArrayList<mSearchDto>();
		
		if(se_nmname.equals("A")) {
			singlebasketDto sdto=new singlebasketDto();
			int midx=(Integer)session.getAttribute("log_idx");
			sdto.setMidx(midx);
			sdto.setRestime(restime);
			sdto.setRestable(restable);
			sdto.setResstore(resstore);
			list=basket_service.getbasketlist(sdto);
		}else {
			NmBasketDto nmdto=new NmBasketDto();
			int nmidx=(Integer)session.getAttribute(se_nmname);
			nmdto.setNmidx(nmidx);
			nmdto.setRestable(restable);
			nmdto.setRestime(restime);
			nmdto.setResstore(resstore);
			list=nm_basket_service.nmBasketList(nmdto);
		}
		
		
		return list;
	}
	//코스 메뉴선택시
	@RequestMapping(value="/rescoursesel.do",method=RequestMethod.GET)
	public void rescoursesel(HttpSession session,@RequestParam int idx,@RequestParam(defaultValue="A",required=false)String se_nmname,
			   @RequestParam String restable,@RequestParam String restime,@RequestParam String resstore)throws Exception{
		CourseDto cdto=new CourseDto();
		cdto=cou_service.resCourseOne(idx);
		int[] nidx= {cdto.getAppe_p(),cdto.getSoup_p(),cdto.getMain_p(),cdto.getSide_p(),cdto.getDes_p(),cdto.getDrink_p()};
		for(int s:nidx) {
		if(!se_nmname.equals("A")){ 
			   Integer se_n=(Integer)session.getAttribute(se_nmname);
			   NmBasketDto nmdto=new NmBasketDto();
			   nmdto.setFidx(s);
			   nmdto.setNmidx(se_n);
			   nmdto.setRestime(restime);
			   nmdto.setRestable(restable);
			   nmdto.setResstore(resstore);
			   if(nm_basket_service.insertCheck(nmdto)<=0){
				   nm_basket_service.insertnMemberBasket(nmdto);
			   }else{
				   nm_basket_service.updatenMemberBasket(nmdto);
			   }
			   
		   }else{
			   System.out.println("요기3");
			   Integer midx=(Integer)session.getAttribute("log_idx");
			   singlebasketDto mdto=new singlebasketDto();
			   mdto.setFidx(s);
			   mdto.setMidx(midx);
			   mdto.setRestime(restime);
			   mdto.setRestable(restable);
			   mdto.setResstore(resstore);
			   if(basket_service.checkmbasket(mdto)<=0) {
				   basket_service.insertmbasket(mdto);
			   }else {
				   basket_service.updatembasket(mdto);
			   }		 
		   }
		}
	}
	//장바구니 db에서 count낮추기 0되면 삭제
	
	@RequestMapping(value="/countdel.do",method=RequestMethod.GET)
	@ResponseBody
	public void countdel(HttpSession session,@RequestParam(defaultValue="A",required=false)String se_nmname,
		    String restable, String fname, String restime,String resstore) {
		System.out.println("fname"+fname);
		int fidx=fservice.getFoodIdx(fname);
		System.out.println("fidx"+fidx);
		if(se_nmname!="A") {
			NmBasketDto dto = new NmBasketDto();
			//ReservationDto dto = new ReservationDto()
			int nmidx=(Integer) session.getAttribute(se_nmname);
			dto.setNmidx(nmidx);
			dto.setFidx(fidx);
			dto.setRestable(restable);
			dto.setResstore(resstore);
			dto.setRestime(restime);
			System.out.println(dto.getNmidx());
			System.out.println(dto.getFidx());
			System.out.println(dto.getRestable());
			System.out.println(dto.getResstore());
			System.out.println(dto.getRestime());
			int count=nm_basket_service.nmBasketcountcheck(dto);
			System.out.println(count);
			if(count>1) {
				nm_basket_service.updatendelBasket(dto);
			}else {
				nm_basket_service.nmBasketDelete(dto);
			}
		}else {
			singlebasketDto dto=new singlebasketDto();
			int midx=(Integer) session.getAttribute("log_idx");
			dto.setMidx(midx);
			dto.setFidx(fidx);
			dto.setRestable(restable);
			dto.setResstore(resstore);
			dto.setRestime(restime);
			basket_service.mBasketaddupdate(dto);
		}
		
	}
	//장바구니 카운트 올려주는
	@RequestMapping(value="/countadd.do",method=RequestMethod.GET)
	@ResponseBody
	public void countadd(HttpSession session,@RequestParam(defaultValue="A",required=false)String se_nmname,
		    String restable, String fname, String restime,String resstore){
		int fidx=fservice.getFoodIdx(fname);
		if(se_nmname.equals("A")) {
			
			singlebasketDto dto=new singlebasketDto();
			int midx=(Integer) session.getAttribute("log_idx");
			dto.setMidx(midx);
			dto.setFidx(fidx);
			dto.setRestable(restable);
			dto.setResstore(resstore);
			dto.setRestime(restime);
			basket_service.mBasketaddupdate(dto);
		}else {
			NmBasketDto dto = new NmBasketDto();
			
			int nmidx=(Integer) session.getAttribute(se_nmname);
			dto.setNmidx(nmidx);
			dto.setFidx(fidx);
			dto.setRestable(restable);
			dto.setResstore(resstore);
			dto.setRestime(restime);
			nm_basket_service.updatenMemberBasket(dto);
			
		}
		
	}
}
