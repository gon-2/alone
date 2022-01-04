<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					취업자 현황
				</h2>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<c:forEach items="${imageList}" var="image">
				<img src="/images/${image.images}" width="1200px"/><br>
			</c:forEach>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>