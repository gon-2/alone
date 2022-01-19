<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
// 타이틀 클릭
$(function() {
$(".btnClick").click(function(e){
	e.preventDefault();
	location.href="/member/answer_form";
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
					<c:forEach items="${list}" var="MemberBoardVo">
						<tr >
							<td> ${MemberBoardVo.bno}</td>
							<td>${MemberBoardVo.title}</td>
							<td><a class="btnClick" href="/member/board_form">${MemberBoardVo.content} </a></td>
							<td>${MemberBoardVo.userid}</td>
							<td>${MemberBoardVo.regdate}</td>
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
