<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/admin/css/adminMember.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<style type="text/css">
		div.memberList{
		position: relative;
		width: 900px;
		margin: 0 auto;
		display: table;
	}
	
	div.memberList ul{
		margin: 0;
		padding: 0;
		float: left;
		width: 100%;
		border: 1px solid;
	}
	
	
	
	div.memberList ul li{
		float: left;
		list-style: none;
		margin: 0 5px;
		font-size: 15px;
		width: 10%;
		text-align: center;
		line-height: 40px;
		min-height: 25px;
		
		
	}
	
	div.memberList ul li:nth-child(1),
	div.memberList ul li:nth-child(3){
		width: 5%;
	}
	div.memberList ul li:nth-child(2){
		width: 6%;
	}
	div.memberList ul li:nth-child(4){
		width: 8%;
	}
</style>
</head>
<body>
	<div>
		<div>
		
			<div class="memberList">
				<ul>
					<li>idx</li>
					<li>아이디</li>
					<!-- <li>비밀번호</li> -->
					<li>성별</li>
					<li>이름</li>
					
					<li>핸드폰</li>
					<li>이메일</li>
					
					<li>보유포인트</li>
					<li>생일</li>
					<li>가입일</li>
					<li>관리</li>
				</ul>
				<c:forEach var="dto" items="${mlist}">
				<c:set var="gneder" value="${dto.gender==1?'여':'남'}" />
				<ul>
					<li>${dto.idx}</li>
					<li>${dto.id}</li>
					<%-- <li>${dto.password}</li> --%>
					<li>${gneder}</li>
					<li>${dto.name}</li>
					<li>${dto.hp}</li>
					<li>${dto.email}</li>
					
					<li>${dto.point}</li>
					<li>${dto.birth}</li>
					<li>${dto.joindate}</li>
					<li>
						<button onclick="location.href='memberDelete.do?pageNum=${currentPage}&idx=${dto.idx}'">회원탈퇴</button>
						
					</li>
					
				</ul>
				</c:forEach>
			</div> 
			
			
			<!--페이징  -->
			<div class="paging text-center">
				<ul class="pagination">
					<c:if test="${startPage > 1 }">
						<li><a href="ad_MemberList.do?pageNum=${startPage-1}">◀</a></li>
					</c:if>
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${pp==currentPage }">
							<li><a href="ad_MemberList.do?pageNum=${pp}" style="color:red;">${pp}</a></li>
						</c:if>
						<c:if test="${pp!=currentPage }">
							<li><a href="ad_MemberList.do?pageNum=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage<totalPage }">
						<li><a href="ad_MemberList.do?pageNum=${endPage+1}">▶</a></li>
					</c:if>
				</ul>
			</div>  
		</div>
	
	</div>
	
</body>
</html>