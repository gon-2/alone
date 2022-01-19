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
		$("#frmPaging > input[name=searchType]").val("${pagingDto.searchType}");
		$("#frmPaging > input[name=keyword]").val("${pagingDto.keyword}");
		$("#frmPaging").attr("action", "/employ/lookJobTestList")
					   .submit();
	});
	$(".tno_title").click(function(e){
		e.preventDefault();
		var tno = $(this).attr("href");
		$("#frmPaging > input[name=rno]").attr("name", "tno").val(tno);
		$("#frmPaging").attr("action", "/employ/lookJobTest")
					   .submit();
	});
	// 검색
	$("#btnSearch").click(function() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging").attr("action", "/employ/lookJobTestList")
					   .submit();
	});
});
</script>

<style>
.th_test {
	background-color:#F4FFFF;
	text-align:center;
}
.td_test {
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
					<h2>자격증 시험안내</h2>
					<br>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<form name="lookJob">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div>
				<select name="searchType" id="searchType">
					<option value="t"
						<c:if test="${pagingVo.searchType == 't'}">
							selected
						</c:if>
					>제목</option>
					<option value="w"
						<c:if test="${pagingVo.searchType == 'w'}">
							selected
						</c:if>
					>작성자</option>
					<option value="tw"
						<c:if test="${pagingVo.searchType == 'tw'}">
							selected
						</c:if>
					>제목+작성자</option>
				</select>
					<label style="width:200px;">
						<input type="text" name="keyword" 
							id="keyword" placeholder="검색어 입력"
							value="${pagingVo.keyword}">
					</label>
				<a type="button" class="btn btn-sm btn-success"
					id="btnSearch">검색</a>
			</div>
			
			<div style="text-align:right; margin-bottom:10px;">
			<a href="/employ/lookJobTestRegist" class="btn btn-sm btn-success">글 쓰기</a>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th class="th_test">번호</th>
						<th class="th_test">제목</th>
						<th class="th_test">작성자</th>
						<th class="th_test">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="jobTestVo">
				<tr>
						<td class="td_test">${jobTestVo.tno}</td>
						<td class="td_test"><a class="tno_title" href="${jobTestVo.tno}">${jobTestVo.title}</a></td>
						<td class="td_test">${jobTestVo.writers}</td>
						<td class="td_test">${jobTestVo.test_date}</td>
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