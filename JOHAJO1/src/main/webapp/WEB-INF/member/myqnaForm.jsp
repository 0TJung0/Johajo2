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
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage_qna.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/500');
    });
    $('#content').keyup();
});

</script>
</head>
<body>
   <div class="content_qna">
	   <form action="myqnaInsert.do" method="post">
	   <input type="hidden" name="anw" value="0">
	   <input type="hidden" name="mem_f" value="${log_idx}">
	   <input type="hidden" name="p_idx" value="${p_idx}" />
	   <div class="qnaform">
		   <div class="category">
		   	<span>문의 유형</span>
		   	<select name="selection">
		   		<option value="1" selected="selected">예약</option>
		   		<option value="2">취소/환불</option>
		   		<option value="3">할인쿠폰/포인트</option>
		   		<option value="4">메뉴관련</option>
		   		<option value="5">회원정보</option>
			</select>
		   </div>
		  <div>
		   	<input type="text" name="title" id="title" placeholder="제목" maxlength="40" autofocus="autofocus" required="required">
		  </div> 	
		  <div>
		   	<textarea name="content" id="content" maxlength="500" placeholder="500자 이내로 입력해주세요" 
		   	autofocus="autofocus" required="required" style="height:180px;"></textarea>
		   	<span id="counter">###</span>
		  </div>
		  <div class="btn">
		   <button type="button" class="cancel" onclick="location.href='myqnaList.do?idx=${log_idx}'">취소</button>
		   <button type="submit" class="btnwrite">문의하기</button>
	   	  </div>
	   </div>
	   
	   </form>
   </div>
</body>
</html>