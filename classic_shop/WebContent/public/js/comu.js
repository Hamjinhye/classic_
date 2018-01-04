/**
 * 
 */
//QNA LIST
$(function(){
	$(document).ready(function(){
		var setting={
				//url: "<c:url value='/qna.do'/>",
				url: "/classic_shop/qna.do",
				type: "GET",
				dataType: "json",
				success: function(data){
					console.log(data);
					var qna_contents="";
					$(data).each(function(index,item){
						qna_contents+="<tr>";
						qna_contents+="<td>"+item.num+"</td>";
						qna_contents+="<td>"+item.subject+"</td>";
						qna_contents+="<td>"+item.name+"</td>";
						qna_contents+="<td>"+item.indate+"</td>";
						qna_contents+="<td>"+item.count+"</td>";
						qna_contents+="</tr>";
					});
					$(".qna_contents").html(qna_contents);
				}
			}
			$.ajax(setting);
	});
});
