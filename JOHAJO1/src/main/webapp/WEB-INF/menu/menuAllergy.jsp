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
		
		
		$(function () {	
			tab('#atab',0);	
		});
	
		function tab(e, num){
		    var num = num || 0;
		    var menu = $(e).children();
		    var con = $(e+'_acon').children();
		    var select = $(menu).eq(num);
		    var i = num;
	
		    select.addClass('on');
		    con.eq(num).children().show();
	
		    menu.click(function(){
		        if(select!==null){
		            select.removeClass('on');
		            con.eq(i).children().hide();
		        }
	
		        select = $(this);	
		        i = $(this).index();
	
		        select.addClass('on');
		        con.eq(i).children().show();
		        con.eq(i).children().attr("aname");
		    });
		}
	</script>
	</head>
	<body>
		<ul class="atab" id="atab">
		    <li class="a_li">전체</li> <li class="a_li" aname="1">난류</li> <li class="a_li" aname="2">우유</li>	
		    <li class="a_li" aname="3">대두</li> <li class="a_li" aname="4">밀</li> <li class="a_li" aname="5">돼지고기</li>
		    <li class="a_li" aname="6">소고기</li> <li class="a_li" aname="7">닭고기</li> <li class="a_li" aname="8">토마토</li>
		    <li class="a_li" aname="9">오징어</li> <li class="a_li" aname="9">조개류</li>	
		</ul>
		<div class="atab_acon" id="atab_acon"> 
		    	<div>
		    		<c:forEach var="dto" items="${list}">
		    		<div class="a_div">
						${dto.fname}
		    		</div>
		    		</c:forEach>
		    	</div>
		    	<div>
		    		<c:forEach var="dto" items="${list}">
		    		<div class="a_div">
						${dto.fname}
		    		</div>
		    		</c:forEach>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<div class="a_div" >
						
		    		</div>
		    	</div>
		    	<div>
		    		<c:forEach var="dto" items="${list}">
		    		<div class="a_div">
						${dto.fname}
		    		</div>
		    		</c:forEach>
		    	</div>
		</div>
		    	
		    
	</body>
</html>