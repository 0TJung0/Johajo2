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
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css"/>
	
	</head>
	<body>
		<div>
			<select>
				<option value="all" selected="<c:if test="${dto.selection=='1'}">selected</c:if>">전체</option>
				<option value="info" selected="<c:if test="${dto.selection=='2'}">selected</c:if>">이용안내</option>
				<option value="coupon" selected="<c:if test="${dto.selection=='3'}">selected</c:if>">쿠폰</option>
				<option value="join" selected="<c:if test="${dto.selection=='4'}">selected</c:if>">회원가입/탈퇴</option>
			</select>
			<input type="text" size="30">
			<button type="button">검색</button>
		</div>
		<div class="faq"> 
				<div>
    		<c:forEach var="dto" items="${list}">
	    			<div class="f_div">
					<table id="f_table">
					<tr class="f_tr">
						<td class="f_td">
							<a href="noticefaq_content.do?idx=${dto.idx}&pageNum=${currentPage}">${dto.title}</a>
						</td>
						<td class="f_td">
							<fmt:formatDate value="${dto.writedate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					</table>
					</div>
			</c:forEach>
				<!-- 페이지번호 출력 -->
		<div style="width: 600px; text-align: center; margin-left: 200px;">
			<ul>
				<c:if test="${startPage>1}">
					<li>
						<a href="list.do?pageNum=${startPage-1}">◁</a>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<li>
					<c:if test="${pp==currentPage}">
						<a href="list.do?pageNum=${pp}" style="color: tomato;">${pp}</a>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<a href="list.do?pageNum=${pp}" >${pp}</a>
					</c:if>
				</li>
				</c:forEach>
				
				<c:if test="${endPage<totalPage}">
					<li>
						<a href="list.do?pageNum=${endPage+1}">▷</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
		</div>
    		
	</body>
</html>