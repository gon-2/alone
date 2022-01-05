<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	$(".f_course").click(function(e) {
		e.preventDefault();
		var fno = $(this).attr("href");
		console.log(fno);
		var f_url = "/employ/findPosition?fno=" + fno;
	    var f_name = "pop";
	    var option = "width=1300,height=800,history=no,resizable=no,status=no,scrollbars=yes,menubar=no";
		window.open(f_url, f_name, option);
	});
});
</script>

<style>
.th_find {
	background-color:#F4FFFF;
	text-align:center;
}
.td_find {
	text-align:center;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<h2>취업자 현황</h2>
					<br>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<hr>
	<form name="lookJob">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th class="th_find">번호</th>
						<th class="th_find">회사명</th>
						<th class="th_find">취업자</th>
						<th class="th_find">취업한 날짜</th>
						<th class="th_find">과정명</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<c:forEach items="${list}" var="findVo">
						<td class="td_find">${findVo.fno}</td>
						<td class="td_find">${findVo.company}</td>
						<td class="td_find">${findVo.fname}</td>
						<td class="td_find">${findVo.fday}</td>
						<td class="td_find"><a class="f_course" href="${findVo.fno}">${findVo.course_name}</a></td>
					</c:forEach>		
				</tr>
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>