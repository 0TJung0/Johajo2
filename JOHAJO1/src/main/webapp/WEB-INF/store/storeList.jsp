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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(function(){
		map1();
});
	
	function selStore(){
		var a = $(".selStore").val().split(",");
		ajax2(a[0]);
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
</body>
</html>
