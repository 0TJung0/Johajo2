
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/reservation.css"/>" rel="stylesheet">
<script type="text/javascript">
$(function(){
    now=new Date();
	var mon=now.getMonth()
  	addFoodIdx="";
  	var check=$(".check").val();
  	console.log(check);
  	if(check==0){
  		mCheck()
  	}
  	calender(mon);
});
</script>
<script src="js/reservationform.js"></script>
</head>
<body>

<div id="reserv_menu">
   <form action="resAppetizer5.do">
      <ul>
            <li><span onclick="selday()">날짜선택<b class="seday"></b></span>
               <ul>
                  <li>
                     <div class="cal">
								<ul>
									<li>
										<div class='month'>
											
										</div>

										<ul class='weekdays'>
											<li>일</li>
											<li>월</li>
											<li>화</li>
											<li>수</li>
											<li>목</li>
											<li>금</li>
											<li>토</li>
										</ul>
										<ul class='days'>
										
							</div>
						</li>
               </ul></li>

				<li><span onclick="store()">매장선택<b class="selStore"></b></span>
					<ul>
						<li>
							<div class="store">
								<table class='store1'>
									<tr>
										<td>번호</td>
										<td>지점명</td>
										<td>시간선택</td>
									</tr>
									<c:forEach var='i' items='${list }' varStatus='s'>
										<tr>
											<td>${s.count }</td>
											<td><a class="storeName">${i.name }</a></td>
											<td><a class='selTime' time='5시' store="${i.name}">5시</a>&nbsp;&nbsp;
												<a class='selTime' time='6시' store="${i.name}">6시</a>&nbsp;&nbsp;
												<a class='selTime' time='7시' store="${i.name}">7시</a>&nbsp;&nbsp; 
												<a class='selTime' time='8시' store="${i.name}">8시</a>
											</td>
											
										</tr>
									</c:forEach>
								</table>

							</div>
						</li>
					</ul></li>
				<li><span onclick="selectsit()">자리선택 <b class="seleted"></b></span>
               <div class="selsit" style="width: 200px;height: 200px;position: relative;">
                  <%-- <c:set var="it">A,B,C,D,E</c:set>
                  <c:forEach var="key" items="${it }">
                     <c:forEach var="i" begin="1" end="5">
                        <span class="selClass" sel="${key}${i}"> <img src="#">
                        </span>
                     </c:forEach>
                     <br>
                  </c:forEach> --%>
               </div></li>

            <li><span onclick="menu()">메뉴선택</span>
               <div class="selmenu" >
                  <div id="sidebar">
                     <!-- 사이드바 -->
                     <div id="sidebar1">
                     	<ul>
                     		<li class="sidebar3">course</li>
                        	<li class="sidebar4"><a>HotMenu</a></li>
                     	</ul>
                        <ul class="sidebar2">
                           <li><a name="1">Appetizer</a></li>
                           <li><a name="2">Soup</a></li>
                           <li><a name="3">MainDish</a></li>
                           <li><a name="4">SideDish</a></li>
                           <li><a name="5">Dessert</a></li>
                           <li><a name="6">Drink</a></li>
                        </ul>
                     </div>
                     <!-- /사이드바 -->

                     <!-- 본문 -->
                     <div id="page-content-wrapper">
                        <div class="container-fluid">
                          <span id="datatest123"></span>
                        </div>
                     </div>
                     
                  </div>
                 
               </div></li>
               <h3 class="resselect">선택한 메뉴</h3>
               <div class="resselect"></div>
               
         </ul>
         <input type='hidden' class='hmonth' name='hmonth' value=''>
         <input type='hidden' class='hday' name='hday' value=''>
         <input type='hidden' class='hstore' name='hstore' value=''>
         <input type='hidden' class='htime' name='htime' value=''>
         <input type='hidden' class='hsit' name='hsit' value=''>
         <input type='hidden' class='hcourse' name='hcourse' value=''>
         <input type='hidden' class='hfidx' name='hfidx' value=''>
         <input type='hidden' class='se_nmname' name='se_nmname' value='${se_name}'>
         <input type='hidden' class='se_sitname' name='se_sitname' value=''>
         
         <input type="submit" class="resok" value="예약">
         <input type="button" value="취소">
      </form>
   </div>
  
   <input type="hidden" class="check" value="${check }">
</body>
<script type="text/javascript">

   
</script>

</html>