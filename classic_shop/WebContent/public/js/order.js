//wish
var allGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:8888/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=f&productNum=";
		$('input:checkbox[class*="checkWish"]').each(function(){
			url+=this.value+"_";
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
var productOptionSelect = function(memNum,productNum){
	var url = "http://localhost:8888/classic_shop/user/wish/option.do?memNum="+memNum+"&productNum="+productNum;
 	var method = "GET";
 	var http = new XMLHttpRequest();
 	http.onreadystatechange=function(){
 		if(this.readyState==4 && this.status==200){
			var option_json = JSON.parse(this.response);
			var name = "optionSelect"+productNum;
			var optionTab =document.getElementById(name);
			var innerText ="";
			var i ; 
			innerText +='<div class="col-5" style="display: inline-block; margin-right: 5px;">';
			innerText +='	<select class="form-control" id="optionColour">';
			for(i = 0; i<option_json["colour"].length;i++){
				innerText +='		<option value=\"'+option_json["colour"][i].num+'\">'+option_json["colour"][i].name+'</option>';
			}
			innerText +='	</select>';
			innerText +='</div>';
			innerText +='<div class="col-5" style="display: inline-block; margin-right: 5px; ">';
			innerText +='	<select class="form-control" id="optionSizu">';
			for(i=0;i<option_json["sizu"].length; i++){
				innerText +='		<option value=\"'+option_json["sizu"][i].num+'\">'+option_json["sizu"][i].sizu+'</option>';
			}
			innerText +='	</select>';
			innerText +='</div>';
			innerText +='<div class="col-2" style="display: inline-block; width: 86px;">';
			innerText +='	<input type="number" min="1" value=\"'+option_json["quantity"]+'\" class="form-control" id="optionAfterQuantity">';
			innerText +='	<input type="hidden" value=\"'+option_json["quantity"]+'\" id="optionBeforeQuantity">';
			innerText +='	<input type="hidden" value=\"'+option_json["colour"][0].productNum+'\" id="optionProductNum">';
			innerText +='	<input type="hidden" value=\"'+option_json["memNum"]+'\" id="memNum">';
			innerText +='</div>';
			optionTab.innerHTML = innerText;
	 		}
 	}
 	http.open(method,url, true);
 	http.send();
};

var optionChange = function(){
	var colourNum = document.getElementById("optionColour").value;
	var sizuNum = document.getElementById("sizuNum").value;
	var afterQuantity = document.getElementById("optionAfterQuantity").value;
	var beforeQuantity = document.getElementById("optionBeforeQuantity").value;
	var productNum = document.getElementById("optionProductNum").value;
	var memNum = document.getElementById("memNum").value;
	var url = "http://localhost:8888/classic_shop/user/wish/option.do?productNum="+productNum+"&memNum="+memNum+"&colourNum="+colourNum+"&sizuNum="+sizuNum+"&afterQuantity="+afterQuantity+"&beforeQuantity="+beforeQuantity;
	var method="PUT";
	var http = new XMLHttpRequest();
	console.log(sizuNum);
	/*$.ajax({
		url: url, 
		type : method,
		dateType:"json", 
		success: function(data){
			console.log(data);
		}
	})*/
}
var checkGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:8888/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=f&productNum=";
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}


var checkAll =function(data){
	var allCheck =  document.getElementById(data.id);
	var checkWish = document.getElementsByClassName("checkProduct");
	var i;
	if(allCheck.checked){
		for(i=0; i<checkWish.length; i++){
			checkWish[i].checked = true;
		}
	} else {
		for(i=0; i<checkWish.length; i++){
			checkWish[i].checked = false;
		}
	}	
}
var goCartWishSelected=function(mem_num){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:8888/classic_shop/cart.do?num="+mem_num+"&productNum=";
		var url2 = url;
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		if(url2==url){
			alert("상품을 선택 해 주세요.");
		}else{
			url=url.substr(0, url.length-1);
			location.href=url;
		}
	}
}
var delWishSelected=function(mem_num){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:8888/classic_shop/user/wish/remove.do?num="+mem_num+"&product_num=";
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
		var url ="http://localhost:8888/classic_shop/user/wish/remove.do?num="+mem_num;
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
	var url ="http://localhost:8888/classic_shop/user/wish/remove.do?num="+mem_num+"&product_num="+product_num; 
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
	var allPriceTab = document.getElementById("allProductPrice");
	var delivePrice = document.getElementById("delivPrice");
	var allSellPrice = document.getElementById("allSellPrice");
	var product = {};
	var innerText ="";
	var pNum;
	var allprice = 0;
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
			innerText +='	<td><input type="checkbox" class="checkProduct" value="'+key+'"></td>';
			innerText +='	<td id ="cartDetailList">';
			innerText +='		<div class="cartDetailListDiv">';
			innerText +='			<div>';
			innerText +='				<p><a href="#">이미지임</a></p>';
			innerText +='			</div>';
			innerText +='		</div>';
			innerText +='		<div class="cartDetailListDiv">';
			innerText +='			<div>';
			innerText +='				<ul class="list-group " >';
			innerText +='					<li class="list-group-item"><a href="#">'+product[key].name+'</a></li>';
			innerText +='					<li class="list-group-item">';
			innerText += (product[key].colour==undefined)?"":"color  "+product[key].colour;
			innerText += (product[key].sizu==undefined)?"":"sizu  "+product[key].sizu;
			innerText +='					</li>';
			innerText +='					<li class="list-group-item"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#cartOption'+key+'"  onclick="productOptionSelect(${loginMem.num},'+key+')">옵션변경</button></li>';
			innerText +='						<div class="modal fade" id="cartOption'+key+'" tabindex="-1" role="dialog">';
			innerText +='							<div class="modal-dialog" role="document">';
			innerText +='								<div class="modal-content">';
			innerText +='									<div class="modal-header">';
			innerText +='										<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
			innerText +='										<span aria-hidden="true">&times;</span></button>';
			innerText +='										<h3 class="modal-title" id="myModalLabel">옵션변경</h3>';
			innerText +='									</div>';
			innerText +='								<form action="wish/option.do" method="PUT">';
			innerText +='									<div class="modal-body row" style="display: inline-block!important;" id="optionSelect'+key+'">';
			innerText +='									</div>';
			innerText +=' 									<div class="modal-footer">';
			innerText +='										<button type="button" class="btn btn-default">변경</button>';
			innerText +='									</div>';
			innerText +='								</form>';
			innerText +='							</div>';
			innerText +='						</div>';
			innerText +='					</div>'; 
			innerText +='				</ul>';
			innerText +='			</div>';
			innerText +='		</div>';
			innerText +='	</td>';
			innerText +='	<td>'+product[key].price+'</td>';
			innerText +='	<td>'+product[key].count+'</td>';
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
			allprice+=parseInt(product[key].price);
		}
		table.innerHTML =innerText;
		allPriceTab.innerHTML = allprice;
		if(allprice>50000){
			delivePrice.innerHTML = "무료";
			allSellPrice.innerHTML = allprice;
		}else{
			delivPrice.innerHTML = 2500;
			allSellPrice.innerHTML = allprice+2500;
		}
	} else {
		innerText = "<td class='emptyTableData' colspan='7'>장바구니가 비었습니다.</td>";
		table.innerHTML =innerText;
	}
});

//orderList
var AllCartGoSheet = function(memNum){
	if("${(fn:length(wishList))!=0}"){
		var url ="http://localhost:8888/classic_shop/user/ordersheet.do?num="+memNum+"&cookie=t&productNum=";
		var url2 = url;
		$('input:checkbox[class*="checkCart"]').each(function(){
			url+=this.value+"_";
		});
		if(url2==url){
			alert("장바구니가 비었습니다. 상품을 추가해 주세요.");
		}else{
			url=url.substr(0, url.length-1);
			location.href=url;
		}
	}
}
var CheckCartGoSheet=function(memNum){
	if(memNum!=null){
		if("${(fn:length(wishList))!=0}"){
			var url ="http://localhost:8888/classic_shop/user/ordersheet.do?num="+memNum+"&productNum=";
			var url2 = url;
			$('input:checkbox[class*="checkCart"]').each(function(){
				if(this.checked){
					url+=this.value+"_";
				}		
			});
			if(url2==url){
				alert("상품을 선택 해 주세요.");
			}else{
				url=url.substr(0, url.length-1);
				location.href=url;
			}
		}
	}else{
		alert("로그인 시 주문가능합니다.");
		location.href="http://localhost:8888/classic_shop/login.do";
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
