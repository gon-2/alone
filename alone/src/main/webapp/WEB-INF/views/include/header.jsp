<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<!--
	Arcana by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
			
<style>
BODY {
	FONT-FAMILY: arial; FONT-SIZE: 10px; 
}
/* board Information */
.boardInformation { width:100%; clear:both; margin:0px 0 0px 0; overflow:hidden; color:#000000;}
.articleNum { float:left; padding:0 0 0 0px;}
/* account Navigation */
.accountNavigation { margin:0; padding:0; float:right;}
.accountNavigation li { float:left; margin-left:7px; list-style:none;}
.accountNavigation li a { white-space:nowrap; color:#000000; text-decoration:none;}
#homeAction {
	padding-right:50px;
}
</style>

	<head>
		<title>KH정보교육원 수강센터</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1">													
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>
	


	<body class="is-preload">
	<div id="page-wrapper">
<!-- CSS 파일 로드 (컬러셋에 따라서) -->
    <!--%import("css/common.css")-->


<!-- 게시판 정보 -->
<!--@if($module_info->display_login_info != 'N' || $module_info->display_setup_button != 'N')-->
    <div class="boardInformation">
        <!-- 로그인 정보 -->
        <ul class="accountNavigation" id="homeAction">

        <!-- 로그인 되어 있을 경우 -->
        <!--@if($is_logged)-->
			<c:choose>
				<c:when test="${empty sessionScope.memberVo}">
			
            <!-- 최고관리자이면 관리자 페이지 버튼 출력 -->
            <!--@if($logged_info->is_admin == 'Y' && $module_info->display_setup_button != 'N')-->
            <li><a href="{getUrl('','module','admin','act','dispBoardAdminContent')}" onclick="window.open(this.href); return false;">ADMIN&nbsp;</a> | </li>
            <!--@end-->

            <!-- 회원정보 버튼 출력 -->
            <!--@if($module_info->display_login_info != 'N')-->
            <li><a href="/regist_form" target=blank>MY INFO&nbsp;</a> | </li>
            <!--@end-->

        <!-- 로그인 되어 있지 않고 레이아웃이 없으면 -->
        <!--@elseif(!$is_logged && $module_info->display_login_info != 'N')-->
            <li><a href="/login_form" target=_top>LOGIN</a></li>
        <!--@end-->
        
        		</c:when>
        		<c:otherwise>
        		
        		<li>${sessionScope.memberVo.userid}(${sessionScope.memberVo.username})<li>
        		<li><a href="/logout">LOGOUT</a></li>
        		
        		</c:otherwise>
			</c:choose>
        </ul>
    </div>
<!--@end-->
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="/" id="logo">KH정보교육원 </a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="/">Home</a></li>
								<li>
									<a href="#">수강안내</a>
									<ul>
										<li><a href="/classInfo/list_all">모집과정</a></li>
										<li><a href="/classInfo/onlineAgree">온라인 접수</a></li>
										<li><a href="/classInfo/myStatusForm">접수상태 확인</a></li>
										<li><a href="#">후기</a></li>
									</ul>
								</li>
								<li>
									<a href="#">취업정보</a>
									<ul>
										<li><a href="/employ/lookJob">구인현황</a></li>
										<li><a href="/employ/lookJobTestList">자격증 시험안내</a></li>
										<li><a href="/employ/findPositionList">수료생 취업현황</a></li>
										<li><a href="/employ/referenceRoomList">취업자료실</a></li>
									</ul>
								</li>
								<li>
									<a href="/customer_main/home">고객센터</a>
									<ul>
										<li><a href="/customer_main/faq">자주묻는 질문</a></li>
										<li><a href="/class_board/class_regist">수강신청</a></li>
										<li><a href="/inquiry/listall">건의사항</a></li>
										<li><a href="/customer_main/consultmessage">상담메시지</a></li>
									</ul>
								</li>
								<li>
									<a href="#">마이페이지</a>
									<ul>
										<li><a href="/member/modify_form">회원정보</a></li>
										<li><a href="/member/class_form">내 강의실</a></li>
										<li><a href="/member/board_form">내 게시판</a></li>
										<li><a href="/member/drop">회원탈퇴</a></li>
									</ul>
								</li>
							</ul>
						</nav>
	</div>
				</div>
				<section class="wrapper style1">