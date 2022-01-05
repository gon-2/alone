<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
});
</script>

<style>
.r_th {
	text-align:center;
	background-color:#F4FFFF;
}
.r_td {
	text-align:center;
}
#t_td {
	text-align:left;
	padding-left: 50px;
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
			<table class="table">
				<thead>
					<tr>
						<th class="r_th">번호</th>
						<th class="r_th" width="600px">제목</th>
						<th class="r_th">작성자</th>
						<th class="r_th">추천</th>
						<th class="r_th">조회수</th>
						<th class="r_th">등록일</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<c:forEach items="${list}" var="ReferenceVo">
						<td class="r_td">${ReferenceVo.rno}</td>
						<td class="r_td" id="t_td"><a href="/employ/referenceRoom?rno=${ReferenceVo.rno}">${ReferenceVo.rtitle}</a></td>
						<td class="r_td">${ReferenceVo.rwriter}</td>
						<td class="r_td">${ReferenceVo.recommend}</td>
						<td class="r_td">${ReferenceVo.hits}</td>
						<td class="r_td">${ReferenceVo.reference_date}</td>
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