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
		   <table>
			<tr>
				<th>
					${dto.title}
					<fmt:formatDate value="${dto.writedate}" pattern="yyyy-MM-dd"/>
				</th>
			</tr>
			<tr>
				<td>
					<span>${dto.contents}</span>
				</td>
			</tr>
		</table>
		
		<div>
			<button type="button" onclick="location.href='noticefaq.do?pageNum=${pageNum}'">목록</button>
		</div>
		</div>	
	</body>
</html>