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
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$(".storeSubBtn").click(function(){
			window.close();
		});
	});
	function close_Event(){
		$("#updataform").submit();
		alert("수정되었습니다.");
		opener.parent.location='ad_StoreList.do';
		window.close();
	}
</script>
</head>
<body>
	<form action="storeUpdata.do" method="post" enctype="multipart/form-data"
	id="updataform">
		지점명:<input name="name" type="text" value="${dto.name }"><br>
		x좌표:<input name="xpoint" type="text" value="${dto.xpoint }"><br>
		y좌표:<input name="ypoint" type="text" value="${dto.ypoint }"><br>
		주소:<input name="addr" type="text" value="${dto.addr }"><br>
		전화:<input name="phone" type="text" value="${dto.phone }"><br>
		영업시간:<input name="ohours" type="text" value="${dto.ohours }"><br>
		서비스:<input name="service1" type="text" value="${dto.service }"><br>
		사진:<input type="file" name="photo" value="${dto.photo }"><br>
 		<input type="hidden" value="${dto.idx }" name="idx">
		<input type="button" value="수정완료" onclick="close_Event()">
		<input type="button" value="닫기" class="storeSubBtn">
	</form>
</body>
</html>