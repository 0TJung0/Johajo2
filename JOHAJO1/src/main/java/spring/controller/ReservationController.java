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

import javafx.scene.chart.PieChart.Data;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.hamcrest.core.IsNull;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FoodDto;
import spring.data.ReservationDto;
import spring.data.StoreDto;
import spring.data.TableDto;
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
	  private MemberService mservice;
	  @Autowired
	  private singlebasketService basket_service;
	  @Autowired
	  private nm_basketService nm_basket_service;
	  int year2=0;
	  int n=0;
      List<FoodDto> list2=new ArrayList<FoodDto>();
      
	  
   //예약페이지   
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
	  System.out.println("no_memeber"+nmid);
	  System.out.println("mid"+mid);
	 
	  if(nmid==null&&mid==null){
		  System.out.println("no_memeber"+nmid);
		  System.out.println("mid"+mid);
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
   //달력
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
	   
	   //System.out.println("마지막달"+cal.get(Calendar.MONTH));
	   //System.out.println("마지막날"+cal.get(Calendar.DATE));
	   int mon=month;
	   
	   System.out.println(year2);
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
      model.addObject("today",today);
      model.addObject("lastday",lastday);
      model.addObject("month",mon+1);
      model.addObject("week",week);
      model.setViewName("/res/resCal");
      return model;
      
   }
   //메뉴 가져오는
   @RequestMapping(value="/resAppetizer.do",method=RequestMethod.GET)
   public ModelAndView app(@RequestParam int kind)
   {
      ModelAndView model=new ModelAndView();
      List<FoodDto> list=null;
      //System.out.println("kind="+kind);
      list=fservice.getKindFood(kind);
      model.addObject("list",list);
      model.setViewName("/res/resApp");
      //System.out.println("데이터 2");
      return model;
   }
   @RequestMapping("/resAppetizer2.do")
   public ModelAndView addlist2(@RequestParam int idx,@RequestParam String name,HttpServletRequest req)throws Exception
   {
	  System.out.println("이곳1");
      ModelAndView model=new ModelAndView();
      FoodDto dto=new FoodDto();
      dto=fservice.getOneFood(idx);
      //System.out.println(count);
      
      //if(count==1){
    	 // model.addObject("count", count+1);
    	  //System.out.println("이곳3");
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
   //다음 예약창으로 넘기기
   @RequestMapping("/resAppetizer5.do")
   public ModelAndView app5(HttpSession session,@RequestParam int hmonth,@RequestParam int hday,
	   @RequestParam(value="hstore") String hstore,@RequestParam(value="htime") String htime,@RequestParam(value="hsit") String hsit,
	   @RequestParam(required=false,defaultValue ="0")String se_nmname,@RequestParam(value="hcourse", required=false,defaultValue ="0") String hcourse){
	   String mid=(String)session.getAttribute("log_idx");
	   int check=mid!=null?1:2;
	   ModelAndView model=new ModelAndView();
	   System.out.println("se_nmname"+se_nmname);
	   model.addObject("se_name",se_nmname);
	   model.addObject("check",check);
	   model.addObject("hmonth",hmonth);
	   model.addObject("hday",hday);
	   model.addObject("hstore",hstore);
	   model.addObject("htime",htime);
	   model.addObject("hsit",hsit);
	   model.addObject("hcourse",hcourse);
	   String id=(String) session.getAttribute("log_idx");
	   if(id!=null){
	   //System.out.println("idx="+id);
	   int sid=Integer.parseInt(id);
	   int point = mservice.usePoint(sid);
	   //System.out.println("point="+point);
	   model.addObject("point",point);
	   }
	   model.setViewName("/res/reservationResult");
	   return model;
	   
	   
	   
   }
  
   //지점출력
   @RequestMapping("/reservation2.do")
   public ModelAndView tableshow(@RequestParam String store,@RequestParam String time,HttpSession session){
	   String se_name=store+time;
	   session.setAttribute(se_name,1 );
	   ModelAndView model=new ModelAndView();
	   List<TableDto> list=new ArrayList<TableDto>();
	   int idx=service.getDataName(store);
	   //System.out.println("지점idx :"+idx);
	   list=tservice.getList(idx);
//	   for(TableDto dto:list){
//		   System.out.println(dto.getTbname());
//	   }
	   model.addObject("list",list);
	   model.setViewName("/res/resTablelo");
	   return model;
   }
   //장바구니 추가
//   @RequestMapping("/basketadd.do")
//	   public ModelAndView basket(@RequestParam int fidx,HttpServletRequest session)throws Exception{
//		   ModelAndView model = new ModelAndView();
//		   String mid = (String)session.getAttribute("log_id");
//		   if(mid!=null){
//			   int midx=Integer.parseInt(mid);
//		   }
//		   return model;
//	   }
   //로그인 안하고 예약한다는 사람
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
   //장바구니에 추가하는 코드
   @RequestMapping(value="/nmbasketadd.do",method=RequestMethod.GET)
   @ResponseBody
   public ModelAndView addbasket(HttpSession session,@RequestParam(required=false)String se_nmname,@RequestParam int fidx)throws Exception{
	   ModelAndView model = new ModelAndView();
	   Map<String, Integer> map=new HashMap<String, Integer>();
	   if(se_nmname!=null){ 
		   Integer se_n=(Integer)session.getAttribute(se_nmname);
		   //System.out.println(se_n);
		   //System.out.println(fidx);
		   map.put("fidx",fidx);
		   map.put("nmidx",se_n);
		   if(nm_basket_service.insertCheck(map)==0){
			   nm_basket_service.insertnMemberBasket(map);
		   }else{
			   nm_basket_service.updatenMemberBasket(map);
		   }
		   
	   }else{
		   Integer midx=(Integer)session.getAttribute("log_id");
	   }
	   model.setViewName("/res/reservationList");
	   return model;
   }
 
	//장바구니 추가 하면 갯수 보여줄라고해본
	@RequestMapping(value="/basketcountcheck.do",method=RequestMethod.GET)
	   public ModelAndView basketcountcheck(HttpSession session,@RequestParam(required=false)String se_nmname){
		   ModelAndView model = new ModelAndView();
		   int basketcount=0;
		   if(se_nmname!=null){ 
			   Integer se_n=(Integer)session.getAttribute(se_nmname);
			   System.out.println(se_n);
			   basketcount=nm_basket_service.nmBasketCount(se_n);
		   }
		   model.addObject("basketcount",basketcount);
		   model.setViewName("/res/reservationList");
		   return model;
	   }
	@RequestMapping(value="/sitsession.do",method=RequestMethod.GET)
	public ModelAndView sitsession(@RequestParam String sit,HttpSession session){
		ModelAndView model = new ModelAndView();
		String n=(String)session.getAttribute(sit);
		int check=0;
		if(n==null){
			session.setAttribute(sit, 1);
			check=1;
		}
		model.addObject("check",check);
		model.setViewName("/res/reservationList");
		return model;
	}
}
