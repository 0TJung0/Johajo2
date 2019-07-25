function MenuList(n){
	var str="";
	var data=$("div.ad_menulist");
	console.log(n);
	if(n==0)
		return;
	$.ajax({
		type:'get',
		data:{'kind':n},
		url:'ad_MenuData.do',
		success:function(redata){
			$(redata).find('data').each(function(){
				var s=$(this);
				idx=s.find("idx").text();
				name=s.find("fname").text();
				kind=s.find("kind").text();
				calorie=s.find("calorie").text();
				img=s.find("img").text();
				count=s.find("count").text();
				price=s.find("price").text();
				
				str+=idx+name+kind+"<br>";
			});
			$(data).html(str);
		},error:function(e){
			alert("error 는"+e.getMessage);
		}
	});
}

