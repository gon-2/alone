<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 게시판 페이지</title>
<script>
	// 무결성 검사
	function checkValue(){
		var class_board_userid_getid = document.getElementById("class_board_userid");
		var class_board_title_getid = document.getElementById("class_board_title");
		var class_board_content_getid = document.getElementById("class_board_content");
		var frmReg = document.frmReg;
		
		var class_board_userid_value = class_board_userid_getid.value;
		var class_board_title_value = class_board_title_getid.value;
		var class_board_content_value = class_board_content.value;
		
		if(class_board_userid_value == "" || class_board_userid_value.length == 0 || class_board_userid_value.length >= 51){
			alert("아이디의 길이는 총 50byte 까지 입니다.");
			return false;
		}else if(class_board_title_value == "" || class_board_title_value.length == 0 || class_board_title_value.length >= 301){
			alert("제목의 길이는 총 300byte 까지 입니다.");
			return false;
		}else if(class_board_content_value == "" || class_board_content_value.length == 0 || class_board_content_value.length >= 3001){
			alert("내용의 길이는 총 3000byte 까지 입니다.");
			return false;
		}else{
			frmReg.action = "/class_board/run";
			frmReg.method = "post";
			frmReg.submit();
		}
	}
</script>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>수강신청 게시판 글 올리기</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/class_board/class_regist">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" name="frmReg">
				<div class="form-group">		 
					<label for="class_board_userid">아이디</label>
					<input type="text" class="form-control" id="class_board_userid" name="class_board_userid" style="width:200px;" placeholder="아이디 입력"/>
				</div>
				<div class="form-group">
					<label for="class_board_title">상담 제목</label>
					<input type="text" class="form-control" id="class_board_title" name="class_board_title" style="width:300px;" placeholder="상담 제목 입력"/>
				</div>
				<div class="form-group">
					<label for="class_board_enroll">상담할 수강 과정 선택</label><br>
					<select id="class_board_enroll" name="class_board_enroll">
						<option value="주간반">주간반</option>
						<option value="야간반">야간반</option>
						<option value="주말반">주말반</option>
					</select>
				</div>
				<div class="form-group">
					<label for="class_board_content">상담 내용</label><br>
					<textarea style="width:300px; height:100px;" placeholder="상담할 내용을 입력하세요." id="class_board_content" name="class_board_content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary" onclick="checkValue();">게시</button>
				<button type="reset" class="btn btn-success">다시 입력</button>
			</form> 
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>