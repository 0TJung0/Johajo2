<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menulist_list{
		border: 1px solid gray;
		width:100%;
	}
	.menulist_list li{
		display: inline-block;
	}
	#menulist_img{
		width: 300px;
		height: 80%;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".menulist_img").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		var link = document.location.href;
		console.log(link);
		window.open('http://localhost:9000/JOHAJO/menuselpop.do?idx='+idx, 'menulistPop', 'width=350, height=500, left=700, top=100,resizable=no', '_blank');
	});
	
});

</script>
</head>
<body>

	<div id="menu_list">
		<c:forEach var="dto" items="${list}" >	
				<div class="menulist_list" >
					<ul>
						<li><img id="menulist_img" class="menulist_img" src="./image/menu04.jpg" idx="${dto.idx}" ></li>
						<li>${dto.fname}</li>
						<li>${dto.price} ${dto.idx}${dto.kind }</li>
						<li><button type="button" onclick="location.href='menuupdateform.do?idx=${dto.idx}'">수정</button></li>
						
						<li><button type="button" onclick="location.href='menudelete.do?idx=${dto.idx}&kind=${dto.kind}'">삭제</button></li>
					</ul>
				</div>
		</c:forEach>
		
	</div>
</body>
</html>