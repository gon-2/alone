<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.divBottom {
	padding-right:200px;
	text-align:right;
}
</style>

<script>
$(function() {
	$(".t_btnList").click(function() {
		location.href="/employ/lookJobTestList";
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<h2>자격증 시험안내</h2>
					<br>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" style="text-align:center">
					<c:forEach items="${imageList}" var="image">
						<img src="/images/${image.images}" width="1000px"/><br>
					</c:forEach>
				</div>
				<div class="col-md-2">
				</div>
				
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="divBottom">
						<input type="button" class="t_btnList btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>