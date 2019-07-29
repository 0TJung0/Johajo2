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
	<script type="text/javascript">
		$(function(){
			$("option").each(function(index,item){
				var f = '${dto.f}';
				if(f==$(item).val()){
					$(item).attr("selected","selected");
				}
			});
			$("input").each(function(index,item){
				var aname = '${dto.aname}';
				console.log(aname);
				if(aname==$(item).val()){
					$(item).attr("checked","checked");
				}
			});
			/* ---------------------------------------------- */
			
			$(document).on("change","select.alupdate",function(){
				$.ajax({
					type:"post",
					url:"foodselect.do",
					data:{"f":f},
					success:function(redata){
						var str="";
						$(redata).find("data").each(function(){
							var s = $(this);
							aname = s.find("aname").text();
						});
						$(".alcb").val(aname);
					},
					statusCode:{
						404:function(){
							alert("해당 파일을 찾을수 없어요!!");
						},
						500:function(){
							alert("서버 코드 오류");
						}
					}
				});
			});
		});
	</script>
	</head>
	<body>
		<form action="allergyupdate.do" method="post">
			<table class="awformtable">
				<tr>
					<th>메뉴명,${dto.f }</th>
					<td>
						<select class="alupdate">
							<c:forEach var="dto" items="${list}">
								<option value="${dto.f}">${dto.fname},${dto.f}
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>알레르기 ${dto.idx}</th>
					<td>
						<c:forEach var="dto" items="${alist}">
							<c:set var="allergy" value="${dto.aname}"></c:set>
							<c:set var="allergyn" value="${allergy==1?'전체':allergy==10?'난류':allergy==11?'우유':allergy==2?'대두':allergy==3?'밀'
							:allergy==4?'돼지고기':allergy==5?'소고기':allergy==6?'닭고기':allergy==7?'토마토':allergy==8?'오징어':'조개류'}"></c:set>
								<input class="alcb" type="checkbox" name="aname" value="${dto.aname}">${allergyn},${dto.aname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="idx" value="${dto.idx}">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>