<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
	.tr_item:hover {
		background-color: #f4f3FF;
		cursor: pointer;
	}
</style>
<script>
// 타이틀 클릭
$(function() {
// 	$(".btnClick").click(function(){
// 		var re_group = "${memberBoardVo.re_group}";
// 		var re_seq = "${memberBoardVo.re_seq}";
// 		var re_level = "${memberBoardVo.re_level}";
// 		location.href="/member/answer_form?";
// 		loc += "re_group=" + re_group;
// 		loc += "&re_seq=" + re_seq;
// 		loc += "&re_level=" + re_level;
// 		location.href = loc;
// 	});
	
	$('.tr_item').click(function() {
		var re_group = $(this).attr("data-re_group");
		var re_level = $(this).attr("data-re_level");
		var re_seq = $(this).attr("data-re_seq");
		url = "/member/answer_form?re_group=" + re_group + "&re_level=" + re_level + "&re_seq=" + re_seq;
		location.href = url;
	});
});


</script>


<section class="wrapper style1">
	<div class="container">
				<h2>내 게시판</h2><br>
		<div class="clear overflow">
			<section class="col-md-12">
			</section>	
				<label for="board_form">분류</label> 
				<select id="board_form" name="board" size="1">
					<option value="">선택하세요.</option>
					<option value="">강의내용</option>
					<option value="">평가문의</option>
					<option value="">취업문의</option>
					<option value="">콘텐츠오류</option>
				</select> <br>
			
			
			
			
			<form role="form" action="/member/board_form_reply" method="get">
		
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>글내용</th>
						<th>작성자아이디 </th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${list}" var="memberBoardVo">
						<tr class="tr_item" 
							data-re_group="${memberBoardVo.re_group}" 
							data-re_level="${memberBoardVo.re_level}" 
							data-re_seq="${memberBoardVo.re_seq}">
							<td>${memberBoardVo.bno}</td>
							<td>
							<c:if test="${memberBoardVo.re_level > 0}">
							<c:forEach var="v" begin="1" end="${memberBoardVo.re_level}">
								&nbsp;&nbsp;&nbsp;&nbsp; 
							</c:forEach>
								↳ Re:
							</c:if>
							${memberBoardVo.title}
							</td> 
							<td>${memberBoardVo.content}</td>
							<td>${memberBoardVo.userid} </td>
							<td>${memberBoardVo.regdate}</td>
						</tr>
					</c:forEach>
			
				</tbody>
			</table>
				<button type="submit"> 게시글쓰기 </button>
				</form>
		</div>
	</div>
</section>



















<%@ include file="/WEB-INF/views/include/footer.jsp"%>
