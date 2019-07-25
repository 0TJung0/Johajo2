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
	
	<script type="text/javascript">
	$(function () {	
		tab('#tab',0);	
	});

	function tab(e, num){
	    var num = num || 0;
	    var menu = $(e).children();
	    var con = $(e+'_con').children();
	    var select = $(menu).eq(num);
	    var i = num;

	    select.addClass('on');
	    con.eq(num).children().show();

	    menu.click(function(){
	        if(select!==null){
	            select.removeClass('on');
	            con.eq(i).children().hide();
	        }

	        select = $(this);	
	        i = $(this).index();

	        select.addClass('on');
	        con.eq(i).children().show();
	    });
	}
	</script>
	</head>
	<body>
		<ul class="tab" id="tab">
		    <li class="e_li">진행중인 이벤트</li>
		    <li class="e_li">마감</li>	
		</ul>
		<div class="tab_con" id="tab_con">
    		<div>
    		<c:forEach var="dto" items="${list}">
    		<div class="e_div">
				<table>
					<tr>
					<td align="center">
						<img id="event_img" src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg" 
    			onclick="location.href='noticeEvent_content.do?idx=${dto.idx}&pageNum=${currentPage}'">
					</td>
					<td align="center">
						<a href="noticeEvent_content.do?idx=${dto.idx}&pageNum=${currentPage}">${dto.title}</a>
					</td>
					<td align="center">
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
    
    
   			<!-- 마감 이벤트 -->
    			<div>
			    
		    		<div class="e_div" id="e_div2">
		    			<table border="1">
		    				<tr>
		    					<th>번호</th>
		    					<th>이벤트 명</th>
		    					<th>이벤트 기간</th>
		    					<th>당첨자 발표일</th>
		    				</tr>
		    				<tr>
		    					<td>1</td>
		    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
		    					<td>2019.06.29 ~ 2019.07.04</td>
		    					<td>2019.07.08</td>
		    				</tr>
		    			</table>
		    		</div>
		   		</div>	
	
		</div>
		    	
		
	</body>
</html>