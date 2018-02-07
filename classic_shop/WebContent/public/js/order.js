
//wish
var AllGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=f&productNum=";
		$('input:checkbox[class*="checkWish"]').each(function(){
			url+=this.value+"_";
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
var CheckGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=f&productNum=";
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
var ProductColourSelect = function(productNum){
	var method = "GET";
	var http = new XMLHttpRequest();
	http.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			
		}
	}
	http.open(method,url, true);
	http.send();
	
};
$("#allCheck").click(function(){
	if(this.checked){
		$('input:checkbox[class*="checkWish"]').each(function(){
			this.checked = true;
		});
	} else {
		$('input:checkbox[class*="checkWish"]').each(function(){
			this.checked = false;
		});
	}	
});
var GoCartWishSelected=function(mem_num){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/cart.do?num="+mem_num+"&productNum=";
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
var delWishSelected=function(mem_num){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/wish/remove.do?num="+mem_num+"&product_num=";
		var method="GET";
		var http = new XMLHttpRequest();
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		url=url.substr(0, url.length-1);
		http.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				var delete_json = JSON.parse(this.response);
				if(delete_json["delete"]){
					alert("삭제되었습니다.");
					location.reload();
				}else{
					alert("삭제실패");
				}
			}
		}
		http.open(method,url,true);
		http.send();
	} else {
		alert("wish list가 비었습니다.");
	}
}
var allWishDel = function(mem_num){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/wish/remove.do?num="+mem_num;
		var method="DELETE";
		var http = new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				var delete_json = JSON.parse(this.response);
				if(delete_json["delete"]){
					alert("삭제되었습니다.");
					location.reload();
				}else{
					alert("삭제실패");
				}
			}
		}
		http.open(method,url,true);
		http.send();
	} else {
		alert("wish list가 비었습니다.");
	}
}
var pickWishDel = function(mem_num,product_num){
	var url ="http://localhost:9999/classic_shop/order/delwish.do?num="+mem_num+"&product_num="+product_num; 
	console.log(mem)
	var method= "PUT";
	var http = new XMLHttpRequest();
	http.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			var delete_json = JSON.parse(this.response);	
			console.log(delete_json["delete"]);
			if(delete_json["delete"]){
				alert("삭제되었습니다.");
				location.reload();
			}else{
				alert("삭제실패");
			}
		}
	}
	http.open(method,url,true);
	http.send();
}
//cart
$(document).ready(function(){
	var cookies = document.cookie.split(";");
	var table = document.getElementById("cartContents");
	var product = {};
	var innerText ="";
	var pNum;
	if(cookies!=""){
		for(i=0; i<cookies.length; i++){
			var key = cookies[i].split("=")[0].trim();
			if(key.startsWith("classic_")){
				pNum = key.split("_")[1].trim();
				var pInfo = key.split("_")[2].trim();			
				var value = cookies[i].split("=")[1].trim();
				if(eval("typeof(c"+pNum+")=='undefined'")){
					eval("var c"+pNum+"= {}");
					eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
				} else {
					eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
				}
			}
			if(eval("Object.keys(c"+pNum+").length==5")){
				product[pNum]=eval("c"+pNum);
			}
		}
		var key ;
		for(key in product){
			innerText +='<tr>';
			innerText +='	<td><input type="checkbox" class="checkCart" value="'+product[key]+'"></td>';
			innerText +='	<td id ="cartDetailList">';
			innerText +='		<div id="cartDetailListDiv">';
			innerText +='			<div>';
			innerText +='				<p><a href="#">이미지임</a></p>';
			innerText +='			</div>';
			innerText +='			<div>';
			innerText +='				<ul class="list-group" >';
			innerText +='					<li class="list-group-item"><a href="#">'+product[key].name+'</a></li>';
			innerText +='					<li class="list-group-item">';
			innerText += (product[key].colour==undefined)?"":"color"+product[key].colour;
			innerText += (product[key].sizu==undefined)?"":"sizu"+product[key].sizu;
			innerText +='					</li>';
			innerText +='					<li class="list-group-item"><button type="button" class="btn btn-default">옵션변경</button></li>';
			innerText +='				</ul>';
			innerText +='			</div>';
			innerText +='		</div>';
			innerText +='	</td>';
			innerText +='	<td>'+product[key].price+'</td>';
			innerText +='	<td>';
			innerText +='		<div id="productQuantity">';
			innerText +='			<div>';
			innerText +='				<input type="number" value="'+product[key].count+'" min="1">';
			innerText +='			</div>';
			innerText +='			<div>';
			innerText +='				<button class="btn btn-default" >변경</button>';
			innerText +='			</div>';					
			innerText +='		</div>';
			innerText +='	</td>'
			innerText +='	<td>';
			innerText += (product[key].price>50000)?"무료":"2500원";
			innerText +='	</td>';
			innerText +='	<td>'+product[key].price+'</td>';
			innerText +='	<td>';
			innerText +='		<div class="btn-group" id="cartListBtn">';
			innerText +='			<button type="button" class="btn btn-default" >주문하기</button>';
			innerText +='			<button type="button" class="btn btn-default">WISH LIST 등록</button>';
			innerText +='			<button type="button" class="btn btn-default">삭제</button>';
			innerText +='		</div>';
			innerText +='	</td>';
			innerText +='</tr>';
		}
		table.innerHTML =innerText;
	} else {
		innerText = "<td colspan='7'>장바구니가 비었습니다.</td>";
		table.innerHTML =innerText;
	}
});

