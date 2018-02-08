/**
 * 
 */
//Member Login
$(function(){
	$("#joinBtn").click(function(){
		location.href="/classic_shop/signup.do";
	});
});
/*
//Google Login
function onSignIn(googleUser){
	var profile = googleUser.getBasicProfile();
	console.log("ID: " + profile.getId()); 
	console.log('Full Name: ' + profile.getName());
	console.log('Given Name: ' + profile.getGivenName());
	console.log('Family Name: ' + profile.getFamilyName());
	console.log("Image URL: " + profile.getImageUrl());
	console.log("Email: " + profile.getEmail());
	var id_token = googleUser.getAuthResponse().id_token;
	console.log("ID Token: " + id_token);
};

 경미: 내 js가 안 먹어서 naver.login 전체 주석했었는데.........
 * 주석 다시 푸려고 보니까 주석안에 주석이 사라져서 오류가 나는데.........
 * 결론: 어디부터 어디까지 주석이었는지 잘 모르곘어여............ 네이버 로그인 안에서 ...고친 거 없음... 주석만 했음...
 
//NAVER Login
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "jyvqXeaVOVmV",
		callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/oauth/sample/callback.html",
		isPopup: false,
		loginButton: {color: "green", type: 3, height: 60}
	}
);
// (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 
naverLogin.init();

// (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 
$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

// (5) 현재 로그인 상태를 확인 
window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
//			 (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. 
			setLoginStatus();
		}
	});
});

// (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. 
function setLoginStatus() {
	var profileImage = naverLogin.user.getProfileImage();
	var nickName = naverLogin.user.getNickName();
	$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
	$("#gnbLogin").html("Logout");
	$("#gnbLogin").attr("href", "#");
//	 (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. 
	$("#gnbLogin").click(function () {
		naverLogin.logout();
		location.reload();
	});
}
//Naver Login ABOVE!

*/
//ID/PW search
var searchIdPwd = function(){
	window.open("view/member/searchIdPwdBom.html","_blank","top=100 left=200 width=400 height=400");
}

//Member Join
var joinCancelBtn = function(){
	location.href="/classic_shop/main.do";
}

var idStrFlag = false;
var pwStrFlag = false;
var mailStrFlag = false;
var agreeFlag = false;

//id 유효성 검사
$(function(){
	$("#memIdInput").keyup(function(){
		var idVal = $(this).val();
		var idStrCheck = /^[a-z]\w/;
		idStrFlag = false;
		if(idVal.length < 4 || idVal.length >12){ //id 4자 미만, 12자 초과인 경우
			$("#checkIdMsg").html("아이디는 4자 이상, 12자 이하여야 합니다.").css("color","red");
		} else if(!(idStrCheck.test(idVal))){ //id 정규식 표현에 어긋난 경우
			$("#checkIdMsg").html("아이디는 영문/숫자/_로 구성, 첫글자는 영문만 사용 가능합니다.").css("color","red");
		} else{
			var setting={
					url: "/classic_shop/signup/checkId.do?id="+idVal,
					type: "GET",
					dataType: "json",
					success: function(data){
						if(!(data.checkIdMsg)){ //checkIdMsg == false
							$("#checkIdMsg").html("사용 가능한 아이디입니다.").css("color","blue");
							idStrFlag = true;
						}else{
							$("#checkIdMsg").html("사용 불가능한 아이디입니다.").css("color","red");
						}
					}
			}
			$.ajax(setting);
		}
	});
});

//pwd 유효성 검사
$(function(){
	$("#memPwCheck").keyup(function(){
		var pwVal = $(this).val();
		var pwValCheck = $("#memPwInput").val();
		var pwStrCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,12}$/;
		if(pwVal.length < 4 || pwVal.length >12){ //pw 4~12
			$("#checkPwMsg").html("비밀번호는 4자 이상, 12자 이하여야 합니다.").css("color","red");
		} else if(!(pwStrCheck.test(pwVal))){ //pw 영문, 숫자, 특문
			$("#checkPwMsg").html("비밀번호는 영문/숫자/특수문자가 포함되어야 합니다.").css("color","red");
		} else if(pwVal!=pwValCheck){ //pw 일치
			$("#checkPwMsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
		} else { //pw 일치
			$("#checkPwMsg").html("사용 가능한 비밀번호 입니다.").css("color","blue");
			pwStrFlag = true;
		}
	});
});
		
