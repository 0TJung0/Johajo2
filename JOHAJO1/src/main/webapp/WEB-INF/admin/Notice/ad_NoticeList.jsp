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
						<a href="noticelist_content.do?idx=${ndto.idx}">${ndto.title}</a>
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
						<a href="noticelist_content.do?idx=${ndto.idx}">${ndto.title}</a>
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
					<td>${fdto.title}</td>
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
					<td>${fdto.title}</td>
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
</div>
</body>
</html>