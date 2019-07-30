<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
<link href="<c:url value="/css/store.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- google map API -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCzHxv7okfaTei_0eZFMzhSw6cnN-dITSg"></script>
<script src="<c:url value="/store/js/mapJS.js" />"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <c:set var="root" value="<%=request.getContextPath() %>"/>
  <link rel="stylesheet" type="text/css" href="slick/slick.css">
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css">
  <script type="text/javascript" src="slick/slick.js"  charset="utf-8"></script>
  
<script>
	$(function(){
		$("div.listStore").hide();
		map1();
	  	$("div.sbtn").click(function(){

	  		
	  		$(this).parent().find("div.smap_wrap").slideToggle('slow',function(){
	  			$(this).parent().addClass("on");
	  			console.log($(window).height());
		  		$('html, body').scrollTop($(window).height());
	  		});
	  		
	  		
	  	},function(){
	  		$(this).parent().find("div.smap_wrap").slideToggle('fast');
	  		$(this).parent().removeClass("on");
	  	});
	  	
});
	
	function selStore(){
		var a = $(".selStore").val().split(",");
		ajax2(a[0]);
	}
	function seleStore(idx){
		ajax2(idx);
	}
	
</script>
</head>
<body>
	<div>
		<select class="selStore" class="custom-select mb-3" onchange="selStore()" >
				<option selected="selected" disabled="disabled">목록</option>
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>

			</c:forEach>
		</select>
		<select class="selStore1">
				<option selected="selected" disabled="disabled">목록</option>
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>
			</c:forEach>
		</select>
	<form action="search.do" method="post" class="storeForm">
		<input type="text" size="12" name="name" placeholder="매장 검색">
		<input type="hidden" value="${totalCount}" id="total">
		<input type="submit" value="검색" class="btn-lg btn-danger">
	</form>
	</div>
	<div id="storeMap1"></div><br>
	<div class="storlist"></div>
	<div class="storeImg"></div>
	<div class="listStore">
		<ul class="listStore">
			<li class="cap">LIST</li>
			<c:forEach var="dto" items="${list }">
				<li><a onclick="seleStore(${dto.idx})">${dto.name }</a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="sbtn">SITEMAP</div>
</body>
</html>
