<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.divBottom {
	padding-right:200px;
	text-align:right;
}
th {
	background-color:#969696;
	width:100px;
}
td {
	width:200px;
	background-color:#F4FFFF;
}
</style>

<script>
$(function() {
	$(".t_btnList").click(function() {
		location.href="/employ/lookJobTestList";
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<h2>자격증 시험안내</h2>
					<br>
					<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${JobTestvo.tno}</td>
						<th>작성자</th>
						<td>${JobTestvo.writers}</td>
						<th>등록일</th>
						<td>${JobTestvo.test_date}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${JobTestvo.title}</td>
					</tr>
				</tbody>
			</table>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" style="text-align:center">
					<c:forEach items="${imageList}" var="image">
						<img src="/upload/download?fileName=${image.images}" width="1000px"/><br>
					</c:forEach>
				</div>
				<div class="col-md-2">
				</div>
				
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="divBottom">
						<input type="button" class="t_btnList btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>