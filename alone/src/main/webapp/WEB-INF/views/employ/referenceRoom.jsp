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
	$(".r_btnMove").click(function(e) {
		e.preventDefault();
		var pageMove = $(this).attr("href");
		location.href="/employ/referenceRoom?rno=" + pageMove;
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
				<img src="/images/${data.r_image}" width="500px" height="700px"/><br>
			</c:forEach>
			<div style="text-align:left">
					${referenceVo.r_content}
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="divBottom">
				<input type="button" class="r_btnList btn-sm" value="목록">
				<div class="move">
	               <a class="r_btnMove btn btn-outline-primary" id="r_btnPrev" href="${pageVo.prev}">이전</a>
	               <a class="r_btnMove btn btn-outline-primary" id="r_btnNext" href="${pageVo.next}">다음</a>
            	</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<br>
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
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
				<tr>
					<c:forEach items="${list}" var="ReferenceVo">
						<td class="td_reference">${ReferenceVo.rno}</td>
						<td class="td_reference"><a href="/employ/referenceRoom?rno=${ReferenceVo.rno}">${ReferenceVo.rtitle}</a></td>
						<td class="td_reference">${ReferenceVo.rwriter}</td>
						<td class="td_reference">${ReferenceVo.recommend}</td>
						<td class="td_reference">${ReferenceVo.hits}</td>
						<td class="td_reference">${ReferenceVo.reference_date}</td>
					</c:forEach>		
				</tr>
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" 
									   end="${pagingDto.endPage}">
					<li 
						<c:choose>
							<c:when test="${pagingDto.page == v}">
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
					<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
					</li>
					</c:if>
				</ul>
			</nav>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>