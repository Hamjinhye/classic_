
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
