<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/yg/homeRegist.jsp"%>
<style>
.atag{
	text-align: center;
}
</style>


${classInfoVo}
<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-md-12">
			<h1>온라인 접수</h1>
			<hr>
			<strong>●필독사항●</strong>
			<br>
			
			<%@ include file="/WEB-INF/views/include/yg/agree.jsp" %>
			
			<div class="atag">
				<a href="/classInfo/onlineRegist" class="btn btn-sm btn-outline-secondary">동의</a> 
				<a href="home" class="btn btn-sm btn-outline-danger">취소</a>
			</div>	
			</section>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>