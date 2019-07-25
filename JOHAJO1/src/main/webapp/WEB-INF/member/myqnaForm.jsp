<<<<<<< HEAD
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
   <form action="myqnaInsert.do" method="post">
   <input type="hidden" name="anw" value="0">
   <input type="hidden" name="mem_f" value="${log_idx}">
   <input type="hidden" name="p_idx" value="${p_idx}" />
   
   <div>
	   <ul>
		   <li>
		   	<span>문의 유형</span><br>
		   	<input type="radio" name="selection" value="1" checked="checked"> 예약관련 <br>
		   	<input type="radio" name="selection" value="2"> 취소/환불<br>
		   	<input type="radio" name="selection" value="3"> 할인쿠폰/포인트<br>
		   	<input type="radio" name="selection" value="4"> 메뉴관련<br>
		   	<input type="radio" name="selection" value="5"> 회원정보 관련<br>
		   </li>
		   <li>
		   	<span>제목</span>
		   	<input type="text" name="title" id="title">
		   </li>
		   <li>
		   	<span>내용</span>
		   	<textarea rows="5" cols="70" name="content"></textarea>
		   </li>
	   </ul>
   </div>
   <button type="button" onclick="location.href='myqnaList.do?idx=${log_idx}'">취소</button>
   <button type="submit">문의하기</button>
   </form>
</body>
=======
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
   <form action="myqnaInsert.do" method="post">
   <input type="hidden" name="anw" value="0">
   <input type="hidden" name="mem_f" value="${log_idx}">
   <input type="hidden" name="p_idx" value="${p_idx}" />
   
   <div>
	   <ul>
		   <li>
		   	<span>문의 유형</span><br>
		   	<input type="radio" name="selection" value="1" checked="checked"> 예약관련 <br>
		   	<input type="radio" name="selection" value="2"> 취소/환불<br>
		   	<input type="radio" name="selection" value="3"> 할인쿠폰/포인트<br>
		   	<input type="radio" name="selection" value="4"> 메뉴관련<br>
		   	<input type="radio" name="selection" value="5"> 회원정보 관련<br>
		   </li>
		   <li>
		   	<span>제목</span>
		   	<input type="text" name="title" id="title">
		   </li>
		   <li>
		   	<span>내용</span>
		   	<textarea rows="5" cols="70" name="content"></textarea>
		   </li>
	   </ul>
   </div>
   <button type="button" onclick="location.href='myqnaList.do?idx=${log_idx}'">취소</button>
   <button type="submit">문의하기</button>
   </form>
</body>
>>>>>>> parent of 89b8508... 멤버 css 수정 + main css,main jsp,slick 추가
</html>