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
<!-- google map API -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCzHxv7okfaTei_0eZFMzhSw6cnN-dITSg"></script>
<script src="<c:url value="/store/js/mapJS.js" />"></script>
<link href="<c:url value="/css/store.css"/>" rel="stylesheet">
<script>
	$(function(){
		map3();
});
	
	function selStore(){
		var a = $(".selStore").val().split(",");
		ajax2(a[0]);
	}
</script>

</head>
<body>
	<div>
		<select class="selStore1">
			<c:forEach var="sdto" items="${slist }">
				<option value="${sdto.idx},${sdto.name},${sdto.xpoint},${sdto.ypoint},${sdto.addr},${sdto.phone}" class="subselStore1">${sdto.name }</option>
			</c:forEach>
		</select>
		<select class="selStore" onchange="selStore()">
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>
			</c:forEach>
		</select>
	<form action="search.do" method="post">
		<input type="text" size="10" name="name">
		<input type="hidden" value="${totalCount}" id="total">
		<input type="submit" value="검색">
	</form>
	</div>
	<div id="storeMap1"></div><br>
	<div class="storlist"></div>
</body>
</html>