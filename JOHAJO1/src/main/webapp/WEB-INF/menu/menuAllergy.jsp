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
	<link href='http://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'> 
	<style type="text/css">
		a,b{font-family: Nanum Gothic;}
	</style>
	<style type="text/css">
		
		.menuatable li{
			padding: 1em;
    		background: white;
    		text-align: center;
    		list-style: none;
    		box-shadow: 1px 1px 5px -2px gray;
		}
		.menuatable ul{
			margin-bottom: 10px;
			width: 60%;
		}
		.menutable{
			display: block;
		}
		.disp{
			position: relative;
		    bottom: 80px;
    		left: 500px;
		    width: 20%;
			box-shadow: 1px 1px 5px -2px gray;
			background: white;
			padding: 12px;
			display: none;
		}
		#aldiv{
			overflow:hidden;
			background:#F5F5F5;
			margin-bottom: 100px;
		}
		
		.allist{
			font-size: 350%;
			text-align: center;
			padding : 100px;
		}
		.allimg{
			width: 50px;
		}
		
		.alcont{
			margin-left : 150px;
			margin-right: 155px;
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
 		 	border-bottom : 1px solid #bdbdbd;
		}
		
		#altabs li b{
			color : #bdbdbd;
		}
		#altabs a{
			position: relative;
		    padding: 1em 1em;
		    float: left;
		    text-decoration: none;
		    width: 129px;
		    text-align: center;
		}
		#altabs a:hover,#altabs a:focus{
		  	color : black;
		  	text-decoration: none;
		}
		#altabs a:focus{
		    outline: 0;
		    color : #231f20;
		}
		#altabs a:visited{
			content:'';
			position:absolute;
			z-index: 1;
			top: 0;
			right: -.5em;  
			bottom: 0;
			width: 1em; 
			color : #bdbdbd;
		}
		#altabs #current a{
		  z-index: 3;
		  border-bottom : solid #231f20;
		}
		#altabs #current b{
		  color : #231f20;
		}
		
		/* ------------------------------------------------- */
		
		#alcontent{
		    padding: 2em;
		    padding-left:5em;
		    padding-right : 5em;
		    width: 100%;
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
		$(".menuatable li").click(function(){
			$(".disp").show();
			var f = $(this).val();
			var result = $.ajax({
				type:"post",
				url:"foodselect.do",
				data:{"f":f},
				success:function(redata){
					var str="";
					$(redata).find("data").each(function(){
					var s = $(this);
					var allergy = s.find("aname").text();
					var a = allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류';
					
						str+="<b>"+a+"</b>"+"&nbsp;";
						
					});
					$(".disp").html(str);
					
				},
				statusCode:{
					404:function(){
						alert("해당 파일을 찾을수 없습니다");
					},
					500:function(){
						alert("서버 코드 오류");
					}
				}
			});
		});
	});
	
	</script>
	</head>
	<body>
			<button type="button" onclick="location.href='allergylist.do'">관리</button>
			<button type="button" onclick="location.href='allergyadd.do'">추가</button>
		<div id="aldiv">	
			<div class="allist"> 
				<b>ALLERGY</b><br>
				<img class="allimg" src="image/allergy.png">
			</div>
			<div class="alcont">
				<ul id="altabs">
					<c:forEach var="dto" items="${kind}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'APPETIZER':mkindnum==2?'SOUP':mkindnum==3?'MAIN':mkindnum==4?'SIDE':mkindnum==5?'DESSERT':'DRINK'}"/>
						    <li><a href="#" kind="${mkindnum}"><b>${mkind}</b></a></li>
					</c:forEach>
				</ul>
				
				<div id="alcontent"> 
					    <div id="1">
				        	<span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==1}">
										<ul>
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
					    <div id="2">
					       	<span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==2}">
										<ul class="alltr">
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>	
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
					    <div id="3">
					       <span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==3}">
										<ul class="alltr">
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>	
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
					    <div id="4">
					        <span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==4}">
										<ul class="alltr">
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>	
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
					    <div id="5">
					        <span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==5}">
										<ul class="alltr">
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>	
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
					    <div id="6">
					      <span class="menuatable">
				        		<c:forEach var="dto" items="${total}">
				        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
				        			<c:if test="${mkindnum==6}">
										<ul class="alltr">
											<li value="${dto.f}"><b>${dto.fname}</b></li>
										</ul>	
									</c:if>
				        		</c:forEach>
				        	</span>
				        	<span class="disp"></span>
					    </div>
				</div>
			</div>
		</div>
	</body>
</html>