<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$(".reviewModify").click(function(){
		var review_number = $(this).attr("data-review_number");
		location.href = "/classInfo/reviewModify?review_number=" + review_number;
	});
	
	$(".reviewDelete").click(function(){
		var review_number = $(this).attr("data-review_number");
		location.href = "/classInfo/reviewDelete?review_number=" + review_number;
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
					<h2>후기</h2> 
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form name="lookJob">
			<table class="table">
				<tbody>
					<tr>
						<th class="th_information"><strong>제목</strong></th>
						<td >${reviewVo.review_title}</td>
						<th class="th_information"><strong>작성자</strong></th>
						<td >${reviewVo.review_writer}</td>
						<th class="th_information"><strong>등록일</strong></th>
						<td>${reviewVo.write_date}</td>
						<th class="th_information"><strong>조회수</strong></th>
						<td>${reviewVo.viewcnt}</td>
					</tr>
					
				</tbody>
			</table>
<!-- 			<hr> -->
			 <textarea readonly style="resize: none; height:500px;">${reviewVo.content}</textarea>
		</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="divBottom">
						  | <a class="a_title" href="/classInfo/reviewList" >목록으로 이동하기  </a> | 
						  <c:if test="${memberVo.userid == reviewVo.review_writer || memberVo.userid == 'test01'}">
						 	 <a class="reviewModify" data-review_number="${reviewVo.review_number}">수정하기  </a> | 								
							 <a class="reviewDelete" data-review_number="${reviewVo.review_number}">삭제하기</a> | 
						  </c:if>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp"%>