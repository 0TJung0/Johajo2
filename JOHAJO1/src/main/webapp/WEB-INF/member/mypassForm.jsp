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
<c:if test="${log_res =='false'}">
<script type="text/javascript">
	alert("비밀번호를  틀렸습니다. 정확히 입력해주세요");
</script>
</c:if>
<%
	session.removeAttribute("log_res");
%>
   <span class="logo mt100">회원정보관리</span>
   
	<div class="content pass">
		<h4><b>일반 회원 인증</b></h4>
		<p>안전한 싱글디너 사용을 위해 <br>비밀번호를 다시 한번 입력해주세요</p>
		<form action="myinfoform.do" method="post">	
		<div class="passform mt30">
			<span>
				<input type="hidden" name="idx" value="${log_idx }" />
				<input type="password" name="password" id="password" autofocus="autofocus" 
					required="required" placeholder="비밀번호">
			</span>
	
			
			<button class="submit" type="submit">확인</button>
		</div>	
		</form>	
	</div>
	
	
</body>
</html>