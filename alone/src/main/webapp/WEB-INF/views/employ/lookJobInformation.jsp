<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
th {
	background-color: #969696;
	width:150px;
}
</style>

<script>
$(function() {
	$("#lookJobList").click(function() {
		var lookJob = document.lookJob;
		lookJob.action = "/employ/lookJob";
		lookJob.method = "get";
		lookJob.submit();
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
					<h2>
						업체 정보
					</h2>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form name="lookJob">
			<table class="table">
				<tbody>
					<tr>
						<th>회사명</th>
						<td>${lookJobVo.company}</td>
						<th>고용형태</th>
						<td>${lookJobVo.employForm}</td>
					</tr>
					<tr>
						<th>사업자번호</th>
						<td>${lookJobVo.companyNum }</td>
						<th>업태/종목</th>
						<td>${lookJobVo.companyForm }</td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td>${lookJobVo.representative }</td>
						<th>담당자</th>
						<td>${lookJobVo.personInCharge }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${lookJobVo.contact }</td>
						<th>팩스</th>
						<td>${lookJobVo.fax }</td>
					</tr>
					<tr>
						<th>메일주소</th>
						<td colspan="3">${lookJobVo.mail }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">${lookJobVo.address }</td>
					</tr>
					<tr>
						<th>근무부서</th>
						<td>${lookJobVo.department }</td>
						<th>담당업무</th>
						<td>${lookJobVo.work }</td>
					</tr>
					<tr>
						<th>근무시간</th>
						<td>${lookJobVo.workTime }</td>
						<th>급여</th>
						<td>${lookJobVo.salary }</td>
					</tr>
					<tr>
						<th>모집시작일</th>
						<td>${lookJobVo.recruitmentStart }</td>
						<th>모집종료일</th>
						<td>${lookJobVo.recruitmentEnd }</td>
					</tr>
				</tbody>
			</table>
			<div>
				${lookJobVo.content}
			</div>
		</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<button class="btn btn-sm btnLookJob" id="lookJobList">목록</button>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>