//이메일 유효성 검사
$(function(){
	$("#memEmailInput").keyup(function(){
		var mail = $(this).val();
		var mailStrCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!(mailStrCheck.test(mail))){
			$("#checkEmailMsg").html("이메일 주소가 올바르지 않을 경우 가입에 제한이 있을 수 있습니다.").css("color","red");
		} else{
			var setting={
					url: "/classic_shop/signup/checkMail.do?mail="+mail,
					type: "GET",
					dataType: "json",
					success: function(data){
						if(!(data.checkEmailMsg)){ //false == mail 사용 가능
							$("#checkEmailMsg").html("사용 가능한 이메일 입니다.").css("color","blue");
							mailStrFlag = true;
						}else{ //true == mail 중복
							$("#checkEmailMsg").html("사용 불가능한 이메일 입니다.").css("color","red");
						}
					}
			}
			$.ajax(setting);
		}
	});
});

//이용약관 유효성 검사
$(function(){
	$("#userAgreeAllCheck").change(function(){
		if(!($("#userAgreeAllCheck").is(":checked"))){
			alert("이용 약관과 개인정보 수집 및 이용에 동의해주세요.");
		}else{
			agreeFlag = true;
		}
	});
});

//회원가입
var url = "signup.do";
var joinJson = function(joinForm){
	if(idStrFlag && pwStrFlag && mailStrFlag && agreeFlag){
		var method = "POST";
		var id = joinForm.id.value;
		var pw = joinForm.pw.value;
		var phone = joinForm.phone.value;
		var mail = joinForm.mail.value;
			var data = "id="+id+"&pw="+pw+"&phone="+phone+"&mail="+mail;
			var http = new XMLHttpRequest();
			http.open(method, url, true);
			http.onreadystatechange=function(){
				if(this.readyState== 4 && this.status==200){
					var register = JSON.parse(this.responseText)["register"];
					if(register){
						alert("가입을 환영합니다.");
						location.href="/classic_shop/login.do";
					}else{
						alert("다시 시도해주세요.");
					}
				}
			}
			http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			http.send(data);	
	} else if(!(idStrFlag)){
		alert("아이디를 확인해주세요.");
	}else if(!(pwStrFlag)){
		alert("비밀번호를 확인해주세요.");
	}else if(!(mailStrFlag)){
		alert("이메일 주소를 확인해주세요.");
	}else if(!(agreeFlag)){
		alert("이용 약관과 개인정보 수집 및 이용에 동의해주세요.");
	}
}

var returnMypage = function(modifyForm){
	var num = modifyForm.num.value;
	location.href="/classic_shop/user/mypage.do?num="+num;
}

//회원정보 비번 유효성
var editPwFlag = false;
$(function(){
	$("#memEditPwCheck").keyup(function(){
		var pwVal = $(this).val();
		var pwValCheck = $("#memEditPw").val();
		var pwStrCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,12}$/;
		if(pwVal.length < 4 || pwVal.length >12){ //pw 4~12
			$("#editCheckPwMsg").html("비밀번호는 4자 이상, 12자 이하여야 합니다.").css("color","red");
		} else if(!(pwStrCheck.test(pwVal))){ //pw 영문, 숫자, 특문
			$("#editCheckPwMsg").html("비밀번호는 영문/숫자/특수문자가 포함되어야 합니다.").css("color","red");
		} else if(pwVal!=pwValCheck){ //pw 일치
			$("#editCheckPwMsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
		} else { //pw 일치
			$("#editCheckPwMsg").html("사용 가능한 비밀번호 입니다.").css("color","blue");
			editPwFlag = true;
		}
	});
});

