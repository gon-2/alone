<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging_form.jsp" %>
<script>
$(function() {
	// 페이징 클릭
	$(".page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능 막기
		console.log($(this));
		var page =	$(this).attr("href");
		$("#frmPaging > input[name=page]").val(page);
		$("#frmPaging > input[name=searchType]").val("${pagingDto.searchType}");
		$("#frmPaging > input[name=keyword]").val("${pagingDto.keyword}");
		$("#frmPaging").attr("action", "/employ/lookJob")
			    	   .submit();
	});
	
	// 타이틀 클릭
	$(".jobno_title").click(function(e){
		e.preventDefault();
		var jobno = $(this).attr("href");
		$("#frmPaging > input[name=rno]").attr("name", "jobno").val(jobno);
		$("#frmPaging").attr("action", "/employ/lookJobInformation")
					   .submit();
	});
	
	// 검색
	$("#btnSearch").click(function() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging").attr("action", "/employ/lookJob")
					   .submit();
	});
});
</script>

<style>
.th_lookJob {
	background-color:#F4FFFF;
	text-align:center;
}
.td_lookJob {
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
					<h2>구인정보</h2>
					<br>
					
					<p><a class="btn" href="https://www.work.go.kr/empInfo/empInfoSrch/list/dtlEmpSrchList.do">
						워크넷 채용정보 바로가기 »</a></p>
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
		<div>
			<select name="searchType" id="searchType">
				<option value="t"
					<c:if test="${pagingDto.searchType == 't'}">
						selected
					</c:if>
				>회사</option>
				<option value="t"
					<c:if test="${pagingDto.searchType == 'c'}">
						selected
					</c:if>
				>내용</option>
				<option value="tc"
					<c:if test="${pagingDto.searchType == 'tc'}">
						selected
					</c:if>
				>제목+내용</option>
			</select>
				<label style="width:200px;">
					<input type="text" name="keyword" 
						id="keyword" placeholder="검색어 입력"
						value="${pagingDto.keyword}">
				</label>
			<a type="button" class="btn btn-sm btn-success"
				id="btnSearch">검색</a>
		</div>
		<div style="text-align:right; margin-bottom:10px;">
		<a href="/employ/lookJobInforMationRegist" class="btn btn-sm btn-success">글 쓰기</a>
		</div>
			<table class="table">
				<thead>
					<tr>
						<th class="th_lookJob">번호</th>
						<th class="th_lookJob">업체명</th>
						<th class="th_lookJob">모집기간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${employList}" var="LookJobVo">
				<tr>
						<td class="td_lookJob">${LookJobVo.jobno}</td>
						<td class="td_lookJob" width="600px"><a href="/employ/lookJobInformation?jobno=${LookJobVo.jobno}">${LookJobVo.company}</a></td>
						<td class="td_lookJob">${LookJobVo.recruitmentStart} ~ ${LookJobVo.recruitmentEnd}</td>
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