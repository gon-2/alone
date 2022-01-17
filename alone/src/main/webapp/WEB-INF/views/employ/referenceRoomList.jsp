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
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging").submit();
	});
	$(".rno_title").click(function(e) {
		e.preventDefault();
		var rno = $(this).attr("href");
		console.log("rno:", rno);
		$("#frmPaging > input[name=rno]").val(rno);
		$("#frmPaging").attr("action", "/employ/referenceRoom")
					   .submit();
	});
	
	// 검색
	$("#btnSearch").click(function() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging").submit();
	});
});

</script>

<style>
.th_reference {
	background-color:#F4FFFF;
	text-align:center;
}
.td_reference {
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
					<h2>취업 자료실</h2>
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
					>제목</option>
					<option value="w"
						<c:if test="${pagingDto.searchType == 'w'}">
							selected
						</c:if>
					>작성자</option>
					<option value="tw"
						<c:if test="${pagingDto.searchType == 'tw'}">
							selected
						</c:if>
					>제목+작성자</option>
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
			<a href="/employ/referenceRoomRegist" class="btn btn-sm btn-success">글 쓰기</a>
			</div>
			
			<table class="table">
				<thead>
					<tr>
						<th class="th_reference">번호</th>
						<th class="th_reference" width="600px">제목</th>
						<th class="th_reference">작성자</th>
						<th class="th_reference">추천</th>
						<th class="th_reference">조회수</th>
						<th class="th_reference">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="ReferenceVo">
						<tr>
							<td class="td_reference">${ReferenceVo.rno}</td>
							<td class="td_reference"><a class="rno_title" href="${ReferenceVo.rno}">${ReferenceVo.rtitle}</a></td>
							<td class="td_reference">${ReferenceVo.rwriter}</td>
							<td class="td_reference">${ReferenceVo.recommend}</td>
							<td class="td_reference">${ReferenceVo.hits}</td>
							<td class="td_reference">${ReferenceVo.reference_date}</td>
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