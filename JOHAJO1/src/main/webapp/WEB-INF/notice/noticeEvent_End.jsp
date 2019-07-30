<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"href="<%= request.getContextPath() %>/css/notice.css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div id="notice_dispaly">
		<span class="logo mt100">EVENT</span> <span class="icon map5-1"></span>

		<div class="eventTab">
			<ul class="tab" id="tab">
				<li class="e_li" onclick="location.href='noticeevent.do'">진행중인
					이벤트</li>

				<li class="e_li" onclick="location.href='EventEnd.do'">마감된 이벤트</li>
			</ul>
		</div>

		<div class="tab_con" id="tab_con">
			<c:forEach var="dto" items="${list}">
				<div class="e_div">
					<div class="e_data">
						<ul>
							<li><img id="event_img" src="./eventImg${dto.title_img }"></li>
							<li>
								<div class="e_title">
									<span>${dto.title}</span> 
									<span class="date">${dto.endday } 까지</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--페이징  -->
			<div class="paging text-center">
					<ul class="pagination">
						<c:if test="${startPage > 1 }">
							<li><a href="EventEnd.do?pageNum=${startPage-1}">◀</a></li>
						</c:if>
						<c:forEach var="pp" begin="${startPage}" end="${endPage}">
							<c:if test="${pp==currentPage }">
								<li><a href="EventEnd.do?pageNum=${pp}" style="color:red;">${pp}</a></li>
							</c:if>
							<c:if test="${pp!=currentPage }">
								<li><a href="EventEnd.do?pageNum=${pp}">${pp}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage<totalPage }">
							<li><a href="EventEnd.do?pageNum=${endPage+1}">▶</a></li>
						</c:if>
					</ul>
			</div>
	</div>
</body>
</html>