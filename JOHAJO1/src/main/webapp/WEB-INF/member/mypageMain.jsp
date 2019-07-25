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
<link rel="stylesheet" href="css/member.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body> 

	
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
			<c:choose>
				<c:when test="${dto.gender == 1}">
					<img src="image/women_icon.png" class="micon">
				</c:when>
				<c:when test="${dto.gender == 2}">
					<img src="image/man_icon.png" class="micon">
				</c:when>
			 	<c:otherwise>
			        <img src="image/chef_icon.png" class="micon">
			    </c:otherwise>
			</c:choose>
			
			
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
						<p>40,200 점${dto.point }</p>
						
					</div>
				</li>
				<li>
					<div class="qna">
						<b><a href="myqnaList.do?idx=${log_idx}">고객의 소리</a></b>
						<span>대기중 <b>0</b></span>
						<span>완료<b>0</b></span>
					</div>
				</li>
				
			</ul>
		</div>
		<div class="field f2 coupon">
			<b>보유 쿠폰</b>
			<div>오픈 기념 30% 할인 2019-07-30</div>
			<div><b>생일 기념 50% 할인</b>2019-07-30</div>
		</div>
		<div class="clear"></div>
	</div>
	


</body>
</html>