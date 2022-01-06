<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 특정 게시판 페이지</title>
	<script>
		$(function(){
			$("#inComment").click(function(e){
				e.preventDefault();
				$("#modal-247369").trigger("click");
			});
			
			$("#btncommentSave").click(function(e){
				e.preventDefault();
				
				var class_board_comment_userid = $("#class_board_comment_userid").val();
				var class_board_comment_content = $("#class_board_comment_content").val();
				
				var sendData = {
						"class_board_comment_userid" : class_board_comment_userid,
						"class_board_comment_content" : class_board_comment_content,
				};
				
				var url = "/comment/insertcomment";
				
				$.post(url , sendData , function(rData){
					console.log(rData);
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
							<input type="hidden" name="class_board_comment_date" id="class_board_comment_date">
						</div>
						<div class="modal-footer"> 
							<button type="button" class="btn btn-primary" id="btncommentSave">댓글 저장</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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
				<h2>${registboardvo.class_board_userid}님의 수강 신청 상담글입니다.</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/class_board/class_regist">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form">
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
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="reset" class="btn btn-success">삭제</button>
				<button type="button" class="btn btn-warning" id="inComment">댓글달기</button>
			</form> 
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>댓글 내용</h3>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr class="table-active">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="table-success">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="table-warning">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr class="table-danger">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div> 
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>

