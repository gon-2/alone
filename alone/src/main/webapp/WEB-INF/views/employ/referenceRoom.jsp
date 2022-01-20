<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging_form.jsp" %>

<style>
th {
	background-color:#969696;
	width:100px;
}
td {
	width:200px;
	background-color:#F4FFFF;
}
.divBottom {
	padding-right:100px;
	text-align:right;
}
</style>

<script>
$(function() {
	$(".r_btnList").click(function() {
		location.href="/employ/referenceRoomList";
	});
	$(".r_btnMove").click(function(e) {
		e.preventDefault();
		var pageMove = $(this).attr("href");
		if (pageMove == 0) {
			alert("게시판이 존재하지 않습니다.");
		} else {
			location.href="/employ/referenceRoom?rno=" + pageMove;			
		}
	});
	$(".page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능 막기
		console.log($(this));
		var page =	$(this).attr("href");
		$("#frmPaging > input[name=page]").val(page);
		$("#frmPaging").submit();
	});
	$(".rno_title").click(function(e) {
		e.preventDefault();
		var rno = $(this).attr("href");
		console.log("rno:", rno);
		$("#frmPaging > input[name=rno]").val(rno);
		$("#frmPaging").attr("action", "/employ/referenceRoom")
					   .submit();
	});
});
</script>

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
						<th>조회수</th>
						<td>${referenceVo.hits}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${referenceVo.rtitle}</td>
						<th>등록일</th>
						<td>${referenceVo.reference_date} ${referenceVo.reference_time}</td>
					</tr>
					<tr>
						<th>링크</th>
						<td colspan="5">
						<c:forEach items="${data}" var="data">
						<a href="/upload/download?fileName=${data.r_image}">${data.r_image}</a> &nbsp;&nbsp;
						</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="text-align:center">
		<c:if test="">
		</c:if>
				<c:forEach items="${data}" var="data">
					<input type="hidden" class="r_image" value="${data.r_image}">
					<img class="r_images" style="display:none;" src="/upload/download?fileName=${data.r_image}" width="500px" height="700px"/><br>
				</c:forEach>
			<div style="text-align:left">
					${referenceVo.r_content}
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="divBottom">
			<a class="r_btnMove btn btn-outline-primary" id="r_btnPrev" href="${pageVo.prev}">이전</a>
				<input type="button" class="r_btnList btn-sm" value="목록">
			<a class="r_btnMove btn btn-outline-primary" id="r_btnNext" href="${pageVo.next}">다음</a>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		
		<br>
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th class="th_reference">번호</th>
						<th class="th_reference" width="600px">제목</th>
						<th class="th_reference">작성자</th>
						<th class="th_reference">추천</th>
						<th class="th_reference">조회수</th>
						<th class="th_reference">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="ReferenceVo">
				<tr>
						<td class="td_reference">${ReferenceVo.rno}</td>
						<td class="td_reference"><a class="rno_title" href="${ReferenceVo.rno}">${ReferenceVo.rtitle}</a></td>
						<td class="td_reference">${ReferenceVo.rwriter}</td>
						<td class="td_reference">${ReferenceVo.recommend}</td>
						<td class="td_reference">${ReferenceVo.hits}</td>
						<td class="td_reference">${ReferenceVo.reference_date}</td>
				</tr>
					</c:forEach>		
				</tbody>
			</table>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var image1 = $(".r_image:eq(0)").val();
	var image2 = $(".r_image:eq(1)").val();
	
		var dotIndex1 = image1.lastIndexOf(".");
		var extName1 = image1.substring(dotIndex1 + 1);
		
		if (extName1 == "JPG" || extName1 == "PNG" || 
				extName1 == "GIF" || extName1 == "jpg" || extName1 == "png" ||
				extName1 == "gif" || extName1 == "BMP" || extName1 == "bmp") {
			$(".r_images:eq(0)").show();
		}
		
		var dotIndex2 = image2.lastIndexOf(".");
		var extName2 = image2.substring(dotIndex2 + 1);
		console.log(extName2);
		if (extName2 == "JPG" || extName2 == "PNG" || 
				extName2 == "GIF" || extName2 == "jpg" || extName2 == "png" ||
				extName2 == "gif" || extName2 == "BMP" || extName2 == "bmp") {
			$(".r_images:eq(1)").show();
		}
});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>