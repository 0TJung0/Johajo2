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
		b{font-family: Nanum Gothic;}
	</style>
	</head>
	<body>
		<div class="list2_div" id="list2_div${list2.kind}">
			<img class="list2_img" id="list2img${list2.kind}" src="http://localhost:9000/SpringTilesMybatis/menuImg/${list2.imgname}">
			<br><br>
			&nbsp;<b class="list2fname" id="list2fname${list2.kind}">${list2.fname}</b><br>
			&nbsp;<b class="list2content" id="list2calorie${list2.kind}">${list2.calorie}kcal</b><br>
			&nbsp;<b class="list2content" id="list2price${list2.kind}">${list2.price}원 </b><br>
			<c:if test="${list2.origin != '미표시'}">
				&nbsp;<b class="list2origin" id="list2origin${list2.kind}">${list2.origin}</b>
			</c:if>
			<br>
			<button onclick="self.close()" class="list2btn"><b>닫기</b></button>	
		</div>
	</body>
</html>