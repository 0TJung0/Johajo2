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
	});

	</script>
	</head>
	<body>
		<ul class="tab" id="tab">
		    <li class="e_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
		    <li class="e_li" id="e_li"><a href="event_lotto.do">마감된 이벤트</a></li>	
		</ul>
		<div  class="tab_con" id="tab_con">
    		<div class="e_div" id="e_div3">
    		<c:forEach var="undto" items="${list }">
				<table border="1">
					<tr>
						<td align="center"><img id="event_img"
							src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg">
						</td>
						<td align="center">${undto.title}</td>
						<td align="center"><fmt:formatDate value="${undto.endday}"/></td>
					</tr>
				</table>
				</c:forEach>
    		</div>
   		</div>	
	</body>
</html>