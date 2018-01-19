$(function(){
	//console.log(document.location.href);
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
				cateListHTML+='<a class="dropdown-toggle" href="/classic_shop/product/list.do?num='+item.num+'" role="button" aria-expanded="false">'+item.name+'</a>';
					//요기 안에 miniCate 들어가는곳
				
				$(data["miniCate"]).each(function(i,mini){
					if(cateNum == mini.cate_num){
						cateListHTML+='<ul class="dropdown-menu" role="menu">';
						return false;
					}
				});//miniCateUl
						$(data["miniCate"]).each(function(i,mini){
							if(cateNum == mini.cate_num){
								//console.log(cateNum);
								cateListHTML+='<li class="dropdown-menu-item"><a href="/classic_shop/product/miniCateList.do?num='+mini.num+'">'+mini.name+'</a></li>';
							}
						});//miniCate
				$(data["miniCate"]).each(function(i,mini){
					if(cateNum == mini.cate_num){
						cateListHTML+='</ul>';
						return false;
					}
				});//miniCateUl
					
					cateListHTML+='</li>';
					cateListHTML+='<c:remove var="msg"/>'; //이거 오류난다!!!!!!!!!!!!!!!!!!! 왜 오류나니?!!!!!!!!!!!!!!!
				//miniCateListHTML(item.num);
				//console.log(data["cate"][0].name);
			}); //cate
		$("#cateNavbar").append(cateListHTML);
		}		
	});

});

