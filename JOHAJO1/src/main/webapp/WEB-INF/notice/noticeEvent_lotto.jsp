<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		    <li class="e_li" id="e_li"><a href="event_win.do">마감된 이벤트</a></li>	<!-- noticeevent.do로 가면 진행중인이벤트가 선택된 페이지로 가게됨 -->
		</ul>
		<div class="tab_con" id="tab_con">
   			<div>

   			</div>
		</div>
	</body>
</html>