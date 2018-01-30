
$(function(){
	//js 파일 안에서는 jstl 안됨!
	
	$("#bt_minus").click(function(){
		var val = Number($("#quantity").val());
		if(val>1){
			val-=1
		}
		$("#quantity").val(val);
	});
	
	$("#bt_plus").click(function(){
		var val = Number($("#quantity").val());
		if(val<99){
			val+=1
		}
		$("#quantity").val(val);
	});
	
});//ready


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