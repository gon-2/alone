<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>






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
						<th class="th_information"><strong>작성자</strong></th>
						<td>${reviewVo.review_writer}</td>
						<th class="th_information"><strong>등록일</strong></th>
						<td>${reviewVo.write_date}</td>
						<th class="th_information"><strong>조회수</strong></th>
						<td>${reviewVo.viewcnt}</td>
					</tr>
					
				</tbody>
			</table>
<!-- 			<hr> -->
			 <textarea readonly style="resize: none; height:500px;">
${reviewVo.content}                 

 			   </textarea>
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
						 <a class="a_title" href="/classInfo/reviewList" >목록으로 이동하기  </a>
					 	 <a href="/classInfo/reviewModify">수정하기  </a>								
						 <a href="/classInfo/reviewDelete">삭제하기</a>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>							
<%@ include file="/WEB-INF/views/include/footer.jsp"%>