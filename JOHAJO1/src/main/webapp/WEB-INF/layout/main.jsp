<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html> 
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("div.area").mouseover(function(){
			//$(this).find('.more').css("display","block");
			$(this).find('.more').show().animate({opacity:1},500);
		}).mouseout(function(){
			//$(this).find('.more').css("display","none"); 
			$(this).find('.more').hide().animate({opacity:1},500);
		});
		
	})
</script>
</head>
<body>

	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	    <li data-target="#demo" data-slide-to="3"></li>
	    <li data-target="#demo" data-slide-to="4"></li>
	    <li data-target="#demo" data-slide-to="5"></li>
	    
	  </ul>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="image/m1.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="image/m2.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="image/m3.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="image/m4.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="image/m5.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="image/m6.jpg">
	      <div class="carousel-caption">
	      </div>   
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>

	<div class="eventTab">
		<ul>
			<li>이벤트 페이지1</li>
			<li>이벤트 페이지2</li>
			<li>이벤트 페이지3</li>
		
		</ul>
	</div>

	<div class="selectTab">
		<ul>
			<li>
				<div class="area">
					
					<img src="image/con2.png" class="jimg">
					<div class="more">
						<img src="image/m-icon_brand.png" class="icon">
						<p>BREAD</p>
						<span class="btn"><a>자세히보기</a></span>
					</div>
					
				</div>
				<div class="area">
					<img src="image/con1.jpg" class="jimg">
					
				</div>
			</li>
			<li>
				<div class="area w50">
					<img src="image/con3.png">
					<img src="image/con7.png">
				</div>
				<div class="area w50 h100"><img src="image/con4.png" class="jimg"></div>
				<div class="area"><img src="image/con6.jpg" class="jimg"></div>
			</li>
			<li>
				<div class="area"><img src="image/con5.png" class="jimg"></div>
				<div class="area"><img src="image/con8.jpg" class="jimg"></div>
			</li>
		</ul>
	</div>
		
		
</body>
</html>