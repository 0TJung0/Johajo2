
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var month=$(".hmonth").val();
	var day=$(".hday").val();
	var store=$(".hstore").val();
	var time=$(".htime").val();
	var sit=$(".hsit").val();
	var course=$(".hcourse").val();
	var sid=$(".se_name").val();
	console.log(sid);
	var check=$(".check").val();
	
	
	var str1="";
	str1+="<table><caption>예약</caption>";
	str1+="<tr><th>예약일</th><th>"+month+"월"+day+"일</th></tr>";
	str1+="<tr><th>지점명</th><th>"+store+"</th></tr>";
	str1+="<tr><th>예약시간</th><th>"+time+"</th></tr>";
	str1+="<tr><th>예약좌석</th><th>"+sit+"</th></tr>";
	str1+="</table>";
	str1+="<div class='out3'></div>"
	str1+="총 가격<b class='price'></b><br>"
	if(check==1){
		str1+="<b class='usecoupon'>사용쿠폰<b><button type='button' class='couponbtn' onclick='coupongetlist()'>쿠폰 사용하기</button><div class='coupon'></div><br>"
		str1+="포인트 사용 <input type='text' size=5 class='point'>사용가능 포인트 : <b class='havapoint'>${point}<b><Button type='button' class='usepoint'>포인트사용</button><br>";
		str1+="결제금액<b class='resprice'></b>"
		str1+="<br><button type='button' class='mresfinbtn'>예약하기</button>"
	}else{
		str1+="핸드폰 번호  010<input type='text' class='nmhp' placeholder='-없이 입력해주세요'><br>";
		str1+="비밀번호 <input type='password' class='nmpass' placeholder='비밀번호를 4자이상 입력해주세요'><br>";
		str1+="결제금액<b class='resprice'></b>"
		str1+="<br><button type='button' class='nmresfinbtn'>예약하기</button>"
	}
	
	
	$(document).on('click','button.mresfinbtn',function() { 
		  
		  var usecouponidx=$(".couponeidx").val();
		  var usepoint=$(".usepoint").val();
		  var totalprice=$("b.resprice").text();
		  
		  $.ajax({
	           url : "resfinsh.do",
	           type : "GET",
	           data:{"month":month,"day":day,"store":store,"totalprice":totalprice,
	        	   "time":time,"sit":sit,"sid":sid,"usepoint":usepoint,"usecouponidx":usecouponidx},
	           cache : false,
	           success : function(res){
	             var html = "";
	              html+="예약이 완료되었습니다.";
	              html+="<table><tr>";
	              html+="<td>예약번호 </td>";
	              html+="<td>예약일자 </td>";
	              html+="<td>예약시간 </td>";
	              html+="<td>예약테이블 </td>";
	              html+="</tr><tr>";
	              html+="<td>"+res.idx+"</td>";
	              html+="<td>"+res.resdate+"</td>";
	              html+="<td>"+res.restime+"</td>";
	              html+="<td>"+res.restable+"</td>";
	              html+="</tr></table>";
	              $("div.finout").html(html);  
	            },error : function( jqXHR, textStatus, errorThrown ) {
	            	alert( jqXHR.status );
		        }
	                   
	      });
	  });
	$(document).on('click','button.nmresfinbtn',function() { 
		  
		  var usecouponidx=$(".couponeidx").val();
		  var usepoint=$(".usepoint").val();
		  var hp=$(".nmhp").val();
		  var pass=$(".nmpass").val();
		  var totalprice=$("b.resprice").text();
		  if(pass.length<4){
			  alert("비밀번호를 4글자이상 해주세요");
			  return false;
		  }else if(hp.length!=8){
			  alert("전화번호를 정확히 해주세요");
			  return false;
		  }
		  $.ajax({
	           url : "resfinsh.do",
	           type : "GET",
	           data:{"pass":pass,"hp":hp,"month":month,"day":day,"store":store,"totalprice":totalprice,
	        	   "time":time,"sit":sit,"sid":sid,"usepoint":usepoint,"usecouponidx":usecouponidx},
	           cache : false,
	           success : function(res){
	             var html = "";
	              html+="예약이 완료되었습니다.";
	              html+="<table><tr>";
	              html+="<td>예약번호 </td>";
	              html+="<td>예약일자 </td>";
	              html+="<td>예약시간 </td>";
	              html+="<td>예약테이블 </td>";
	              html+="</tr><tr>";
	              html+="<td>"+res.idx+"</td>";
	              html+="<td>"+res.resdate+"</td>";
	              html+="<td>"+res.restime+"</td>";
	              html+="<td>"+res.restable+"</td>";
	              html+="</tr></table>";
	              $("div.finout").html(html);  
	            },error : function( jqXHR, textStatus, errorThrown ) {
	            	alert( jqXHR.status );
		        }
	                   
	      });
	  });
	$(".out1").html(str1);
	list();
	$(document).on('keyup','.nmhp',function() { 
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$(document).on('keyup','.point',function() { 
		var price=$("b.resprice").text();
		var thisprice=$(this).val();
		var havapoint=$("b.havapoint").text();
		//console.log("현재 포인트"+havapoint);
		//console.log("사용 포인트"+thisprice);
		//console.log("음식가격)"+price);
		if(havapoint<thisprice){
			alert("포인트가 부족합니다");
			$(this).val(0);
		}else if(thisprice>price){
			alert("주문금액보다 높게 사용하실수 없습니다");
			$(this).val(0);
		}
	});
	$(document).on('click','Button.usepoint',function() { 
		var price=$("b.resprice").text();
		var use=$(".point").val();
		console.log(use);
		var p=price-use;
		//var str="<b>총 결제금액은"+p+"원 입니다</b>";
		$("b.resprice").html(p);
		$(".usepoint").val(p);
	});
	

});
function list(){
	var store=$(".hstore").val();
	var time=$(".htime").val();
	var sit=$(".hsit").val();
	var sid=$(".se_name").val();
	console.log("sid"+sid);
	console.log(sit);
	console.log(time);
	console.log(store);
	
	  $.ajax({
           url : "reservationlist.do",
           type : "GET",
           async:false,
           data:{"se_nmname":sid,"sit":sit,"time":time,"store":store},
           cache : false,
           success : function(res){
             var html = "";
             var price=0;
               for(var i=0; i<res.length; i++){
            	   html += res[i].fname+"<b> 수량:"+res[i].count+"</b> 가격 : "+(res[i].price*res[i].count)+"<br>";
               	   price=price+(res[i].price*res[i].count);
               }
              // html+="</li>"
               $("div.out3").html(html); 
               $("b.price").html(price);
               $("b.resprice").html(price);
           }
       });
}

