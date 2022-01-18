<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>




<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<h1>수료생 후기</h1>
			<hr>
			<!-- Posts -->
			<section class="wrapper style1">
				<div class="container">
					<div class="row">
						<section class="col-md-12">
							<div class="tabbable" id="tabs-214280">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active show"
										href="#tab1" data-toggle="tab">전체보기</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">프로그램</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab3" data-toggle="tab">사무자동화</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab4" data-toggle="tab">제품디자인</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab5" data-toggle="tab">3D프린트</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab6" data-toggle="tab">디자인</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="tab1">
										<div class="col-md-12" style="overflow: auto; width: 1500px; height: 500px;">
											<table class="table">
												<thead>
													<tr>
														<th>#</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회수</th>
													</tr>
												</thead>
												<tbody>
												
													<c:forEach items="${list}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab2">
										<div class="col-md-12"
											style="overflow: auto; width: 1500px; height: 500px;">
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
													<c:forEach items="${program}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab3">
										<div class="col-md-12"
											style="overflow: auto; width: 1500px; height: 500px;">
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
													<c:forEach items="${office}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab5">
										<div class="col-md-12"
											style="overflow: auto; width: 1500px; height: 500px;">
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
													<c:forEach items="${print}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>

													
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab4">
										<div class="col-md-12"
											style="overflow: auto; width: 1500px; height: 500px;">
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
													<c:forEach items="${product}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab6">
										<div class="col-md-12"
											style="overflow: auto; width: 1500px; height: 500px;">
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
													<c:forEach items="${design}" var="reviewVo">
														<tr>
															<td>${reviewVo.review_number}</td>
															<td><a class="a_title" href="/classInfo/reviewContent?review_number=${reviewVo.review_number}" >[${reviewVo.cate_code_name}] ${reviewVo.review_title}</a></td>
															<td>${reviewVo.review_writer}</td>
															<td>${reviewVo.write_date}</td>
															<td>${reviewVo.viewcnt}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div style="text-align:right;">
							<a href="/classInfo/reviewRegist">후기작성하기</a>
							</div>
						</section>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>






<%@ include file="/WEB-INF/views/include/footer.jsp"%>