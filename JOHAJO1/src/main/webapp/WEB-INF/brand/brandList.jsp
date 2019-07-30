<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function showData(num)
	{	
		$.ajax({
			type:"get",
			data:{"num":num},
			url:"selFnq.do",
			success:function(redata){
				$(redata).find("data").each(function(){
					var s=$(this);
					index=s.find("index").text();
					idx=s.find("idx").text();
					title=s.find("title").text();
					contents=s.find("contents").text();
					writeday=s.find("writeday").text();
					hide=s.find("hide").text();
					count=s.find("count").text();
					KindCount=s.find("KindCount").text();
							
			});
			$("div#FaQ_dispaly").html(str);
		},error:function(){
			alert("error");
		}
	});
}
</script>
</head>
<body>

<div id="notice_dispaly">
	<span class="logo mt100">BRAND</span>
	<span class="icon map5-1"></span>

		<div class="faqCategory">
			<ul>
				<li class="main_nvb" onclick="showData(4)">
					<p >이팀장</p>
				</li>
				<li class="main_nvb" onclick="showData(3)">
					<p >방팀장</p>
				</li>
				<li class="main_nvb" onclick="showData(2)">
					<p >김팀장</p>
				</li>
				<li class="main_nvb" onclick="showData(1)">
					<p >한팀장</p>
				</li>
			</ul>	
		</div>
		<div class="brandcon"></div>
</div>
</body>
</html>
