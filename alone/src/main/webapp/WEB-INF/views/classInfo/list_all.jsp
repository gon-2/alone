<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!-- Banner -->
<section id="banner">
	<header>
		<h2>현재 모집중인과정</h2>
		<a href="#">상담신청하기</a>
	</header>
</section>
<!-- Main -->
<section class="wrapper style1">
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12"><!-- 게시판 영역잡기 -->
				<div class="tabbable" id="tabs-214280">
					<ul class="nav nav-tabs"><!--  주간반 야간반 주말반 카테고리 나누기 -->
						<li class="nav-item"><a class="nav-link active show" href="#tab1" data-toggle="tab">전체보기</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">주간반</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab3" data-toggle="tab">야간반</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab4" data-toggle="tab">주말반</a></li>
					</ul>
					<%@ include file="/WEB-INF/views/include/content.jsp"%>
				</div>
			</section>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>