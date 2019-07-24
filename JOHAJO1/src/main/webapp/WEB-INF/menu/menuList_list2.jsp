<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.list2_img{
			width:200px;
		}
		.list2_div{
			margin-left : 80px;
			margin-top : 100px;
		}
	</style>
	</head>
	<body>
		<div class="list2_div">
			<img class="list2_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${list2.imgname}">
			<br>
			메뉴 ${list2.fname}<br>
			칼로리 ${list2.calorie}<br>
			가격 ${list2.price}<br>
			<c:if test="${list2.origin != '미표시'}">
				원산지 ${list2.origin}
			</c:if>
			<br>
			<button onclick="self.close()">닫기</button>
		</div>
	</body>
</html>