<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
th {
	background-color:#969696;
	width:100px;
}
td {
	width:200px;
	background-color:#F4FFFF;
}
.divBottom {
	padding-right:100px;
	text-align:right;
}
</style>

<script>
$(function() {
	$(".r_btnList").click(function() {
		location.href="/employ/referenceRoomList";
	});
});

</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					취업 자료실
				</h2>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${referenceVo.rno}</td>
						<th>작성자</th>
						<td>${referenceVo.rwriter}</td>
						<th>추천</th>
						<td>${referenceVo.recommend}</td>
						<th>조회수</th>
						<td>${referenceVo.hits}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${referenceVo.rtitle}</td>
						<th>등록일</th>
						<td>${referenceVo.reference_date} ${referenceVo.reference_time}</td>
					</tr>
					<tr>
						<th>링크</th>
						<td colspan="7">다운로드</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="text-align:center">
			<c:forEach items="${data}" var="data">
				<img src="/images/${data.r_images}" width="500px" height="700px"/><br>
			</c:forEach>
			<div style="text-align:left">
				<c:forEach items="${data}" var="data">
					${data.r_content}
				</c:forEach>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="divBottom">
				<input type="button" class="r_btnList btn-sm" value="목록">
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>