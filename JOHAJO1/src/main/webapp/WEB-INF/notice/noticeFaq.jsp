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
<script type="text/javascript">
	$(function(){
		num=5;
		showData(4);
		
	});
	function showData(kind)
	{	
		num=5;
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
					KindCount=s.find("KindCount").text();
								
					str+="<tr class='FaQ_title' title='"+index+"' onclick='showContent("+index+")'}>";
					str+="<td><b>Q&nbsp;.</b>";
					str+="<input type='hidden' value='"+count+"' class='hi_count'>";
					str+="<input type='hidden' value='"+KindCount+"' class='hi_kindcount'></td>";
					str+="<td>"+title+"</td>";
					str+="<td>"+writeday+"</td>";
					str+="</tr>";
					str+="<tr class='FaQ_content'>";
					str+="<td colspan='3'><pre>"+contents+"</pre></td>";
					str+="</tr>";
				});
					str+="</table>";
				$("div#FaQ_dispaly").html(str);
				$("div.noticebtn1").show();
				hideFaQ();
			},error:function(){
				alert("error");
			}
		});
	}
	function showContent(index)
	{
		$("div tr.FaQ_content").eq(index).toggle();
	}
	
	function listmore()
	{
		var lc=[];
		num=num+5;
		if(num>=totalCount){
			num=totalCount;
			$("div.noticebtn1").hide();
		}
		for(i=0;i<totalCount;i++){
			lc[i]=$(".hi_count").eq(i).val();
			
			if(lc[i]<=num){
				$("tr.FaQ_title").eq(i).show();
			}
			
		}
	}
	function hideFaQ()
	{
		totalCount=$(".hi_kindcount").val();
		if(num>=totalCount){
			num=totalCount;
			$("div.noticebtn1").hide();
		}
		var lc=[];

		for(i=0;i<totalCount;i++){
			lc[i]=$(".hi_count").eq(i).val();
			
			if(lc[i]>num){
				$("tr.FaQ_title").eq(i).hide();
			}
		}
	}
</script>
</head>
<body>
	<div id="notice_dispaly">
		<span class="logo mt100">FAQ</span>
		<span class="icon map5-1"></span>
		
		<div class="faqCategory">
			<ul>
				<li class="main_nvb" onclick="showData(4)">
					<p >전체보기</p>
				</li>
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
			<a onclick="listmore()">LOAD MORE</a>
		</div>
	</div>
</body>
</html>