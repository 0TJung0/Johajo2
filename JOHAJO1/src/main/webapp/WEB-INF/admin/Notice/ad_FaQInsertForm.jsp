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
	<form action="FaqInsert.do">
		<select name="kind">
			<option value="1">회원</option>
			<option value="2">쿠폰</option>
			<option value="3">예약</option>
		</select>
		공개:<input type="checkbox" name="hide" value="1"><br>
		제목:<input type="text" size="100" name="title"><br>
		내용:
		<textarea rows="18" cols="100" name="contents"></textarea><br>	
		<input type="submit" value="저장">
	</form>	
</body>
</html>