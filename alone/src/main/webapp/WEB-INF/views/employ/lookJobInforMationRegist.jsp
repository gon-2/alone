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
	$("#job_btnRegist").click(function() {
		var company = $("#company").val();
		var employForm = $("#employForm").val();
		var companyNum = $("#companyNum").val();
		var companyForm = $("#companyForm").val();
		var representative = $("#representative").val();
		var personInCharge = $("#personInCharge").val();
		var contact = $("#contact").val();
		var fax = $("#fax").val();
		var mail = $("#mail").val();
		var address = $("#address").val();
		var department = $("#department").val();
		var work = $("#work").val();
		var workTime1 = $("#workTime1").val();
		var workTime2 = $("#workTime2").val();
		var workTime = workTime1 + " ~ " + workTime2;
		var salary = $("#salary").val();
		var recruitmentStart = $("#recruitmentStart").val();
		var recruitmentEnd = $("#recruitmentEnd").val();
		var content = $("#content").val();
		
		console.log(company);
		console.log(employForm);
		console.log(companyNum);
		console.log(companyForm);
		console.log(representative);
		console.log(personInCharge);
		console.log(contact);
		console.log(fax);
		console.log(mail);
		console.log(address);
		console.log(department);
		console.log(work);
		console.log(workTime);
		console.log(salary);
		console.log(recruitmentStart);
		console.log(recruitmentEnd);
		console.log(content);
		
		var url = "/employ/lookJobInforMationRegist_run"
		var sData = {
				"company" 			: company,
				"employForm" 		: employForm,
				"companyNum" 		: companyNum,
				"companyForm" 		: companyForm,
				"representative" 	: representative,
				"personInCharge" 	: personInCharge,
				"contact" 			: contact,
				"fax" 				: fax,
				"mail" 				: mail,
				"address" 			: address,
				"department" 		: department,
				"work" 				: work,
				"workTime" 			: workTime,
				"salary"			: salary,
				"recruitmentStart" 	: recruitmentStart,
				"recruitmentEnd" 	: recruitmentEnd,
				"content" 			: content,
		};
		
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				$("form")[0].submit();
			}
		});
	});
});
</script>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<h2>
						구인현황 등록하기
					</h2>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form name="lookJob" action="/upload/uploadLookJob" method="post" enctype="multipart/form-data">
			<table class="table">
				<tbody>
					<tr>
						<th class="th_information">회사명</th>
						<td><input type="text" id="company" name="company"></td>
						<th class="th_information">고용형태</th>
						<td><input type="text" id="employForm" name="employForm"></td>
					</tr>
					<tr>
						<th class="th_information">사업자번호</th>
						<td><input type="text" id="companyNum" name="companyNum"></td>
						<th class="th_information">업태/종목</th>
						<td><input type="text" id="companyForm" name="companyForm"></td>
					</tr>
					<tr>
						<th class="th_information">대표자명</th>
						<td><input type="text" id="representative" name="representative"></td>
						<th class="th_information">담당자</th>
						<td><input type="text" id="personInCharge" name="personInCharge"></td>
					</tr>
					<tr>
						<th class="th_information">연락처</th>
						<td><input type="text" id="contact" name="contact"></td>
						<th class="th_information">팩스</th>
						<td><input type="text" id="fax" name="fax"></td>
					</tr>
					<tr>
						<th class="th_information">메일주소</th>
						<td colspan="3"><input type="text" id="mail" name="mail"></td>
					</tr>
					<tr>
						<th class="th_information">주소</th>
						<td colspan="3"><input type="text" id="address" name="address"></td>
					</tr>
					<tr>
						<th class="th_information">근무부서</th>
						<td><input type="text" id="department" name="department"></td>
						<th class="th_information">담당업무</th>
						<td><input type="text" id="work" name="work"></td>
					</tr>
					<tr>
						<th class="th_information">근무시간</th>
						<td>
						<input type="time" id="workTime1" name="workTime">~
						<input type="time" id="workTime2" name="workTime">
						</td>
						<th class="th_information">급여</th>
						<td><input type="text" id="salary" name="salary"></td>
					</tr>
					<tr>
						<th class="th_information">모집시작일</th>
						<td><input type="date" id="recruitmentStart" name="recruitmentStart"></td>
						<th class="th_information">모집종료일</th>
						<td><input type="date" id="recruitmentEnd" name="recruitmentEnd"></td>
					</tr>
					<tr>
						<td colspan="4" class="rboard_td">
							<textarea id="content" id="content" name="content" style="float: left; resize: none; width: 872px; height: 437px; margin-top:30px; margin-bottom:10px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="rboard_td">
							<input multiple="multiple" type="file" name="file" placeholder="파일 선택">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<div class="divBottom">
						<input type="button" id="job_btnRegist" class="job_btnRegist btn-sm" value="회사등록">
					</div>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>