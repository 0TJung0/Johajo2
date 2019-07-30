<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script><%-- 
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/> --%>
<script type="text/javascript">
$(function(){
	$(".mlist").hide();
	//console.log($(location).attr('search'));
	var se = $(location).attr('search');
	//console.log(se.charAt(6));
	var kind = se.charAt(6);
	
	if(kind==1){
		$("#mlist1").show();
	}else if(kind==2){
		$("#mlist2").show();
	}else if(kind==3){
		$("#mlist3").show();
	}else if(kind==4){
		$("#mlist4").show();
	}else if(kind==5){
		$("#mlist5").show();
	}else{
		$("#mlist6").show();
	}
	
	
	$(".menulist_img").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		window.open('http://localhost:9000/SpringTilesMybatis/menuselpop.do?idx='+idx, 'menulistPop', 'width=500, height=650, left=700, top=50,resizable=no,', '_blank');
	});
	
});
</script>
<style type="text/css">
	.menu_list{
		background-color: #F5F5F5;
		padding-left: 100px;
        padding-right: 100px;
        overflow: hidden;
	}
	.menu_list2{
		height: 250px;
		display: block;
	}
	.menulist_list{
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
	
	.menulist_list ul{
		padding-left:0px;
		list-style: none;
	}
	.menulist_img{
		display: block;
		width: 100%;
	}
	.menu_fname{
		margin-top:25px;
		font-size: 1em;
		text-align: center;
		z-index: 2;
	}
	.mlist{
		font-size: 350%;
		text-align: center;
		padding : 100px;
	}
</style>
</head>
<body>
	<div class="menu_list">
		<c:forEach var="dto" items="${konly}">
			<c:set var="mkindnum" value="${dto.kind}"></c:set>
			<c:set var="mkind" value="${mkindnum==1?'APPETIZER':mkindnum==2?'SOUP':mkindnum==3?'MAIN':mkindnum==4?'SIDE':mkindnum==5?'DESSERT':'DRINK'}"/>
			<c:set var="mimg" value="${mkindnum==1?'appe.png':mkindnum==2?'soup.png':mkindnum==3?'main.png':mkindnum==4?'side.png':mkindnum==5?'des.png':'drink.png'}"/>
				<div class="mlist" id="mlist${dto.kind}" >
					<b>${mkind}</b><br>
					<img src="image/${mimg}">
				</div>	  
		</c:forEach>
		<div class="menu_list2">
			<c:forEach var="dto" items="${list}" >	
				<div class="menulist_list" id="menulist${dto.idx}">
					<ul>
						<li><img class="menulist_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${dto.imgname}" idx="${dto.idx}" ></li>
						
						<li class="menu_fname">&nbsp;&nbsp;&nbsp;<b>${dto.fname},${dto.idx}</b></li>
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