<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 페이지</title>
<style>
	.pagination{
		justify-content: center;
	}
</style>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>수강 신청 항목입니다</h2><br>
				<p>수강 신청에 한해서 내용을 작성해주세요.</p>
				<p>제목을 클릭하면 상세보기로 이동합니다.</p>
				<p>
					<a class="btn btn-primary btn-large" href="/Customermain/home">홈페이지로</a>
				</p>
			</div>
			<table class="table">
				<thead>
					<tr align="center">
						<th>글 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>수강과정</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
						<th>댓글</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="ClassRegistBoardVo">
					<tr align="center">
						<td>${ClassRegistBoardVo.class_board_number}</td>
						<td><a href="" class="btn btn-info"></a>${ClassRegistBoardVo.class_board_title}</td>
						<td>${ClassRegistBoardVo.class_board_content}</td>
						<td>${ClassRegistBoardVo.class_board_enroll}</td>
						<td>${ClassRegistBoardVo.class_board_userid}</td>
						<td>${ClassRegistBoardVo.class_board_postdate}</td>
						<td>${ClassRegistBoardVo.class_board_viewcnt}</td>
						<td>${ClassRegistBoardVo.class_board_comment}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
					<nav>
						<ul class="pagination" align="center">
							<li class="page-item">
								<a class="page-link" href="#">이전</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">2</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">3</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">4</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">5</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">다음</a>
							</li>
						</ul>
					</nav>  
			<div style="float:center;" class="form-group">
				<select id="keyword" name="keyword" style="margin-left:400px;">
					<option value="number" selected="selected">글 번호</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>&nbsp;
				<input type="text" id="keywordName" style="width:300px;">&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary">검색</button>
				<a href="/ClassBoard/form" class="btn btn-success" style="float:right; margin-right:300px;">글 작성</a>
			</div> 		
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>