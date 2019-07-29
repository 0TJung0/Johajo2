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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	/* $(document).on("click","button.idch", function(){
		var userId = $(".id").val();
		
		var url="idCheck.pop?id="+userId;
		var option="width=370,height=360,resizable=no,scrollbars=no,status=no";
		window.open(url,"",option);
	}); */
	
	
	$(document).on("change","input.birthselect", function(){
		var date = $(this).val().replace(/-/gi,"/");
		$(".birth").val(date);
	});
	

	$(document).on("change","select#hp", function(){
		$("#hp1").val($(this).val());
		console.log($(this).val());
	});
	
	/* $("#password").on("keyup", function() {
		if($(this).val() != $("#password1").val()){
			alert("비밀번호가 일치하지않습니다.");
			$(this).focus();
			return false;
		}
	    
	}); */
	
	
	$("#hp2,#hp3").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    $(this).val($(this).val().substring(0,4));
	});


	

});

function idch(){
	var url="idCheck.pop";
	var option="width=350,height=220,resizable=no,scrollbars=no,status=no";
	window.open(url,"",option);
}

function joinCheck(){
	if($("#id").val() == ""){
		alert("아이디 체크를 클릭해주세요");
		return false;
	}
	
	if($("#password").val() != $("#password1").val()){
		alert("비밀번호를 정확히 입력해주세요");
		$("#password1").val("");
		$("#password").val("");
		$("#password1").focus();
		return false;
	}
	
	
	
}

</script>
<style type="text/css">

	/* div.center{
		position: relative;
		width: 100%;
		float: left;
	}
	
	span.subejct{position: relative;font-size: 40px;text-align: center;display: block;}
	
	
	div.joinform {
		position: relative;
		width: 495px;
		height: auto;
		margin: 60px auto 0;
		padding: 0 17px 10px;
		background-color: #e1e3e4;
	}
	
	div.joinform div.field ul li{
		list-style: none;
		font-size: 15px;
		margin-top: 10px;
	}
	
	input[type="text"], input[type="password"] { 
	height: auto; 
	line-height: normal;  
	padding: 0.3em .2em;
	border-radius: 8px;
    border: 0; }

	select { 
		width: 94px;
	    padding: .2em .2em;
	    font-family: inherit;
	    background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 99% 31%;
	    border: 1px solid #999;
	    border-radius: 6px;
	    -webkit-appearance: none;
    }

	div.joinform div.field ul{
		padding-left:10px;
	}
	div.joinform div.field ul li span{
		display: inline-block;
		width: 90px;
	    margin-bottom: 5px;
	    padding: 2px;
	    text-align: center;
	    
	}

	div.joinform span.bold{
		font-size: 15px;
		font-weight: bold;
	}
	

	
.btnlist {
	    text-align: center;
    position: relative;
    width: 500px;
    margin: 0 auto;
	text-align: center;
} */

</style>
</head>
<body>
	<form name="mJoinForm" onsubmit="return joinCheck();" action="memberInsert.do" method="post">
	<div class="joinform">
		<span class="subejct">Single Dinner</span>
		
		<div class="field">
		<span class="bold">필수정보</span>
			<ul>
				<li>
					<span>아이디</span> 
					<input type="text" name="id" class="id" readonly="readonly" required="required" placeholder="입력 버튼 클릭해주세요">
					<button type="button" class="btnid" onclick="javascriprt:idch();" required="required" >아이디입력</button>
				</li>
				<li>
					<span>비밀번호 </span>
					<input type="password" name="password1" id="password1"  autofocus="autofocus" required="required"
					placeholder="비밀번호(6~16자)" size="16"> 
					<input type="password" name="password" id="password" autofocus="autofocus" required="required"
					placeholder="비밀번호 확인 ">
				</li>
				<li>
					<span>이름 </span>
					<input type="text" name="name" autofocus="autofocus" required="required"
						placeholder="이름">
				</li>
								
				<li>
					<span>휴대폰</span>
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
				</li>
			
				
				<li>
					<span>이메일</span>
					<input type="email" name="email" id="email" autofocus="autofocus" required="required"
					placeholder="이메일 ">
				</li>
			</ul>
		</div>
		
		
		
		<div class="field">
			<span class="bold">추가정보</span>
			<ul>
				<li>
					<span>성별</span>
					<input type="radio" name="gender" value="1" checked="checked"> 여자 
					<input type="radio" name="gender" value="2"> 남자
				</li>
				<li>
					<span>생년월일</span>
					<input name="birth" class="birth" type="hidden"> 
					<input name="birth2" class="birthselect" type="date">
				</li>
			</ul>
		</div>
		
	</div>
	
	<!-- 버튼 -->
	
	<div class="btnlist">
		<div class="">
			<button type="button" class="cancel">취소</button> 
			<button type="submit" class="submit">등록</button>
		</div>
	</div>
	</form>
</body>
</html>