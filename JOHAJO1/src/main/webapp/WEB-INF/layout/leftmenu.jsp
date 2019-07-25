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
	ul.leftmenu li{
		list-style: none;
		border: 3px solid black;
		padding: 15px;
		background: pink;
		border-radius:30px;
		margin-bottom: 5px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<ul class="leftmenu">
	<li>
		<a href="${root}/main.do">HOME</a>
	</li>
	<li>
		<a href="${root}/member/form.do">회원가입</a>
	</li>
	<li>
		<a href="${root}/board/list.do">게시판</a>
	</li>
	<li>
		<a href="${root}/guest/list.do">방명록</a>
	</li>
</ul>
</body>
</html>