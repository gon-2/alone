<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 특정 게시판 페이지</title>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>${registboardvo.class_board_userid}님의 글입니다.</h2>
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
				<button type="submit" class="btn btn-primary">게시</button>
				<button type="reset" class="btn btn-success">다시 입력</button>
			</form> 
		</div>
	</div>
</div> 
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>

