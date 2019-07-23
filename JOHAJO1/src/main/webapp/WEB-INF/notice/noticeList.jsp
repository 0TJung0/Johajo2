<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul li{
		list-style: none;
		float: left;
	}
</style>
</head>
<body>
	<div class="l_div1" id="l_div1">
		${totalCount}개의 글
		<input type="text" name="search_notice" size="20"><button type="button" id="btn_search_notice">검색</button>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${dto.idx}</td>
						
					<td align="center">
						<a href="noticelist_content.do?idx=${dto.idx}&pageNum=${currentPage}">${dto.title}</a>
					</td>
					<td align="center">
						<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이지번호 출력 -->
		<div style="width: 600px; text-align: center; margin-left: 200px;">
			<ul>
				<c:if test="${startPage>1}">
					<li>
						<a href="noticelist.do?pageNum=${startPage-1}">◁</a>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<li>
					<c:if test="${pp==currentPage}">
						<a href="noticelist.do?pageNum=${pp}" style="color: tomato;">${pp}</a>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<a href="noticelist.do?pageNum=${pp}" >${pp}</a>
					</c:if>
				</li>
				</c:forEach>
				
				<c:if test="${endPage<totalPage}">
					<li>
						<a href="noticelist.do?pageNum=${endPage+1}">▷</a>
					</li>
				</c:if>
			</ul>
		</div>
</body>
</html>