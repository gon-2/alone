<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$(".homeRegist").click(function(e){
		e.preventDefault();
		var info_code = $(this).attr("href");
		console.log(info_code);
		location.href = "/classInfo/homeRegist?info_code=" + info_code;
	});
	
	
});
</script>
					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<div class="col-md-12">
								<table class="table" >
									<thead>
										<tr>
											<th>#</th>
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="classInfoVo">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a href="${classInfoVo.info_code}" class="homeRegist btn btn-sm btn-outline-danger">신청하기</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab2">
							<div class="col-md-12">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${weekly}" var="classInfoVo">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a href="${classInfoVo.info_code}" class="homeRegist btn btn-sm btn-outline-danger">신청하기</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab3">
							<div class="col-md-12">
								<table class="table">
								<thead>
										<tr>
											<th>#</th>
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${night}" var="classInfoVo">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a href="${classInfoVo.info_code}" class="homeRegist btn btn-sm btn-outline-danger">신청하기</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab4">
							<div class="col-md-12">
								<table class="table">
								<thead>
										<tr>
											<th>#</th>
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${weekend}" var="classInfoVo">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a href="${classInfoVo.info_code}" class="homeRegist btn btn-sm btn-outline-danger">신청하기</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			
