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
			
			// 유효성 검사
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
		// 글자 수 세기
		$("#service_message_contents").on("keyup" , function(){
			var service_message_contents = $(this).val().length;
			
			$("#test-cnt").html("(" + service_message_contents + " / 3000");
			
			if(service_message_contents > 3000){
				 $(this).val($(this).val().substring(0, 3000));
				 $("#test-cnt").html("(3000 / 3000)");
			}
		});
	});
		
    function fnChkByte(obj, maxByte){
        var str = obj.value;
        var str_len = str.length;
 
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
 
        for(var i=0; i<str_len; i++){
            one_char = str.charAt(i);
            if(escape(one_char).length > 4){
                rbyte += 2;    //한글2Byte
            }else{
                rbyte++;    //영문 등 나머지 1Byte
            }
 
            if(rbyte <= maxByte){
                rlen = i+1;    //return할 문자열 갯수
            }
        }
 
        if(rbyte > maxByte){
            alert("한글 " +"1699자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
            str2 = str.substr(0,rlen);    //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
        }else{
            document.getElementById('byteInfo').innerText = "바이트 수 : " + rbyte;
        }
    }
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
							<input type="text" id="service_message_senders" name="service_message_sender" value="${sessionScope.memberVo.userid}"><br>
							<label for="service_message_receiver">받는사람 : </label>
							<input type="text" id="service_message_receivers" name="service_message_receiver" value="service_center_admin"><br>
							<label for="service_message_title">제목 : </label>
							<input type="text" id="service_message_titles" name="service_message_title"><br>
							<label for="service_message_content">내용 : </label>
							<input type="text" id="service_message_contents" name="service_message_content" style="width:400px; height:200px;" onkeyup="fnChkByte(this, 3000)"><div id="test-cnt">글자수 : (0 / 3000)</div>
 							<span id="byteInfo">바이트수 : 0</span>
 						</div>
						<div class="modal-footer">
							<button type="button" id="resendbtn" class="btn btn-primary resendbtn">답장</button> 
							<button type="button" id="closebtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="jumbotron">
				<h2 align="center">메세지 내역</h2>
			</div>
			<table class="table">
				<thead>
					<c:if test="${sessionScope.memberVo.userid != ServiceMessageVo.service_message_receiver}">	
						<tr align="center">
							<th>보낸사람</th>
							<th>받은사람</th>
							<th>메세지 제목</th>
							<th>날짜</th>
							<th>답장</th>
						</tr>
					</c:if>
					<c:if test="${sessionScope.memberVo.userid == ServiceMessageVo.service_message_receiver}">
					
					</c:if>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty sessionScope.memberVo}">
							<td>로그인이 필요합니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach items="${recieverLists}" var="ServiceMessageVo">
								<tr align="center">
									<c:if test="${sessionScope.memberVo.userid == ServiceMessageVo.service_message_receiver}">
										<td>${ServiceMessageVo.service_message_sender}</td>
										<td>${ServiceMessageVo.service_message_receiver}</td>
										<td><a href="/message/getMessage?tbl_service_message=${ServiceMessageVo.service_message_title}">${ServiceMessageVo.service_message_title}</a></td>
										<td><fmt:formatDate value="${ServiceMessageVo.service_message_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
										<td><button class="btn btn-sm btn-primary resend" id="resend">답장</button></td>
									</c:if>
									<c:if test="${sessionScope.memberVo.userid != ServiceMessageVo.service_message_receiver}">

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