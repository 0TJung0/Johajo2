<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>" />
<script type="text/javascript">
var sub="";
$(function(){
	$("div.mainMenu ul li ul.sub").hide();
	
	$("div.mainMenu>ul>li>span>a").on('mouseover', function(){
		
		$("div.mainMenu ul li ul.sub").hide();
       	$(this).parent().next('.sub').show();
       	$(this).parent().next('.sub').addClass("on");
       
       	
    }).on('mouseout',function(){
    	$("div.mainMenu ul li ul.sub").removeClass("on");
    });
}); 
</script>
</head>
<body>
<%
	String loginok   = (String)session.getAttribute("loginok");		
%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
	<div class="topMenu">
		<img src="image/logo2.JPG" onclick="location.href='main.do'" class="logo">
		  
		<div class="mini">
			<span>
				 <c:if test="${loginok =='yes'}">
				 	<a href="userLogout.do">LOG OUT</a>
				 	<a href="mypageform.do">MYPAGE</a>
				 </c:if>
				 <c:if test="${loginok == NULL || loginok.equals('no')}">
				 	<a href="loginform.do">LOGIN</a>
				 	<a href="joinform.do">JOIN</a>
				 </c:if>
				 
				 <a href="#">CUSTOMER</a>
			</span>
		</div>	
		<div class="mainMenu">
		
			<ul>
				<li>
					<span><a href="menulist.do">MENU</a></span>
					<ul class="sub s1">
						<li><a href="menulist.do">메뉴</a></li>
						<li><a href="menucourse.do">코스</a></li>
						<li><a href="menuallergy.do">알레르기</a></li>
					</ul>
				</li>
				<li>
					<span><a href="storelist.do">STORE</a></span>
					<ul class="sub s2">
						<li><a href="storelist.do">매장안내</a></li>
					</ul>
				</li>
				<li>
					<span><a href="reslist.do">RESERVATION</a></span>
					<ul class="sub s3">
						<li><a href="reslist.do">예약</a></li>
					</ul>
				</li>
				<li>
					<span><a href="noticelist.do">NOTICE</a></span>
					<ul class="sub s4">
						<li><a href="noticelist.do">공지사항</a></li>
						<li><a href="noticefaq.do">FAQ</a></li>
						<li><a href="noticeevent.do">이벤트</a></li>
					</ul>
				</li>
				<!-- <li><span><a href="#">BRAND</a></span>
					<ul class="sub">
						<li><a href="#">소개1</a></li>
						<li><a href="#">소개2</a></li>
						<li><a href="#">소개3</a></li>
						<li><a href="#">소개4</a></li>
					</ul>
				</li> -->
			</ul>
		</div>
		
	</div>
	
</body>
</html>
