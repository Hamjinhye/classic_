
$(function(){
	
	
	/*$("#bt_minus").click(function(){
		var price ='<c:set var="productPrice" value="${productDetail.price}" />';
		console.log(price);
		var val = Number($("#quantity").val());
		if(val>1){
			val-=1
			$("#finalPrice").html(price*val);
		}
		$("#quantity").val(val);
	});
	
	$("#bt_plus").click(function(){
		var val = Number($("#quantity").val());
		if(val<99){
			val+=1
			
		}
		$("#quantity").val(val);
	});*/
});


var finalPrice=0;

var btnMinus =function(price){
	var val = Number($("#quantity").val());
	if(val>1){
		val-=1
		finalPrice=val*price;
		$("#finalPrice").html(finalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}
	$("#quantity").val(val);
}
var btnPlus = function(price){
	var val = Number($("#quantity").val());
	if(val<99){
		val+=1
		finalPrice=val*price;
		$("#finalPrice").html(finalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}
	$("#quantity").val(val);
}
var numberFormat =function(){
	return $(this).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


//상품 자동 검색
var getSearchProductName = function(productNameValue){
	if(productNameValue.trim()){
		var url = "/classic_shop/product/search/name.do?name="+productNameValue;
		var http = new XMLHttpRequest();
		http.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var productNameList = JSON.parse(this.response);
				console.log(productNameList);
				var productNameHTML = "";
				productNameList.forEach(function(name){
					productNameHTML+="<option>"+name+"</option>";
				});
				document.getElementById("productNameList").innerHTML = productNameHTML;
			}
		}
		http.open("GET", url, true);
		http.send();
	}
}

