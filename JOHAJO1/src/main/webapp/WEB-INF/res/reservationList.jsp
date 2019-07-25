
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   $(function(){
	    now=new Date();
		var mon=now.getMonth()
	  	addFoodIdx="";
	  	var check=$(".check").val();
	  	console.log(check);
	  	if(check==0){
	  		mCheck()
	  	}
	  	function mCheck() {

	  		 if (confirm("로그인을 하시면 포인트 및 쿠폰 혜택이 있습니다. 로그인 하시겠습니까?") == true){    //확인
				
	  		    location.href="loginform.do?path=reslist.do"; 

	  		 }else{
	  			location.href="nomember.do";  
	  		 }

	  	}
	  		
	  	function calender(num){
	  		
   		$.ajax({
   			
            type:'get',
            url:'reslist2.do',
            data:{"month":num},
            success:function(redata){
            	var str="";
       	   		var str2="";
            	var cday="";
            $(redata).find("calendar").each(function(){
            	var s=$(this);
            	week=s.find("week").text();
            	currentyear=s.find("currentyear").text();
            	currentyear1=parseInt(currentyear);
            	lastday=s.find("lastday").text();
            	lastmonth=s.find("lastmonth").text();
            	var lastmonth1=parseInt(lastmonth);
            	lastmday=s.find("lastmday").text();
            	var lastmday1=parseInt(lastmday);
            	currentMonth=s.find("currentMonth").text();
            	currentMonth1=parseInt(currentMonth);
            	lastday1=0;
            	week1=0;
            	lastday1=parseInt(lastday);
            	week1=parseInt(week)-1;
            	month=s.find("month").text();
            	month1=parseInt(month);
            	year=s.find("year").text();
            	year1=parseInt(year);
            	today=s.find("today").text();
            	var s1=month1+1;
               	var s2=month1-1;
            		str2+="<ul>";
            	if(currentyear1==year1){
            		if(currentMonth1<month1){
            		str2+="<li class='prev' month="+s2+">&#10094;</li>";
            		}
            	}else{
            		str2+="<li class='prev' month="+s2+">&#10094;</li>";
            	}
				str2+="<li>";
				
				
				if(month1<lastmonth){
					str2+="<li><a class='next' month="+s1+">&#10095;</a></li>";
					
				}
				str2+="<li><span style='font-size: 18px'>"+year+"년<br>"+month+"월</span></li>";
            	
            	for(i=0;i<week1;i++){
   					str+="<li></li>";
            	}
            	today1=parseInt(today);
            	for(j=1;j<=lastday1;j++){
            		
            		if(month1==currentMonth1){
                		if(today1>j){
                			//console.log("여기들어옴1")
                			str+="<li class='nday' month='"+month+"'>"+j+"</li>";
                		}else{
                			//console.log("여기들어옴2")
                			str+="<li class='day' month='"+month+"'>"+j+"</li>";
                		}
            		}else if(month1==lastmonth1){
            			if(today1<j){
            				str+="<li class='nday' month='"+month+"'>"+j+"</li>";
            			}else{
            				str+="<li class='day' month='"+month+"'>"+j+"</li>";
            			}
            		}else{
            			str+="<li class='day' month='"+month+"'>"+j+"</li>";
            		}
            	}
            	str+="</ul>";
        		str+="</li>";
        		//console.log(str2);
   				//console.log(str);
            });
            
            $("div.month").html(str2);
     		$("ul.days").html(str);
		},error : function( jqXHR, textStatus, errorThrown ) {

        	alert( jqXHR.status );

  
        }
   		});
	 }
		
		calender(mon);
	$(document).on('click','.next',function() { 
		var s=0;
		s=$(this).attr("month");
		s1=s-1;
		//console.log(s1);
		calender(s1);
	});
	$(document).on('click','.prev',function() { 
		var s=0;
		s=$(this).attr("month");
		s1=s-1;
		//console.log(s1);
		calender(s1);
	});
     
    $(document).on('click','span.selClass',function() { 
        var a=$(this).attr('tablen');
        var b=$(".hsit").val();
        var sit=b+a;
        $.ajax({
	        type:'get',
	        url:'sitsession.do',
	        data:{"sit":sit},
	        success:function(redata){
	        	if(redata==0){
	        		alert("다른자리를 선택해주세요");
	        		return false;
	        	}
	        }
        });
       // location.href="/resApp6.do?";
        $("sit").val(a);
        $(".cal").css("display","none");
        $(".store").css("display","none");
        $(".selsit").css("display","none");
        $(".selmenu").css("display","block");
        $("b.seleted").html(a);
        $(".hsit").val(sit);
        
    });
    //달력클릭시
     $(document).on('click','li.day',function() { 
  	   var m=$(this).attr("month");
  	   if(m<10){
  		 m="0"+m;  
  	   }
  	   var d=$(this).text();
  	   if(d<10){
  		   d="0"+d;
  	   }
  	   var s=m+"/"+d;
  	   //console.log(s);
  	   $(".hmonth").val(m);
  	   $(".hday").val(d);
  	   $(".seday").html(s);
  	   $(".cal").css("display","none");
       $(".store").css("display","block");
       $(".selsit").css("display","none");
       $(".selmenu").css("display","none");
  	   //console.log(m+"-"+d);
     });
    //시간 클릭시
     $("a.selTime").click(function(){
  	   var n=$(this).attr("store");
   	   var t=$(this).attr("time");
   	   $(".se_sitname").val(n+t);
   	   var s=n+" "+t;
   	 	$.ajax({
	        type:'get',
	        url:'reservation2.do',
	        data:{"store":n,"time":t},
	        success:function(redata){
	        	var str="";
	        	var cl="class='selClass'";
	        	var img="src='image/home.jpg'";
	        $(redata).find("data").each(function(){
	        	var s=$(this);
            	var top=s.find("toplo").text();
            	var left=s.find("leftlo").text();
            	var max=s.find("maxres").text();
            	console.log("top"+top+"left"+left);
	        	var tablename=s.find("tbname").text();
            	console.log("table_n"+tablename);
            	str+="<span class='selClass' tablen="+tablename+">";
            	str+="<img "+img+" "+cl+" style='position: relative;max-width: 20px;top:"+top+"px;left:"+left+"px;'>";
            	str+="</span>";	
	        });
	       
	        $("div.selsit").html(str);
	        },error : function( jqXHR, textStatus, errorThrown ) {
	        	alert( jqXHR.status );
	        }
	        });
   	   $(".selStore").html(s)
   	   $(".hstore").val(n);
   	   $(".htime").val(t);
   	   $(".cal").css("display","none");
       $(".store").css("display","none");
       $(".selsit").css("display","block");
       $(".selmenu").css("display","none");
   	   //console.log(n+t);
     });
    /*  $(document).on('click','Button.btnadd',function() { 
     	 f1=$(".hfname").val();
     	 p1=$(".hprice").val();
    	 if(f1!=""){
    		 f1+=",";
    	 }
    	 if(p1!=""){
    		 p1+=",";
    	 }
    	 f1+=$(this).attr("fname");
     	 p1+=$(this).attr("price");
     	 $(".hfname").val(f1);
    	 $(".hprice").val(p1);
     	 console.log(f1+"  "+p1);
     }); */
     /*$(document).on('click','Button.btndel',function() { 
    	 f1=$(".hfname").val();
     	 p1=$(".hprice").val();
     	 f1.split(",")
     });*/
    //메뉴 타이틀 선택
     $(".sidebar2 a").click(function(){
    	 
         var str="";
         
         var num=$(this).attr("name");
         //console.log("ajax"+num);
         $.ajax({
            type:'get',
            url:'resAppetizer.do',
            data:{"kind":num},
            success:function(redata){
            		str+="<table>";
            		
            		var i=0;
                  $(redata).find("data").each(function(){
                     var s=$(this);
                     idx=s.find("idx").text();
                     fname=s.find("fname").text();
                     imgname=s.find("imgname").text();
                    
                     calorie=s.find("calorie").text();
                     price=s.find("price").text();
                     if(i==0){
                    	 str+="<tr class='trfood'>";
                     }
                     str+="<td><img class='fimg' src='image/"+imgname+"' title="+fname+" fidx="+idx+"></td>";
                     
                     if(i<2){
                    	 i++;
                     }else if(i==0){
                    	 str+="</tr>";
                     }else{
                    	 i=0;
                     }
                     
                     
                  });
            	  str+="</table>";
            	  
                  $("span#datatest123").html(str);
                  
                  
            },error : function( jqXHR, textStatus, errorThrown ) {

            	alert( jqXHR.status );

            }
         });
         
     });
     $(document).on('click','img.fimg',function() { 
    	 var fidx=$(this).attr("fidx");
    	 var fname=$(".hfidx").val();
    	 var restime=$(".htime").val();
    	 var s="";
    	 if(fname==null){
    		 s=fidx;
    	 }else{
    		 s=fname+"/"+fidx;
    	 }
    	 $(".hfidx").val(s);
    	 //var hidx=$(".hidx").val();
    	 //var foodname=$(this).attr("title");
    	 var se_nmname=$(".se_nmname").val();
    	 $.ajax({
	            type:'get',
	            url:'nmbasketadd.do',
	            data:{"se_nmname":se_nmname,"fidx":fidx,"restime":restime},
	            success:function(redata){
	            }
    	 });
    	 //basketCount(se_nmname);
     });
     /* function basketCount(se_nmname){
    	 $.ajax({
	            type:'get',
	            url:'basketcountcheck.do',
	            data:{"se_nmname":se_nmname},
	            success:function(redata){
	            	$("resok").val("예약 "+redata);
	            }
 	 	});
     } */
     
     $(document).on('click','b.countdel',function() { 
    	var str="";
    	var count=$(this).next().text();
    	//console.log(count);
    	var count1=parseInt(count)-1;
    	//console.log(count1);
    	$(this).next().text(count1);
     });
     
   $(".resok").click(function(){
	   	  var day=$("b.seday").text();
		  var store=$("b.selStore").text();
		  var selsit=$("b.seleted").text();
		  var course=$("input.hcourse").val();
		  var fname=$("input.hfname").val();
		  console.log("course"+course);
		  if(day==""){
			  alert("날짜를 선택해주세요");
			  $(".cal").css("display","block");
		      $(".store").css("display","none");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(store==""){
			  alert("매장 및 시간을 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","block");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(selsit==""){
			  alert("자리를 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","none");
		      $(".selsit").css("display","block");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(fname==""&&course==""){
			  alert("메뉴를 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","none");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","block");
		      return false;
		  }
   });
   //코스 클릭시
   
   $(document).on('click','.sidebar3',function() { 
	   $.ajax({
	        url:'rescoursesel.do',
	        type : "GET",
	        data:{"nsid":sid},
	        cache : false,
	        success : function(res){
	        var html = "";
	        html +="<table><tr>";
	        for(var i=0; i<res.length; i++){
	       		html +="<th idx="+res[i].idx+">"+res[i].course_name+"</th>";
	        	
	        	}
	        }
       });
   }
   
});
</script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/reservation.css"/>" rel="stylesheet">
</head>
<body>

<div id="reserv_menu">
   <form action="resAppetizer5.do">
      <ul>
            <li><span onclick="selday()">날짜선택<b class="seday"></b></span>
               <ul>
                  <li>
                     <div class="cal">
								<ul>
									<li>
										<div class='month'>
											
										</div>

										<ul class='weekdays'>
											<li>일</li>
											<li>월</li>
											<li>화</li>
											<li>수</li>
											<li>목</li>
											<li>금</li>
											<li>토</li>
										</ul>
										<ul class='days'>
										
							</div>
						</li>
               </ul></li>

				<li><span onclick="store()">매장선택<b class="selStore"></b></span>
					<ul>
						<li>
							<div class="store">
								<table class='store1'>
									<tr>
										<td>번호</td>
										<td>지점명</td>
										<td>시간선택</td>
									</tr>
									<c:forEach var='i' items='${list }' varStatus='s'>
										<tr>
											<td>${s.count }</td>
											<td><a class="storeName">${i.name }</a></td>
											<td><a class='selTime' time='5시' store="${i.name}">5시</a>&nbsp;&nbsp;
												<a class='selTime' time='6시' store="${i.name}">6시</a>&nbsp;&nbsp;
												<a class='selTime' time='7시' store="${i.name}">7시</a>&nbsp;&nbsp; 
												<a class='selTime' time='8시' store="${i.name}">8시</a>
											</td>
											
										</tr>
									</c:forEach>
								</table>

							</div>
						</li>
					</ul></li>
				<li><span onclick="selectsit()">자리선택 <b class="seleted"></b></span>
               <div class="selsit" style="width: 200px;height: 200px;position: relative;">
                  <%-- <c:set var="it">A,B,C,D,E</c:set>
                  <c:forEach var="key" items="${it }">
                     <c:forEach var="i" begin="1" end="5">
                        <span class="selClass" sel="${key}${i}"> <img src="#">
                        </span>
                     </c:forEach>
                     <br>
                  </c:forEach> --%>
               </div></li>

            <li><span onclick="menu()">메뉴선택</span>
               <div class="selmenu" >
                  <div id="sidebar">
                     <!-- 사이드바 -->
                     <div id="sidebar1">
                     	<ul>
                     		<li class="sidebar3">course</li>
                        	<li class="sidebar4"><a>HotMenu</a></li>
                     	</ul>
                        <ul class="sidebar2">
                           <li><a name="1">Appetizer</a></li>
                           <li><a name="2">Soup</a></li>
                           <li><a name="3">MainDish</a></li>
                           <li><a name="4">SideDish</a></li>
                           <li><a name="5">Dessert</a></li>
                           <li><a name="6">Drink</a></li>
                        </ul>
                     </div>
                     <!-- /사이드바 -->

                     <!-- 본문 -->
                     <div id="page-content-wrapper">
                        <div class="container-fluid">
                          <span id="datatest123"></span>
                        </div>
                     </div>
                     
                  </div>
                 
               </div></li>
               
               
         </ul>
         <input type='hidden' class='hmonth' name='hmonth' value=''>
         <input type='hidden' class='hday' name='hday' value=''>
         <input type='hidden' class='hstore' name='hstore' value=''>
         <input type='hidden' class='htime' name='htime' value=''>
         <input type='hidden' class='hsit' name='hsit' value=''>
         <input type='hidden' class='hcourse' name='hcourse' value=''>
         <input type='hidden' class='hfidx' name='hfidx' value=''>
         <input type='hidden' class='se_nmname' name='se_nmname' value='${se_name}'>
         <input type='hidden' class='se_sitname' name='se_sitname' value=''>
         
         <input type="submit" class="resok" value="예약">
         <input type="button" value="취소">
      </form>
   </div>
  
   <input type="hidden" class="check" value="${check }">
</body>
<script type="text/javascript">
   function selday(){
      $(".cal").css("display","block");
      $(".store").css("display","none");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
   }
   function store(){
 
      $(".cal").css("display","none");
      $(".store").css("display","block");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
   }
   function selectsit(){
	   //console.log("1");
	  var day=$("b.seday").text()
	  var store=$("b.selStore").text()
	  if(day!=""&&store!=""){
      	$(".cal").css("display","none");
      	$(".store").css("display","none");
      	$(".selsit").css("display","block");
      	$(".selmenu").css("display","none");
	  }else if(day==""){
		  alert("날짜를 선택해주세요")
	  }else if(store==""){
		  alert("매장 및 시간을 선택해주세요")
	  }   
	 }
   function menu(){
      $(".cal").css("display","none");
      $(".store").css("display","none");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","block");
   }
   
</script>

</html>