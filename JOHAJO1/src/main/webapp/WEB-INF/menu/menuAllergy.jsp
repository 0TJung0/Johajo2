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
		.menuatable tr,.menuatable th,.menuatable td{
			border:1px solid gray;
		}
		.menuatable th,.menuatable td{
			padding : 5px;
		}
	
		#aldiv{
			margin-top: 10px;
			margin-left:50px;
			margin-right: 50px;
		}
		
		/* ------------------------------------------------- */
		
		#altabs{
			overflow: hidden;
			width: 100%;
			margin: 0;
			padding: 0;
			list-style: none;
		}
		#altabs li{
			float: left;
 		 	margin: 0 .1em 0 0;
 		 	border: 1px solid lightgray;
		}
		#altabs a{
			position: relative;
			padding: .2em 1em;
			float: left;
			text-decoration: none;
		}
		#altabs a:hover,#altabs a:focus{
		  	color : black;
		  	text-decoration: none;
		}
		#altabs a:focus{
		    outline: 0;
		    color : black;
		}
		#altabs a:visited{
			content:'';
			position:absolute;
			z-index: 1;
			top: 0;
			right: -.5em;  
			bottom: 0;
			width: 1em; 
			color : black;
		}
		#altabs #current a{
		  z-index: 3;
		  background: lightgray;
		  color : tomato;
		}
		
		/* ------------------------------------------------- */
		
		#alcontent{
			background: #fff;
		    padding: 2em;
		    height: 
		}
		
	</style>
	<script type="text/javascript">
	$(document).ready(function() {
		//모든 내용 숨김
		$("#alcontent div").hide();
		//첫 탭만 활성화
		$("#altabs li:first").attr("id","current");
		//첫번째 탭 내용만 보이도록
		$("#alcontent div:first").fadeIn();
	    
	    $('#altabs a').click(function(e) {
	        e.preventDefault();        
	        $("#alcontent div").hide(); //모든 내용 숨기기
	        $("#altabs li").attr("id",""); 
	        $(this).parent().attr("id","current"); 
	        $('#' + $(this).attr('kind')).fadeIn(); //활성화된 탭만 보이도록
	    });
	});
	
	$(function(){
		$("#altabs li").click(function(){
			var kind = $(this).attr("aname");
			console.log(kind);
		});
	});
	</script>
	</head>
	<body>
		<div id="aldiv">
			<button type="button" onclick="location.href='allergylist.do'">관리</button>
			<button type="button" onclick="location.href='allergyadd.do'">추가</button>
			
			<ul id="altabs">
				<c:forEach var="dto" items="${kind}">
					<c:set var="mkindnum" value="${dto.kind}"></c:set>
					<c:set var="mkind" value="${mkindnum==1?'APPETIZER':mkindnum==2?'SOUP':mkindnum==3?'MAIN':mkindnum==4?'SIDE':mkindnum==5?'DESSERT':'DRINK'}"/>
					    <li><a href="#" kind="${mkindnum}">${mkind}</a></li>
				</c:forEach>
			</ul>
			
			<div id="alcontent"> 
			    
			    <div id="1">
		        	<table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==1}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="2">
			       	<table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==2}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="3">
			       <table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==3}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="4">
			        <table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==4}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="5">
			        <table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==5}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="6">
			      <table class="menuatable">
		        		<tr>
							<th>메뉴</th>
						</tr>
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
		        			<c:if test="${mkindnum==6}">
								<tr>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			</div>
		</div>
	</body>
</html>