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
<link rel="stylesheet" href="css/member.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

<script type="text/javascript">
</script>
</head>
<body>
<%-- <c:out value="${log_res}" /> --%>
<c:if test="${log_res =='false'}">
<script type="text/javascript">
	alert("아이디아 비밀번호를 정확히 입력해주세요");
</script>
</c:if>
<%
	session.removeAttribute("log_res");
%>

<c:out value="${mupdate}" />
<c:if test="${mupdate =='true'}">
<script type="text/javascript">
	alert("회원 정보 수정완료하였습니다.다신 로그인해주세요");
</script>
</c:if>
<%
	session.removeAttribute("mupdate");
%>
	
	
<c:if test="${saveok == 'no'}">
<c:set var="isSave" value="false"/>
</c:if>

<c:if test="${saveok == 'yes'}">
<c:set var="isSave" value="true"/>
</c:if>


	<span class="logo mt100">Single Dinner</span>
	<div class="content login">
		<form name="login" action="memberlogin.do" method="post">
			
			<span class="top1">
				<input type="checkbox" name="chkid" 
					id="chkid" value="yes" ${isSave?'checked':''}>
				아이디 저장
			</span>
			<span class="top2">
				<a href="selIdform.do">아이디찾기</a>
				<a href="selPwform.do">비번찾기</a>
				<a href="joinform.do">회원가입</a>
			</span>
		
				
		
		<div class="loginform">
			<input type="text" name="id" id="id"  value="${isSave?idok:''}" autofocus="autofocus" 
				required="required" placeholder="아이디">
			<input type="password" name="pw" id="pw" autofocus="autofocus" 
				required="required" placeholder="비밀번호 ">
			<button class="submit" type="submit">로그인</button>
		</div>	
		</form>	
	</div>


</body>
</html>