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
<link rel="stylesheet" href="css/member.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body>
	<span class="logo mt100">아이디 찾기</span>
	<div class="content sel">
		<form name="selectId" action="selectid.do" method="post">
		
		<div class="selectform">
			<span>
				<label>이름</label>
				<input type="text" name="name" id="name" autofocus="autofocus" 
					required="required" placeholder="이름">
			</span>
			<span>
				<label>전화번호</label>
					<input type="hidden" name="hp1" id="hp1"> 
					<select name="hp" id="hp" required="required">
						<option value="" selected>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - 
					<input type="text" name="hp2" id="hp2" size="4"  autofocus="autofocus" required="required"> - 
					<input type="text" name="hp3" id="hp3" size="4"  autofocus="autofocus" required="required">
			
			</span>
			
			<button class="cancel" type="button"  onclick="history.go(-1);">취소</button>
			<button class="submit" type="submit">확인</button>
		</div>	
		</form>	
	</div>


</body>
</html>