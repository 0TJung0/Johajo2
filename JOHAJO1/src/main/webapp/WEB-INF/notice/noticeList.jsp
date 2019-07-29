<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css">
<script type="text/javascript">
	$(function(){
		$("tr.notice_title").click(function(){
			
			if($(this).css("background-color")=="rgb(128, 128, 128)"){
				$(this).css("background-color","#ffffff");
			}
			if($(this).css("background-color")=="#ffffff"){
				$(this).css("background-color","gray");
			}
			var index=$(this).attr("title");
			$("tr.notice_content").eq(index).toggle();
		});
	});
	
	
</script>
</head>
<body>
	<div id="notice_dispaly">
	<span class="logo mt100">NOTICE</span>
	<span class="icon map5-1"></span>
		<table>
			<c:forEach var="dto" items="${list }" varStatus="index">
				<tr class="notice_title" title="${index.index }">
					<td width="10%">${index.count }</td>
					<td width="70%">${dto.title }</td>
					<td>
						<fmt:formatDate value="${dto.writeday}"/>
					</td>
					
				</tr>
 				<tr class="notice_content">
					<td colspan="3" width="20%">${dto.contents }</td>
				</tr>
				
					
					
			</c:forEach>
		</table>
		
		<div class="noticebtn1">
			<a href="#">LOAD MORE</a>
		</div>
	</div>
</body>
</html>