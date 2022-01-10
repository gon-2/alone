<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>자주 묻는 질문 페이지</title>
	<script>
		$(function(){
			$("#classRegist").click(function(e){
				$("#classboard").html("수강신청 조회");
				e.preventDefault();
				var url = "/classboard";
				
				$.get(url , function(rData){
					console.log(rData);
					$.each(rData , function(i){
						$("#class_board_number").html(this.class_board_number);
 						$("#class_board_title").html(this.class_board_title);
 						$("#class_board_content").html(this.class_board_content);
						$("#class_board_enroll").html(this.class_board_enroll);
						$("#class_board_postdate").html(this.class_board_postdate);
						$("#class_board_userid").html(this.class_board_userid);
						$("#class_board_viewcnt").html(this.class_board_viewcnt);
					});
				});
				$("#classboardlist").fadeIn(1000);
			});
		});
	</script>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center" id="success">조회수에 따라서 질문 내역을 확인 할 수 있습니다.</h3>
					<h3 class="text-center">조회수 50 이상 질문 내역 확인 가능</h3>
					<br>
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">분류</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> 
							 <a class="dropdown-item" href="/classboard" id="classRegist">수강신청</a> 
							 <a class="dropdown-item" href="#" id="faq">건의사항</a>
						</div>
					</div>
				</div>
			</div><br><br><br><br><br>

			<h3 class="text-center" id="classboard"></h3><br><br><br>
			<table class="table" id="classboardlist" style="display:none;">
				<thead>
					<tr align="center">
						<th>글 번호</th>
						<th>글 제목</th>
						<th>글 내용</th>
						<th>수강과정</th>
						<th>게시일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center" class="table-primary" id="clonetr">
						<td id="class_board_number"></td>
						<td id="class_board_title"></td>
						<td id="class_board_content"></td>
						<td id="class_board_enroll"></td>
						<td id="class_board_postdate"></td>
						<td id="class_board_userid"></td>
						<td id="class_board_viewcnt"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>