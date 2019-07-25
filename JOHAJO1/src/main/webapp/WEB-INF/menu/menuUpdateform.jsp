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
<style type="text/css">
	th,td{
		border: 1px solid gray;
	}
	#imgname_second>img{
		max-width: 200px;
	}
</style>
<script>
// input file 이미지 미리보기 함수
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

$(function() {
	$("option").each(function(index, item) {
		var kind = '${dto.kind}';
		if(kind==$(item).val()) {
			$(item).attr("selected", "selected");
		}
	});
});
</script>
</head>
<body>
	<form action="menuupdate.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>종류</th>
				<td>
					<select name="kind">
						<option value="1">appetizer</option>
						<option value="2">soup</option>
						<option value="3">main</option>
						<option value="4">side</option>
						<option value="5">dessert</option>
						<option value="6">drink</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><input type="text" name="fname" value="${dto.fname}"></td>
			</tr>
			<tr>
				<th>칼로리</th>
				<td><input type="text" name="calorie" value="${dto.calorie}"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
				<img src="http://localhost:9000/SpringTilesMybatis/menuImg/${dto.imgname}">
				<br>
				<input type="text" value="${dto.imgname}" readonly="readonly">
				<div id="imgname_second"></div>
				<input id="ex_file" type="file" onchange="previewImage(this, 'imgname_second');" name="upfile"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<th>원산지</th>
				<td><input type="text" name="origin" value="${dto.origin}"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name=idx value="${dto.idx}">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
