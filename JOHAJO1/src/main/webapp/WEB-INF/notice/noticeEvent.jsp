<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css"/>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		num=3;
		var total=$(".EventTotal").val();
		var lc=[];
		for(i=0;i<total;i++){
			lc[i]=$(".ElistCount").eq(i).val();
				
			if(lc[i]>num){
				$("div.e_div").eq(i).hide();
			}
		}
	});
	function listmore()
	{
		var total=$(".EventTotal").val();
		var lc=[];
		num=num+3;
		if(num>total){
			num=total;	
			$(".EventMoreBtn1").hide();
		}
		for(i=0;i<total;i++){
			lc[i]=$(".ElistCount").eq(i).val();
			console.log(lc[i]);
			
			if(lc[i]<=num){
				$("div.e_div").eq(i).show();
			}
			
		}
	}

</script>
</head>

<body>

	<div id="notice_dispaly">
		<span class="logo mt100">EVENT</span> <span class="icon map5-1"></span>
		<div class="eventTab">
			<ul class="tab" id="tab">
				<li class="e_li">진행중인 이벤트</li>

				<li class="e_li" onclick="location.href='EventEnd.do'">마감된 이벤트</li>
			</ul>
		</div>
		<div class="tab_con" id="tab_con">
			<c:forEach var="dto" items="${alist}" varStatus="index">
		   		<div class="e_div">
		    		<div class="e_data">
		    			<input type="hidden" value="${index.count }" class="ElistCount">
			   			<ul>
			    			<li><img id="event_img" src="./eventImg${dto.title_img }" onclick="location.href='noticeEvent_content.do?idx=${dto.idx}&pageNum=${currentPage}'"></li>
			    			<li>
			    				<div class="e_title">
			    					<span>${dto.title}</span>
			    					<span class="date">${dto.startday } ~ ${dto.endday }</span>
			    					<span class="click"><a href="noticeEvent_content.do?idx=${dto.idx}&pageNum=1">자세히보기</a></span>
			    				</div>
			    			</li>
			    		</ul>
		    		</div>
				</div>
			</c:forEach>
		</div>
			<div class="EventMoreBtn1">
				<input type="hidden" value="${showCount }" class="EventTotal">
				<a onclick="listmore()">LOAD MORE</a>
			</div>
    </div>
</body>
</html>