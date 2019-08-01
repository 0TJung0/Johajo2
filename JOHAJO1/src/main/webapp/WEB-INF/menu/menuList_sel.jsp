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
	<style type="text/css">
		a{font-family: Nanum Gothic;}
		.mwbtn{
			background: white;
			color: gray;
			font-family: Nanum Gothic;
		}
	</style>
	<script type="text/javascript">
	$(function(){
			$(".menusel").mouseenter(function(){
				$(this).css({
					"transform":"scale(1.1)",
					"transition":"transform 1s",
					"opacity":"0.8"
					});
				$(this).find('.menumore').show();
			}).mouseleave(function(){
				$(this).css({
					"transform":"scale(1)",
					"transition":"transform 1s",
					"opacity":"1"
					});
				$(this).find('.menumore').hide();
			});
			$(".menubtn1").mouseenter(function(){
				$(this).css({
					"background-color" : "#fff",
					"color" : "#231f20"
				}); 
			}).mouseleave(function(){
				$(this).css({
					"background-color": "#231f20",
		    		"color": "#fff"
				});
			});
		}) 
	</script>
	</head>
	<body>
		<%
			String log_id   = (String)session.getAttribute("log_id");
		%>
		<br>
			<c:if test="${log_id =='manager'}">
	 			<div class="menu_add">
					<button type="button" onclick="location.href='menuinsert.do'" class="mwbtn">메뉴 추가</button>
				</div> 
	 		</c:if>
			
			<div class="menu_list" id="menu_list">
				<div class="menu_left" id="menu_left">
				
					<div class="menusel" id="menu_mmain">
						<c:forEach var="dto" items="${konly}">
							<c:set var="mkindnum" value="${dto.kind}"></c:set>
								<c:if test="${mkindnum==3}">
									<img src="./image/main.jpg" id="main_img" title="main">
									<div class="menumore">
										<a class="menubtn1" href='mmain.do' target="_self" id="btnmain"><b>상세보기</b></a>
									</div>
								</c:if>
						</c:forEach>
					</div>
					
					<div class="menu_left2" id="menu_left2">
					
						<div class="menusel" id="menu_soup">
							<c:forEach var="dto" items="${konly}">
								<c:set var="mkindnum" value="${dto.kind}"></c:set>
									<c:if test="${mkindnum==2}">
										<img src="./image/soup.jpg" id="soup_img" title="soup">
										<div class="menumore">
											<a class="menubtn1" href='soup.do' target="_self" id="btnsoup"><b>상세보기</b></a>
										</div>
									</c:if>
							</c:forEach>
						</div>
						<div class="menusel" id="menu_dess">
							<c:forEach var="dto" items="${konly}">
								<c:set var="mkindnum" value="${dto.kind}"></c:set>
									<c:if test="${mkindnum==5}">
										<img src="./image/des.jpg" id="dess_img" title="dessert">
										<div class="menumore">
											<a class="menubtn1" href='dessert.do' target="_self" id="btndes"><b>상세보기</b></a>
										</div>
									</c:if>
							</c:forEach>
						</div>
						
					</div>
				</div>
				
				<div class="menu_right" id="menu_right">
					<div class="menusel" id="menu_appe">
						<c:forEach var="dto" items="${konly}">
							<c:set var="mkindnum" value="${dto.kind}"></c:set>
								<c:if test="${mkindnum==1}">
									<img src="./image/appe.jpg"  id="appe_img" title="appetizer">
									<div class="menumore">
										<a class="menubtn1" href='appetizer.do' target="_self" id="btnappe"><b>상세보기</b></a>
									</div>
								</c:if>
						</c:forEach>
					</div>
						<div class="menu_right2" id="menu_right2">
						
							<div class="menusel" id="menu_side">
								<c:forEach var="dto" items="${konly}">
									<c:set var="mkindnum" value="${dto.kind}"></c:set>
										<c:if test="${mkindnum==4}">
											<img src="./image/side.jpg" id="side_img" title="side dish">
											<div class="menumore">
												<a class="menubtn1" href='side.do' target="_self" id="btnside"><b>상세보기</b></a>
											</div>
										</c:if>
								</c:forEach>
							</div>
							<div class="menusel" id="menu_drink">
								<c:forEach var="dto" items="${konly}">
									<c:set var="mkindnum" value="${dto.kind}"></c:set>
										<c:if test="${mkindnum==6}">
											<img src="./image/drink.jpg" id="drink_img" title="drink">
											<div class="menumore">
												<a class="menubtn1" href='drink.do' target="_self" id="btndrink"><b>상세보기</b></a>
											</div>
										</c:if>
								</c:forEach>
							</div>
							
						</div>
				</div>
			</div>
						
			
			
	</body>
</html>