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
	
	function previewImage(targetObj, previewId) {
		 
	    var ext = $(targetObj).val().split('.').pop().toLowerCase();
	 
	    if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
	        alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
	        return;
	    }
	 
	    var preview = document.getElementById(previewId); // 미리보기 div id   
	    var ua = window.navigator.userAgent;
	 
	    if (ua.indexOf("MSIE") > -1) { //ie일때
	 
	        targetObj.select();
	 
	        try {
	            var src = document.selection.createRange().text; // get file full path 
	            var ie_preview_error = document
	                    .getElementById("ie_preview_error_" + previewId);
	 
	            if (ie_preview_error) {
	                preview.removeChild(ie_preview_error); //error가 있으면 delete
	            }
	 
	            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 
	 
	            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
	                    + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
	        } catch (e) {
	            if (!document.getElementById("ie_preview_error_" + previewId)) {
	                var info = document.createElement("<p>");
	                info.id = "ie_preview_error_" + previewId;
	                info.innerHTML = "a";
	                preview.insertBefore(info, null);
	            }
	        }
	    } else { //ie가 아닐때
	        var files = targetObj.files;
	        for ( var i = 0; i < files.length; i++) {
	 
	            var file = files[i];
	 
	            var imageType = /image.*/; //이미지 파일일 경우만 뿌려줌.
	            if (!file.type.match(imageType))
	                continue;
	 
	            var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
	            if (prevImg) {
	                preview.removeChild(prevImg);
	            }
	 
	            var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기때문에 자식 Element를 만듬.
	            img.id = "prev_" + previewId;
	            img.classList.add("obj");
	            img.file = file;
	            
	            preview.appendChild(img);
	 
	            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
	                var reader = new FileReader();
	                reader.onloadend = (function(aImg) {
	                    return function(e) {
	                        aImg.src = e.target.result;
	                    };
	                })(img);
	                reader.readAsDataURL(file);
	            } else { // safari is not supported FileReader
	                //alert('not supported FileReader');
	                if (!document.getElementById("sfr_preview_error_"+ previewId)) {
	                    var info = document.createElement("p");
	                    info.id = "sfr_preview_error_" + previewId;
	                    info.innerHTML = "not supported FileReader";
	                    preview.insertBefore(info, null);
	                }
	            }
	        }
	    }
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
		<td>공개</td>
		<td><input type="checkbox" name="hide" value=1></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width: 800px;" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>파일첨부</td>
		<td><div id="imgname_second"></div>
            <input id="ex_file" type="file" onchange="previewImage(this, 'imgname_second');" name="photo">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td style="width:800px;"><textarea id="contents" name="contents" rows="15" cols="180" style="width: 100%; min-width: 100%"></textarea>
		</td>
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