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
			
		});
		
		$(".course_list li").click(function(){
			var idx = $(this).attr("idx");
			location.href="menucourse.do?idx="+idx;
			$(this).addClass('on');
		});
	});
</script>
<style type="text/css">
	.course_list li.on {
		background: #ff6600;
		color: #fff;
	}

	.course_menu{
		border: 1px solid gray;
		
	}
	
	.course_select{
		border: 1px solid gray;
	}
	.course_select .course_list{
		/* display: none; */
		}
	.course_select .course_list li{
		list-style:none;
		height: 40px; line-height: 40px;
		color: #666; text-indent: 20px;
		width : 50px;
		background: rgba(35,35,35,0.8);
	}
	
	.course_select .course_list li:hover{
		background: #ff6600;
		color: #fff;
	}
</style>
</head>
<body>
	<div class="course_add">
		<button type="button" onclick="location.href='courseinsert.do'">코스 추가</button>
		<button type="button" onclick="location.href='courseupdateform.do?idx=${dto.idx}'">코스 수정</button>
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
					<li class="course1" idx="4">A</li>
					<li class="course2" idx="5">B</li>
					<li class="course3" idx="6">C</li>
				</ul>	
		</div>
		<br>
		
			
	</div>
</body>
</html>
