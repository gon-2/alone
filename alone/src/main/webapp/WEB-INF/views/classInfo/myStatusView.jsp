<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>





<!-- Banner -->
<section id="banner">
	<header>
		<h2>나의 신청상태 보기</h2>
		<a href="#">상담신청하기</a>
	</header>
</section>

<!-- Main -->
<section class="wrapper style1">
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>신청자</th>
						<th>강의명</th>
						<th>강의시작일</th>
						<th>강의종료일</th>
						<th>진행현황</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${mineList}" var="studentClassRegistVo">
					<tr>
						<td>${studentClassRegistVo.student_name}</td>
						<td>${studentClassRegistVo.c_title} / ${studentClassRegistVo.time_code_name} / ${studentClassRegistVo.c_time}시간</td>						
						<td>${studentClassRegistVo.start_date}</td>
						<td>${studentClassRegistVo.end_date}</td>
						<td>진행중</td>
					</tr>
				</c:forEach>
						
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>