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
		$("#e_li").click(function(){
			window.history.back();
		});
	});

	</script>
	</head>
	<body>
		<ul class="tab" id="tab">
		    <li class="e_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
		    <li class="e_li" id="e_li"><a href="event_win.do">당첨자 발표</a></li>	<!-- noticeevent.do로 가면 진행중인이벤트가 선택된 페이지로 가게됨 -->
		</ul>
		<div class="tab_con" id="tab_con">
   			<div>
   				<table border="1">
	   				<tr>
	   					<th>당첨자 발표</th>
	   					<th>STEAK ACADEMY</th>
	   					<th>2019.06.29 ~ 2019.07.04</th>
	   				</tr>
	   				<tr>
	   					<td colspan="3">1</td>
	   				</tr>
   				</table>
   			</div>
		</div>
	</body>
</html>