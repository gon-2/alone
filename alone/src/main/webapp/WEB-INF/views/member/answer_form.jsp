<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<script>
	
	</script>
<section class="wrapper style1">
<div class="container">
	<div class="row">
		<div class="col-md-12">
					<h2>답글쓰기 양식</h2><br>
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

				
		<form role="form" action="/member/answer_form_run" 
				method="post">
	
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" 
						id="userid" name="userid" 
						value="${sessionScope.memberVo.userid}"
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
				
				
				<input type="hidden" name="re_group" id="re_group" value="${memberBoardVo.re_group}">
				<input type="hidden" name="re_seq" id="re_seq" value="${memberBoardVo.re_seq}">
				<input type="hidden" name="re_level" id="re_level" value="${memberBoardVo.re_level}">
				
				<button type="submit" class="btn btn-primary">
					작성 완료
				</button>
			</form>
		</div>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>