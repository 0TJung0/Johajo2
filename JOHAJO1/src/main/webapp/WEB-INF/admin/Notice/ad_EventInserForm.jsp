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
	$("#EventSub").click(function(){
		var inputText=oEditors.getById["con"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#EventInsert").submit(); 
	});
	
});

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
	<form action="EventInsert.do" id="EventInsert" method="post"
	enctype="multipart/form-data">
		제목:<input type="text" size="100" name="title"><br>
		시작일:<input type="date" name="startday">
		종료일:<input type="date" name="endday"><br>
		할인률:<input type="number" name="discount_rate"><br>
		쿠폰 사용 기간:<input type="number" name="validity_month"><br>
		타이틀 이미지:
		<div id="imgname_second"></div>
        <input id="ex_file" type="file" onchange="previewImage(this, 'imgname_second');" name="title_img">
		메인 이미지:
		<div id="imgname_second1"></div>
        <input id="ex_file1" type="file" onchange="previewImage(this, 'imgname_second1');" name="main_img">
		내용:
		<textarea rows="18" cols="100" name="con" id="con"></textarea><br>	
		<input type="button" value="저장" id="EventSub">
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