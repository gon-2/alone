<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp"%><br><br>
<head>
	<title>메인 페이지</title>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" align="center">
			<img alt="Bootstrap Image Preview" src="https://mblogthumb-phinf.pstatic.net/MjAxOTA4MDZfMTY1/MDAxNTY1MDU0MzE3MjIy.wM-TmJTbL63s_YyZ7497_aENIs3SHp8tYoB4a7h462sg.zPZhyu5aeGAZ90vUeIrlH6mQhUove_uZBcFlb5mkFaog.JPEG.creativeintelligence/%EB%A7%88%ED%81%AC%EC%A3%BC%EC%BB%A4%EB%B2%84%EA%B7%B8.jpg?type=w800" style="width:auto; height:auto; margin-bottom: 100px; margin-right:100px;"/>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<h4 align="center" style="margin-right: 100px;"><a href="/customer_main/faq">자주 묻는 질문 - 수강신청</a></h4>
			<br>
			<table class="table" align="center" style="width:500px; margin-right:100px;">
				<thead>
					<tr align="center">
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${regthirdlist}" var="RegistBoardVo">
						<tr align="center">
							<td><a href="/class_board/getBoard?class_board_title=${RegistBoardVo.class_board_title}">${RegistBoardVo.class_board_title}</a></td>
							<td>${RegistBoardVo.class_board_content}</td>
							<td>${RegistBoardVo.class_board_userid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col-md-6">
			<h4 align="center" style="margin-right: 100px;"><a href="/customer_main/faq">자주 묻는 질문 - 건의사항</a></h4>
			<br>
			<table class="table" align="center" style="width:500px; margin-right:100px;">
				<thead>
					<tr align="center">
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
 					<c:forEach items="${inquiryRecentList}" var="InquiryBoardVo">
						<tr align="center">
							<td><a href="/inquiry/getBoard?inquiry_title=${InquiryBoardVo.inquiry_title}">${InquiryBoardVo.inquiry_title}</a></td>
							<td>${InquiryBoardVo.inquiry_content}</td>
							<td>${InquiryBoardVo.inquiry_userid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6"><br><br>
			<h4 align="center" style="margin-right: 100px;"><a href="/class_board/class_regist">수강 신청</a></h4>
			<br>
			<table class="table" align="center" style="width:500px; margin-right:100px;">
				<thead>
					<tr align="center">
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${classregistList}" var="RegistBoardVo">
						<tr align="center">
							<td><a href="/class_board/getBoard?class_board_title=${RegistBoardVo.class_board_title}">${RegistBoardVo.class_board_title}</a></td>
							<td>${RegistBoardVo.class_board_content}</td>
							<td>${RegistBoardVo.class_board_userid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-6"><br><br>
			<h4 align="center" style="margin-right: 100px;"><a href="/inquiry/listall">건의 사항</a></h4>		
			<br>
			<table class="table" align="center" style="width:500px; margin-right:100px;">
				<thead>
					<tr align="center">
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${inquiryThirdList}" var="InquiryBoardVo">
						<tr align="center">
							<td><a href="/inquiry/getBoard?inquiry_title=${InquiryBoardVo.inquiry_title}">${InquiryBoardVo.inquiry_title}</a></td>
							<td>${InquiryBoardVo.inquiry_content}</td>
							<td>${InquiryBoardVo.inquiry_userid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br><Br>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>