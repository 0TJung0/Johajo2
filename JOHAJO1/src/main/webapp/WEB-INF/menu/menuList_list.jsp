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
		border: 1px solid lightgray;
		width:100%;
	}
	.menulist_list li{
		display: inline-block;
	}
	.menulist_img{
		width: 300px;
	}
	.menu_fname{
		font-size: 1.25em;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".menulist_img").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		
		window.open('http://localhost:9000/SpringTilesMybatis/menuselpop.do?idx='+idx, 'menulistPop', 'width=350, height=500, left=700, top=100,resizable=no', '_blank');
	});
	
});

</script>
</head>
<body>

	<div id="menu_list">
		<c:forEach var="dto" items="${list}" >	
				<div class="menulist_list" >
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