function coupongetlist(){
	$.ajax({
           url : "coupongetlistcheck.do",
           type : "GET",
           success : function(res){
        	   html="";
        	   if(res>1){
        		   html+="<select class='couponuse'>"
        		   $.ajax({
        	           url : "coupongetlist.do",
        	           type : "GET",
        	           async:false,
        	           cache : false,
        	           success : function(res){
        	        	   for(var i=0; i<res.length; i++){
        	        	   html+="<option value='"+res[i].idx+"'";
        	        	   html+=">"+res[i].coupon_name;
        	        	   html+="</option>";
        	           }
        	           }
        			});
        		    	html+="</select>"
        		    	html+="<button type='button' onclick='couponuse()'>적용하기</button>";
        		    	$("div.coupon").html(html);
        	   }else{
        		   html+="<b>사용 가능한 쿠폰이 없습니다</b>";
        		   $("div.coupon").html(html);
        	   }
           }
	});
	
}
function couponuse(){
	var couponeidx=$("select.couponuse").val();
	var sprice=$("b.price").text();
	var price=parseInt(sprice);
	 $(".couponeidx").val(couponeidx);
	var s=0;
	$.ajax({
        url : "coupongetdiscount.do",
        type : "GET",
        data:{"couponeidx":couponeidx},
        async:false,
        cache : false,
        success : function(res){
        	var v=0.00;
        	v=res/100;
        	s=0;
        	s=price-(price*v);
        	console.log(res);
        	console.log(v);
        	console.log(s);
        	$("b.resprice").html(s); 
        }
       
	});
}
</script>
</head>
<body>
<h1>예약</h1>
<input type="hidden" value="${hmonth }" class="hmonth">
<input type="hidden" value="${hday }" class="hday">
<input type="hidden" value="${hstore }" class="hstore">
<input type="hidden" value="${htime }" class="htime">
<input type="hidden" value="${hsit }" class="hsit">
<input type="hidden" value="${hcourse }" class="hcourse">
<input type="hidden" value="${se_name }" class="se_name">
<input type="hidden" value="${check }" class="check">
<input type="hidden" value="" class="usepoint">
<input type="hidden" value="" class="couponeidx">
<div class="finout">
	<div class="out1"></div>
	<div class="out2"></div>
</div>
</body>
<script type="text/javascript">
	
</script>

</html>