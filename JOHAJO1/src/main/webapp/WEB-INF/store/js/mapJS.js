function ajax1(idx){
	var str="";
	var data=$("div.storlist");
	$.ajax({
		type:'get',
		data:{'idx':idx},
		url:'storeData.do',
		success:function(redata){
				$(redata).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					name=s.find("name").text();
					xpoint=s.find("xpoint").text();
					ypoint=s.find("ypoint").text();
					service=s.find("service").text();
					phone=s.find("phone").text();
					addr=s.find("addr").text();
					open=s.find("ohours").text();
					photo=s.find("photo").text();
					
					var serviceArray=service.split(',');
					
					str+="<table class='infostore'>";
					str+="<tr>";
					str+="<td>점포명</td>";
					str+="<td>"+name+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/phone.PNG'>전화</td>";
					str+="<td>"+phone+"</td>";
					str+="</tr>";					
					str+="<tr>";
					str+="<td><img src='image/addr.PNG'>주소</td>";
					str+="<td>"+addr+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/open.PNG'>주소</td>";
					str+="<td>"+open+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/service.PNG'>서비스</td>";
					str+="<td>";
					for(var i in serviceArray){
						str+="<img src='image/"+serviceArray[i]+".PNG' width='40'>"+serviceArray[i];
					}
					str+="</td>";
					str+="</tr>";	
					str+="<tr>";
					str+="<td><img src='./storeImg/"+photo+"'></td>";
					str+="</tr>";
					str+="</table>";
					
				});
			$(data).html(str);
		},
		error:function(){
			alert("error");
		}
		
	});
}

function ajax2(idx){

	var str="";
	var data=$("div.storlist");
	$.ajax({
		type:'get',
		data:{'idx':idx},
		url:'storeData.do',
		success:function(redata){
				$(redata).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					name=s.find("name").text();
					xpoint=s.find("xpoint").text();
					ypoint=s.find("ypoint").text();
					service=s.find("service").text();
					phone=s.find("phone").text();
					addr=s.find("addr").text();
					open=s.find("ohours").text();
					photo=s.find("photo").text();
					
					var serviceArray=service.split(',');
					
					str+="<table class='infostore'>";
					str+="<tr>";
					str+="<td>점포명</td>";
					str+="<td>"+name+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/phone.PNG'>전화</td>";
					str+="<td>"+phone+"</td>";
					str+="</tr>";					
					str+="<tr>";
					str+="<td><img src='image/addr.PNG'>주소</td>";
					str+="<td>"+addr+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/open.PNG'>주소</td>";
					str+="<td>"+open+"</td>";
					str+="</tr>";
					str+="<tr>";
					str+="<td><img src='image/service.PNG'>서비스</td>";
					str+="<td>";
					for(var i in serviceArray){
						str+="<img src='image/"+serviceArray[i]+".PNG' width='40'>"+serviceArray[i];
					}
					str+="</td>";
					str+="</tr>";	
					str+="<tr>";
					str+="<td><img src='./storeImg/"+photo+"'></td>";
					str+="</tr>";
					
					str+="</table>";
					
				});
			x=xpoint;
			y=ypoint;
			storeName=name;
			addr1=addr;
			phone1=phone;
			$(data).html(str);
			map2(x,y,storeName,addr1,phone1);
		},
		error:function(){
			alert("error");
		}
		
	});
}
function map1(){
	
var locations=new Array();
var totalCount=$("#total").val();
for(var i=0;i<totalCount;i++ ){
	var splitlocations=$(".subselStore").eq(i).val().split(",");
	locations[i]=new Array(splitlocations.length);
	for(var j=0;j<splitlocations.length;j++){
		locations[i][j]=splitlocations[j];	
		}
	}

var map = new google.maps.Map(document.getElementById('storeMap1'), {
      zoom: 7,
      center: new google.maps.LatLng(36.626457, 127.493725),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        id:i,
        position: new google.maps.LatLng(locations[i][2], locations[i][3]),
        map: map,
        name:locations[i][1],
      	title:locations[i][1],
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][1]+"<hr>"+locations[i][4]+"<br>"+locations[i][5]);
          infowindow.open(map, marker);
          //map2(this.name);
          ajax1(locations[i][0]);
        }
       
       
      })(marker, i));
      if(marker)
      {
        marker.addListener('click', function() {
          map.setZoom(18);
          map.setCenter(this.getPosition());
        });
        }
    }
}

function map2(x,y,storName,addr1,phone1){
	var myLatlng = new google.maps.LatLng(); // 위치값 위도 경도
	var Y_point = x; // Y 좌표
	var X_point = y; // X 좌표

	var zoomLevel=18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle=storeName; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth=500; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	
	var contentString=storeName+"<hr>"+addr1+"<br>"+phone1;

	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
		zoom : zoomLevel,
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById('storeMap1'), mapOptions);
	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map,
		title : markerTitle
	});
	var infowindow = new google.maps.InfoWindow({
		maxWizzzdth : markerMaxWidth
	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.setContent(contentString);
		infowindow.open(map, marker);
	});
};

function map3(){
	var locations=new Array();
	var totalCount=$("#total").val();
	if(totalCount==0)
		{
		alert("검색결과가 없습니다.");
		location.href="storelist.do"
		}
	for(var i=0;i<totalCount;i++ ){
		var splitlocations=$(".subselStore1").eq(i).val().split(",");
		locations[i]=new Array(splitlocations.length);
		for(var j=0;j<splitlocations.length;j++){
			locations[i][j]=splitlocations[j];	
			}
		}

	var map = new google.maps.Map(document.getElementById('storeMap1'), {
	      zoom: 7,
	      center: new google.maps.LatLng(36.626457, 127.493725),
	      mapTypeId: google.maps.MapTypeId.ROADMAP
	    });

	    var infowindow = new google.maps.InfoWindow();

	    var marker, i;
	    for (i = 0; i < locations.length; i++) {  
	      marker = new google.maps.Marker({
	        id:i,
	        position: new google.maps.LatLng(locations[i][2], locations[i][3]),
	        map: map,
	        animation: google.maps.Animation.DROP,
	        name:locations[i][1],
	      	title:locations[i][1],
	      });

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locations[i][1]+"<hr>"+locations[i][4]+"<br>"+locations[i][5]);
	          infowindow.open(map, marker);
	          //map2(this.name);
	          ajax1(locations[i][0]);
	        }
	       
	       
	      })(marker, i));
	      if(marker)
	      {
	        marker.addListener('click', function() {
	          map.setZoom(18);
	          map.setCenter(this.getPosition());
	        });
	        }
	    }
	}

