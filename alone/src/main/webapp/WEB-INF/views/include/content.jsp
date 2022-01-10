<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<div class="col-md-12">
								<table class="table" >
									<thead>
										<tr>
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="ClassInfoVo">
										<tr>
											<td>${ClassInfoVo.c_title}</td>
											<td>${ClassInfoVo.start_date}<br>${ClassInfoVo.end_date}</td>
											<td><a href="#" class="btn btn-sm btn-outline-danger">신청하기</a></td>
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
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${weekly}" var="ClassInfoVo">
										<tr>
											<td>${ClassInfoVo.c_title }</td>
											<td>${ClassInfoVo.start_date}<br>${ClassInfoVo.end_date}</td>
											<td><a href="#" class="btn btn-sm btn-outline-danger">신청하기</a></td>
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
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${weekend}" var="ClassInfoVo">
										<tr>
											<td>${ClassInfoVo.c_title }</td>
											<td>${ClassInfoVo.start_date}<br>${ClassInfoVo.end_date}</td>
											<td><a href="#" class="btn btn-sm btn-outline-danger">신청하기</a></td>
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
											<th>과정명</th>
											<th>교육기간</th>
											<th>신청하기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${night}" var="ClassInfoVo">
										<tr>
											<td>${ClassInfoVo.c_title }</td>
											<td>${ClassInfoVo.start_date}<br>${ClassInfoVo.end_date}</td>
											<td><a href="#" class="btn btn-sm btn-outline-danger">신청하기</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			
