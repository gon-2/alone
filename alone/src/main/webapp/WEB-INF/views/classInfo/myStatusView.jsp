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
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12"><!-- 게시판 영역잡기 -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>훈련직종 분류</th>
										<th>교육과정 분류</th>
										<th>과정 제목</th>
										<th>이름</th>
										<th>신청현황</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mine}" var="OnlineRegistVo">
										<tr>
											<td>1</td>
											<td>${OnlineRegistVo.c_day}</td>
											<td>${OnlineRegistVo.c_cate}</td>
											<td>${OnlineRegistVo.c_title}</td>
											<td>${OnlineRegistVo.c_name}</td>
											<td>신청완료</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>