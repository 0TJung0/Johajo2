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
	});
	</script>
	</head>
	<body>
		<ul class="ectab" id="ectab">
		    <li class="ece_li" id="ece_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
		    <li class="ece_li"><a href="event_win.do">당첨자 발표</a></li>	
		</ul>
		<div class="ectab_con" id="ectab_con">
		   <table style="width: 900px;">
			<tr>
				<th>
					&nbsp;${dto.title}
					<span style="margin-left: 500px; color: lightgray;">
						<fmt:formatDate value="${dto.writedate}" pattern="yyyy-MM-dd"/>
					</span>
				</th>
			</tr>
			<tr height="400">
				<td valign="top">
					<span>${dto.content}</span>
				</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="location.href='noticeevent.do?pageNum=${pageNum}'">목록</button>
		</div>
		</div>	
	</body>
</html>