<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.th_information {
	background-color: #969696;
	width:150px;
}
.divBottom {
	padding-right:50px;
	text-align:right;
}
</style>

<script>
$(function() {
	$(".job_btnList").click(function() {
		location.href="/employ/lookJob";
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
						<th class="th_information">회사명</th>
						<td>${lookJobVo.company}</td>
						<th class="th_information">고용형태</th>
						<td>${lookJobVo.employForm}</td>
					</tr>
					<tr>
						<th class="th_information">사업자번호</th>
						<td>${lookJobVo.companyNum }</td>
						<th class="th_information">업태/종목</th>
						<td>${lookJobVo.companyForm }</td>
					</tr>
					<tr>
						<th class="th_information">대표자명</th>
						<td>${lookJobVo.representative }</td>
						<th class="th_information">담당자</th>
						<td>${lookJobVo.personInCharge }</td>
					</tr>
					<tr>
						<th class="th_information">연락처</th>
						<td>${lookJobVo.contact }</td>
						<th class="th_information">팩스</th>
						<td>${lookJobVo.fax }</td>
					</tr>
					<tr>
						<th class="th_information">메일주소</th>
						<td colspan="3">${lookJobVo.mail }</td>
					</tr>
					<tr>
						<th class="th_information">주소</th>
						<td colspan="3">${lookJobVo.address }</td>
					</tr>
					<tr>
						<th class="th_information">근무부서</th>
						<td>${lookJobVo.department }</td>
						<th class="th_information">담당업무</th>
						<td>${lookJobVo.work }</td>
					</tr>
					<tr>
						<th class="th_information">근무시간</th>
						<td>${lookJobVo.workTime }</td>
						<th class="th_information">급여</th>
						<td>${lookJobVo.salary }</td>
					</tr>
					<tr>
						<th class="th_information">모집시작일</th>
						<td>${lookJobVo.recruitmentStart }</td>
						<th class="th_information">모집종료일</th>
						<td>${lookJobVo.recruitmentEnd}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<div>
						${lookJobVo.content}
				</div>
				<c:forEach items="${jobImageList}" var="jobImageList">
					<img src="/upload/download?fileName=${jobImageList.job_image}" width="1200px"/><br>
				</c:forEach>
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
					<div class="divBottom">
						<input type="button" class="job_btnList btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>