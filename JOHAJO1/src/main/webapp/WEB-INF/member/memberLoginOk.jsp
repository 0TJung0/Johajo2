<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body>
   <h2>Session 사용</h2><br>
	
	saveok :<c:out value="${saveok}" /><br>
	log_idx : <c:out value="${log_idx}" /><br>
	log_id <c:out value="${log_id}" /><br>
	log_namme <c:out value="${log_name}" /><br>
	loginok <c:out value="${loginok}" /><br>
	
	<button type="button" onclick="location.href='userLogout.do'">${log_name} 님 로그아웃하기</button>
	
</body>
</html>