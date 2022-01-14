<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging_form.jsp" %>
<script>
$(function() {
	$(".page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능 막기
		console.log($(this));
		var page =	$(this).attr("href");
		$("#frmPaging > input[name=page]").val(page);
		$("#frmPaging").submit();
	});
	
	
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
			<div style="text-align:right; margin-bottom:10px;">
			<a href="/employ/findPositionRegist" class="btn btn-sm btn-success">글 쓰기</a>
			</div>
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
					<c:forEach items="${list}" var="findVo">
				<tr>
						<td class="td_find">${findVo.fno}</td>
						<td class="td_find">${findVo.company}</td>
						<td class="td_find">${findVo.fname}</td>
						<td class="td_find">${findVo.fday}</td>
						<td class="td_find"><a class="f_course" href="${findVo.fno}">${findVo.course_name}</a></td>
				</tr>
					</c:forEach>		
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${pagingVo.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingVo.startPage - 1}">이전</a>
					</li>
					</c:if>
					<c:forEach var="v" begin="${pagingVo.startPage}" 
									   end="${pagingVo.endPage}">
					<li 
						<c:choose>
							<c:when test="${pagingVo.page == v}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>
					>
						<a class="page-link" href="${v}">${v}</a>
					</li>
					</c:forEach>
					<c:if test="${pagingVo.endPage < pagingVo.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingVo.endPage + 1}">다음</a>
					</li>
					</c:if>
				</ul>
			</nav>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>