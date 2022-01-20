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
			var url = "/message/sendMessage";
			
			var sendData = {
					"service_message_sender" : service_message_sender,
					"service_message_receiver" : service_message_receiver,
					"service_message_title" : service_message_title,
					"service_message_content" : service_message_content
			};
			
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
			
			
			console.log("service_message_sender >> " + service_message_sender);
			console.log("service_message_receiver >> " + service_message_receiver);
			$.post(url , sendData , function(rData){
				console.log(rData);
				if(rData == "success"){
					alert("메세지가 성공적으로 발송되었습니다.");
					location.href="/message/messageList";
				}else if(rData == "fail"){
					alert("존재하는 사용자가 없습니다.");
					return false;
				}
			});
		});
		
		// 글자 수 세기
		$("#service_message_content").on("keyup" , function(){
			var service_message_content = $(this).val().length;
			$("#test-cnt").html("(" + service_message_content + " / 3000)");
			
			if(service_message_content > 3000){
				 $(this).val($(this).val().substring(0, 3000));
				 $("#test-cnt").html("(3000 / 3000)");
			}
		});
	});
	
	// 바이트 계산
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
			<form role="form">
				<c:choose>
					<c:when test="${sessionScope.memberVo.userid == 'service_center_admin'}">
						<div class="form-group">
							<label for="service_message_sender">관리자 아이디 </label>
							<input type="text" id="service_message_sender" name="service_message_sender" class="form-control" style="width: 330px;" placeholder="관리자의 아이디는 service_center_admin" value="${sessionScope.memberVo.userid}"/>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-group">
							<label for="service_message_sender">수강생 아이디 </label>
							<input type="text" id="service_message_sender" name="service_message_sender" class="form-control" style="width: 330px;" placeholder="수강생의 아이디를 입력하세요." value="${sessionScope.memberVo.userid}"/>
						</div>
					</c:otherwise>					
				</c:choose>
			<c:choose>
				<c:when test="${sessionScope.memberVo.userid == 'service_center_admin'}">	
					<div class="form-group">
						<label for="service_message_receiver">수강생 아이디</label>
						<input type="text" id="service_receiver" name="service_message_receiver" class="form-control" style="width: 330px;" placeholder="수강생의 아이디를 입력하세요." />
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="service_message_receiver">관리자 아이디</label>
						<input type="text" id="service_receiver" name="service_message_receiver" class="form-control" style="width: 330px;" placeholder="관리자의 아이디는 service_center_admin" />
					</div>				
				</c:otherwise>
			</c:choose>
				<div class="form-group">
					<label for="service_message_title">제목</label>
					<input type="text" id="service_message_title" name="service_message_title" class="form-control" style="width: 400px;" placeholder="제목을 입력하세요"/>
				</div>
				<div class="form-group">
					<label for="service_message_content">내용</label>
					<input type="text" id="service_message_content" name="service_message_content" class="form-control" style="width: 400px; height: 200px;" placeholder="내용을 입력하세요." onkeyup="fnChkByte(this, 3000)" /><div id="test-cnt">(0 / 3000)</div>
					<span id="byteInfo">바이트수 : 0</span>
				</div>
				<button type="button" id="sendMessage" class="btn btn-primary">보내기</button>
				<button type="reset" class="btn btn-primary">초기화</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>