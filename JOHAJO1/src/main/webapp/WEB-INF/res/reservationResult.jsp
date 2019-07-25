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
	var sid=$(".session_id").val();
	var check=$(".check").val();
	
	
	var str1="";
	str1+="<table><caption>예약</caption>";
	str1+="<tr><th>예약일</th><th>"+month+"월"+day+"일</th></tr>";
	str1+="<tr><th>지점명</th><th>"+store+"</th></tr>";
	str1+="<tr><th>예약시간</th><th>"+time+"</th></tr>";
	str1+="<tr><th>예약좌석</th><th>"+sit+"</th></tr>";
	str1+="</table>";
	str1+="<div class='out3'></div>"
	if(sid==null){
		str1+="포인트 사용 <input type='text' size=5 class='point'><b>사용가능 포인트 : ${point}<b><Button type='button' class='usepoint'>포인트사용</button>";
	}else{
		str1+="이름<input type='text' class='nmname'><br>";
		str1+="핸드폰 번호 <input type='text' class='nmhp' placeholder='-없이 입력해주세요'><br>";
	}
	str1+="<button type='button' class='resfinbtn'>예약하기</button>"
	$(document).on('keyup','input.nmhp',function() { 
		var s=$(this).val();
		var sp=s.split();
		var str;
		var len=split.length();
		if(isNaN(parseInt(sp[len]))){
			for(i=0;i<len-1;i++){
				str+=sp[i];	
				console.log(str);
			}
		}
		$(this).val(str);
	});
	$(document).on('click','button.resfinbtn',function() { 
		
	});
	function nmlist(sid){
		  $.ajax({
	           url : "reservationfinnm.do",
	           type : "GET",
	           data:{"nsid":sid},
	           cache : false,
	           success : function(res){
	             var html = "";
	               for(var i=0; i<res.length; i++){
	                   html += res[i].fname+": price="+res[i].price+"갯수"+res[i].count+"<br>";
	               }
	               $("div.out3").html(html);             
	           }
	       });
	}
	function mlist(){
		  $.ajax({
	           url : "reservationfinm.do",
	           type : "GET",
	           cache : false,
	           success : function(res){
	             var html = "";
	               for(var i=0; i<res.length; i++){
	                   html += res[i].fname+": price="+res[i].price+"갯수"+res[i].count+"<br>";
	               }
	               $(".out3").html(html);             
	           }
	       });
	}
	$(".out1").html(str1);
	console.log("check"+check);
	if(check==1){
		mlist();
	}else{
		nmlist(sid);
	}
	
	$(document).on('click','Button.usepoint',function() { 
		var use=$(".point").val();
		var p=price-use;
		var str="<b>총 결제금액은"+p+"원 입니다</b>";
		$("div.out2").html(str);
	});
	/* var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload){
        	
        	return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
        }
    }); */

});
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
<input type="hidden" value="${session_id }" class="session_id">
<input type="hidden" value="${check }" class="check">

<div class="out1"></div>
<div class="out2"></div>

</body>
</html>