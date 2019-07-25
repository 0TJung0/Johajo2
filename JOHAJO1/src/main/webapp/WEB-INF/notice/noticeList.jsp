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
	tr.notice_content{
		display: none;
	}
	.ContentShow{
		display: block;
	}
	tr.notice_title{
		padding:0px;
		width: 80%;
		text-align: center;
		cursor: pointer;
		border-bottom: 0.5px solid gray;
	}
	table tr.notice_content{
		background-color: #ffffff;
		text-align: left;
		border-bottom: 0.5px solid gray; 
	}
	div#notice_dispaly{
		margin-left: 10%;
		margin-top: 5%;
	}
</style>
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
		<table>
			<c:forEach var="dto" items="${list }" varStatus="index">
				<tr class="notice_title" title="${index.index }">
					<td width="10%">${index.count }</td>
					<td width="75%">${dto.title }</td>
					<td>
						<fmt:formatDate value="${dto.writeday}"/>
					</td>
				</tr>
 				<tr class="notice_content">
					<td colspan="3" width="20%">${dto.contents }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>