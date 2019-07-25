<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet" >
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div class="layout">
		<div id="top" class="top">
			<tiles:insertAttribute name="top"/>
		</div>
		<div id="main" class="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>

</body>
</html>