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
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<style type="text/css">
/* 	div.idcheck_warp{
		position: relative;
	    width: 100%;
	    height: 232px;
	    padding: 13px;
	    margin: 0 auto;
	    background-color: #ddd;
	    border-radius: 3px;
	}
	
	div.idcheckForm{
		position: relative;
	    width: 100%;
	    height: 104px;
	    border-radius: 4px;

	}
	div.idcheckForm>span{
		font-size: 15px;
	    display: inline-block;
	    text-align: center;
	    width: 100%;
	    padding: 20px 0;

	}
	div.idcheckForm input[type=text]{
		margin: 0 10px 0 50px;
    	line-height: 30px;
	}
	
	div.result div.useform button.use,
	div.idcheckForm .chbtn{
		cursor: pointer;
	    border: 0;
	    background-color: #000;
	    color: #fff;
	    padding: 4px 12px;
	    border-radius: 3px;
	    line-height: 30px;

	}
	
	div.result{
		position: relative;
	    width: 100%;
	    padding: 25px;
	}
	div.result div.useform{
	
	    position: relative;
    	margin: 0 auto;
    	text-align: center;
	}
	
	
	div.result div.useform span{
	    display: inline-block;
	    width: 100%;
	    margin-bottom: 9px;
	    font-size: 16px;
    }
	div.result div.useform span b{
		color:orange;
		font-size: 17px;
	}
	
	div.result div.useform button.use:hover{
		background-color: orange;
		color: #fff;
		font-weight: bold;
	}
	
	div.result div.useform.u2{
		line-height: 25px;
		margin-top: 9px;
	}
 	 */

</style>
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
			<input type="submit" value="중복체크" class="chbtn">
			
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