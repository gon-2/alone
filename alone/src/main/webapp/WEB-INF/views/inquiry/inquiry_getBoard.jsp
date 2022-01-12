<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
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
		
		$.post(url , sendData , function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("삭제되었습니다.");
				location.href="/inquiry/listall";
			}
		});
	});
	$("#updateBoard").click(function(e){
		e.preventDefault();
		$("#modal-338142").trigger("click");
	});
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
	
		$.post(url , sendData , function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("수정이 완료되었습니다.");
				location.href="/inquiry/listall";
			}
		});
	});
});
</script>
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
							<textarea id="inquiry_contents" name="inquiry_content"></textarea>
							<input type="hidden" id="inquiry_date" name="inquiry_date"> 
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="updateSave">Save changes</button> 
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
			<div class="jumbotron" align="center">
				<h2>${inquiryBoardVo.inquiry_userid}님의   글번호 ${inquiryBoardVo.inquiry_number}번 건의사항 글입니다.</h2>
				<p>
					<a href="/inquiry/listall" class="btn btn-primary">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="" method="">
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
				
				<button type="button" class="btn btn-primary" id="updateBoard">수정</button>
				<button type="submit" class="btn btn-danger" id="deleteBoard">삭제</button>
			</form> 
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>