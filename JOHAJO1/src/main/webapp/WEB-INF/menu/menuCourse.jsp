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
<link href='http://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'> 
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/>
<script type="text/javascript">
	$(function(){
			$(".cmsg").show();
			
			$("#course_titleimg1").mouseenter(function(){
				$(this).attr("src","image/coursesel_red1.png");
			}).mouseleave(function(){
				$(this).attr("src","image/coursesel1.png");
			});
			$("#course_titleimg2").mouseenter(function(){
				$(this).attr("src","image/coursesel_red2.png");
			}).mouseleave(function(){
				$(this).attr("src","image/coursesel2.png");
			});
			$("#course_titleimg3").mouseenter(function(){
				$(this).attr("src","image/coursesel_red3.png");
			}).mouseleave(function(){
				$(this).attr("src","image/coursesel3.png");
			});
			
		$(".course_titleimg").click(function(){
			$(".cmsg").hide();
			var idx = $(this).attr("idx");
			location.href="menucourse.do?idx="+idx;
		});
		
		$(".course_menu").mouseenter(function(){
			$(this).find('.courseres').show();
		}).mouseleave(function(){
			$(this).find('.courseres').hide();
		});
		
		$(".coursebtn1").mouseenter(function(){
			$(this).css({
				"background-color" : "lightgray",
				"color" : "#231f20",
	    		"text-decoration":"none", 
	    		"border" : "3px solid #231f20"
			}); 
		}).mouseleave(function(){
			$(this).css({
				"background-color": "#414141",
	    		"color": "#fff", 
	    		"text-decoration":"none"
			});
		});
	});
</script>
<style type="text/css">
	a,b{font-family: Nanum Gothic;}
</style>
</head>
<body>
	<div class="course_ma">
		<button type="button" onclick="location.href='courselist.do'">코스 관리</button>
	</div>
	<div class="course">
		<div class="course_title"> 
			<b>COURSE</b><br>
			<img class="course_titleimg" id="course_titleimg1" src="image/coursesel1.png" idx="12">
			<img class="course_titleimg" id="course_titleimg2" src="image/coursesel2.png" idx="5">
			<img class="course_titleimg" id="course_titleimg3"src="image/coursesel3.png" idx="6">
		</div>
		<div class="course_menu">
			<p>
		<c:if test="${dto.show eq 1}">
			<b>${dto.appe}</b><br>
			<b>${dto.soup}</b><br>
			<b>${dto.main}</b><br>
			<b>${dto.side}</b><br>
			<b>${dto.des}</b><br>
			<b>${dto.drink}</b><br>
			<b>${dto.tot_pri}원</b><br>
		</c:if>
			<div class="courseres">
				<a class="coursebtn1" id="cmenu" idx="${dto.idx}" onClick="window.open('courselook.do','_blank','resizable=no,width=700,height=500,left=500,top=100')"><b>상세보기</b></a>
				<a class="coursebtn1" id="courseres" idx="${dto.idx}" onClick="window.open('courselook.do','_blank','resizable=no,width=700,height=500,left=500,top=100')"><b>예약하기</b></a>
			</div>
		</div>
		<br>
	</div>
</body>
</html>