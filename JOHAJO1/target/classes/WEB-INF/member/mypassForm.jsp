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
		font-size:45px;
		text-align: center;
		display: inline-block;
		width: 100%;
        font-weight: bold;

		
	}
	
	div.content{
		position: relative;
	    width: 380px;
	    margin: 0 auto 0;
	    padding:27px 0 60px;
	    margin-bottom: 100px;
	    text-align: center;
	}
	
	
	div.content p{
		font-size:14px;
	}
	div.passform{
		position: relative;
	    text-align: center;
	}
	div.passform span{
		width: 100%;
		display: inline-block;
		line-height: 36px;
    	margin-bottom: 5px;
    	text-align: center;
	}
	
	div.passform span input#password{
		width: 100%;
		padding-left: 20px;
	}

	button.submit{
		width: 100%;
	    margin:10px auto 0 ;
	    line-height: 46px;
	    color: #fff;
	    font-weight: bold;
	    background-color: #000;
	    border: 0;
	    
	}
	
	
</style>
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
   
	<div class="content">
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