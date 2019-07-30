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
<link href='http://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
<%-- 
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/> --%>
<script type="text/javascript">
$(function(){
	$(".drinkbtn1").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		window.open('http://localhost:9000/SpringTilesMybatis/menuselpop.do?idx='+idx, 'menulistPop', 'width=500, height=650, left=700, top=50,resizable=no,', '_blank');
	});
	
	$(".drinklist_list").mouseenter(function(){
		$(this).css("opacity","0.8");
		$(this).find('.drinkmore').show();
	}).mouseleave(function(){
		$(this).css("opacity","1");
		$(this).find('.drinkmore').hide();
	});
	$(".drinkbtn1").mouseenter(function(){
		$(this).css({
			"background-color" : "#fff",
			"color" : "#231f20",
    		"text-decoration":"none"
		}); 
	}).mouseleave(function(){
		$(this).css({
			"background-color": "#414141",
    		"color": "#fff",
    		"text-decoration":"none"
		});
	});
});
</script>
<style type="text/css">
	a,b{font-family: Nanum Gothic;}
	.drink_list{
		background-color: #F5F5F5;
		padding-left: 100px;
        padding-right: 100px;
        overflow: hidden;
	}
	.drinklist2{
		height: 250px;
		display: block;
	}
	.drinklist_list{
		background-color:white;
		margin-left:10px;
		margin-right:10px;
		margin-bottom:20px;
		position:relative;
		float:left;
		border: 1px solid lightgray;
		width: 30%;
		height: 100%;
	}
	
	.drinklist_list ul{
		padding-left:0px;
		list-style: none;
	}
	.drinklist_img{
		display: block;
		width: 100%;
	}
	.drink_fname{
		margin-top:25px;
		font-size: 1em;
		text-align: center;
		z-index: 2;
	}
	.drinklist1{
		font-size: 350%;
		text-align: center;
		padding : 100px;
	}
	.drinkmore{
		position: absolute;
	    width: 100%;
	    height : 80%;
	    z-index: 13;
	    top: 25%;
	    margin-left: 70px;
    	margin-top: 50px;
	    top: 18%;
	    display: none;
	}
	.drinkbtn1{
		background-color: #231f20;
    	color: #fff;
    	display: inline-block;
   	 	position: relative;
    	padding: 11px 20px 0;
    	text-align: center;
   	 	font-size: 11px;
   	 	width: 127px;
    	height: 40px;
        text-align: center;
    	font-size: 11px;
    	letter-spacing: 2px;
    	text-decoration: none;
	}
	a.drinkbtn1:link, a.drinkbtn1:visited{
    color: #fff;
    text-decoration: none;
	}
</style>
</head>
<body>
	<div class="drink_list">
		<div class="drinklist1" id="drinklist1" > 
			<b>DRINK</b><br>
			<img src="image/drink.png">
		</div>
		<div class="drinklist2">
			<c:forEach var="dto" items="${list}" >	
				<div class="drinklist_list" id="drinklist${dto.idx}">
					<div class="drinkmore">
						<a class="drinkbtn1" idx="${dto.idx}"><b>상세보기</b></a>
					</div>
					<ul>
						<li><img class="drinklist_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${dto.imgname}" idx="${dto.idx}" ></li>
						
						<li class="drink_fname">&nbsp;&nbsp;&nbsp;<b>${dto.fname},${dto.idx}</b></li>
						<%-- 
						<li><button type="button" onclick="location.href='menuupdateform.do?idx=${dto.idx}'">수정</button></li>
						<li><button type="button" onclick="location.href='menudelete.do?idx=${dto.idx}&kind=${dto.kind}'">삭제</button></li> --%>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>