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
 	$(".btnOut").click(function() {
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
					<h2>내 강의실</h2><br>
					
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
		<img src="/images/member_class2.jpg" width="1090px" height ="700px"/>
		
				
		</div><br>
		
			<div class="row">
			</div>
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="divBottom">
						<input type="button" class="btnOut btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
			</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>