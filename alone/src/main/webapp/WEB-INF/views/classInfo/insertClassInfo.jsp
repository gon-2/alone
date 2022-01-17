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
	$("#btnClassInfo").click(function() {
		var cate_code = $("#cate_code").val();
		if(cate_code == ""){
			alert("전공을 선택해주세요.");
		}
		var time_code = $("#time_code").val();
		if(time_code == ""){
			alert("수업 파트를 선택해주세요.");
		}
		var c_title = $("#c_title").val();
		var c_time = $("#c_time").val();
		var price = $("#price").val();
		var class_room = $("#class_room").val();
		var class_total = $("#class_total").val();
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		
		
		console.log(cate_code);
		console.log(time_code);
		console.log(c_title);
		console.log(c_time);
		console.log(price);
		console.log(class_room);
		console.log(class_total);
		console.log(start_date);
		console.log(end_date);
		
		
		var url = "/classInfo/insertClassInfoRun"
		var sData = {
				"c_title" 		: c_title,
				"c_time" 		: c_time,
				"start_date" 	: start_date,
				"end_date" 		: end_date,
				"price" 		: price,
				"class_room" 	: class_room,
				"class_total" 	: class_total,
				"cate_code" 	: cate_code,
				"time_code" 	: time_code
		}
		console.log(sData);
		
		$.post(url, sData, function(rData){
			if(rData == "success"){
				location.href = "/classInfo/list_all";
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
						수업 등록하기
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
			<form name="lookJob">
			<table class="table">
				<tbody>
					
					<tr>
						<th class="th_information">전공</th>
						<td>
							<select id="cate_code">
								<option value="">▼ 선택하세요  ▼</option>
								<option value="1">프로그램</option>
								<option value="2">사무자동화</option>
								<option value="3">재퓸디자인</option>
								<option value="4">3D프린트</option>
								<option value="5">디자인</option>
							</select>
						</td>
						<th class="th_information">수업파트</th>
						<td>
							<select id="time_code">
								<option value="">▼ 선택하세요  ▼</option>
								<option value="1">주간반</option>
								<option value="2">야간반</option>
								<option value="3">주말반</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="th_information">수업명</th>
						<td colspan="3"><input type="text" id="c_title" name="c_title" required="required"></td>
					</tr>
					<tr>
						<th class="th_information">수업시간</th>
						<td><input type="text" id="c_time" name="c_time"  required="required"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
						<th class="th_information">수강료</th>
						<td><input type="text" id="price" name="price" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
					</tr>
					<tr>
						<th class="th_information">강의실</th>
						<td>
						<input type="text"  required="required"id="class_room" name="class_room" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						
						</td>
						<th class="th_information">총원</th>
						<td><input type="text"  required="required"id="class_total" name="class_total" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
					</tr>
					<tr>
						<th class="th_information">수업 시작일</th>
						<td><input type="date"  required="required" id="start_date" name="start_date"></td>
						<th class="th_information">수업 종료일</th>
						<td><input type="date"  required="required" id="end_date" name="end_date"></td>
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
						<input type="button" id="btnClassInfo" class="btnClassInfo btn-sm" value="수업등록">
					</div>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>