
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
     $(document).on('click','a.selTime',function(){
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
     $(document).on('click','.sidebar2 li a',function(){
    	 
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
     //메뉴선택시 디비에 추가
     $(document).on('click','img.fimg',function() { 
    	 var fidx=$(this).attr("fidx");
    	 var fname=$(".hfidx").val();
    	 var restime=$(".htime").val();
    	 var restable=$(".hsit").val();
    	 var resstore=$(".hstore").val();
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
	            async:false,
	            data:{"se_nmname":se_nmname,"fidx":fidx,"restime":restime,"restable":restable,"resstore":resstore},
	            success:function(redata){
	            }
    	 });
    	 //basketCount(se_nmname);
    	 basketreslist();
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
     $(document).on('click','.resok',function() { 
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
   //코스 클릭시 코스 종류나오게
   
   $(document).on('click','.sidebar3',function() {
	   $.ajax({
	        url:'rescoursesellist.do',
	        cache : false,
	        success : function(res){
	        var html = "";
	        html +="<table><tr>";
	        for(var i=0; i<res.length; i++){
	       		html +="<th class='coursesel' idx="+res[i].idx+">"+res[i].course_name+"</th>";
	        	
	        	}
	        html +="</tr></table>";
	        $("span#datatest123").html(html);
	        }
       });
	   
	});
   //출력된 코스 클릭시
   $(document).on('click','.coursesel',function() {
	   var idx=$(this).attr("idx");
  	   var restime=$(".htime").val();
  	   var restable=$(".hsit").val();
  	   var se_nmname=$(".se_nmname").val();
  	   var resstore=$(".hstore").val();
	   $.ajax({
	        url:'rescoursesel.do',
	        data:{"idx":idx,"se_nmname":se_nmname,"restime":restime,"restable":restable,"resstore":hstore},
	        cache : false,
	        success : function(res){
	        	
	        }
	   });
	   basketreslist();
   });
   $(document).on('click','.sidebar4',function() {
	   $.ajax({
	        url:'resbestsel.do',
	        cache : false,
	        success : function(res){
	        var html = "";
	        html +="<table><tr>";
	        for(var i=0; i<res.length; i++){
	       		html +="<th idx="+res[i].idx+">"+res[i].course_name+"</th>";
	        	}
	        html +="</tr></table>";
	        $("span#datatest123").html(html);
	        }
       });
	});
   //baskekdb에 있는 데이터 출력
   function basketreslist(){
	    var restime=$(".htime").val();
 	  	var restable=$(".hsit").val();
 	 	var se_nmname=$(".se_nmname").val();
 	 	var resstore=$(".hstore").val();
	   $.ajax({
	        url:'ressellist.do',
	        cache : false,
	        async:false,
            data:{"se_nmname":se_nmname,"restime":restime,"restable":restable,"resstore":resstore},
	        success : function(res){
	        	html="";
	        	html+="<div>";
	        	 for(var i=0; i<res.length; i++){
	        		 //html+="<img class='basketlist' src="+res[i].imgname+" title="+res[i].fname+">";
	        	 	 html+="<b>"+res[i].fname+"</b>";
	        	 	 html+="<input onclick='countdelfunc(\"" + res[i].fname + "\")' name='countbtn' type='button' value='-'>";
	        	 	 //html+="<input onclick='countdelfunc("'"+res[i].fname+"'")' name='countbtn' type='button' value='-'>";
	        	 	 html+="<b name='countb'>"+res[i].count+"</b>";
	        	 	 html+="<input onclick='countaddfunc(\"" + res[i].fname + "\")' name='countbtn' type='button' value='+'>";
	        	 	 //html+="<input onclick='countaddfunc("+res[i].fname+")' name='countbtn' type='button' value='+'>";
	        	 	 html+="<input type='button' fname="+res[i].fname+" value='삭제'><br>";
	        	 }
	        	 html+="</div>"
	        	 $("div.resselect").html(html);
	        },error : function( jqXHR, textStatus, errorThrown ) {

            	alert( jqXHR.status );
	        }
	   });
   }
   //count 1마이너스 0이면 삭제
   function countdelfunc(fname){
	   var restime=$(".htime").val();
	  	var restable=$(".hsit").val();
	 	var se_nmname=$(".se_nmname").val();
	 	var resstore=$(".hstore").val();
	 	//var fname=$(this).attr("fname");
	 	console.log(fname);
	   $.ajax({
	   url:'countdel.do',
	   async:false,
       cache : false,
       		data:{"fname":fname,"se_nmname":se_nmname,"restime":restime,"restable":restable,"resstore":resstore},
        		success : function(res){
        			
        		},error : function( jqXHR, textStatus, errorThrown ) {
					alert( jqXHR.status );
		        }
		   });
	   basketreslist();
	 }
   //count 1추가
   function countaddfunc(fname){
	    var restime=$(".htime").val();
	  	var restable=$(".hsit").val();
	 	var se_nmname=$(".se_nmname").val();
	 	var resstore=$(".hstore").val();
	 	//var fname=$(this).attr("fname");
	 	console.log(fname);
	   $.ajax({
	   url:'countadd.do',
	   async:false,
	   cache : false,
  		data:{"fname":fname,"se_nmname":se_nmname,"restime":restime,"restable":restable,"resstore":resstore},
   		success : function(res){
   		},error : function( jqXHR, textStatus, errorThrown ) {
			alert( jqXHR.status );
        }
	   });
	   basketreslist();
   }
   
   function selday(){
	      $(".cal").css("display","block");
      $(".store").css("display","none");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
      //$(".resselect").css("display","none");
   }
   function store(){
 
      $(".cal").css("display","none");
      $(".store").css("display","block");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
      //$(".resselect").css("display","none");
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
      	//$(".resselect").css("display","none");
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
      //$(".resselect").css("display","block");
   }
