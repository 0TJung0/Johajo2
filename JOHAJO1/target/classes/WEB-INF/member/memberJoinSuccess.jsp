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
	    width: 600px;
	    margin: 30px auto 0;
	    text-align: center;
	    font-size: 17px;
	    border: 1px solid #000;
    	padding: 59px 0;
	}
	div.content span.p1{
		display: inline-block;
		margin-bottom: 20px;
		
	}
	
	div.content span.p1 b{
		color:#0174DF;
	}
	
	div.mainBtn{
		position: relative;
		 width: 600px;
		 margin: 30px auto 70px;
		 text-align: center;
		 padding:20px 0;
		 background-color: #000000;
		
		
	}
	
	div.mainBtn a{
		font-size:15px;
		color:#fff;
		font-weight: bold;
		text-decoration: none;
	}
	
	div.mainBtn a:hover{
		color:#fff;
		text-decoration: none;
	}
</style>
</head>
<body>
	<span class="logo mt100">Single Dinner</span>
	<div class="content">
	   	<span class="p1">회원가입이 정상적으로 <b>완료</b>되었습니다.</span><br>
	   	<span>
	   		회원이 되신것을 환영합니다. <br>
	   		싱글 디너가 제공하는 다양한 혜택을 만나보세요
	   	</span>
	</div>
	
   
   <div class="mainBtn"><a href="main.do">메인으로 이동</a></div>
</body>
</html>