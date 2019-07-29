<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
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

	<div id="notice_dispaly">
		<span class="logo mt100">EVENT</span> <span class="icon map5-1"></span>

		<div class="eventTab">
			<ul class="tab" id="tab">
				<li class="e_li">진행중인 이벤트</li>

				<li class="e_li">마감된 이벤트</li>
			</ul>
		</div>
		

		<div class="tab_con" id="tab_con">
    		<div>
    			<c:forEach var="dto" items="${alist}">
		    		<div class="e_div">
		    			<div class="e_data">
			    			<ul>
			    				<li><img id="event_img" src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg" onclick="location.href='noticeEvent_content.do?idx=${dto.idx}&pageNum=${currentPage}'"></li>
			    				<li>
			    					<div class="e_title">
			    						<span>${dto.title}</span>
			    						<span class="date"><fmt:formatDate value="${dto.writedate}" pattern="yyyy-MM-dd"/></span>
			    						<%-- <span class="click"><a href="noticeEvent_content.do?idx=${dto.idx}&pageNum=${currentPage}">자세히보기</a></span> --%>
			    						<span class="click"><a href="noticeEvent_content.do?idx=${dto.idx}&pageNum=1">자세히보기</a></span>
			    						
			    					</div>
			    					
			    				</li>
			    				
			    			</ul>
		    			</div>
		    		</div>	
				</c:forEach>
				
				<!--페이징  -->
				<div class="paging text-center">
					<ul class="pagination">
						<c:if test="${startPage > 1 }">
							<li><a href="myqnaList.do?pageNum=${startPage-1}&idx=${log_idx}">◀</a></li>
						</c:if>
						<c:forEach var="pp" begin="${startPage}" end="${endPage}">
							<c:if test="${pp==currentPage }">
								<li><a href="myqnaList.do?pageNum=${pp}&idx=${log_idx}" style="color:red;">${pp}</a></li>
							</c:if>
							<c:if test="${pp!=currentPage }">
								<li><a href="myqnaList.do?pageNum=${pp}&idx=${log_idx}">${pp}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage<totalPage }">
							<li><a href="myqnaList.do?pageNum=${endPage+1}&idx=${log_idx}">▶</a></li>
						</c:if>
					</ul>
				</div>
				
    		</div>
    
    
  			<!-- 마감 이벤트 -->
   			<!-- <div>
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
	    				<tr>
	    					<td>1</td>
	    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
	    					<td>2019.06.29 ~ 2019.07.04</td>
	    					<td>2019.07.08</td>
	    				</tr>
	    				<tr>
	    					<td>1</td>
	    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
	    					<td>2019.06.29 ~ 2019.07.04</td>
	    					<td>2019.07.08</td>
	    				</tr>
	    				<tr>
	    					<td>1</td>
	    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
	    					<td>2019.06.29 ~ 2019.07.04</td>
	    					<td>2019.07.08</td>
	    				</tr>
	    				<tr>
	    					<td>1</td>
	    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
	    					<td>2019.06.29 ~ 2019.07.04</td>
	    					<td>2019.07.08</td>
	    				</tr>
	    				<tr>
	    					<td>1</td>
	    					<td><a href="event_lotto.do">STEAK ACADEMY</a></td>
	    					<td>2019.06.29 ~ 2019.07.04</td>
	    					<td>2019.07.08</td>
	    				</tr>
	    				
	    			</table>
	    		</div>
	   		</div> -->	
		</div>
	</div>
</body>
</html>