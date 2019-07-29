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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body>
	<form action="EventUpData.do">
	<c:set var="dto" value="${dto }"/>
		제목:<input type="text" size="100" name="title" value="${dto.title }"><br>
		내용:
		<textarea rows="18" cols="100" name="con">${dto.con }</textarea><br>	
		시작일:
		<input type="date" name="startday" value="${dto.startday }">
		종료일:
		<input type="date" name="endday" value="${dto.endday }">
		할인률:
		<input type="number" name="discount_rate" value="${dto.discount_rate }">
		쿠폰 사용 기간:
		<input type="number" name="validity_month" value="${dto.validity_month }">
		<input type="hidden" name="idx" value="${dto.idx }">
		<input type="submit" value="저장">
	</form>	
</body>
</html>