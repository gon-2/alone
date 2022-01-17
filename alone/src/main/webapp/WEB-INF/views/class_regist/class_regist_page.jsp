<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 페이지</title>
<style>
	.pagination{
		justify-content: center;
	}
</style>
<script>
	$(function(){
		$(".page-link").click(function(e) {
			e.preventDefault(); 
			// 클릭한 링크 알아내기
			var page =	$(this).attr("href");
			console.log("page >> " + page);
			var pageVal = $("#frmPaging > input[name=page]").val(page);
			$("#frmPaging > input[name=searchType]").val("${dto.searchType}");
			$("#frmPaging > input[name=keyword]").val("${dto.keyword}");
			$("#frmPaging").submit();
		});
		
		$("#perPage").change(function(){
			var perPage = $(this).val();
			console.log("perPage >> " + perPage);
			 $("#frmPaging > input[name=perPage]").val(perPage);
			 $("#frmPaging").submit();
		});
		
		var date = "${ClassRegistBoardVo.class_board_postdate}";
		$("testdate").val(changeDateString(date));

		$("#btnSearch").click(function(){
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			if(keyword.length == 0 || keyword == ""){
				alert("검색어를 입력하세요.");
				return false;
			}
			$("#frmPaging > input[name=page]").val("1");
			$("#frmPaging > input[name=searchType]").val(searchType);
			$("#frmPaging > input[name=keyword]").val(keyword);
			$("#frmPaging").submit();
		});
	});
	
	function changeDateString(timestamp){
		var dateF = new Date(timestamp);
		
		var year = dateF.getFullYear();
		var month = make2digits(dateF.getMonth() + 1);
		var date = make2digits(dateF.getDate());
		var hour = make2digits(dateF.getHours());
		var minute = make2digits(dateF.getMinutes());
		var second = make2digits(dateF.getSeconds());
		var dateString = year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
		return dateString;
	}
	
	function make2digits(num){
		if(num < 10){
			num = "0" + num;
		}
		return num;
	}
</script>
</head>
<%@ include file="/WEB-INF/views/class_regist/class_paging_form.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>수강 신청 항목입니다</h2><br>
				<p>수강 신청에 한해서 내용을 작성해주세요.</p>
				<p>제목을 클릭하면 상세보기로 이동합니다.</p>
				<p>
					<a class="btn btn-primary btn-large" href="/customer_main/home">고객센터 홈페이지로</a>
				</p>
			</div>
			<table class="table">
				<thead class="thead-dark">
					<tr align="center">
						<th>글 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>수강과정</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="ClassRegistBoardVo">
						<tr align="center">
							<td>${ClassRegistBoardVo.class_board_number}</td>
							<td><a href="/class_board/getBoard?class_board_title=${ClassRegistBoardVo.class_board_title}">${ClassRegistBoardVo.class_board_title}</a></td>
							<td>${ClassRegistBoardVo.class_board_content}</td>
							<td>${ClassRegistBoardVo.class_board_enroll}</td>
							<td>${ClassRegistBoardVo.class_board_userid}</td>
							<td><fmt:formatDate value="${ClassRegistBoardVo.class_board_postdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
							<td>${ClassRegistBoardVo.class_board_viewcnt}</td>
							<c:choose>		
								<c:when test="${empty sessionScope.memberVo}">
									<td>로그인 하세요.</td>
								</c:when>
								<c:when test="${sessionScope.memberVo.userid == ClassRegistBoardVo.class_board_userid}">
			 						<form action="/class_board/deleteBoard?class_board_content=${ClassRegistBoardVo.class_board_content}" method="post">
										<td><button type="submit" class="btn btn-sm btn-danger">삭제</button></td>
									</form>
								</c:when>
								<c:when test="${sessionScope.memberVo == InquiryBoardVo.inquiry_userid == 'service_center_admin'}">
			 						<form action="/class_board/deleteBoard?class_board_content=${ClassRegistBoardVo.class_board_content}" method="post">
										<td><button type="submit" class="btn btn-sm btn-danger">삭제</button></td>
									</form>
								</c:when>
								<c:otherwise>
									<td>로그인 하세요.</td>
								</c:otherwise>
							</c:choose>					
	 					</tr>
					</c:forEach>
				</tbody>
			</table>
					<nav><!-- 페이지네이션 가운데 정렬 -->
						<ul class="pagination justify-content-center">
							<c:if test="${dto.startPage != 1}">
								<li class="page-item">
									<a class="page-link" href="${dto.startPage - 1}">이전</a>
								</li>
							</c:if>
							<c:forEach var="v" begin="${dto.startPage}" end="${dto.endPage}">
							<li 
								<c:choose>
									<c:when test="${dto.page == v}">
										class="page-item active"
									</c:when>
									<c:otherwise>
										class="page-item"
									</c:otherwise>
								</c:choose>
							>
								<a class="page-link active" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<c:if test="${dto.endPage < dto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${dto.endPage + 1}">다음</a>
							</li>
							</c:if>
						</ul>
					</nav>
			<div style="float:center;" class="form-group">
				<select id="perPage" style="">
						<c:forEach var="v" begin="5" end="30" step="5">
							<option value="${v}"
								<c:if test="${v == dto.perPage}">
									selected
								</c:if>
							>${v}줄씩 보기</option>
						</c:forEach>
				</select>
				<select id="searchType" name="searchType" style="margin-left:275px;">
					<option value="n" selected="selected"
						<c:if test="${dto.searchType == 'n'}">
							selected
						</c:if>
					>글 번호</option>
					<option value="w"
						<c:if test="${dto.searchType == 'w'}">
							selected
						</c:if>
					>작성자</option>
					<option value="t"
						<c:if test="${dto.searchType == 't'}">
							selected
						</c:if>
					>제목</option>
					<option value="c"
						<c:if test="${dto.searchType == 'c'}">
							selected
						</c:if>
					>내용</option>
				</select>&nbsp;
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" style="width:300px;">&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" id="btnSearch">검색</button>
		<c:choose>
			<c:when test="${empty sessionScope.memberVo}">
				<h6>글 작성을 위해 로그인 하세요.</h6>	
			</c:when>
			<c:otherwise>
				<a href="/class_board/form" class="btn btn-success" style="float:right; margin-right:100px;">글 작성</a>
			</c:otherwise>
		</c:choose>
			</div> 		
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>