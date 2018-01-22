<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="comu_body">
	<div class="container">
	<p class="comu_title">NOTICE</p>
		<!--글 등록 -->
		<form name="noticeRegisterForm method=post action="">
			<!-- SUBJECT 선택 -->
			<div class="form-group">
				<label id="subjectField">TITLE</label>
				<td><input name="title" size="220"></td>
			</div>
			<!--글 내용 -->
			<div class="form-group">
				<textarea class="form-control" rows="20" name="noticeContents"></textarea>
			</div>
			<!--첨부파일 및 옵션 -->
			<div class="notice_option">
				<label class="col-xs-2">File Upload</label>
				<input type="file" id="noticeFile" style="margin: 0; display: inline-block;">
			</div>
			<div class="notice_option">
				<label class="col-xs-2">공개</label>
					<div class="checkbox">
						<input type="radio" name="secure" id="noticeOpen" value="0" checked> 공개
						<input type="radio" name="secure" id="noticeSecure" value="1"> 비공개
					</div>
			</div>
			<div class="notice_option">
				<label class="col-xs-2">Password</label>
				<input type="password" name="pwd" placeholder="비밀번호 설정" disabled>
			</div>
			<!--  버튼 -->
			<div class="notice_btn_group">
				<button type="submit" class="btn btn-default btn-lg">등록</button>
				<button type="reset" class="btn btn-default btn-lg" onclick="location.href='<c:url value='/comu/notice/adminlist.jsp'/>'">취소</button>
			</div>
		</form>
	</div>
</div>

