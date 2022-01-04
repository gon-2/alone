<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>FAQ 페이지</title>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">조회수에 따라서 질문 내역을 확인 할 수 있습니다.</h3>
					<br>
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">분류</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> 
							 <a class="dropdown-item" href="#">수강신청</a> 
							 <a class="dropdown-item" href="#">건의사항</a>
						</div>
					</div>
				</div>
			</div><br><br><br><br><br>
			<h3 class="text-center">...</h3><br><br><br>
			<table class="table">
				<thead>
					<tr align="center">
						<th>글 제목</th>
						<th>글 내용</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성 날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center" class="table-primary">
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
						<td>01/04/2012</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>