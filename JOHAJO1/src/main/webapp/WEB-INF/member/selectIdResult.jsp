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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body>
<span class="logo mt100">아이디 찾기</span>
	<div class="content sel">
		
		<div class="selectform">
			<c:if test="${findId.equals('')}">
				<div class="res">
					<p>입력하신 정보의 회원은 존재하지 않습니다.</p>
					<span></span>
				</div>
			</c:if>
			<c:if test="${!findId.equals('')}">
				<div class="res">
					<strong>회원님의 아이디 조회결과 입니다.</strong>
					<p class="p1">${findId}</p>
					<strong class="s2">가입일자  ${joindate}</strong>
					
					<p>더 궁금하신 점은 고객센터 문의 바랍니다.</p>
				</div>
			</c:if>
			
			   
   
			<button class="cancel" type="button" onclick="location.href='loginform.do'">로그인</button>
			<button class="submit" type="button" onclick="location.href='selPwform.do'">비밀번호 찾기</button>
		</div>	
	</div>

</body>
</html>