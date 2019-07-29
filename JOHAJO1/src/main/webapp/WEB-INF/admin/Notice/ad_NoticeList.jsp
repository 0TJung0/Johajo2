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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>     
<style>
	ul li{
		list-style: none;
		float: left;
	}
	div.l_div1{
		overflow: auto;
		height: 500px;
		float: left;
		margin: 0px 0px 0px 100px;
	}
	div#Adnotice_List,div#Adfaq_List,div#Adevent_List{
		height: 600px;
		border: 1px solid gray;
		overflow: auto;
	}
	div#movebutton{
		position: fixed;
		left:3%;
		top:40%;
	}
</style>
<script type="text/javascript">
	function fnMove(move){
		var offset = $("div#"+move).offset();
		$('html,body').animate({scrollTop:(offset.top-$(window).height()*0.15)},400);
	}
	function insertCoupon()
	{
		var mem_idx=$(".selectId").val();
		var eve_idx=$(".selectEvent").val();
		location.href='insertCouponMember.do?mem_idx='+mem_idx+"&eve_idx="+eve_idx;
		alert(mem_idx+","+eve_idx);
	}
</script>
</head>
<body>
<div id="movebutton">
	<button onclick="fnMove('Adnotice_List')">공지사항페이지로 이동</button><br>
	<button onclick="fnMove('Adfaq_List')">FaQ 페이지로 이동</button><br>
	<button onclick="fnMove('Adevent_List')">이벤트 페이지로 이동</button>
</div>
<div id="Adnotice_List">
<button onclick="location.href='notice_insertform.do'">글 쓰기</button>
	<div class="l_div1">
		<table border="1">
			<caption>공개 공지사항</caption>
			<tr>
				<th>제목</th>
				<th>작성일</th>
				<th>관리</th>
				<th>중요</th>
			</tr>
			<c:forEach var="ndto" items="${nlist}" varStatus="index">
				<c:if test="${ndto.hide==1}">
				<tr>
					<td align="center">
						<a href="ad_noticeContent.do?idx=${ndto.idx}">${ndto.title}</a>
					</td>
					<td align="center">
						<fmt:formatDate value="${ndto.writeday}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<button onclick="location.href='changeNoticeState.do?idx=${ndto.idx }'">비공개</button>
					</td>
					<td>${ndto.topnotice }</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	
		<div class="l_div1" >
		<table border="1">
			<caption>비공개 공지사항</caption>
			<tr>
				<th>제목</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
			<c:forEach var="ndto" items="${nlist}" varStatus="index">
				<c:if test="${ndto.hide==0}">
				<tr>	
					<td align="center">
						<a href="ad_noticeContent.do?idx=${ndto.idx}">${ndto.title}</a>
					</td>
					<td align="center">
						<fmt:formatDate value="${ndto.writeday}" pattern="yyyy-MM-dd"/>
					</td>
					<td colspan="2">
						<button type="button" onclick="location.href='noticeUpdataForm.do?idx=${ndto.idx }'">수정</button>
						<button type="button" onclick="location.href='noticedelete.do?idx=${ndto.idx }'">삭제</button>
						<button onclick="location.href='changeNoticeState.do?idx=${ndto.idx }'">공개</button>
					</td>
					<td>${ndto.topnotice }</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</div>
<div id="Adfaq_List">
<button onclick="location.href='FaQInsertForm.do'">글 쓰기</button>
	<div class="l_div1">
		<table border="1">	
			<caption>공개 FaQ</caption>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
			<c:forEach var="fdto" items="${flist}">
			<c:if test="${fdto.hide==1 }">
				<tr>
					<td>
						<c:if test="${fdto.kind==1}">회원</c:if>
						<c:if test="${fdto.kind==2}">쿠폰</c:if>
						<c:if test="${fdto.kind==3}">예약</c:if>
					</td>
					<td><a href="ad_FaQContent.do?idx=${fdto.idx }">${fdto.title}</a></td>
					<td>
						<fmt:formatDate value="${fdto.writeday }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<button onclick="location.href='FaQChangeState.do?idx=${fdto.idx }&hide=${fdto.hide }'">비공개</button>
					</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="l_div1">
		<table border="1">	
			<caption>비공개 FaQ</caption>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
			<c:forEach var="fdto" items="${flist}">
			<c:if test="${fdto.hide==0 }">
				<tr>
					<td>
						<c:if test="${fdto.kind==1}">회원</c:if>
						<c:if test="${fdto.kind==2}">쿠폰</c:if>
						<c:if test="${fdto.kind==3}">예약</c:if>
					</td>
					<td><a href="ad_FaQContent.do?idx=${fdto.idx }">${fdto.title}</a></td>
					<td>
					<fmt:formatDate value="${fdto.writeday }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<button onclick="location.href='FaQChangeState.do?idx=${fdto.idx }&hide=${fdto.hide }'">공개</button>
						<button onclick="location.href='FaQDelete.do?idx=${fdto.idx}'">삭제</button>
						<button onclick="location.href='FaQUpdataForm.do?idx=${fdto.idx}'">수정</button>
					</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</div>
<div id="Adevent_List">
	<button onclick="location.href='EventInsertForm.do'">이벤트 추가</button>
	<button onclick="insertCoupon()" class="couponBtn">쿠폰 지급</button>
	<select class="selectId">
		<c:forEach var="mlist" items="${mlist }">
			<option value="${mlist.idx }">${mlist.name },${mlist.id}</option>
		</c:forEach>
	</select>
	<select class="selectEvent">
		<c:forEach var="adto" items="${alist }">
			<option value="${adto.idx }">${adto.title }</option>
		</c:forEach>
	</select>
	<table border="1">
		<caption>진행중인 이벤트</caption>
		<tr>
			<th>제목</th>
			<th>작성일</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="adto" items="${alist }">
			<tr>
				<td><a href="ad_eventContent.do?idx=${adto.idx }">${adto.title }</a></td>
				<td>${adto.writedate}</td>
				<td>${adto.startday }</td>
				<td>${adto.endday }</td>
				<td>
					<button onclick="location.href='deleteEvent.do?idx=${adto.idx}'">삭제</button>
					<button onclick="location.href='updateEventForm.do?idx=${adto.idx}'">수정</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table border="1">
		<caption>마감된 이벤트</caption>
		<tr>
			<th>제목</th>
			<th>작성일</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="undto" items="${unlist }">
			<tr>
				<td><a href="ad_eventContent.do?idx=${undto.idx }">${undto.title }</a></td>
				<td>${undto.writedate}</td>
				<td>${undto.startday }</td>
				<td>${undto.endday }</td>
				<td>
					<button onclick="location.href='deleteEvent.do?idx=${undto.idx}'">삭제</button>
					<button onclick="location.href='updateEventForm.do?idx=${undto.idx}'">수정</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table border="1">
		<caption>준비중 이벤트</caption>
		<tr>
			<th>제목</th>
			<th>작성일</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="redto" items="${relist }">
			<tr>
				<td><a href="ad_eventContent.do?idx=${redto.idx }">${redto.title }</a></td>
				<td>${redto.writedate}</td>
				<td>${redto.startday }</td>
				<td>${redto.endday }</td>
				<td>
				<button onclick="location.href='deleteEvent.do?idx=${redto.idx}'">삭제</button>
				<button onclick="location.href='updateEventForm.do?idx=${redto.idx}'">수정</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>