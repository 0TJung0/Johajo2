<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(document).on("change","input.birthselect", function(){
		var date = $(this).val().replace(/-/gi,"/");
		$(".birth").val(date);
	});
	
	
	$(document).on("change","select#hp", function(){
		$("#hp1").val($(this).val());
		console.log($("#hp1").val());
	});
	
	
	$("#hp2,#hp3").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    $(this).val($(this).val().substring(0,4));
	});


	

});


function joinCheck(){
	
	if($("#newpass1").val()!= null || $("#newpass2").val()!= null ){
		if($("#newpass1").val() != $("#newpass2").val()){
			alert("새 비밀번호를 정확히 입력해주세요");
			$("#newpass1").val("");
			$("#newpass2").val("");
			$("#newpass1").focus();
			return false;
		}
		if(($("#newpass1").val() == $("#password").val()) || ($("#newpass2").val() == $("#password").val())){
			alert("현재 비밀번호와 동일합니다. 새로 입력해주세요");
			$("#newpass1").val("");
			$("#newpass2").val("");
			$("#newpass1").focus();
			return false;
		}
		
		if($("#newpass1").val() == $("#newpass2").val()){
			$("#newpass").val($("#newpass1").val());
		}
		
	}
	
	
	if($("#password").val() == null){
		alert("현재 비밀번호를 입력해주세요");
		return false;
	}
	
	confirm("회원 정보 수정 하시겠습니까??");	
	
	
}

</script>
<style type="text/css">

	div.center{
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
}

</style>
</head>
<body>
수정폼
	<c:set var="dto" value="${dto}" />
	<form name="mJoinForm" onsubmit="return joinCheck();" action="memberUpdate.do" method="post">
	<input type="hidden" name="idx" value="${dto.getIdx()}"> 
	<div class="joinform">
		<span class="subejct">Single Dinner</span>
		
		<div class="field">
		<span class="bold">필수정보</span>
			<ul>
				<li>
					<span>아이디</span> 
					${dto.getId()}
					* 최초 등록 후 변경 불가 합니다.
				</li>
				<li>
					<span>기존 비밀번호 </span>
					<input type="password" name="password" id="password"  autofocus="autofocus" required="required"
					placeholder="비밀번호(6~16자)" size="16"> 
				
				</li>
				<li>
					<span>새비밀번호 </span>
					<input type="hidden" name="newpass" id="newpass"/>
					<input type="password" name="newpass1" id="newpass1"  autofocus="autofocus"
					placeholder="새비밀번호(6~16자)" size="16"> 
					<input type="password" name="newpass2" id="newpass2" autofocus="autofocus"
					placeholder="새비밀번호 확인 ">
				</li>
				<li>
					<span>이름 </span>
					<input type="text" name="name" value="${dto.getName()}" autofocus="autofocus" required="required"
						placeholder="이름">
				</li>
								
				<li>
					<span>휴대폰</span>
					<input type="hidden" name="hp1" id="hp1" value="${dto.getHp1()}"> 
				
					<select name="hp" id="hp" required="required">
						<option value='010' ${dto.getHp1()==010?'selected':''}>010</option>
						<option value="011" ${dto.getHp1()==011?'selected':''}>011</option>
						<option value="016" ${dto.getHp1()==016?'selected':''}>016</option>
						<option value="017" ${dto.getHp1()==017?'selected':''}>017</option>
						<option value="019" ${dto.getHp1()==019?'selected':''}>019</option>
					</select> - 
					<input type="text" name="hp2" value="${dto.getHp2()}" id="hp2" size="4"  autofocus="autofocus" required="required"> - 
					<input type="text" name="hp3" value="${dto.getHp3()}" id="hp3" size="4"  autofocus="autofocus" required="required">
				</li>
			
				
				<li>
					<span>이메일</span>
					<input type="email" name="email" id="email"  value="${dto.getEmail()}" autofocus="autofocus" required="required"
					placeholder="이메일 ">
				</li>
			</ul>
		</div>
		
		
		
		<div class="field">
			<span class="bold">추가정보</span>
			<ul>
				<li>
					<span>성별</span>
					<input type="radio" name="gender" value="1" ${dto.getGender()==1?'checked':''}> 여자 
					<input type="radio" name="gender" value="2" ${dto.getGender()==2?'checked':''}> 남자
				</li>
				<li>
					<span>생년월일 </span>
					<input name="birth" class="birth" type="hidden"> 
					<input name="birth2" class="birthselect" type="date" value="">
				</li>
				
				<%-- <li>
				
				<c:if test="${dto.getBirth() != null}">
					<span>생년월일 </span>
					${dto.getBirth().substring(0,11)}
					* 최초 등록 후 변경 불가 합니다.
				</c:if>
				<c:if test="${dto.getBirth() == null}">
					<span>생년월일 </span>
					<input name="birth" class="birth" type="hidden"> 
					<input name="birth2" class="birthselect" type="date" value="">
				</c:if>
				</li> --%>
			</ul>
		</div>
		
	</div>
	
	<!-- 버튼 -->
	
	<div class="btnlist">
		<div class="">
			<button type="button"  onclick="history.go(-1)">취소</button> 
			<button type="submit">수정</button>
		</div>
	</div>
	</form>
</body>
</html>
