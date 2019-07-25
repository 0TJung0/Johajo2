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
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(function(){
	var id= $("#id").val().length;
	console.log(id);
	 if(id == 0){
		$("div.result").hide();
	}else{
		$("div.result").show();
	} 
	
	
	 $("button.use").click(function(){
		 var user = $("#user").val();
		
		opener.mJoinForm.id.value=user;
		window.close();
	});
	 
	 

});
</script>
</head>
<body>
<div class="idcheck_warp">
	<form action="idCheck.pop" method="post">
		<div class="idcheckForm">
			<span>사용 할 아이디를 입력하세요</span>
			<input type="text" name="id" id="id" size="16" value="${id}" required="required" autofocus="autofocus">
			<input type="submit" value="중복체크">
			
		</div>
	</form>
	
	
	<div class="result">
	<c:if test="${result == 1}">
		<div class="useform  u2">
			이미 <b>사용중인</b> 아이디 입니다.<br>
			다시 입력해주세요
		</div>
	</c:if>
	<c:if test="${result == 0}">
		<div class="useform">
			<span>사용 <b>가능한</b> 아이디 입니다.</span>
		   	<input type="hidden" id="user" value="${id}">
		   	<button type="button" class="use">사용하기</button>
		</div>
	</c:if>
	</div>
	
</div>  	 
   
 
   
</body>
</html>