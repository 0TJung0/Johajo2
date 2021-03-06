<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css"/>
	<script type="text/javascript">
	$(function(){
		$("#tab>#e_li").addClass('on');
		
		$(".EventBtn1").click(function(){
			var mid=$("#midhidden").val();
			var ck=$("#h1_ck1").val();
			
			if(mid=="nologin"){
				if(confirm("로그인 하시겠습니까?")){
					location.href="loginform.do";								
				}
			}else{
				if(ck!=0){
					alert("이미 지급된 쿠폰입니다.");
				}else{
					$("#hi_e").submit();
					alert("쿠폰이 지급되었습니다.");			
				}
			}
		});
	});
	</script>
	</head>
	<body>
	
	<div id="notice_dispaly">
		<span class="logo mt100">EVENT</span> <span class="icon map5-1"></span>

		<div class="eventTab">
			<ul class="tab" id="tab">
				<li class="e_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
				<li class="e_li"><a href="EventEnd.do">마감된 이벤트</a></li>
			</ul>
		</div>
		
		
		<div class="event_content" id="event_content">
		<div class="event_close">
			<a href="noticeevent.do?pageNum=${pageNum}"><img src="./image/close.JPG" class="closebtn"></a>
		</div>
			
			<div class="centent1">
				<span class="subject">${dto.title}</span>
				<span>
					<fmt:formatDate var="start" value="${dto.startday}" pattern="yyyy.MM.dd"/>
					<fmt:formatDate var="end" value="${dto.endday}" pattern="yyyy.MM.dd"/>
					${start} ~ ${end}
				</span>
			</div>
			
			<div class="centent2">
			
			 	<span>${dto.con}</span><br>
				<span><img src="./eventImg${dto.main_img }"></span>
				<button type="button" class="EventBtn1">쿠폰 받기</button>
				<form  id="hi_e" action="insertCoupon.do" method="post" >
				<input type="hidden" value="${mid }" name="mnd" id="midhidden">
				<input type="hidden" value="${dto.title }" name="title" id="hi_Etitle">
				<input type="hidden" value="${dto.idx }" name="idx" id="hi_Eidx">
				<input type="hidden" value="${dto.discount_rate }" name="dis" id="hi_Edis">
				<input type="hidden" value="${dto.validity_month}" name="valid" id="hi_Eval">	
				</form>
				<input type="hidden" value="${ck1}" id="h1_ck1">
			</div>
		</div>
		
		
	</div>
</body>
</html>