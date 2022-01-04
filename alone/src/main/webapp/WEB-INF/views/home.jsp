<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


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

<!-- Highlights -->
<section class="wrapper style1">
	<div class="container">
		<div class="row gtr-200">
			<section class="col-4 col-12-narrower">
				<div class="box highlight">
					<i class="icon solid major fa-paper-plane"></i>
					<h3>여긴</h3>
					<p>뭐를 넣어야할지 고민되는구만</p>
				</div>
			</section>
			<section class="col-4 col-12-narrower">
				<div class="box highlight">
					<i class="icon solid major fa-pencil-alt"></i>
					<h3>허허</h3>
					<p>여긴 또 뭘 하지</p>
				</div>
			</section>
			<section class="col-4 col-12-narrower">
				<div class="box highlight">
					<i class="icon solid major fa-wrench"></i>
					<h3>으아</h3>
					<p>여기는 뭐!</p>
				</div>
			</section>
		</div>
	</div>
</section>

<!-- Gigantic Heading -->
<section class="wrapper style2">
	<div class="container">
		<header class="major">
			<h2>현재 모집중인 과정</h2>
			<br>
			<p>수업 종류마다 나눌까 아니면 근로자 실업자 이렇게 해서 나눌까 고민되는구만</p>
		</header>
	</div>
</section>

<!-- Posts -->
<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-6 col-12-narrower">
				<div class="tabbable" id="tabs-214280">
					<ul class="nav nav-tabs">
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
<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-6 col-12-narrower">
				<div class="box post">
					<a href="#" class="image left"><img src="images/pic01.jpg"
						alt="" /></a>
					<div class="inner">
						<h3>공지사항</h3>
						<p>동작그만! 첫장부터 밑장빼기냐?!</p>
					</div>
				</div>
			</section>
			<section class="col-6 col-12-narrower">
				<div class="box post">
					<a href="#" class="image left"><img src="images/pic02.jpg"
						alt="" /></a>
					<div class="inner">
						<h3>온라인 상담</h3>
						<p>시나리오 쓰고있네 증거있어?!</p>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
