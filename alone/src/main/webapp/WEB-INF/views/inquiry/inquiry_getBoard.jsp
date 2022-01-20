<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
<title>건의사항 상세 페이지</title>
<script>
$(function(){
	
	// 삭제버튼 클릭 시 모달 보이기
	$("#deleteBoard").click(function(e){
		e.preventDefault();
		$("#modal-920809").trigger("click");
	});
	
	// 삭제확인버튼 클릭 시 리스트로 넘어가기
	$("#deleteCheck").click(function(e){
		var inquiry_number = $("#inquiry_number").val();
		var inquiry_password = $("#inquiry_password").val();
		
		var url = "/inquiry/deleteBoard";
		var sendData = {
				"inquiry_number" : inquiry_number,
				"inquiry_password" : inquiry_password
		};
		// 무결성 검사
		if(inquiry_number.length == 0 || inquiry_number == ""){
			alert("번호를 입력하세요.");
			return false;
		}else if(inquiry_password.length >= 5 || inquiry_password == "" || inquiry_password.length == 0){
			alert("비밀번호는 4자리까지 입력가능합니다. 다시 입력하세요.");
			return false;
		}
		
		$.post(url , sendData , function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("삭제되었습니다.");
				location.href="/inquiry/listall";
			}
		});
	});
	// 수정 버튼 클릭 시 이벤트
	$("#updateBoard").click(function(e){
		e.preventDefault();
		$("#modal-338142").trigger("click");
	});
	// 글자 수 세기
	$("#inquiry_contents").on("keyup" , function(){
		var inquiry_contents = $(this).val().length;
		console.log(inquiry_contents);
		
		$("#test-cnt").html("(" + inquiry_contents + " / 3000)");
 			
		if(inquiry_contents > 3000){
			 $(this).val($(this).val().substring(0, 3000));
			 $("#test-cnt").html("(3000 / 3000)");
		}
	});
	// 수정 저장 버튼 클릭 시 이벤트
	$("#updateSave").click(function(e){
		e.preventDefault();
		var inquiry_password = $("#inquiry_passwords").val();
		var inquiry_title = $("#inquiry_titles").val();
		var inquiry_content = $("#inquiry_contents").val();
		
		var url = "/inquiry/updateBoard";
		var sendData = {
			"inquiry_password" : inquiry_password,
			"inquiry_title" : inquiry_title,
			"inquiry_content" : inquiry_content,
		};
		// 무결성 검사
		if(inquiry_password.length == 0 || inquiry_password.length >= 5 || inquiry_password == ""){
			alert("비밀번호의 길이는 4자리 이하입니다. 다시 입력하세요.");
			return false;
		}else if(inquiry_title.length == 0 || inquiry_title.length >= 301 || inquiry_title == ""){
			alert("제목의 길이는 300바이트 이하입니다. 다시 입력하세요.");
			return false;
		}else if(inquiry_content.length == 0 || inquiry_content.length >= 3001 || inquiry_content == ""){
			alert("내용의 길이는 3000바이트 이하입니다. 다시 입력하세요.");
			return false;
		}
	
		$.post(url , sendData , function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("수정이 완료되었습니다.");
				location.href="/inquiry/listall";
			}
		});
	});
	// 댓글 버튼 클릭 시 이벤트
	$("#commentBoard").click(function(e){
		e.preventDefault();
		$("#modal-162465").trigger("click");
	});
	$("#saveComment").click(function(e){
		e.preventDefault();
		var inquiry_comment_userid = $("#inquiry_comment_userid").val();
		var inquiry_comment_content = $("#inquiry_comment_content").val();
		
		// 댓글 무결성 검사
		if(inquiry_comment_userid == "" || inquiry_comment_userid.length == 0 || inquiry_comment_userid.length >= 51){
			alert("아이디의 길이는 50바이트 입니다. 다시 입력하세요.");
			return false;
		}else if(inquiry_comment_content == "" || inquiry_comment_content.length == 0 || inquiry_content.length >= 301){
			alert("댓글의 길이는 300바이트 입니다. 다시 입력하세요.");
			return false;
		}
	
		var url = "/insertcomment";
		var sendData = {
			"inquiry_comment_userid" : inquiry_comment_userid,
			"inquiry_comment_content" : inquiry_comment_content
		};
		
		$.post(url , sendData , function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("성공적으로 댓글이 입력 되었습니다.");
				$("#commentclose").trigger("click");
				location.href = "/inquiry/listall";
			}
		});
	});
	// 댓글보기 클릭 시 이벤트
	$("#showcomment").click(function(e){
		e.preventDefault();
		var inquiry_comment_userid = $("#inquiry_comment_userids").val();
		var url = "/showcomment";
		var sendData = {
				"inquiry_comment_userid" : inquiry_comment_userid
		};
		
		// 댓글보기 무결성 검사
		if(inquiry_comment_userid == "" || inquiry_comment_userid.length == 0){
			alert("아이디를 입력하세요.");
			return false;
		}else if(inquiry_comment_userid.length >= 51){
			alert("아이디의 길이는 50byte입니다.");
			return false;
		}
		
		
		$.get(url , sendData , function(rData){
			console.log(rData);
			if(rData == ""){
				alert("해당하는 댓글이 없습니다.")
				return false;
			}
			$.each(rData , function(){
				$(".comment_userid").html("<h4> 아이디 : " + this.inquiry_comment_userid + "</h4>");
				$(".comment_content").html("<h4> 내용 : " + this.inquiry_comment_content + "</h4>");
				$(".comment_date").html("<h4> 시간 : " + changeDateString(this.inquiry_comment_date) + "</h4>");
			});
			$("#commentshow").show(1000);
		});
	});
	
	$("#logins").click(function(){
		location.href = "/login_form";
	});
});

	function changeDateString(timestamp){
		var dateF = new Date(timestamp);
		
		var year = dateF.getFullYear();
		var month = make2digits(dateF.getMonth() + 1);
		var date = make2digits(dateF.getDate());
		var hour = make2digits(dateF.getHours());
		var minute = make2digits(dateF.getMinutes());
		var second = make2digits(dateF.getSeconds());
		var dateString = year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
		return dateString;
	}
	
	function make2digits(num){
		if(num < 10){
			num = "0" + num;
		}
		return num;
	}
	
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
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-162465" href="#modal-container-162465" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container-162465" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">댓글을 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="inquiry_comment_userid">아이디 : </label>
							<input type="text" id="inquiry_comment_userid" name="inquiry_comment_userid" value="${sessionScope.memberVo.userid}"><br>
							<label for="inquiry_comment_content">댓글 : </label>
							<input type="text" id="inquiry_comment_content" name="inquiry_comment_content" style="width: 210px; height: 100px;" placeholder="댓글 입력" onkeyup="fnChkByte(this, 300)">
							<span id="byteInfo">바이트수 : 0</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="saveComment">댓글 저장</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="commentclose">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-920809" href="#modal-container-920809" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>	
			<div class="modal fade" id="modal-container-920809" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">삭제할 글번호와 비밀번호를 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="number" id="inquiry_number" name="inquiry_number" value="${inquiryBoardVo.inquiry_number}" readonly="readonly">
							<input type="password" id="inquiry_password" name="inquiry_password" value="${inquiryBoardVo.inquiry_password}">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="deleteCheck">삭제확인</button> 
							<button type="button" class="btn btn-secondary" id="close" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-338142" href="#modal-container-338142" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-338142" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">수정할 글 제목과 글 내용을 입력하세요. 글 번호와 비밀번호 입력은 필수입니다.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="inquiry_password">비밀번호:</label> 
							<input type="password" id="inquiry_passwords" name="inquiry_password" placeholder="비밀번호 입력"><br>
							<label for="inquiry_title">글 제목:</label>
							<input type="text" id="inquiry_titles" name="inquiry_title" value="${inquiryBoardVo.inquiry_title}"><br>
							<label for="inquiry_content">글 내용:</label>
							<textarea id="inquiry_contents" name="inquiry_content" onkeyup="fnChkByte(this, 3000)"></textarea><div id="test-cnt">(0 / 3000)</div>
							<span id="byteInfo">바이트수 : 0</span>
							<input type="hidden" id="inquiry_date" name="inquiry_date"> 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="updateSave">수정저장</button> 
							<button type="button" class="btn btn-secondary" id="close" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
			<c:choose>
				<c:when test="${inquiryBoardVo.inquiry_userid == 'service_center_admin'}">
					<h2>관리자의 게시글 입니다.</h2>
				</c:when>
				<c:otherwise>
					<h2>${inquiryBoardVo.inquiry_userid}님의   글번호 ${inquiryBoardVo.inquiry_number}번 건의사항 글입니다.</h2>
				</c:otherwise>
			</c:choose>	
				<p>
					<a href="/inquiry/listall" class="btn btn-primary">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					<label for="class_board_title">건의 제목</label>
					<input type="text" class="form-control" id="inquiry_title" name="inquiry_title" style="width:300px;" readonly="readonly" value="${inquiryBoardVo.inquiry_title}"/>
				</div>
				<div class="form-group">
					<label for="class_board_enroll">건의 내용</label><br>
					<input type="text" class="form-control" id="inquiry_content" name="inquiry_content" style="width:300px;" readonly="readonly" value="${inquiryBoardVo.inquiry_content}"/>
				</div>
				<div class="form-group">
					<label for="class_board_content">건의 날짜</label><br>
					<input type="text" style="width:300px; height:100px;"  id="inquiry_date" name="inquiry_date" readonly="readonly" value="<fmt:formatDate value="${inquiryBoardVo.inquiry_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>">
				</div>
				
				<c:choose>
					<c:when test="${sessionScope.memberVo.userid == 'service_center_admin'}">
						<button type="button" class="btn btn-warning" id="commentBoard">상담자 댓글 쓰기</button>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
			
				<c:choose>
					<c:when test="${empty sessionScope.memberVo}">
						
					</c:when>
					<c:when test="${sessionScope.memberVo.userid == inquiryBoardVo.inquiry_userid}">
						<button type="button" class="btn btn-primary" id="updateBoard">수정</button>
						<button type="submit" class="btn btn-danger" id="deleteBoard">삭제</button><br><br>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<input type="text" id="inquiry_comment_userids" name="inquiry_comment_userid" placeholder="댓글을 볼 게시자 아이디">
				<button type="button" class="btn btn-info" id="showcomment">댓글보기</button>
			</form> 
		</div><br>
		<div id="commentshow" style="display: none;">
			<p id="comment_userid" class="comment_userid"></p>
			<p id="comment_content" class="comment_content"></p>
			<p id="comment_date" class="comment_date"></p>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>