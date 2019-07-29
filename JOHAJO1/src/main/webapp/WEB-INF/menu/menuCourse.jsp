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
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/>

<script type="text/javascript">
	$(function(){
		$(".course_list li").click(function(){
			var idx = $(this).attr("idx");
			location.href="menucourse.do?idx="+idx;
			$(this).addClass('on');
		});
	});
</script>
</head>
<body>
	<div class="course_ma">
		<button type="button" onclick="location.href='courselist.do'">코스 관리</button>
	</div>
	<div class="course">
		<div class="course_menu">
		<c:if test="${dto.show eq 1}">
			${dto.appe}<br>
			${dto.soup}<br>
			${dto.main}<br>
			${dto.side}<br>
			${dto.des}<br>
			${dto.drink}<br>
			${dto.tot_pri}<br>
		</c:if>
		</div>
		<div class="course_select">
				<ul class="course_list">
					<li class="course1" idx="12">A</li>
					<li class="course2" idx="5">B</li>
					<li class="course3" idx="6">C</li>
				</ul>	
		</div>
		<br>
	</div>
</body>
</html>
