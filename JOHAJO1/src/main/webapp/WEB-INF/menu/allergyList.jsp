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
		.clisttable tr,.clisttable th,.clisttable td{
			border:1px solid gray;
			
		}
		.clisttable th,.clisttable td{
			padding : 5px;
		}
	
		#allistdiv{
			margin-top: 10px;
			margin-left:50px;
			margin-right: 50px;
		}
		
		/* ------------------------------------------------- */
		
		#allisttabs{
			overflow: hidden;
			width: 100%;
			margin: 0;
			padding: 0;
			list-style: none;
		}
		#allisttabs li{
			float: left;
 		 	margin: 0 .1em 0 0;
 		 	border: 1px solid lightgray;
		}
		#allisttabs a{
			position: relative;
			padding: .2em 1em;
			float: left;
			text-decoration: none;
		}
		#allisttabs a:hover,#allisttabs a:focus{
		  	color : black;
		  	text-decoration: none;
		}
		#allisttabs a:focus{
		    outline: 0;
		    color : black;
		}
		#allisttabs a:visited{
			content:'';
			position:absolute;
			z-index: 1;
			top: 0;
			right: -.5em;  
			bottom: 0;
			width: 1em;
			color : black;
		}
		#allisttabs #current a{
		  z-index: 3;
		  background: lightgray;
		  color : tomato;
		}
		
		/* ------------------------------------------------- */
		
		#allistcontent{
			background: #fff;
		    padding: 2em;
		    height: 
		}
		
	</style>
	<script type="text/javascript">
	$(document).ready(function() {
		//모든 내용 숨김
		$("#allistcontent div").hide();

		//첫 탭만 활성화
		$("#allisttabs li:first").attr("id","current");
		//첫번째 탭 내용만 보이도록
		$("#allistcontent div:first").fadeIn();
	    
	    $('#allisttabs a').click(function(e) {
	        e.preventDefault();        
	        $("#allistcontent div").hide(); //모든 내용 숨기기
	        $("#allisttabs li").attr("id",""); 
	        $(this).parent().attr("id","current"); 
	        $('#' + $(this).attr('kind')).fadeIn(); //활성화된 탭만 보이도록
	    });
	});
	
	$(function(){
		$("#allisttabs li").click(function(){
			var kind = $(this).attr("kind");
			console.log(kind);
		});
	});
	
	$(function(){
		$("#btndel").click(function(){
			//체크박스 개수
			chkcnt=$(".delchk");
			//console.log("체크박스 개수: " + chkcnt.length);
			selchk=$(".delchk:checked");
			//console.log("선택된 체크박수 개수 : " + selchk.length);
			
			if(selchk.length==0){
				alert("체크박스를 선택해주세요");
				return false;
			}
			
			var idxs=""; //선택한 글에서 num을 얻어서 ,로 연결
			for(i=0;i<chkcnt.length;i++){
				if(chkcnt[i].checked){
					var n=$(".delchk").eq(i).attr("idx");
					idxs+=n+",";
				}
			}
			console.log(idxs);
			idxs=idxs.substring(0, idxs.length-1);
			console.log(idxs); //콤마제거 확인
			
			//컨트롤러 호출
			location.href = "allergychkdelete.do?idxs="+idxs;
		});
	});
	</script>
	</head>
	<body>
		<div id="allistdiv">
			
			<button type="button" id="btndel" >알러지 삭제</button>
		
			<ul id="allisttabs">
				<c:forEach var="dto" items="${kind}">
					<c:set var="mkindnum" value="${dto.kind}"></c:set>
					<c:set var="mkind" value="${mkindnum==1?'APPETIZER':mkindnum==2?'SOUP':mkindnum==3?'MAIN':mkindnum==4?'SIDE':mkindnum==5?'DESSERT':'DRINK'}"/>
					    <li><a href="#" kind="${mkindnum}">${mkind}</a></li>
				</c:forEach>
			</ul>
			
			<div id="allistcontent"> 
			    <div id="1">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==1}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="2">
			       <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==2}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="3">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==3}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="4">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==4}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="5">
			       <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==5}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="6">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${total}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						
							<c:if test="${mkindnum==6}">
								<tr>
									<td><input type="checkbox" class="delchk" idx="${dto.f}"></td>
									<td>${dto.fname}</td>
									<td>
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			</div>
		</div>
	</body>
</html>