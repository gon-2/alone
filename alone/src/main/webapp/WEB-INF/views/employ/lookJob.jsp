<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	
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
				<tr>
					<c:forEach items="${employList}" var="LookJobVo">
						<td class="td_lookJob">${LookJobVo.jobno}</td>
						<td class="td_lookJob" width="600px"><a href="/employ/lookJobInformation?jobno=${LookJobVo.jobno}">${LookJobVo.company}</a></td>
						<td class="td_lookJob">${LookJobVo.recruitmentStart} ~ ${LookJobVo.recruitmentEnd}</td>
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