//회원정보수정
var memModify = function(memModifyForm){
	if(editPwFlag){
		var num = memModifyForm.num.value;
		var pw = memModifyForm.pw.value;
		var phone = memModifyForm.phone.value;
		var urlSet = "/classic_shop/mypage/modify.do?num="+num;
		var method = "PUT";
		var http = new XMLHttpRequest();
		var url = urlSet+"&pw="+pw+"&phong="+phone;
		http.open(method, url, true);
		http.onreadystatechange = function(){
			if(this.readyState==4 && this.status==200){
				var modifyVal = JSON.parse(this.responseText)["modify"];
				if(modifyVal){
					alert("회원정보가 정상적으로 수정 되었습니다.");
					returnMypage();
				} else{
					alert("다시 시도해주세요");
				}
			}
		}
		http.send();
	}else if(!(editPwFlag)){
		alert("비밀번호를 확인해주세요.");
	}
}


//우편번호 API
function sample6_execDaumPostcode() {
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
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById('sample6_address').value = fullAddr;

            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
//주소등록
var addrJson = function(addrForm){
	var method = "POST";
	var url = "/classic_shop/user/address/register.do"
	var check=true;
	var memNum = addrForm.memNum.value;
	var addrZip = addrForm.addrZip.value;
	var addrBase = addrForm.addrBase.value;
	var addrDetail = addrForm.addrDetail.value;
	console.log(addrZip);
	console.log(addrBase);
	console.log(addrDetail);
	
	if(!addrZip.trim() || !addrBase.trim() || !addrDetail.trim()){
		check=false;
		alert("주소 항목은 필수 입력값입니다.");
	}
	else if(check){
		var data = "mem_num="+memNum+"&zip_code="+addrZip+"&base_addr="+addrBase+"&detail_addr="+addrDetail;
		console.log(data);
		var http = new XMLHttpRequest();
		http.open(method, url, true);
		http.onreadystatechange = function(){
			if(this.readyState==4 && this.status==200){
				var register = JSON.parse(this.response)["register"];
				if(register){
					alert("등록 성공");
					location.href="/classic_shop/user/address.do?num="+memNum;
				}else{
					alert("등록 실패");
				}
			}
		}
		http.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8;");
		http.send(data);
		/* charset=UTF-8 을 추가하지 않으면 ajax 전송시 한글이 깨짐......*/
	}			
}
//전체선택
$("#checkAll").click(function(){
	var chk = $(this).is(":checked");
	if(chk){
		$("input[name=checkRow]").prop("checked",true);
	}else{
		$("input[name=checkRow]").prop("checked",false);		
	}
});
//선택삭제
var addrCheckDel= function(memNum){
	var url="/classic_shop/user/address/remove.do?mem_num="+memNum+"&addr_num=";
	var method="GET";
	var http=new XMLHttpRequest();
	var checkRow="";
	$("input[name=checkRow]:checked").each(function(){
		url+=this.value+"-";
	});
	url=url.substring(0,url.lastIndexOf("-"))	
	/* alert(url); */
	
	http.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			var delete_json = JSON.parse(this.response);
			console.log(delete_json["delete"]);
			if(delete_json["delete"]){
				alert("삭제 성공");
				location.reload();
			}else{
				alert("삭제 실패");
			}
		}
	}
	http.open(method, url, true);
	http.send();
}
//배송주소록 삭제
var addrDelBtn = function(memNum,addrNum){
	var url = "/classic_shop/user/address/remove.do?mem_num="+memNum+"&addr_num="+addrNum;
	var method = "DELETE";
	var http= new XMLHttpRequest();
	http.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			var delete_json = JSON.parse(this.response);
			console.log(delete_json["delete"]);
			if(delete_json["delete"]){
				alert("삭제 성공");
				location.href="/classic_shop/user/address.do?num="+memNum;
			}else{
				alert("삭제 실패");
			}
		}
	}
	http.open(method, url, true);
	http.send();
}