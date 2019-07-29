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
	//수정 전 메뉴명 셀렉트박스에 뜨게
	$("option").each(function(index, item){
		var appe = '${dto.appe}';
		var soup = '${dto.soup}';
		var main = '${dto.main}';
		var side = '${dto.side}';
		var des = '${dto.des}';
		var drink = '${dto.drink}';
		
		if(appe == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
		if(soup == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
		if(main == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
		if(side == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
		if(des == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
		if(drink == $(item).val())
		{
			$(item).attr("selected", "selected");
		}
	});
	
	$(".appe").change(function(){
		var opt = "";
		$("select option:selected").each(function(index, item)
			{
				opt += $(this).val();
			});
	});
	
	
});


</script>
</head>
<body>
	<form action="courseupdate.do" method="post">
		<table class="cuformtable">
			<tr>
				<th>appetizer</th>
				<td>
					<select name="appe" >
						<c:forEach var="dto" items="${list1}">
							<option class="appe" id="appe" value="${dto.idx}" price="${dto.price}" >${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>soup</th>
				<td>
					<select name="soup" >
						<c:forEach var="dto" items="${list2}">
							<option class="soup" id="soup" value="${dto.idx}" price="${dto.price}">${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>main</th>
				<td>
					<select name="main" >
						<c:forEach var="dto" items="${list3}">
							<option class="main" value="${dto.idx}" price="${dto.price}">${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>side</th>
				<td>
					<select name="side" >
						<c:forEach var="dto" items="${list4}">
							<option class="side" value="${dto.idx}" price="${dto.price}">${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>dessert</th>
				<td>
					<select name="des" >
						<c:forEach var="dto" items="${list5}">
							<option class="des" value="${dto.idx}" price="${dto.price}">${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>drink</th>
				<td>
					<select name="drink" >
						<c:forEach var="dto" items="${list6}">
							<option class="drink" value="${dto.idx}" price="${dto.price}">${dto.fname},${dto.price}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>tot_pri</th>
				<td><input type="text" name=tot_pri value="${dto.tot_pri}"></td>
			</tr>
			<tr>
			    <th>course_name</th>
				<td>
					<input type="text" name="course_name" value="${dto.course_name}">
				</td>
			</tr>
			<tr>
				<th>공개 여부</th>
				<td>
					<c:if test="${dto.show==1}">
						<input type="radio" value="1" name="show" checked="checked">공개
						<input type="radio" value="0" name="show">비공개
					</c:if>
					<c:if test="${dto.show==0}">
						<input type="radio" value="1" name="show" >공개
						<input type="radio" value="0" name="show" checked="checked">비공개
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idx" value="${dto.idx}">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