//orderList
var AllChartGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:9999/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=t&productNum=";
		$('input:checkbox[class*="checkCart"]').each(function(){
			url+=this.value+"_";
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
//sheet
var selectCoupon = function(s){
	console.log($("#couponSelect").find("option:selected").val());
}
function OrderDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = ''; 
            var extraAddr = '';
            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;
            } else { 
                fullAddr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            document.getElementById('orderPostcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('orderAddress').value = fullAddr;
            document.getElementById('orderAddress2').focus();
        }
    }).open();
}
function DelivDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = ''; 
            var extraAddr = '';
            if (data.userSelectedType === 'R') { 
            	fullAddr = data.roadAddress;
            } else {
                fullAddr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            document.getElementById('delivPostcode').value = data.zonecode;
            document.getElementById('delivAddress').value = fullAddr;
            document.getElementById('delivAddress2').focus();
        }
    }).open();
}

//list

var cancelBtn = function(){
	
}

$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
});
/**.star-group의 별을 노란색으로 표시하는 함수*/
var printFormStar=function(target){
	//target이 있으면 target만 노란색 표시
	//target이 없으면 .star-group 전부 노란색 표시
	if(target==undefined){target=".star-group"}
	$(target).find(".btn").removeClass("text-primary");
	$(target).each(function(i,starGroup){
		var active=false;
		$(starGroup).find("label.btn").each(function(i,labelBtn){
			if(!active){				
				$(labelBtn).addClass("text-primary");
				if($(labelBtn).is(".active")||$(labelBtn).is(".focus")){
					active=true;
				}
			}
		});
	});
}
/**.star-group 안에 있는 form.star의 value 가 바뀌면 value만큼 gold색으로 바꾸는 함수  */
var chagneFormStar=function(startGroup){
	if(startGroup==undefined){startGroup=".star-group";}
	$(startGroup).change(function(e){
		//var taget=e.currentTarget; //이벤트가 발생한 dom
		var target=this;
		$(target).find(".text-primary").removeClass("text-primary");
		setTimeout(function(){
			printFormStar(target);
		},10);
	});
}
/**.star-group 안에 있는 form.star의 value만큼 gold색으로 바꾸는 함수  */
var printStar=function(){	
	var star_i="<i class='fa fa-star'></i>"
	$(".review .star").each(function(){
		var int_star=Number($(this).data("star"));
		var i;
		for(i=0; i<int_star; i++){
			$(this).append(star_i);
		}
	}).css({color:"gold"});
}
var goodsNum="${param.goods_num}";

$(document).ready(function(){
	printStar();
	printFormStar();
	chagneFormStar();
	var regist=document.forms.reviewsRegist;
	$(regist).submit(function(){
		console.log($(this).serializeArray());
		$.ajax({
			url: "<c:url value='/reviews/regist'/>",
			data:$(this).serializeArray(),
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.regist){alert("리뷰 등록 성공")}
				readReviews();
			}
		})
		return false;
	});
	
});
function cancelBtn(){
	alert("주문이 취소 되었습니다.");
}

