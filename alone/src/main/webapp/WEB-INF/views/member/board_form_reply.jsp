<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>



	</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>답글쓰기 양식</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/member/board_form">글목록</a>
				</p>
			</div>
		</div>
	</div>
	
				
	<div class="row">
		<div class="col-md-12">
				<input type="hidden" name="re_group" value="${memberBoardVo.re_group}">
				<input type="hidden" name="re_seq" value="${memberboardVo.re_seq}">
				<input type="hidden" name="re_level" value="${membervoboardVo.re_level}">
				
		<form role="form" action="/member/board_form_reply_run" 
				method="post">
			
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" 
						id="userid" name="userid" required="required"/>
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
				
				<button type="submit" class="btn btn-primary">
					작성 완료
				</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>