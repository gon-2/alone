<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.th_test {
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
	$("#find_btnRegist").click(function() {
		var company = $("#company").val();
		var fname = $("#fname").val();
		var fday = $("#fday").val();
		var course_name = $("#course_name").val();
		
		console.log(company);
		console.log(fname);
		console.log(fday);
		console.log(course_name);
		
		var url = "/employ/findPositionRegist_run"
		
		var sData = {
				"company" 		: company,
				"fname"			: fname,
				"fday"			: fday,
				"course_name"	: course_name
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
						취업현황 등록
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
			<form name="lookJob" action="/upload/uploadFind" method="post" enctype="multipart/form-data">
			<table class="table">
					<tbody>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">회사명</th>
							<td class="fboard_td"><input type="text" id="company" name="company" style="width:672px;"></td>
						</tr>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">취업자</th>
							<td class="fboard_td"><input type="text" id="fname" name="fname" style="width:672px;"></td>
						</tr>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">취업한 날짜</th>
							<td class="fboard_td"><input type="date" id="fday" name="fday" style="width:672px;"></td>
						</tr>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">과정명</th>
							<td class="fboard_td"><input type="text" id="course_name" name="course_name" style="width:672px;"></td>
						</tr>
						
						<tr>
							<td colspan="2" class="tboard_td">
							<div><input multiple="multiple" type="file" name="file" placeholder="파일 선택"></div>
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
						<input type="button" id="find_btnRegist" class="find_btnRegist btn-sm" value="등록">
					</div>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>