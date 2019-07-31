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
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/course.css"/>
<script type="text/javascript">
	$(function(){
		$("#btndel").click(function(){
			//체크박스 개수
			chkcnt=$(".delchk");
			//console.log("체크박스 개수: " + chkcnt.length);
			selchk=$(".delchk:checked");
			//console.log("선택된 체크박수 개수 : " + selchk.length);
			
			if(selchk.length==0){
				alert("체크박스를 선택해주세요");
				return false;
			}
			
			var idxs=""; //선택한 글에서 num을 얻어서 ,로 연결
			for(i=0;i<chkcnt.length;i++){
				if(chkcnt[i].checked){
					var n=$(".delchk").eq(i).attr("idx");
					idxs+=n+",";
				}
			}
			console.log(idxs);
			idxs=idxs.substring(0, idxs.length-1);
			console.log(idxs); //콤마제거 확인
			
			//컨트롤러 호출
			location.href = "coursechkdelete.do?idxs="+idxs;
		});
	});
</script>
</head>
<body>
	<div class="course_list">
		<button type="button" onclick="location.href='courseinsert.do'">코스 추가</button>
		<button type="button" id="btndel" >코스 삭제</button>
	<br>
	<table class="clisttable">
		<tr>
			<th></th>
			<th>idx</th>
			<th>appe</th>
			<th>soup</th>
			<th>main</th>
			<th>side</th>
			<th>des</th>
			<th>drink</th>
			<th>총 금액</th>
			<th>코스이름</th>
			<th>공개여부</th>
			<th></th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td><input type="checkbox" class="delchk" idx="${dto.idx}"></td>
				<td>${dto.idx}</td>
				<td>${dto.appe}</td>
				<td>${dto.soup}</td>
				<td>${dto.main}</td>
				<td>${dto.side}</td>
				<td>${dto.des}</td>
				<td>${dto.drink}</td>
				<td>${dto.tot_pri }</td>
				<td>${dto.course_name }</td>
				<td>
					<c:if test="${dto.show == 1}">
						공개
					</c:if>
					<c:if test="${dto.show == 0}">
						비공개
					</c:if>
				</td>
				<td>
					<button type="button" onclick="location.href='courseupdateform.do?idx=${dto.idx}'">수정</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
</body>
</html>
