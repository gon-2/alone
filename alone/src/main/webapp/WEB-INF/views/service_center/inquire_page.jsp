<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>건의사항 페이지</title>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="width: 500px;">
				<h2 align="center">건의사항 페이지입니다!</h2>
			</div>
			<form role="form">
				<div class="form-group"> 
					<label for="exampleInputEmail1">Email address</label>
					<input type="email" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				<div class="form-group">
					<label for="exampleInputFile">File input</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<button type="submit" class="btn btn-primary">
					Submit
				</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>