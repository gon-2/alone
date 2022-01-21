<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
//답글
$(function() {
	$("#btnReply").click(function() {
	var loc = "/member/board_form_reply?";
	location.href = loc;
	});
});

	</script>
<section class="wrapper style1">
<div class="container">
	<div class="row">
		<div class="col-md-12">
					<h2>게시글쓰기 양식</h2><br>
				<p>
					<a class="btn btn-primary" href="/member/board_form">글목록</a>
				</p>
			</div>
		</div>
	</div>
	</section>
<section class="wrapper style1">
<div class="container">			
	<div class="row">
		<div class="col-md-12">
							
		<form role="form" action="/member/board_form_reply_run" 
				method="post">
	
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" 
						id="userid" name="userid" value="${sessionScope.memberVo.userid}"
						readonly/>
				</div>
				
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" required="required"/>
				</div>
				<div class="form-group">
					<label for="content">글내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
				
				
				<button type="submit" class="btn btn-primary" id="btnReply">
					작성 완료
				</button>
			</form>
		</div>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>