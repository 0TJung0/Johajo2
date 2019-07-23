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
<style type="text/css">

	.mt100{
		margin-top:100px; 
	}
	.mt30{
		margin-top:30px; 
	}
	span.logo{
		font-size: 57px;
		text-align: center;
		display: inline-block;
		width: 100%;
	}
	
	div.content{
		position: relative;
	    width: 380px;
	    margin: 0 auto 0;
	    padding: 63px 0;
	    margin-bottom: 100px;
	}

	div.selectform{
		position: relative;
	}
	
	div.selectform div.res{
		position: relative;
	    width: 100%;
	    text-align: center;
	    margin: 0 0 70px;
	    background-color: #F2F2F2;
    	padding: 45px 0 43px;


	}
	
	div.selectform div.res p,
	div.selectform div.res strong{
		font-size: 14px;
	}
	div.selectform div.res p.p1{
	    color: #FA5858;
	    font-size: 20px;
	    padding-top: 51px;
	    margin-bottom: 0px;
    }
    div.selectform div.res strong.s2{
		font-size: 12px;
	    font-weight: bold;
	    margin-bottom: 12px;
	    display: inline-block;
	    line-height: 38px;
	    color: #848484;
	}
	
	button.cancel,
	button.submit{
		float:left;
		width: 48%;
	    margin-top:10px;
	    margin-right: 3px;
	    margin-left:2px;
	    line-height: 46px;
	    color: #fff;
	    font-weight: bold;
	    background-color: #000;
	    border: 0;
	    
	}
	
	button.cancel{
		 color: #000;
	    font-weight: bold;
	    background-color: #fff;
	    border: 1px solid #000;
	}
</style>
</head>
<body>
<span class="logo mt100">비밀번호 찾기</span>
	<div class="content">
		
		<div class="selectform">
			<c:if test="${findPw.equals('')}">
				<div class="res">
					<p>입력하신 정보의 회원은 존재하지 않습니다.</p>
					<span></span>
				</div>
			</c:if>
			<c:if test="${!findPw.equals('')}">
				<div class="res">
					<strong>회원님의 비밀번호 조회결과 입니다.</strong>
					<p class="p1">${findName}</p>
					<strong class="s2">${findPw}</strong>
					
					<p>더 궁금하신 점은 고객센터 문의 바랍니다.</p>
				</div>
			</c:if>
			
			   
   
			<button class="cancel" type="button" onclick="location.href='main.do'">홈</button>
			<button class="submit" type="button" onclick="location.href='loginform.do'">로그인</button>
		</div>	
	</div>

</body>
</html>