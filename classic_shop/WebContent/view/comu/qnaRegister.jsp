<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>
</head>
<body>
<!-- COMMUNITY MENU -->
<div class="comu_menu">
	<div class="container">
		<h2>COMMUNITY</h2>
			<ul class="nav nav-tabs">
				<li><a href="<c:url value='/community/notice.do' />">NOTICE</a></li>
				<li><a href="<c:url value='/community/qna.do' />">QNA</a></li>
				<li><a href="<c:url value='/community/faq.do' />">FAQ</a></li>
			</ul>
	</div>
</div>
<div class="comu_body">
	<div class="container-fluid">
		<p class="comu_title">QNA</p>
		<!-- QNA 글 등록 -->
		<form name="qnaRegisterForm" action="<c:url value='/community/qna/register.do'/>" method="post" enctype="multipart/form-data">
			<div class="rable-responsive">
				<table class="table table-hover">
					<tbody>
						<!-- SUBJECT 선택 -->
						<tr class="qna-subject-row">
							<th class="col-xs-2 qna-subject-head">SUBJECT</th>
							<td class="col-8 qna-subject-data">
								<select id="qnaSubject" name="subject" class="form-control">
									<option value="">선택</option>
									<option value="0">상품 문의</option>
									<option value="1">배송 문의</option>
									<option value="2">배송 전 변경</option>
									<option value="3">입금 문의</option>
									<option value="4">교환/환불 문의</option>
									<option value="5">기타 문의</option>
								</select>
								<input type="hidden" name="memNum" value="${loginMem.num}">
							</td>
						</tr>
						<!-- QNA 글 내용 -->
						<tr class="qna-content-row">
							<th class="col-2 qna-content-head">CONTENT</th>
							<td><textarea class="col-8 form-control qna-content-data" rows="20" name="qnaContent"></textarea></td>
						</tr>
					</tbody>
					<!-- QNA 첨부파일 및 옵션 -->
					<tbody id="qnaFileTbody">
						<tr class="qna-file-row">
							<th class="col-2 qna-file-head">FILE</th>
							<td class="qna-file-data" style="text-align: left;">
								<input type="file" name="qnaFileName" id="fileName" style="display: inline-block;">
								<span class="qna-file-option" style="display: inline-block;">
									<a id="addFileForm" class="form-control"><i class="fa fa-plus"></i></a>
								</span>
								<span id="removeSpan" class="qna-file-option" style="display: none;">
									<a id="removeFileForm" class="form-control"><i class="fa fa-minus"></i></a>
								</span>
								<span id="filesize" style="color:red;"></span>
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr class="qna-secure-row">
							<th class="col-2 qna-secure-head">SECRET</th>
							<td class="qna-secure-data" style="text-align: left;">
								<input type="radio" name="qnaSecure" id="qnaSecure0" value="0" checked>
								<label for="qnaSecure0">공개</label>
								<input type="radio" name="qnaSecure" id="qnaSecure1" value="1">
								<label for="qnaSecure1">비공개</label>
							</td>
						</tr>
						<tr class="qna-pwd-row">
							<th class="col-2 qna-pwd-head">PASSWORD</th>
							<td class="qna-pwd-data" style="text-align: left;">
								<input type="password" name="qnaPwd" placeholder="비밀번호 설정" class="form-control" id="qnaPwSet" disabled>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- QNA 버튼 -->
				<div class="qna-btn-group" style="float: right;">
					<button type="button" class="btn btn-default btn" onclick="registerQna(this.form)">등록</button>
					<button type="button" class="btn btn-default btn" onclick="qnaListBtn()">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>


<!-- <script>
var filesize = 0;
var filetype = "";
	
//파일 용량 체크
function bytesToSize(bytes){
	var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB''];
	if(bytes==0) return '0 Byte';
	var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
	return Math.round(bytes / Math.pow(1024, i), 2)+' '+sizes[i];
};

//파일 사이즈 체크
$(".qna-file-data>input[type='file']").bind('change', function(){
	filesize=this.files[0].size;
	filesize=bytesToSize(filesize);
	var point=this.files[0].name.lastIndexOf('.');
	filetype=this.files[0].name.substring(point+1,this.lenght).toLowerCase();
	console.log(filesize);
	$('#filesize').text("("+filesize +")");
	if(filetype != 'gif' && filetype != 'jpg' && filetype != 'jpeg' && filetype != 'png'){
		//$('img').hide();
		$('#filetype').show();
	}else{
		//$('img').show();
		$('#filetype').hide();
	}
	setTimeout(function() {setHeight()}, 0);
   });

//이미지 미리보기
$(function() {
          $(".qna-file-data>input[type='file']").on('change', function(){
              readURL(this);
          });
      });

      function readURL(input) {
          if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
                  $('#preImage').attr('src', e.target.result);
              }
            reader.readAsDataURL(input.files[0]);
          }
      }
});
</script> -->
