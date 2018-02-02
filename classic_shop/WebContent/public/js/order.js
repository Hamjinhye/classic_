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
//$( ".datepicker" ).datepicker();

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
