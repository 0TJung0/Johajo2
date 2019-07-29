<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./smartEditor/js/service/HuskyEZCreator.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(function(){
	$("#EventUpDataSub").click(function(){
		var inputText=oEditors.getById["con"].exec("UPDATE_CONTENTS_FIELD", []);
		var a = $("#con").val();
							
		$("#EventUpDateForm").submit(); 
	});
});
</script>

</head>
<body>
	<form action="EventUpData.do" id="EventUpDateForm" method="post"
enctype="multipart/form-data">
	<c:set var="dto" value="${dto }"/>
		제목:<input type="text" size="100" name="title" value="${dto.title }"><br>
		시작일:<input type="date" name="startday" value="${dto.startday }">
		종료일:<input type="date" name="endday" value="${dto.endday }"><br>
		할인률:<input type="number" name="discount_rate" value="${dto.discount_rate }"><br>
		쿠폰 사용 기간:<input type="number" name="validity_month" value="${dto.validity_month }"><br>
		타이틀 이미지:
		<div id="imgname_second"></div>
        <input id="ex_file" type="file" onchange="previewImage(this, 'imgname_second');" name="title_img">
		메인 이미지:
		<div id="imgname_second1"></div>
        <input id="ex_file1" type="file" onchange="previewImage(this, 'imgname_second1');" name="main_img">
		내용:
		<textarea rows="18" cols="100" name="con" id="con">${dto.con }</textarea><br>	
		<input type="hidden" name="idx" value="${dto.idx }">
		<input type="button" value="수정 완료" id="EventUpDataSub">
	</form>	
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef:oEditors,
	elPlaceHolder:"con",
	sSkinURI:"./smartEditor/SmartEditor2Skin.html",
	fCreator:"createSEditor2"
});


</script>
</html>