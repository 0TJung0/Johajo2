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
	div.selectform span{
		width: 100%;
		display: inline-block;
		line-height: 36px;
    	margin-bottom: 5px;
	}
	
	div.selectform span label{
		margin-left: 5px;
		width: 100px;
		font-weight: normal;
	}
	
	div.selectform span input#id{
		width: 260px;
	}
	div.selectform span select#hp{
	   width: 72px;
	    height: 43px;
	}
	div.selectform span input#hp2,
	div.selectform span input#hp3{
		width: 81px;
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
		<form name="selectPw" action="selectpw.do" method="post">
		
		<div class="selectform">
			<span>
				<label>아이디</label>
				<input type="text" name="id" id="id" autofocus="autofocus" 
					required="required" placeholder="아이디">
			</span>
			<span>
				<label>휴대전화번호</label>
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
			
			<button class="cancel" type="button">홈</button>
			<button class="submit" type="submit">확인</button>
		</div>	
		</form>	
	</div>


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
	div.selectform span{
		width: 100%;
		display: inline-block;
		line-height: 36px;
    	margin-bottom: 5px;
	}
	
	div.selectform span label{
		margin-left: 5px;
		width: 100px;
		font-weight: normal;
	}
	
	div.selectform span input#id{
		width: 260px;
	}
	div.selectform span select#hp{
	   width: 72px;
	    height: 43px;
	}
	div.selectform span input#hp2,
	div.selectform span input#hp3{
		width: 81px;
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
		<form name="selectPw" action="selectpw.do" method="post">
		
		<div class="selectform">
			<span>
				<label>아이디</label>
				<input type="text" name="id" id="id" autofocus="autofocus" 
					required="required" placeholder="아이디">
			</span>
			<span>
				<label>휴대전화번호</label>
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
			
			<button class="cancel" type="button">홈</button>
			<button class="submit" type="submit">확인</button>
		</div>	
		</form>	
	</div>


</body>
>>>>>>> parent of 89b8508... 멤버 css 수정 + main css,main jsp,slick 추가
</html>