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
		<div class="list2_div">
			<img class="list2_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${list2.imgname}">
			<br><br>
			&nbsp;<b class="list2fname">${list2.fname}</b><br>
			&nbsp;<b class="list2content">${list2.calorie}kcal</b><br>
			&nbsp;<b class="list2content">${list2.price}원</b><br>
			<c:if test="${list2.origin != '미표시'}">
				&nbsp;<b class="list2origin">${list2.origin}</b>
			</c:if>
			<br>
			<button onclick="self.close()" class="list2btn">닫기</button>	
		</div>
	</body>
</html>