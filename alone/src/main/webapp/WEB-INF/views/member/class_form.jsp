<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	$("#btnEnter").click(function(){
		location.href="/member/class_form_run";
	});
	
	$(".btn1").click(function(){
		location.href="/member/class_form_run2";
	});
	
});
	

</script>
<section class="wrapper style1">
	<div class="container">
		<div class="container-fluid">
	<div class="row">
			<h2>내 강의실</h2>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"></div>
				<div class="col-md-2"></div>
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand" href="#"></a>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				
				
					<form class="form-inline">
						<input class="form-control" type="text" style="margin-left: 698px;"/>&nbsp;
						<button class="btn" type="submit">찾기</button>
					</form><br><br>
			
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink"></div>
					</div>
			
			</nav>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>순서</th>
						<th></th>
						<th>과정명</th>
						<th>교육기간</th>
						<th>진도율</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
							<td class="imgBox">
								<div class="cropBox" style="background-image: url(&quot;https://cms.step.or.kr/api/file/get?path=/Polaris/course_content/2018/03/AD9B9301-24A5-2D8F-7A9C-C6EE86470AEE.png&quot;); background-size: cover; background-repeat: no-repeat; background-position: 75% 100%; height: 200px; width:250px"></div>
								<img src="https://cms.step.or.kr/api/file/get?path=/Polaris/course_content/2018/03/AD9B9301-24A5-2D8F-7A9C-C6EE86470AEE.png"
									alt="" class="cropImg" style="display: none;">
							</td>
						<td><span class="btn1" style="cursor:pointer;color:#38ACEC;">프로그래밍</span></td>
						<td>2021/06/01 ~ 2022/01/01</td>
						<td><div class="progress"><div class="progress-bar w-100">100%</div></div></td>
						<td><button id="btnEnter"> 강의실 입장</button></td>
					</tr>
				</tbody>
			</table>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>