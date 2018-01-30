/**
 * 
 */

//faq List
$( function() {
  $( "#faqAccordion" ).accordion({
    collapsible: true
  });
});
//Notice Detail
function readNotice(num){
	var setting={
			url: "/classic_shop/notice/read.do?num="+num,
			data: "GET",
			dataType: "json",
			success: function(data){
				$(".notice_div table").hide();
				//$(".comu_paging").hide();
				var notice_contents="";
				$(data).each(function(index, item){
					notice_contents+="<table class='table table-condensed'>";
					notice_contents+="<tbody class='notice_read_title'>";
					notice_contents+="<tr>";
					notice_contents+="<th>TITEL</th>";
					notice_contents+="<td>"+item.title+"</td>";
					notice_contents+="<th>NAME</th>";
					notice_contents+="<td>"+item.name+"</td>";
					notice_contents+="</tr>";
					notice_contents+="<tr>";
					notice_contents+="<th>DATE</th>";
					notice_contents+="<td>"+item.indate+"</td>";
					notice_contents+="<th>VIEW</th>";
					notice_contents+="<td>"+item.count+"</td>";
					notice_contents+="</tr>";
					notice_contents+="</tbody>";
					notice_contents+="</table>";
					notice_contents+="<table class='table table-bordered'>";
					notice_contents+="<tbody class='notice_read_contents'>";
					notice_contents+="<td>"+item.content+"</td>";
					notice_contents+="</tbody>";
					notice_contents+="</table>";
				});
				$(".notice_div").html(notice_contents);
				//notice '목록' btn 추가
				var $div = $("<div id='noticeListBtnDiv'></div>");
				$('.notice_div').after($div);
				$("<button type='button' class='btn btn-default' onclick='noticeListBtn()'>목록</button>").appendTo("#noticeListBtnDiv");
			}
	}
	$.ajax(setting);
}
//Notice List
var noticeListBtn = function(){
	location.href="/classic_shop/community/notice.do";
}

//qnaListBtn
var qnaListBtn = function(){
	location.href="/classic_shop/community/qna.do";
}

//qnaDelete
var removeQna = function(num){
	var removeNum = num;
	var setting={
			url: "/classic_shop/community/qna/read.do?num="+removeNum,
			type: "DELETE",
			dataType: "json",
			success: function(data){
				if(data["remove"]){
					alert("문의하신 글이 정상적으로 삭제 되었습니다.");
					qnaListBtn();
				} else{
					alert("다시 시도해주세요.")
				}
			}
	}
	$.ajax(setting);
}

var qnaSecureCheck = function(qnaNum){
	var qnaNum = qnaNum;
	var secureOpen = window.open("/classic_shop/community/qna/secure.do?qnaNum="+qnaNum, "_blank", "width=300, height=300");
}

//qnaModify
var modifyQnaForm = function(num){
	var modifyNum = num;
	location.href="/classic_shop/community/qna/modify.do?num="+modifyNum;
}

var modifyQna = function(qnaModifyForm){
	var num = qnaModifyForm.qnaNum.value;
	var mem_num = qnaModifyForm.memNum.value;
	var subject = qnaModifyForm.subject.value;
	var content = qnaModifyForm.qnaContent.value;
	var secure = qnaModifyForm.qnaSecure.value;
	var pwd = qnaModifyForm.qnaPwd.value;
	var urlSet = "/classic_shop/community/qna/modify.do?num="+num;
	var method = "PUT";
	var http = new XMLHttpRequest();
	var url = urlSet+"&mem_num="+num+"&subject="+subject+"&content="+content+"&secure="+secure+"&pwd="+pwd;
	http.open(method, url, true);
	http.onreadystatechange = function(){
		if(this.readyState==4 && this.status==200){
			var modifyVal = JSON.parse(this.responseText)["modify"];
			if(modifyVal){
				alert("등록하신 글이 정상적으로 수정 되었습니다.");
				qnaListBtn();
			} else {
				alert("다시 시도해주세요.");
			}
		}
	}
	http.send();
}

//qnaInsert
var registerQna = function(qnaRegisterForm){
	//첨부파일 아직X
	var mem_num = qnaRegisterForm.memNum.value;
	var subject = qnaRegisterForm.subject.value;
	var content = qnaRegisterForm.qnaContent.value;
	var secure = qnaRegisterForm.qnaSecure.value;
	var pwd = qnaRegisterForm.qnaPwd.value;
	var url = "/classic_shop/community/qna/register.do";
	var method = "POST";
	var data = "mem_num="+mem_num+"&subject="+subject+"&content="+content+"&secure="+secure+"&pwd="+pwd;
	console.log(data);
	var http = new XMLHttpRequest();
	http.open(method, url, true);
	http.onreadystatechange = function(){
		if(this.readyState==4 && this.status==200){
			var register = JSON.parse(this.response)["register"];
			if(register){
				alert("문의하신 글이 정상적으로 등록 되었습니다.");
				qnaListBtn();
			}else{
				alert("다시 시도해주세요.");
			}
		}
	}
	http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	http.send(data);
}

/* QNA register PWD 활성/비활성 설정 */
$(function(){
	$(".qna-secure-data").change(function(){
		var secureVal = $(".qna-secure-data input[type='radio']:checked").val();
		if(secureVal=="1"){
			$(".qna-pwd-data input").prop('disabled', false);
		}else{
			$(".qna-pwd-data input").prop('disabled', true);
		}
	});
});


//QNA 첨부파일 Form 추가
$(function(){
	$("#addFileForm").click(function(){
		$("#qnaFileTbody>tr:last").clone(true).insertAfter("#qnaFileTbody>tr:last");
		$("#qnaFileTbody>tr:last #fileName").val("");
		$("#qnaFileTbody>tr:last #removeSpan").attr("style", "display: inline-block");
		return false;
	});
	$("#removeFileForm").click(function(){
		$("#qnaFileTbody>tr:last").remove();
		return false;
	});
});

//QNA 검색
$("#qnaSearchField").click(function(){
	var qnaSearchOption = $("#qnaSearchField").val();
	if(qnaSearchOption == 9){
		$("#qnaSubjectNum").attr("style", "display: inline-block");
		$("#qnaSearchValue").attr("style", "display: none");
		$("#qnaSearchBtn").attr("style", "display: none");
	} else{
		$("#qnaSubjectNum").attr("style", "display: none");
		$("#qnaSearchValue").attr("style", "display: inline-block");
		$("#qnaSearchBtn").attr("style", "display: inline-block");
	}
});
