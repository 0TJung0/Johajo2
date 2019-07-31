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
	$(".sidebtn1").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		window.open('http://localhost:9000/SpringTilesMybatis/menuselpop.do?idx='+idx, 'menulistPop', 'width=500, height=650, left=700, top=50,resizable=no,', '_blank');
	});
	
	$(".sidelist_list").mouseenter(function(){
		$(this).css("opacity","0.8");
		$(this).find('.sidemore').show();
	}).mouseleave(function(){
		$(this).css("opacity","1");
		$(this).find('.sidemore').hide();
	});
	$(".sidebtn1").mouseenter(function(){
		$(this).css({
			"background-color" : "#fff",
			"color" : "#231f20",
    		"text-decoration":"none"
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
<%
	String log_id   = (String)session.getAttribute("log_id");
%>
	<div class="side_list">
		<div class="sidelist1" id="sidelist1" > 
			<b>SIDE</b><br>
			<img src="image/side.png">
		</div>
		<div class="sidelist2">
			<c:forEach var="dto" items="${list}" >	
				<div class="sidelist_list" id="sidelist${dto.idx}">
					<div class="sidemore">
						<a class="sidebtn1" idx="${dto.idx}"><b>상세보기</b></a>
					</div>
					<ul>
						<li><img class="sidelist_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${dto.imgname}" idx="${dto.idx}" ></li>
						
						<li class="side_fname"><b>${dto.fname}</b></li>
						
						<c:if test="${log_id =='manager'}">
				 			<li><button type="button" onclick="location.href='menuupdateform.do?idx=${dto.idx}'">수정</button></li>
							<li><button type="button" onclick="location.href='menudelete.do?idx=${dto.idx}&kind=${dto.kind}'">삭제</button></li>
				 		</c:if>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>