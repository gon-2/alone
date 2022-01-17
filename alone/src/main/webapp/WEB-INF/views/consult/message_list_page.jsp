<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp"%>
<script>
	$(function(){
		$(".resend").click(function(e){
			e.preventDefault();
			$("#modal-146838").trigger("click");
		});
		$("#resendbtn").click(function(e){
			e.preventDefault();
			var service_message_sender = $("#service_message_senders").val();
			var service_message_receiver = $("#service_message_receivers").val();
			var service_message_title = $("#service_message_titles").val();
			var service_message_content = $("#service_message_contents").val();
			
			var sendData = {
				"service_message_sender" : service_message_sender,
				"service_message_receiver" : service_message_receiver,
				"service_message_title" : service_message_title,
				"service_message_content" : service_message_content
			}
			
			var url = "/message/sendMessage";
			
			// 무결성 검사
			if(service_message_sender.length >= 51 || service_message_sender == ""){
				alert("보내는사람의 길이는 50자 이하입니다.");
				return false;
			}else if(service_message_receiver.length >= 51 || service_message_receiver == ""){
				alert("받는사람의 길이는 50자 이하입니다.");
				return false;				
			}else if(service_message_title.length >= 501 || service_message_title == ""){
				alert("제목의 길이는 50자 이하입니다.");
				return false;								
			}else if(service_message_content.length >= 1001 || service_message_content == ""){
				alert("내용의 길이는 50자 이하입니다.");
				return false;				
			}
			
			$.post(url , sendData, function(rData){
				console.log(rData);
				if(rData == "success"){
					alert("답장이 완료되었습니다.");
					location.href="/message/messageList";
				}else{
					alert("답장에 실패하였습니다.");
					return false;
				}
			});
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-146838" href="#modal-container-146838" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container-146838" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">답장하기</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="service_message_sender">보내는사람 : </label>
							<input type="text" id="service_message_senders" name="service_message_sender"><br>
							<label for="service_message_receiver">받는사람 : </label>
							<input type="text" id="service_message_receivers" name="service_message_receiver"><br>
							<label for="service_message_title">제목 : </label>
							<input type="text" id="service_message_titles" name="service_message_title"><br>
							<label for="service_message_content">내용 : </label>
							<input type="text" id="service_message_contents" name="service_message_content" style="width:400px; height:200px;" >
 						</div>
						<div class="modal-footer">
							<button type="button" id="resendbtn" class="btn btn-primary resendbtn">답장</button> 
							<button type="button" id="closebtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="jumbotron">
				<h2 align="center">메세지 리스트</h2>
			</div>
			<table class="table">
				<thead>
							<tr align="center">
								<th>보낸사람</th>
								<th>받은사람</th>
								<th>메세지 제목</th>
								<th>날짜</th>
								<th>메세지 갯수</th>
								<th>답장</th>
							</tr>

				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty sessionScope.memberVo}">
							<td>로그인이 필요합니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach items="${recieverLists}" var="ServiceMessageVo">
								<tr align="center">
									<td>${ServiceMessageVo.service_message_sender}</td>
									<td>${ServiceMessageVo.service_message_receiver}</td>
									<c:if test="${sessionScope.memberVo.userid == ServiceMessageVo.service_message_receiver}">
										<td><a href="/message/getMessage?tbl_service_message=${ServiceMessageVo.service_message_title}">${ServiceMessageVo.service_message_title}</a></td>
									</c:if>
									<c:if test="${sessionScope.memberVo.userid != ServiceMessageVo.service_message_receiver}">
										<td><a href="/message/getMessage?tbl_service_message=${ServiceMessageVo.service_message_title}">${ServiceMessageVo.service_message_title}</a></td>
									</c:if>
									<td><fmt:formatDate value="${ServiceMessageVo.service_message_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
									<td>${ServiceMessageVo.service_message_count}</td>
									<c:if test="${sessionScope.memberVo.userid == ServiceMessageVo.service_message_receiver}">
										<td><button class="btn btn-sm btn-primary resend" id="resend">답장</button></td>
									</c:if>
									<c:if test="${sessionScope.memberVo.userid != ServiceMessageVo.service_message_receiver}">
										<td>답장 불가능한 ID</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp"%>