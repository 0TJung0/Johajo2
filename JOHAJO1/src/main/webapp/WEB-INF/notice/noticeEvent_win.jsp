<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	});

	</script>
	</head>
	<body>
		<ul class="tab" id="tab">
		    <li class="e_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
		    <li class="e_li" id="e_li"><a href="event_lotto.do">당첨자 발표</a></li>	
		</ul>
		<div  class="tab_con" id="tab_con">
    		<div class="e_div" id="e_div3">
    			<table border="1">
    				<tr>
    					<th>번호</th>
    					<th>이벤트 명</th>
    					<th>이벤트 기간</th>
    					<th>당첨자 발표일</th>
    				</tr>
    				<tr>
    					<td>1</td>
    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
    					<td>2019.06.29 ~ 2019.07.04</td>
    					<td>2019.07.08</td>
    				</tr>
    			</table>
    		</div>
   		</div>	
	</body>
</html>