<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
  <link rel="stylesheet" type="text/css" href="slick/slick.css">
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css">
  <script type="text/javascript" src="slick/slick.js"  charset="utf-8"></script>

  <script type="text/javascript">
	$(function(){
		$("div.area").mouseover(function(){
			//$(this).find('.more').css("display","block");
			$(this).find('.more').show().animate({opacity:1},500);
		}).mouseout(function(){
			//$(this).find('.more').css("display","none"); 
			$(this).find('.more').hide().animate({opacity:1},500);
		});
		
	
	      $(".regular").slick({
	    	  autoplay:true,
	          dots: false,
	          infinite: true,
	          slidesToShow: 4,
	          slidesToScroll: 4,
	          arrows:true
	      });
	    
	
	    $(".more").css("display","none");
	  	$(".selectTab .over").on("mouseenter", function (){
	  		$(this).prev().children().addClass("on");
	  		$(this).children("div.more").fadeIn(500);
	  		
	  		$(this).find('span.btn').addClass("on");
	  		
	  	});
	  	
	  	$(".selectTab .over").on("mouseleave", function (){
	  	
	  		$(this).prev().children().removeClass("on");
	  		$(this).children("div.more").fadeOut("fast");
	  		$(this).find('span.btn').removeClass("on");
	  		
	  	});
	  	
	  	$("div.more span.btn").on("mouseover",function(){
	  		$(this).addClass("on");
	  	}).mouseout(function(){
	  		$(this).removeClass("on");
	      });
	  	
	  	moveicon();
	  	function moveicon() {
	  		$('.moveicon').animate({'top' : '400'}, "slow").animate({'top' : '420'}, "slow"
	  		, function() { 
	  			moveicon(); 
	  		});
	  	}
	  	
	  	
	  	$(window).scroll(function() {
	  	  var $el = $('.reseve_wrap');
	  	  
	  	  if($(this).scrollTop() >= 400) $el.addClass('show');
	  	  else $el.removeClass('show');
	  	});
	  
	  	$("div.sbtn").click(function(){

	  		
	  		$(this).parent().find("div.smap_wrap").slideToggle('slow',function(){
	  			$(this).parent().addClass("on");
	  			console.log($(window).height());
		  		$('html, body').scrollTop($(window).height());
	  		});
	  		
	  		
	  	},function(){
	  		$(this).parent().find("div.smap_wrap").slideToggle('fast');
	  		$(this).parent().removeClass("on");
	  	});
	  	
	  	
	  	$(".btn_top").click(function(){
	  		 $('html').animate({scrollTop : 0}, 600);
	  	});
	  	
	  	
	  	function fnMove(move){
	        var offset = $("div#"+move).offset();
	        $('html,body').animate({scrollTop:(offset.top-$(window).height()*0.05)},400);
	     }
	  	
	  	
	  	
	});
	
	function pageDwon(){
		console.log("aa");
		$('html, body').scrollTop($(window).height());
  		
	}
</script>
</head>
<body>

	
	
		
	<div class="reseve_wrap moveicon">
		<button class="btn_top"></button>
		
		<button class="btn_reseve" onclick="">
			<span>예약</span>
		</button>
	</div>
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
	
	
	<c:set var="eventArr" value="etc1.jpg,etc1.jpg,etc1.jpg,etc1.jpg,etc1.jpg"  />
	<div class="eventTab">
	   <section class="regular slider">
	    <c:forEach var="evt" items="${elist}" varStatus="i">
	    	<div>
	          <a href="#">${evt.title }<img src="./eventImg/${evt.title_img }"></a>
	    	</div>
		</c:forEach>
	  </section>
	</div>




	<div class="selectTab">
		<ul>
			<li>
				<div class="inner">
					<div class="jimg">
						<img src="image/con2.png">
					</div>
					<div class="over o1">
						<div class="more">
							<img src="image/m-icon_brand.png" class="icon">
							<p>BREAD</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
			<li class="type1">
				<div class="inner">
					<img src="image/con3.png">
					<img src="image/con7.png">
				</div>
				<div class="inner i50">
				<div class="jimg">
						<img src="image/con4.png">
					</div>
					<div class="over o2">
						<div class="more">
							<img src="image/m-icon_starter.png" class="icon">
							<p>STARTER</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="inner">
				<div class="jimg">
						<img src="image/con5.png">
					</div>
					<div class="over o3">
						<div class="more">
							<img src="image/m-icon_pasta.png" class="icon">
							<p>PASTA</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="inner">
				<div class="jimg">
						<img src="image/con1.jpg">
					</div>
					<div class="over o4">
						<div class="more">
							<img src="image/m-icon_pizza.png" class="icon">
							<p>PIZZA</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="inner">
					<div class="jimg">
						<img src="image/con6.jpg">
					</div>
					<div class="over o5">
						<div class="more">
							<img src="image/m-icon_ricerisotto.png" class="icon">
							<p>RICE & RISOTTO</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="inner">
					<div class="jimg">
						<img src="image/con8.jpg">
					</div>
					<div class="over o6">
						<div class="more">
							<img src="image/m-icon_steak.png" class="icon">
							<p>STEAK</p>
							<span class="btn"><a href="#">자세히보기</a></span>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
	
	<div class="footerTab">
		<div class="smap_wrap">
		<div class="smap">
				<ul>
					<li>
						<div class="msub">
							<ul>
								<li><a href="#">MENU</a></li>
								<li><a href="#">메뉴</a></li>
								<li><a href="#">코스</a></li>
								<li><a href="#">알레르기</a></li>
							</ul>
						</div>
						
					</li>
					<li>
						<div class="msub">
							<ul>
								<li><a href="#">STORE</a></li>
								<li><a href="#">매장안내</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="msub">
							<ul>
								<li><a href="#">RESERVATION</a></li>
								<li><a href="#">예약</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="msub">
							<ul>
								<li><a href="#">NOTICE</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">이벤트</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="sbtn">SITEMAP</div>
	</div>
</body>
</html>