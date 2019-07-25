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
<style type="text/css">
	th,td{
		border: 1px solid gray;
	}
</style>


</head>
<body>
	<form action="menuwrite.do" method="post">
		<table>
			<tr>
				<th>종류</th>
				<td>
					<select name="kind">
						<option value="1">appetizer</option>
						<option value="2">soup</option>
						<option value="3">main</option>
						<option value="4">side</option>
						<option value="5">dessert</option>
						<option value="6">drink</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<th>칼로리</th>
				<td><input type="text" name="calorie"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
				<input type="file" name="imgname">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th>원산지</th>
				<td><input type="text" name="origin"></td>
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
