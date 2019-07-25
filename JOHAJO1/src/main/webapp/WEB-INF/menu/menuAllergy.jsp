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
		#aldiv{
			margin-top: 10px;
			margin-left:100px;
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
			padding: .5em 1.5em;
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
		
		#content{
			background: #fff;
		    padding: 2em;
			height: 220px;
			position: relative;
			z-index: 2;	
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
	        $('#' + $(this).attr('aname')).fadeIn(); //활성화된 탭만 보이도록
	    });
	});
	
	$(function(){
		$("#altabs li").click(function(){
			var aname = $(this).attr("aname");
			console.log(aname);
		});
	});
	</script>
	</head>
	<body>
		<div id="aldiv">
			<button type="button">관리</button>
			<c:forEach var="a" items="${list}">
				<ul id="altabs">
				    <li><a href="#" aname="${a.aname}">${a.aname==1?전체}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==10?난류}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==11?우유}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==2?대두}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==3?밀}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==4?돼지고기}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==5?소고기}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==6?닭고기}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==7?전체}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==8?토마토}</a></li>
				    <li><a href="#" aname="${a.aname}">${a.aname==9?조개류}</a></li>
				</ul>	
			</c:forEach>
			
			
			<div id="alcontent"> 
			    <div id="11">
			        <c:forEach var="dto" items="${list}">
			        	<table>
			        		<tr>
			        			<td>${dto.aname} , ${dto.f}</td>
			        		</tr>
			        	</table>
			        </c:forEach>
			    </div>
			    <div id="1">
			        <c:forEach var="dto" items="${list}">
			        	<table>
			        		<tr>
			        			<td>${dto.aname} ${dto.f}</td>
			        		</tr>
			        	</table>
			        </c:forEach>
			    </div>
			    <div id="2">
			        우유
			    </div>
			    <div id="3">
			        대두
			    </div>
			    <div id="4">
			        밀
			    </div>
			    <div id="5">
			        돼지고기
			    </div>
			    <div id="6">
			        소고기
			    </div>
			    <div id="7">
			        닭고기
			    </div>
			    <div id="8">
			        토마토
			    </div>
			    <div id="9">
			        오징어
			    </div>
			    <div id="10">
			        조개류
			    </div>
			</div>
		</div>
	</body>
</html>