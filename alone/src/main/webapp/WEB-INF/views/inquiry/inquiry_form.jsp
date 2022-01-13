<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>건의사항 페이지</title>
</head>
<script>
	$(function(){
		$("#inquiry_btn").click(function(e){
			e.preventDefault();
			var inquiry_userid = $("#inquiry_userid").val();
			var inquiry_title = $("#inquiry_title").val();
			var inquiry_content = $("#inquiry_content").val();
			var inquiry_password = $("#inquiry_password").val();
 			var url = "/inquiry/insertrun";
 			var sendData = {
					"inquiry_userid" : inquiry_userid,
					"inquiry_title" : inquiry_title,
					"inquiry_content" : inquiry_content,
					"inquiry_password" : inquiry_password
			};
 			
 			// 건의 사항 폼 무결성 검사
 			if(inquiry_userid == "" || inquiry_userid.length == 0){
 				alert("아이디를 입력하세요.");
 				return false;
 			}else if(inquiry_userid.length >= 51){
 				alert("아이디의 길이는 50byte 까지 입니다.");
 				return false;
 			}else if(inquiry_title == "" || inquiry_title.length == 0){
 				alert("글 제목을 입력하세요.");
 				return false;
 			}else if(inquiry_title.length >= 301){
 				alert("글 제목의 길이는 300byte 까지 입니다.");
 				return false;
 			}else if(inquiry_content == "" || inquiry_content.length == 0){
 				alert("글 내용을 입력하세요.");
 				return false;
 			}else if(inquiry_content.length >= 3001){
 				alert("글 내용의 길이는 3000byte 까지 입니다.");
 				return false;
 			}
			
			$.post(url, sendData , function(rData){
				console.log(rData);
				if(rData == "success"){
					location.href="/inquiry/listall";
				}
			});
		});
	});
</script>
<div class="container-fluid">
	<div class="row">ㄴ
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>건의사항 신청 페이지</h2>
			</div>
			<form role="form">
					<div class="form-group"> 
						<label for="inquiry_userid">아이디</label>
						<input type="text" class="form-control" id="inquiry_userid" name="inquiry_userid" style="width:500px;"/>
					</div>
					<div class="form-group">
						<label for="inquiry_title">글 제목</label>
						<input type="text" class="form-control" id="inquiry_title" name="inquiry_title" style="width:500px;"/>
					</div>
					<div class="form-group">
						<label for="inquiry_content">글 내용</label>
						<textarea class="form-control" rows="5" id="inquiry_content" name="inquiry_content" cols="5" style="width:500px;"></textarea>
					</div>
					<div class="form-group">
						<label for="inquiry_password">글 비밀번호 입력</label>
						<input type="password" class="form-control-file" id="inquiry_password" name="inquiry_password" style="width:100px;"/>
					</div>						
					<button type="submit" class="btn btn-primary" id="inquiry_btn">제출</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>