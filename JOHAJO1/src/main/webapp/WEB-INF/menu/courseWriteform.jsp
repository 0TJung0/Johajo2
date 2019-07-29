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
		
		$("#appe").change(function(){
			var s = $("select option:selected").attr('price');
			console.log(s);
			
		});
		
		/* var appe = ""; var soup = ""; var main = "";
		var side = ""; var des = ""; var drink = "";
		
		
		$(".appe").change(function(){
			n = $(this).attr("selected","selected");
			appe = $(n).attr('price');
			console.log(appe);
		}); */
		/* 
		$(".soup").change(function(){
			soup = $("select option:selected").attr('price');
			console.log(soup+"soup");
		});
		$(".main").change(function(){
			main = $("select option:selected").attr('price');
			console.log(main+"main");
		}); 
		$(".side").change(function(){
			side = $("select option:selected").attr('price');
			console.log(side+"side");
		});
		$(".des").change(function(){
			des = $("select option:selected").attr('price');
			console.log(des+"des");
		});
		$(".drink").change(function(){
			drink = $("select option:selected").attr('price');
			console.log(drink+"drink");
		}); */
	});
	
	
</script>
</head>
<body>
	<form action="coursewrite.do" method="post">
		<table class="cwformtable">
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
				<td><input type="text" name=tot_pri ></td>
			</tr>
			<tr>
			    <th>course_name</th>
				<td>
					<input type="text" name="course_name">
				</td>
			</tr>
			<tr>
				<th>공개 여부</th>
				<td>
				<input type="radio" value="1" name="show">공개
				<input type="radio" value="0" name="show">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>