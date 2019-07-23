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
	<form action="coursewrite.do" method="post">
		<table>
			<tr>
				<th>appetizer</th>
				<td>
				<select name="appe">
					<option value="23">컬리플라워를 곁들인 구운 브로콜리</option>
					<option value="24">카프레제 바질 샐러드</option>
					<option value="25">갈릭코타 홀 토마토</option>
					<option value="26">시저 샐러드</option>
					<option value="27">치킨텐더 샐러드</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>soup</th>
				<td>
				<select name="soup">
					<option value="28">단호박 스프</option>
					<option value="29">양송이 스프</option>
					<option value="30">브로콜리 스프</option>
					<option value="31">콘크림 스프</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>main</th>
				<td>
				<select name="main">
					<option value="32">스파이시 씨푸드 알리오 올리오</option>
					<option value="33">토마토 소고기 파스타</option>
					<option value="34">모짜렐라 크림 파스타</option>
					<option value="35">빠네 크리미 어니언 파스타</option>
					<option value="36">뉴욕 스트립 스테이크</option>
					<option value="37">얌스톤 안심 스테이크</option>
					<option value="38">클래식 채끝 스테이크</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>side</th>
				<td>
				<select name="side">
					<option value="39">감자튀김</option>
					<option value="40">구운 통감자</option>
					<option value="41">더운 야채모듬</option>
					<option value="42">치킨 핑거</option>
					<option value="43">비프 퀘사디아</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>dessert</th>
				<td>
				<select name="des">
					<option value="44">아포가토</option>
					<option value="45">당근케이크</option>
					<option value="46">밀크 크레이프</option>
					<option value="47">녹차 아이스크림</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>drink</th>
				<td>
				<select name="drink">
					<option value="48">미네랄 워터</option>
					<option value="49">코카콜라</option>
					<option value="50">오렌지 에이드</option>
					<option value="51">커피</option>
					<option value="52">스텔라 아르투아</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>tot_pri</th>
				<td><input type="text" name=tot_pri></td>
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
