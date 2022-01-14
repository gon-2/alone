<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>   
<%@ include file="/WEB-INF/views/inquiry/inquiry_paging_form.jsp" %>
<head>
	<title>건의사항 페이지</title>
</head>
<script>
$(function(){
/* 		// 링크 걸린 제목 클릭 시 이벤트
		$(".getBoard").click(function(e){
			e.preventDefault();
			console.log("클릭됨");
			$("#modal-331097").trigger("click");
		});
 		// 확인하기 버튼 클릭 시 이벤트
		$("#checkPassword").click(function(e){
			e.preventDefault();
			var inquiry_password = $("#inquiry_password").val();
			console.log("inquiry_password >> " + inquiry_password);
 			var url = "/inquiry/checkPassword";
 			
			var sendData = {
					"inquiry_password" : inquiry_password
			};
			
			$.post(url , sendData , function(rData){
				console.log(rData);
				 if(rData == "false"){
					alert("비밀번호를 다시 입력하세요.");
					return false;
				}else if(rData == "true"){
					location.href="/inquiry/getBoard";	
				}
			});
		});
 		 */
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
	
	$("#btnSearch").click(function(){
		var searchType = $("#searchType").val();
		console.log("searchType >> " + searchType);
		var keyword = $("#keyword").val();
		console.log("keyword >> " + keyword);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging").submit();
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-331097" href="#modal-container-331097" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container-331097" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">글 비밀번호를 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="password" name="inquiry_password" id="inquiry_password">
						</div>
						<div class="modal-footer">					 
							<button type="button" class="btn btn-primary" id="checkPassword">확인하기</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>건의 사항 항목입니다</h2><br>
				<p>건의 사항에 한해서 내용을 작성해주세요.</p>
				<p>제목을 클릭하면 상세보기로 이동합니다.</p>
				<p>
					<a class="btn btn-primary btn-large" href="/customer_main/home">고객센터 홈페이지로</a>
				</p>
			</div>
			
			<table class="table">
			<!-- 관리자로 로그인 했을 경우 th , tr 시작 -->
			<c:choose>
				<c:when test="${sessionScope.memberVo == InquiryBoardVo.inquiry_userid == 'service_center_admin'}">
					<thead>
						<tr align="center">
							<th>글 번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>게시일</th>
							<th>조회수</th>
							<th>삭제</th>
						</tr>
					</thead>
				</c:when>
				<c:otherwise>
					<thead>
						<tr align="center">
							<th>글 번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>게시일</th>
							<th>조회수</th>
						</tr>
					</thead>
				</c:otherwise>
			</c:choose>
			<!-- 관리자로 로그인 했을 경우 th , tr 끝 -->
			
			<!-- 관리자로 로그인 했을 경우 tbody 시작 -->
			<c:choose>
				<c:when test="${sessionScope.memberVo == InquiryBoardVo.inquiry_userid == 'service_center_admin'}">
					<tbody>
						<c:forEach items="${list}" var="InquiryBoardVo">
						<tr align="center">
							<td>${InquiryBoardVo.inquiry_number}</td>
							<td><a href="/inquiry/getBoard?inquiry_title=${InquiryBoardVo.inquiry_title}" id="getBoard" class="getBoard">${InquiryBoardVo.inquiry_title}</a></td>
							<td>${InquiryBoardVo.inquiry_content}</td>
							<td>${InquiryBoardVo.inquiry_userid}</td>
							<td><fmt:formatDate value="${InquiryBoardVo.inquiry_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
							<td>${InquiryBoardVo.inquiry_viewcnt}</td>
							<td><a href="/inquiry/deleteBoardAdmin?inquiry_title=${InquiryBoardVo.inquiry_title}" class="btn btn-sm btn-danger">삭제</a></td>				
	 					</tr>
						</c:forEach>
					</tbody>
				</c:when>
			</c:choose>
			<!-- 관리자로 로그인 했을 경우 tbody 끝 -->
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
						
					</c:when>
					<c:otherwise>
						<a href="/inquiry/form" class="btn btn-success" style="float:right; margin-right:100px;">글 작성</a>
					</c:otherwise>
				</c:choose>
			</div> 		
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %> 