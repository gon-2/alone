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
	
	var price = ${classInfoVo.price};
	price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	console.log("price: " + price);
	
	$("#price").append(price + " 원");
	
	$(".btn_classInfo").click(function() {
		location.href="/classInfo/list_all";
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
					<h2>수업 정보</h2>
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
						<th class="th_information">수업명</th>
						<td colspan="3">${classInfoVo.c_title}</td>
					</tr>
					
					<tr>
						<th class="th_information">시간대</th>
						<td>${classInfoVo.time_code_name}</td>
						<th class="th_information">전공</th>
						<td>${classInfoVo.cate_code_name}</td>
					</tr>
					<tr>
						<th class="th_information">하루수업 시간</th>
						<td>${classInfoVo.c_time }시간</td>
						<th class="th_information">수강료</th>
						<td id="price"></td>
					</tr>
					<tr>
						<th class="th_information">강의실</th>
						<td>${classInfoVo.class_room }호</td>
						<th class="th_information">총원</th>
						<td>${classInfoVo.class_total }명</td>
					</tr>
					<tr>
						<th class="th_information">수업 시작일</th>
						<td>${classInfoVo.start_date }</td>
						<th class="th_information">수업 종료일</th>
						<td>${classInfoVo.end_date}</td>
					</tr>
				</tbody>
			</table>
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
						<input type="button" class="btn_classInfo btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp" %>