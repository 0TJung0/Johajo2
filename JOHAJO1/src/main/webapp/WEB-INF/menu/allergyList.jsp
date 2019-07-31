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
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/allergy.css"/>
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
			<b class="allistb">관리자용 : 유발성분 리스트</b><br>
			<button type="button" id="btndel" class="mwbtn">알러지 삭제</button>
		
			<ul id="allisttabs">
				<c:forEach var="dto" items="${kind}">
					<c:set var="mkindnum" value="${dto.kind}"></c:set>
					<c:set var="mkind" value="${mkindnum==1?'APPETIZER':mkindnum==2?'SOUP':mkindnum==3?'MAIN':mkindnum==4?'SIDE':mkindnum==5?'DESSERT':'DRINK'}"/>
					    <li><a href="#" kind="${mkindnum}"><b>${mkind}</b></a></li>
				</c:forEach>
			</ul>
			
			<div id="allistcontent"> 
			    <div id="1">
			        <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="2">
			       <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="3">
			        <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="4">
			        <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="5">
			       <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
									</td>
								</tr>	
							</c:if>
						</c:forEach>
					</table>
			    </div>
			    <div id="6">
			        <table class="alisttable">
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
										<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
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