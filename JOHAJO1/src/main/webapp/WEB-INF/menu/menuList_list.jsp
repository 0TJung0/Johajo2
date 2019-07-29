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
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/>
<script type="text/javascript">
$(function(){
	$(".menulist_img").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		window.open('http://localhost:9000/SpringTilesMybatis/menuselpop.do?idx='+idx, 'menulistPop', 'width=500, height=650, left=700, top=50,resizable=no,', '_blank');
	});
	
});

</script>
</head>
<body>

	<div id="menu_list">
		<c:forEach var="dto" items="${list}" >	
				<div class="menulist_list"  >
					<ul>
						<li><img class="menulist_img" src="http://localhost:9000/SpringTilesMybatis/menuImg/${dto.imgname}" idx="${dto.idx}" ></li>
						
						<li class="menu_fname">&nbsp;&nbsp;&nbsp;<b>${dto.fname}</b></li>
						
						<li><button type="button" onclick="location.href='menuupdateform.do?idx=${dto.idx}'">수정</button></li>
						<li><button type="button" onclick="location.href='menudelete.do?idx=${dto.idx}&kind=${dto.kind}'">삭제</button></li>
					</ul>
				</div>
		</c:forEach>
		
	</div>
</body>
</html>