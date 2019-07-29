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
		$("#noticeSub").click(function(){
			var inputText=oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			var a = $("#contents").val();
								
			$("#noticeInsertForm").submit(); 
		});
	});
	function goBack()
	{
		window.history.back();
	}
</script>
</head>
<body>
<form action="noticeInsert.do" id="noticeInsertForm" method="post"
enctype="multipart/form-data">
<table border="1">
	<tr>
		<td>카테고리</td>
		<td>
			<input type="radio" name="topnotice" value="1">중요공지
			<input type="radio" name="topnotice" value="2">서브공지
		</td>
	</tr>
	<tr>
		<td>비공개</td>
		<td><input type="checkbox" name="hide" value=0></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width: 800px;"></td>
	</tr>
	<tr>
		<td>파일첨부</td>
		<td>
			<input type="file" id="photo" name="photo" class="photo">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td style="width:800px;"><textarea id="contents" name="contents" rows="15" cols="180" style="width: 100%; min-width: 100%"></textarea></td>
	</tr>

	<tr align="right">
		<td colspan="2">
			<input type="button" value="저장" id="noticeSub">
			<input type="button" value="취소" onclick="goBack()">
		</td>
	</tr>
</table>
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