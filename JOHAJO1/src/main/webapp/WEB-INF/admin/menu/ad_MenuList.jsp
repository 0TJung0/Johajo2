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
<script src="<c:url value="/admin/menu/js/ad_menuScript.js" />"></script>
<script type="text/javascript">
	function menuView_list(){
		var n=$("select").val();
		alert(n);
		MenuList(n);
	}
</script>
</head>
<body>
	<select onchange="menuView_list()">
		<option value="0">목록</option>
	<c:forEach var="menu_dto" items="${klist }">
		<option value="${menu_dto.kind }">
			<c:if test="${menu_dto.kind==1 }">에피타이저</c:if>
			<c:if test="${menu_dto.kind==2 }">스프</c:if>
			<c:if test="${menu_dto.kind==3 }">메인</c:if>
			<c:if test="${menu_dto.kind==4 }">사이드</c:if>
			<c:if test="${menu_dto.kind==5 }">디저트</c:if>
			<c:if test="${menu_dto.kind==6 }">음료</c:if>
		</option>		
	</c:forEach>
	</select>
	<div class="ad_menulist"></div>
</body>
</html>