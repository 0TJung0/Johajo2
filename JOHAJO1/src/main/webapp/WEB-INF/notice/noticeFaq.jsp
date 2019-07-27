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
<style>
/* 	 ul li.main_nvb{
		list-style: none;
		float: left;
		margin-left: 10%;
		cursor: pointer;
	}
	tr.FaQ_content{
		display: none;
	}
	tr.FaQ_title{
		padding:0px;
		width: 80%;
		text-align: center;
		cursor: pointer;
		border-bottom: 0.5px solid gray;
	}
	
	table tr.FaQ_content{
		text-align: left;
		border-bottom: 0.5px solid gray; 
	}
	div#FaQ_dispaly{
		margin-left: 10%;
		margin-top: 5%;
	}  */
</style>
<script type="text/javascript">
	$(function(){
		showData(1);
	});
	function showData(kind)
	{	
		var str="<table>";
		$.ajax({
			type:"get",
			data:{"kind":kind},
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
								
					str+="<tr class='FaQ_title' title='"+index+"' onclick='showContent("+index+")'}>";
					/* str+="<td>"+count+"</td>"; */
					str+="<td><b>Q&nbsp;.</b></td>";
					str+="<td>"+title+"</td>";
					str+="<td>"+writeday+"</td>";
					str+="</tr>";
					str+="<tr class='FaQ_content'>";
					str+="<td colspan='3'><pre>"+contents+"</pre></td>";
					str+="</tr>";
				});
					str+="</table>";
				$("div#FaQ_dispaly").html(str);
			},error:function(){
				alert("error");
			}
		});
	}
	function showContent(index)
	{
		$("div tr.FaQ_content").eq(index).toggle();
	}
</script>
</head>
<body>

	<div id="notice_dispaly">
		<span class="logo mt100">FAQ</span>
		<span class="icon map5-1"></span>
		
		<div class="faqCategory">
			<ul>
				<li class="main_nvb" onclick="showData(3)">
					<p >예약</p>
				</li>
				<li class="main_nvb" onclick="showData(2)">
					<p >쿠폰</p>
				</li>
				<li class="main_nvb" onclick="showData(1)">
					<p >회원가입/탈퇴</p>
				</li>
			</ul>	
		</div>
		
		
		<div id="FaQ_dispaly">
		</div>
		
		
		<div class="noticebtn1">
			<a href="#">LOAD MORE</a>
		</div>
	</div>
</body>
</html>