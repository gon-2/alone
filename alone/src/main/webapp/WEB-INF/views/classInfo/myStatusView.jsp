<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$(".btnCheck").click(function(){
		
			var r_num = $(this).val();
			
			var sData = {
					"r_num" : r_num
			};
			
			
			var url = "/classInfo/adminListCheck";
			$.post(url, sData, function(rData){
				if(rData == "success"){
					alert("확인 되었습니다.");
					location.href = "/classInfo/adminList";
				}
			});
		
	});
});
</script>



<!-- Banner -->
<section id="banner">
	<header>
		<c:if test="${memberVo.userid == 'test01'}">
			<h2>관리자 신청관리페이지</h2>
		</c:if>
		<c:if test="${memberVo.userid != 'test01'}">
			<h2>나의 신청상태 보기</h2>
		</c:if>
				
	</header>
</section>
<section class="wrapper style1">
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
			<c:if test="${memberVo.userid == 'test01'}">
				<thead>
					<tr>
						<th>신청자</th>
						<th>강의명</th>
						<th>전화번호</th>
						<th>확인현황</th>
					</tr>
				</thead>
			</c:if>
			<c:if test="${memberVo.userid != 'test01'}">
				<thead>
					<tr>
						<th>신청자</th>
						<th>강의명</th>
						<th>강의시작일</th>
						<th>강의종료일</th>
						<th>진행현황</th>
					</tr>
				</thead>
			</c:if>
				<tbody>
						<c:if test="${memberVo.userid == 'test01'}">
							<c:forEach items="${admin}" var="studentClassRegistVo">
								<tr>
									<td>${studentClassRegistVo.student_name}</td>
									<td>${studentClassRegistVo.c_title}</td>						
									<td>${studentClassRegistVo.phone_num}</td>
									<td><button class="btnCheck" value="${studentClassRegistVo.r_num}">${studentClassRegistVo.regist_check}</button></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:forEach items="${mineList}" var="studentClassRegistVo">
							<tr>
								<td>${studentClassRegistVo.student_name}</td>
								<td>${studentClassRegistVo.c_title} / ${studentClassRegistVo.time_code_name} / ${studentClassRegistVo.c_time}시간</td>						
								<td>${studentClassRegistVo.start_date}</td>
								<td>${studentClassRegistVo.end_date}</td>
								<td>${studentClassRegistVo.regist_check}</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>