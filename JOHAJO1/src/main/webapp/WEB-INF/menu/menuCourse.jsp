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
<script type="text/javascript">
	$(function(){
		$(".course_list li").click(function(){
			var idx = $(this).attr("idx");
			location.href="menucourse.do?idx="+idx;
			$(this).addClass('on');
		});
	});
</script>
<style type="text/css">
	.course{
		border: 1px solid blue;
		margin-left: 150px;
		margin-right: 150px;
		background-color: #F5F5F5;
		position: relative;
		height: 700px;
	}

	.course_list li.on {
		background: #ff6600;
		color: #fff;
	}

	.course_menu{
		border: 1px solid green;
		position: relative;
		width: 80%;
		float: left;
		left: 10%;
		top:10%;
	}
	
	.course_select{
		border: 1px solid red;
		width: 7%;
		height: 120px;    
		position: relative;
		float: left;
		top:10%;
	}
	.course_select .course_list{
		/* display: none; */
		padding: 0;
		
	}
	.course_select .course_list li{
		list-style:none;
		height: 40px; line-height: 40px;
		color: #666; text-indent: 22px;
		width : 100%;
		background: rgba(35,35,35,0.8);
		position: relative;
	}
	
	.course_select .course_list li:hover{
		background: #ff6600;
		color: #fff;
	}
</style>
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
