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
	// 자격증 시험 안내 등록 (비동기)
	$("#test_btnRegist").click(function() {
		var title = $("#title").val();
		var writers = $("#writers").val();
		
		var url = "/employ/lookJobTestRegist_run"
		
		var sData = {
				"title" 	: title,
				"writers"	: writers
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
						자격증 시험 등록
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
			<form name="lookJob" action="/upload/uploadTest" method="post" enctype="multipart/form-data">
			<input type="hidden" id="writers" name="writers" value="${sessionScope.memberVo.username}">
			<input type="hidden" id="userid" name="userid" value="${sessionScope.memberVo.userid}">
			<table class="table">
					<tbody>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">작성자</th>
							<td class="tboard_td">
							<div style="width:672px;">${sessionScope.memberVo.username}(${sessionScope.memberVo.userid})</div>
							</td>
						</tr>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">제목</th>
							<td class="tboard_td"><input type="text" id="title" name="title" style="width:672px;"></td>
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
						<input type="button" id="test_btnRegist" class="test_btnRegist btn-sm" value="등록">
					</div>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>