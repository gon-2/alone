<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강생 상담 쪽지 보내는 페이지</title>
</head>
<script>
	$(function(){
		// 메세지 보내기 버튼 클릭 시 이벤트
		$("#sendMessage").click(function(e){
			e.preventDefault();
			var service_message_sender = $("#service_message_sender").val();
			var service_message_receiver = $("#service_receiver").val();
			var service_message_title = $("#service_message_title").val();
			var service_message_content = $("#service_message_content").val();
			var url = "/sendMessage";
			
			var sendData = {
					"service_message_sender" : service_message_sender,
					"service_message_receiver" : service_message_receiver,
					"service_message_title" : service_message_title,
					"service_message_content" : service_message_content
			};
			console.log("service_message_sender >> " + service_message_sender);
			console.log("service_message_receiver >> " + service_message_receiver);
			$.post(url , sendData , function(rData){
				console.log(rData);
				if(rData == "success"){
					alert("메세지가 성공적으로 발송되었습니다.");
				}else if(rData == "fail"){
					alert("존재하는 사용자가 없습니다.");
					return false;
				}
			});
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					<label for="service_message_sender">관리자 아이디 </label>
					<input type="text" id="service_message_sender" name="service_message_sender" class="form-control" style="width: 200px;" placeholder="아이디를 입력하세요."/>
				</div>
				<div class="form-group">
					<label for="service_message_receiver">받는 수강생 아이디</label>
					<input type="text" id="service_receiver" name="service_message_receiver" class="form-control" style="width: 200px;" placeholder="비밀번호를 입력하세요." />
				</div>
				<div class="form-group">
					<label for="service_message_title">제목</label>
					<input type="text" id="service_message_title" name="service_message_title" class="form-control" style="width: 400px;" placeholder="제목을 입력하세요"/>
				</div>
				<div class="form-group">
					<label for="service_message_content">내용</label>
					<input type="text" id="service_message_content" name="service_message_content" class="form-control" style="width: 400px; height: 200px;" placeholder="내용을 입력하세요." />
				</div>
				<button type="button" id="sendMessage" class="btn btn-primary">보내기</button>
				<button type="reset" class="btn btn-primary">초기화</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>