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
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/allergy.css"/>

	<script type="text/javascript">
	$(document).ready(function() {
		//모든 내용 숨김
		$("#alcontent2 div").hide();

		//첫 탭만 활성화
		$("#altabs2 li:first").attr("id","current");
		//첫번째 탭 내용만 보이도록
		$("#alcontent2 div:first").fadeIn();
	    
	    $('#altabs2 a').click(function(e) {
	        e.preventDefault();        
	        $("#alcontent2 div").hide(); //모든 내용 숨기기
	        $("#altabs2 li").attr("id",""); 
	        $(this).parent().attr("id","current"); 
	        $('#' + $(this).attr('aname')).fadeIn(); //활성화된 탭만 보이도록
	    });
	});
	
	$(function(){
		$("#altabs2 li").click(function(){
			var aname = $(this).attr("aname");
			console.log(aname);
		});
	});
	</script>
	</head>
	<body>
		<div id="aldiv2">
			<button type="button" onclick="location.href='allergylist.do'">관리</button>
			<ul id="altabs2">
				<c:forEach var="a" items="${alist}">
					<c:set var="allergy" value="${dto.aname}"></c:set>
					<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
					:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
					    <li><a href="#" aname="${allergy}">${allergyn}</a></li>
				</c:forEach>
			</ul>
			
			<div id="alcontent2"> 
			    
			    <div id="1">
		        	<table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="10">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'" class="mwbtn">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="11">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="2">
			       	<table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="3">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="4">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="5">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="6">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="7">
			       <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="8">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			    <div id="9">
			        <table class="clisttable">
						<tr>
							<th></th>
							<th>kind</th>
							<th>메뉴 idx</th>
							<th>메뉴 유발성분</th>
							<th>메뉴</th>
							<th></th>
						</tr>
									
						<c:forEach var="dto" items="${list}">
						<c:set var="mkindnum" value="${dto.kind}"></c:set>
						<c:set var="mkind" value="${mkindnum==1?'에피타이져':mkindnum==2?'수프':mkindnum==3?'메인요리':mkindnum==4?'사이드메뉴':mkindnum==5?'디저트':'음료'}"></c:set>
						
						<c:set var="allergy" value="${dto.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
						
							<tr>
								<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
								<td>${mkind}</td>
								<td>${dto.f}</td>
								<td>${allergyn}</td>
								<td>${dto.fname}</td>
								<td>
									<button type="button" onclick="location.href='allergyupdateform.do?idx=${dto.f}'">수정</button>
								</td>
							</tr>
						</c:forEach>
					</table>
			    </div>
			</div>
		</div>
	</body>
</html>