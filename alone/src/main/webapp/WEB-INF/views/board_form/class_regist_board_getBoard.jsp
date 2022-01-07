<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
<title>수강신청 특정 게시판 페이지</title>
<script>
	$(function(){
		// 댓글 입력하기 버튼 클릭하면 모달 버튼 show
		$("#inComment").click(function(e){
			e.preventDefault();
			$("#modal-247369").trigger("click");
		});
		// 댓글 저장 버튼 입력시 이벤트
 		$("#btncommentSave").click(function(e){
			e.preventDefault();
			var class_board_comment_userid = $("#class_board_comment_userid").val();
			var class_board_comment_content = $("#class_board_comment_content").val();
 			var class_board_comment_no = $("#class_board_comment_no").val(); 
			var url = "/comment/insertcomment";				
			var sendData = {
 					"class_board_comment_no" : class_board_comment_no,
					"class_board_comment_userid" : class_board_comment_userid,
					"class_board_comment_content" : class_board_comment_content
			};	
			
			$.post(url , sendData , function(rData){
				console.log(rData);
				if(rData == "success"){
					alert("댓글이 입력되었습니다");	
				}
			});
			$("#btnCancel").trigger("click");
			$("#showComment").trigger("click");
		});
 		// 댓글 보기버튼 클릭 시 이벤트
 		$("#showComment").click(function(e){
 			e.preventDefault();
 			var url = "/comment/listComment";
 			
 			$.get(url , function(rData){
 				console.log(rData);
 				$.each(rData, function(){
					$(".first_userid").html("<h3>상담자 아이디 : " + this.class_board_comment_userid + "</h3>").show(1000);
					$(".first_content").html("<h3>상담 내용 : "  + this.class_board_comment_content + "</h3>").show(1000);
					$(".first_date").html("<h3> 상담 일자 : " + this.class_board_comment_date + "</h3>").show(1000);
					$("#showAni").show(1000);
 				});
 			});
		});
 		
 		$("#deleteComment").click(function(e){
 			e.preventDefault();
 			
 			var url = "/comment/deleteComment";
 			var first_content = $("#first_content").val();
 			
 			var sendData = {
 				"first_contnet" : first_content	
 			};
 			
 			$.post(url , sendData , function(rData){
 				console.log(rData);
 				if(rData == "success"){
 					$("#first_userid").val("");
 					$("#first_content").val("");
 					$("#first_date").val("");
 					$("#showAni").fadeOut(1000);
 				}
 			});
 			
 		});
	});
</script>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-247369" href="#modal-container-247369" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>	
			<div class="modal fade" id="modal-container-247369" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">댓글을 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="class_board_comment_userid">아이디 입력</label>
							<input type="text" name="class_board_comment_userid" id="class_board_comment_userid" placeholder="아이디를 입력하세요." value="${class_board_comment_userid}"><br>
							<label for="class_board_comment_content">댓글 입력</label><br>
							<textarea name="class_board_comment_content" id="class_board_comment_content" placeholder="댓글을 입력하세요." value="${class_board_comment_content}"></textarea>
							<input type="number" name="class_board_comment_no" id="class_board_comment_no" placeholder="현재 글번호를 입력하세요." >
							<input type="hidden" name="class_board_comment_date" id="class_board_comment_date">
						</div>
						<div class="modal-footer"> 
							<button type="button" class="btn btn-primary" id="btncommentSave">댓글 저장</button> 
							<button type="button" class="btn btn-secondary" id="btnCancel" data-dismiss="modal">취소</button>
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
				<h2>${registboardvo.class_board_userid}님의   글번호 ${registboardvo.class_board_number}번 수강 신청 상담글입니다.</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/class_board/class_regist">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/class_board/deleteBoard" method="post">
				<div class="form-group">
					<label for="class_board_title">상담 제목</label>
					<input type="text" class="form-control" id="class_board_title" name="class_board_title" style="width:300px;" readonly="readonly" value="${registboardvo.class_board_title}"/>
				</div>
				<div class="form-group">
					<label for="class_board_enroll">수강 과정</label><br>
					<input type="text" class="form-control" id="class_board_enroll" name="class_board_enroll" style="width:300px;" readonly="readonly" value="${registboardvo.class_board_enroll}"/>
				</div>
				<div class="form-group">
					<label for="class_board_content">상담 내용</label><br>
					<textarea style="width:300px; height:100px;"  id="class_board_content" name="class_board_content" readonly="readonly">${registboardvo.class_board_content}</textarea>
				</div>
				<button type="button" class="btn btn-primary">수정</button>
				<button type="submit" class="btn btn-danger" id="deleteBoard">삭제</button>
				<button type="button" class="btn btn-warning" id="inComment">상담자 댓글달기</button>
				<button type="button" class="btn btn-secondary" id="showComment">댓글보기</button>
			</form> 
		</div>
	</div>
</div><br><br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form>
				<div id="showAni" style="display: none;">
					<p id="first_userid" class="first_userid"></p>
					<p id="first_content" class="first_content"></p>
					<p id="first_date" class="first_date"></p>
					<button type="button" id="deleteComment" class="btn btn-warning">댓글 삭제</button>
				</div>
			</form>
		</div>
	</div>
</div> 
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>

