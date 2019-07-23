<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>     
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

	div.logo{
		position:relative;
		
		font-size: 40px;
		text-align: center;
		
	}
	div.myform{
		position: relative;
		width: 800px;
		border: 1px solid;
		margin:0 auto;
		background-color: #e1e3e4; 
	}
	
	div.field{
		position: relative;	 
		margin:0 auto;
		background-color: #fff; 
		margin-top:20px;
	}
	
	div.field.f1{
		position: relative;
		width:300px;
		text-align: center;
		font-size: 20px;
	}
	
	div.field.f1 p{
	   padding: 28px 20px 5px;
       padding: 20px;
    }
    
    div.field.f1 p span{
    	color:#FE9A2E;
    	font-weight: bold;
    }
    
    div.field.f2{
    	width: 650px;
    	height: 110px;
   
    }
    
    div.field.f2 ul{
        float: left;
        width: 100%;
	    padding: 0;
    }
    
    div.field.f2 ul li{
    	float: left;
    	width: 33.3%;
    	height: 110px;
    	padding: 16px 19px 0;
    	list-style: none;
    	border-left: 1px solid;
    }
    div.field.f2 ul li:first-child{
    	border: 0;
    }
    
    div.field.f2 ul li div{
    	width: 100%;
    }
    
    div.field.f2 ul li div b{
    	display:inline-block;
    	margin-bottom: 10px;
    }
    
    div.field.f2 ul li div b a{
		
    }
    
 	img.micon{
 		max-width: 132px;
    	margin-top: 37px;

 	}
 	
 	div.mbtn1{
 		position: relative;
	    width: 150px;
	    line-height: 30px;
	    border: 1px solid gray;
	    border-radius: 5px;
	    font-size: 15px;
	    margin: 0 auto;
 	}
 	
 	div.mbtn1 a{
 	    color: #8f8f8f;
	    font-weight: 500;
	    text-decoration: none;
 	}
 	div.mbtn1 a:hover{
 		color:#000;
 	}
 	
 	


</style>
</head>
<body> 
	saveok :<c:out value="${saveok}" /><br>
	log_idx : <c:out value="${log_idx}" /><br>
	log_id <c:out value="${log_id}" /><br>
	log_name <c:out value="${log_name}" /><br>
	loginok <c:out value="${loginok}" /><br>
	
<c:out value="${mupdate}" />
<c:if test="${mupdate =='true'}">
<script type="text/javascript">
	alert("회원 정보 수정완료하였습니다.");
</script>
</c:if>
<%
	session.removeAttribute("mupdate");
	
%>
	
	<div class="myform">
		<div class="logo">
			MY PAGE
		</div>
	
		<div class=" field f1">
			
		
			<img src="image/women_icon.png" class="micon">
			<c:set  var="name" value="${log_name}" />
			<p>안녕하세요, <span>${name}</span>님 </p>
			<div class="mbtn1"><a href="mypassfrom.do">회원정보 관리</a></div>
		</div>
	
		<div class="field f2">
			<ul>
				<li>
					<div class="res">
						<b>예약 현황</b>
						<div><span>[강남점]</span><span>나만을 위한 특별한 코스 A</span><span>2019-07-21</span></div>
						
					</div>
				</li>
				<li>
					<div class="point">
						<b>보유 포인트</b>
						<p>40,200 점${dto. }</p>
						
					</div>
				</li>
				<li>
					<div class="qna">
						<b><a href="myqnaList.do?idx=${log_idx}">고객의 소리</a></b>
						<span>답변 대기중 <b>0</b>건</span>
						<span>답변 완료<b>0</b>건</span>
					</div>
				</li>
				
			</ul>
		</div>
		<div class="field f2">
			<b>보유 쿠폰</b>
			<div><span>오픈 기념 30% 할인</span><span>2019-07-30</span></div>
			<div><span>생일 기념 50% 할인</span><span>2019-07-30</span></div>
		</div>
		<div class="clear"></div>
	</div>
	


</body>
</html>