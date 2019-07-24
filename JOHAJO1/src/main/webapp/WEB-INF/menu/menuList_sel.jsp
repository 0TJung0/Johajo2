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

	</head>
	<body>
			<div class="menu_list">
				<div class="menu_left">
					<div class="menu_mmain">
						<a href="menusel.do?kind=3"><img src="./image/main.jpg" id="main_img" title="main" ></a>
					</div>
					<div class="menu_left2">
						<div class="menu_soup">
						<a href="menusel.do?kind=2"><img src="./image/soup.jpg" id="soup_img" title="soup"></a>
						</div>
						<div class="menu_dess">
						<a href="menusel.do?kind=5"><img src="./image/des.jpg" id="dess_img" title="dessert"></a>
						</div>
					</div>
				</div>
				
				<div class="menu_right">
					<div class="menu_appe">
					<a href="menusel.do?kind=1"><img src="./image/appe.jpg"  id="appe_img" title="appetizer"></a>
					</div>
						<div class="menu_right2">
							<div class="menu_side">
							<a href="menusel.do?kind=4"><img src="./image/side.jpg" id="side_img" title="side dish"></a>
							</div>
							<div class="menu_drink">
							<a href="menusel.do?kind=6"><img src="./image/drink.jpg" id="drink_img" title="drink"></a>
							</div>
						</div>
				</div>
			</div>
			<div class="menu_add">
				<button type="button" onclick="location.href='menuinsert.do'">메뉴 추가</button>
			</div>
	</body>
</html>
