$(function(){
	$.ajax({
		url:"/classic_shop/template/cate.do",
		type:"GET",
		dataType:"json",
		success:function(data){
			
			var miniCate
			var cateListHTML="";
			cateListHTML+='<li><a href="/classic_shop/main.do">CLASSIC</a></li>';			
			$(data["cate"]).each(function(index,item){
				var cateNum=item.num;
				cateListHTML+='<li role="presentation" id="navDrop'+item.num+'" class="dropdown">';
				cateListHTML+='<a class="dropdown-toggle" href="/classic_shop/product.do?cate=0&num='+item.num+'" role="button" aria-expanded="false">'+item.name+'</a>';
					
				$(data["miniCate"]).each(function(i,mini){
					if(cateNum == mini.cate_num){
						cateListHTML+='<ul class="dropdown-menu" role="menu">';
						return false;
					}
				});
						$(data["miniCate"]).each(function(i,mini){
							if(cateNum == mini.cate_num){
								cateListHTML+='<li class="dropdown-menu-item"><a href="/classic_shop/product.do?cate=1&num='+mini.num+'">'+mini.name+'</a></li>';
							}
						});
				$(data["miniCate"]).each(function(i,mini){
					if(cateNum == mini.cate_num){
						cateListHTML+='</ul>';
						return false;
					}
				});
					cateListHTML+='</li>';
					cateListHTML+='<c:remove var="msg"/>'; //이거 오류난다!!!!!!!!!!!!!!!!!!! 왜 오류나니?!!!!!!!!!!!!!!!
			}); 
		
		$("#cateNavbar").html(cateListHTML);
		}		
	});
 	var cookies = document.cookie.split(";");
 	var cartSymbol = document.getElementById("cartSymbol");
 	var productCount=0;
 	var i;
 	for(i = 0; i<cookies.length; i++){
 		var key = (cookies[i].split("=")[0].trim()).split("_")[2];
 		if(key=="name"){
 			productCount++;
 		}
 	}
 	cartSymbol.innerHTML = productCount;
 	if(productCount!=0){
 		cartSymbol.style.background = "red";
 	}
});

