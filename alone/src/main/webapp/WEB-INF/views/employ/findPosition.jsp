<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<meta name="viewport" content="width=device-width, initial-scale=1">													
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
th {
	background-color:#969696;
	width:150px;
	text-align: center;
}
td {
	background-color:#F4FFFF;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
				<h2>
					취업자 현황
				</h2>
				<hr>
				<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${findVo.fno}</td>
						<th width="200px">회사명</th>
						<td>${findVo.company}</td>
						<th>취업자</th>
						<td>${findVo.fname}</td>
						<th>취업한 날짜</th>
						<td>${findVo.fday}</td>
					</tr>
					<tr>
						<th>과정명</th>
						<td colspan="7">${findVo.course_name}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<c:forEach items="${imageList}" var="image">
				<img src="/upload/download?fileName=${image.images}" width="1200px"/><br>
			</c:forEach>
		</div>
	</div>
</div>
