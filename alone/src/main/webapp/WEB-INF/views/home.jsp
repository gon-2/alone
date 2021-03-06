<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$(".homeRegist").click(function(e){
		e.preventDefault();
		var info_code = $(this).attr("href");
		console.log(info_code);
		if(info_code != ""){
			location.href = "/classInfo/homeRegist?info_code=" + info_code;
		}else{
			location.href = "/classInfo/homeRegist";
		}
	});
	
	
});
</script>

<!-- Banner -->
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/images/1.png" alt="1번 이미지">
    </div>
    <div class="carousel-item">
      <img src="/images/2.png" alt="2번 이미지">
    </div>
    <div class="carousel-item">
      <img src="/images/3.png" alt="3번 이미지">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>



<!-- Gigantic Heading -->
<section class="wrapper style2">
	<div class="container">
		<header class="major">
			<h2>현재 모집중인 과정</h2>
			<br>
			<p>야! 너두 할수있어! </p>
		</header>
	</div>
</section>

<!-- Posts -->
<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-md-12">
				<div class="tabbable" id="tabs-214280">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active show" href="#tab1" data-toggle="tab">전체보기</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">주간반</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab3" data-toggle="tab">야간반</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab4" data-toggle="tab">주말반</a></li>
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
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
									<c:forEach items="${list}" var="classInfoVo">
									
										<input type="hidden" id="time_code" value="${classInfoVo.time_code}">
										<input type="hidden" id="cate_code" value="${classInfoVo.cate_code}">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a class="homeRegist btn btn-sm btn-outline-danger" id="homeRegist" href="${classInfoVo.info_code}">신청</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab2">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
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
									
										<input type="hidden" id="time_code" value="${classInfoVo.time_code}">
										<input type="hidden" id="cate_code" value="${classInfoVo.cate_code}">
										<tr>
											<td>${classInfoVo.info_code}</td>
												<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a class="homeRegist btn btn-sm btn-outline-danger"  id="homeRegist" href="${classInfoVo.info_code}">신청</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab3">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
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
									
										<input type="hidden" id="time_code" value="${classInfoVo.time_code}">
										<input type="hidden" id="cate_code" value="${classInfoVo.cate_code}">
										<tr>
											<td>${classInfoVo.info_code}</td>
											<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a class="homeRegist btn btn-sm btn-outline-danger" id="homeRegist" href="${classInfoVo.info_code}">신청</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab4">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
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
									
										<input type="hidden" id="time_code" value="${classInfoVo.time_code}">
										<input type="hidden" id="cate_code" value="${classInfoVo.cate_code}">
										<tr>
											<td>${classInfoVo.info_code}</td>
												<td><a href="/classInfo/classInfoView?info_code=${classInfoVo.info_code}">${classInfoVo.c_title} / ${classInfoVo.c_time}시간  /${classInfoVo.time_code_name }</a></td>
											<td>${classInfoVo.start_date}<br>${classInfoVo.end_date}</td>
											<td><a class="homeRegist btn btn-sm btn-outline-danger"  id="homeRegist" href="${classInfoVo.info_code}">신청</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
				</div>
			</section>
		</div>
	</div>
</section>
<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-6 col-12-narrower">
				<div class="box post">
					<a href="#" class="image left"><img src="images/pic01.jpg"
						alt="" /></a>
					<div class="inner">
						<h3>공지사항</h3>
					</div>
				</div>
			</section>
			<section class="col-6 col-12-narrower">
				<div class="box post">
					<a href="#" class="image left"><img src="images/pic02.jpg"
						alt="" /></a>
					<div class="inner">
						<h3>온라인 상담</h3>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
