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
			<button type="button" onclick="location.href='allergylist.do'">관리</button>
			<button type="button" onclick="location.href='allergyadd.do'">추가</button>
			
			<ul id="altabs">
				<li><a href="#" aname="1">전체</a></li>
				<c:forEach var="a" items="${alist}">
					<c:set var="allergy" value="${a.aname}"></c:set>
					<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
					:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
					    <li><a href="#" aname="${allergy}">${allergyn}</a></li>
				</c:forEach>
			</ul>
			
			<div id="alcontent"> 
			    
			    <div id="1">
		        	<table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${total}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
		        			<tr>
			        			<td>${mkind}</td>
								<td>${dto.fname}</td>
		        			</tr>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="10">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==10}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="11">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==11}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="2">
			       	<table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==2}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="3">
			       <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==3}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="4">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==4}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="5">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==5}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="6">
			       <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==6}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="7">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==7}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="8">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==8}">
								<tr>
									<td>${mkind}</td>
									<td>${dto.fname}</td>
								</tr>	
							</c:if>
		        		</c:forEach>
		        	</table>
			    </div>
			    <div id="9">
			        <table class="menuatable">
		        		<tr>
							<th>종류</th>
							<th>메뉴</th>
						</tr>
		        	
		        		<c:forEach var="dto" items="${list}">
		        			<c:set var="mkindnum" value="${dto.kind}"></c:set>
							<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
							
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							
							<c:if test="${allergy==9}">
								<tr>
									<td>${mkind}</td>
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