/**
 * 
 */
//Member Login
$(function(){
	$("#joinBtn").click(function(){
		location.href="/classic_shop/signup.do";
	});
});

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
						if(data.checkIdMsg){ //checkIdMsg == true
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
var url = "join.do";
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
