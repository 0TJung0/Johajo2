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
	$("#FaQUpDataSub").click(function(){
		var inputText=oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		var a = $("#contents").val();
							
		$("#FaQUpDateForm").submit(); 
	});
});
</script>

</head>
<body>
	<form action="FaqUpData.do"  id="FaQUpDateForm" method="post"
enctype="multipart/form-data">
	<c:set var="dto" value="${dto }"/>
		<select name="kind">
			<option value="1" 
			<c:if test="${dto.kind==1 }">selected="selected"</c:if>
			>회원</option>
			<option value="2"
			<c:if test="${dto.kind==2 }">selected="selected"</c:if>
			>쿠폰</option>
			<option value="3"
			<c:if test="${dto.kind==3 }">selected="selected"</c:if>
			>예약</option>
		</select>
		비공개:<input type="checkbox" value="0" name="hide"
		<c:if test="${dto.hide==0 }">checked="checked"</c:if>><br>
		제목:<input type="text" size="100" name="title" value="${dto.title }"><br>
		내용:
		<textarea rows="18" cols="100" name="contents" id="contents">${dto.contents }</textarea><br>	
		<input type="hidden" name="idx"value="${dto.idx }">
		<input type="button" value="수정 완료" id="FaQUpDataSub">
	</form>	
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef:oEditors,
	elPlaceHolder:"contents",
	sSkinURI:"./smartEditor/SmartEditor2Skin.html",
	fCreator:"createSEditor2"
});


</script>
</html>