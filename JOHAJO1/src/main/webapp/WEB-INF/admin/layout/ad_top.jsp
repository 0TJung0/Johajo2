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
<style type="text/css">

	div.topMenu{
		position: relative;
	    width: 100%;
	    margin: 0 auto;
	    padding-top: 30px;
	    float: left;
	}
	div.mainMenu{
		position: relative;
	    width: 100%;
	    /* margin: 0 auto; */
	    float: left;
	}
	div.mainMenu>ul{
		float: right;
	    margin-right: 100px;
	}
	div.mainMenu>ul>li{
		float: left;
		list-style: none;
		padding: 15px 10px;
		
	}
	div.mainMenu>ul>li>span>a{
		padding: 12px 18px 38px;
	    height: 49px;
	    color: #808285;
	    font-size: 17px;
	    line-height: 1;
	    letter-spacing: 1px;
	    font-family: 'Open Sans', 'sans-serif', 'Arial';
	    font-weight: 700;
	
	}
	div.mainMenu ul.sub{
		position: absolute;
	    left: 0;
	    top: 67px;
	    width: 100%;
	    height: 53px;
	    border-top: 1px solid #efefef;
	    border-bottom: 1px solid #efefef;
	    background-color: #fff;
	    text-align: center;
	    padding-left:500px;
	}
	
	div.mainMenu ul.sub.s1{
		padding-left:467px;
	}
	
	div.mainMenu ul.sub.s2{
		padding-left:580px;
	}
	
	div.mainMenu ul.sub.s3{
		padding-left:746px;
	}
	
	div.mainMenu ul.sub.s4{
		padding-left:743px;
	}
	
	
	div.mainMenu ul.sub li{
		float: left;
		list-style: none;
	}
	div.mainMenu ul.sub li>a{
		display: inline-block;
	    padding: 15px 17px 0;
	    height: 49px;
	    color: #808285;
	    font-size: 14px;
	    line-height: 1;
	    letter-spacing: 1px;
	    font-family: 'Open Sans', 'sans-serif', 'Arial';
	    font-weight: 700;
	    
		
	}
	div.mini{
		position: relative;
		width: 100%;
	}
	
	div.mini>span{
		float: right;
		margin-right:100px;
	}
	
	div.mini>span>a{
		padding: 0 4px;
		font-size: 10px;
	}

</style>
</head>
<body>
	<div class="mainMenu">
	<ul>
		<li><span><a href="admain.do">관리자 홈</a></span></li>
		<li><span><a href="ad_MainForm.do">메인관리</a></span></li>
		<li><span><a href="ad_MenuList.do">메뉴관리</a></span></li>
		<li><span><a href="ad_StoreList.do">STORE</a></span></li>
		<li><span><a href="ad_NoticeList.do">NOTICE</a></span></li>
		<li><span><a href="ad_MemberList.do">회원관리</a></span></li>
	</ul>
	</div>
</body>
</html>