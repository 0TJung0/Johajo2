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
				$(this).fadeTo('slow',0.5);
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
						<img src="./image/main.jpg" id="main_img" title="main">
						<div class="menumore">
							<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=3'" class="menubtn1">
						</div>
						<a href="menusel.do?kind=3"></a>
					</div>
					<div class="menu_left2" id="menu_left2">
					
						<div class="menusel" id="menu_soup">
							<img src="./image/soup.jpg" id="soup_img" title="soup">
							<div class="menumore">
								<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=2'" class="menubtn">
							</div>
						</div>
						<div class="menusel" id="menu_dess">
							<img src="./image/des.jpg" id="dess_img" title="dessert">
							<div class="menumore">
								<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=5'" class="menubtn">
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="menu_right" id="menu_right">
					<div class="menusel" id="menu_appe">
					<img src="./image/appe.jpg"  id="appe_img" title="appetizer">
						<div class="menumore">
							<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=1'" class="menubtn1">
						</div>
					</div>
						<div class="menu_right2" id="menu_right2">
						
							<div class="menusel" id="menu_side">
							<img src="./image/side.jpg" id="side_img" title="side dish">
								<div class="menumore">
									<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=4'" class="menubtn">
								</div>
							</div>
							<div class="menusel" id="menu_drink">
							<img src="./image/drink.jpg" id="drink_img" title="drink">
							
								<div class="menumore">
									<input type="button" value="상세보기" onclick="location.href='menusel.do?kind=6'" class="menubtn">
								</div>
							</div>
							
						</div>
				</div>
			</div>
			<div class="menu_add">
				<button type="button" onclick="location.href='menuinsert.do'">메뉴 추가</button>
			</div>
	</body>
</html>
