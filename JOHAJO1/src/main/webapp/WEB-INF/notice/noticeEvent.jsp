<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link type="text/css" rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice.css" />

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
		<li class="e_li">마감된 이벤트</li>
	</ul>
	<div class="tab_con" id="tab_con">
		<div>
			<c:forEach var="adto" items="${alist}">
				<div class="e_div">
					<table>
						<tr>
							<td align="center"><img id="event_img"
								src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"
								onclick="location.href='noticeEvent_content.do?idx=${adto.idx}">
							</td>
							<td align="center"><a href="noticeEvent_content.do?idx=${adto.idx}">${adto.title} ◎</a>
							</td>
							<td align="center">${adto.startday } ~ ${adto.endday }
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		
		<!-- 마감 이벤트 -->

		<div>
			<div class="e_div" id="e_div2">
				<c:forEach var="undto" items="${unlist }">
				<table border="1">
					<tr>
						<td align="center"><img id="event_img"
							src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg">
						</td>
						<td align="center">${undto.title}</td>
						<td align="center"><fmt:formatDate value="${undto.endday}"/></td>
					</tr>
				</table>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>