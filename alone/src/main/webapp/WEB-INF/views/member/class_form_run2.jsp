<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.th_information {
	background-color: #969696;
	width:150px;
}
.divBottom {
	padding-right:50px;
	text-align:right;
}
</style>

 <script>
 $(function() {
 	$(".btnReturn").click(function() {
 		location.href="/member/class_form";
 	});
 });
 
 </script>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<h2>프로그래밍</h2><br>
					
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<img src="/images/member_class3.jpg" width="1090px" height ="700px"/>
		
				
		</div><br>
		
			<div class="row">
			</div>
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<input type="button" class="btnReturn btn-sm" value="목록">
				</div>
				<div class="col-md-2">
			</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>