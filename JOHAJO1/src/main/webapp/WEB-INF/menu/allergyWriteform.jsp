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
	<link href='http://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'> 
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/allergy.css"/>
	</head>
	<body>
			<div class="alwritediv">
			<b class="alupdateb">관리자용 : 알레르기 추가</b><br>
			<form action="allergywrite.do" method="post">
				<table class="awformtable">
				<tr>
					<th>메뉴명</th>
					<td>
						<select name="f" class="alwrite">
							<c:forEach var="f" items="${mlist}">
								<option value="${f.idx}">${f.fname}
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td>
						<c:forEach var="a" items="${alist}">
						<c:set var="allergy" value="${a.aname}"></c:set>
						<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
						:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
							<input type="radio" class="writechk" name="aname" value="${allergy}">${allergyn}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장" id="insertal">
					</td>
				</tr>
			</table>
			</form>
			</div>
	</body>
</html>