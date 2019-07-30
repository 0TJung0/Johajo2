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
			$(".menusel").mouseover(function(){
				$(this).find('.menumore').show();
				$(this).fadeTo('fast');
			}).mouseout(function(){
				$(this).find('.menumore').hide();
				$(this).fadeTo('fast',1);
			});
		})
	</script>
	</head>
	<body>
			<div class="menu_list" id="menu_list">
				<div class="menu_left" id="menu_left">
				
					<div class="menusel" id="menu_mmain">
						<c:forEach var="dto" items="${konly}">
							<c:set var="mkindnum" value="${dto.kind}"></c:set>
								<c:if test="${mkindnum==3}">
									<img src="./image/main.jpg" id="main_img" title="main">
									<div class="menumore">
										<input type="button" value="상세보기" onclick="location.href='mmain.do'" class="menubtn1">
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
											<input type="button" value="상세보기" onclick="location.href='soup.do'" class="menubtn1">
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
											<input type="button" value="상세보기" onclick="location.href='dessert.do'" class="menubtn1">
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
										<input type="button" value="상세보기" onclick="location.href='appetizer.do'" class="menubtn1">
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
												<input type="button" value="상세보기" onclick="location.href='side.do'" class="menubtn1">
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
												<input type="button" value="상세보기" onclick="location.href='drink.do'" class="menubtn1">
											</div>
										</c:if>
								</c:forEach>
							</div>
							
						</div>
				</div>
			</div>
			<div class="menu_add">
				<button type="button" onclick="location.href='menuinsert.do'">메뉴 추가</button>
			</div>
	</body>
</html>