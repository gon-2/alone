<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
th {
	background-color:#969696;
	width:100px;
}
td {
	width:200px;
	background-color:#F4FFFF;
}
.r.content { 
 	padding:30px;
}
.divBottom {
	text-align:right;
}
</style>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					취업 자료실
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
			<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${referenceVo.rno}</td>
						<th>작성자</th>
						<td>${referenceVo.rwriter}</td>
						<th>추천</th>
						<td>${referenceVo.recommend}</td>
						<th>조회수</th>
						<td>${referenceVo.hits}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${referenceVo.rtitle}</td>
						<th>등록일</th>
						<td>${referenceVo.reference_date} ${referenceVo.reference_time}</td>
					</tr>
					<tr>
						<th>링크</th>
						<td colspan="7">다운로드</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<c:forEach items="${data}" var="data">
				<img src="/images/${data.r_images}" width="800px" height="1200px"/><br>
			</c:forEach>
			<div class="r.content">
				<c:forEach items="${data}" var="data">
					${data.r_content}
				</c:forEach>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="divBottom">
				<button>목록</button>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>