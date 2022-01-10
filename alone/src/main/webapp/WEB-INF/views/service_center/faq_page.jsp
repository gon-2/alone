<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>자주 묻는 질문 페이지</title>
	<script>
		$(function(){
			$("#classRegist").one("click" , function(e){
				$("#classboard").html("수강신청 조회");
				e.preventDefault();
				var url = "/classboard";
				
				$.get(url , function(rData){
					console.log(rData);
					$.each(rData , function(i){
		 				var tr = $("#copyTable tr").clone();			
		 				tr.find("td").eq(0).text(this.class_board_number);
		 				tr.find("td").eq(1).text(this.class_board_title);
						tr.find("td").eq(2).text(this.class_board_content);
						tr.find("td").eq(3).text(this.class_board_userid);
						tr.find("td").eq(4).text(this.class_board_enroll);
						tr.find("td").eq(5).text(changeDateString(this.class_board_postdate));
						tr.find("td").eq(6).text(this.class_board_viewcnt);
						$("#classboardlist").fadeIn(1000).append(tr);
					});
				});
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
			<div class="row" align="center">
				<div class="col-md-12">
					<table style="display:none" id="copyTable" align="center">
						<tr align="center">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				
					<table class="table" id="commentTable">
						<thead align="center">
							<th>글번호</th>
							<th>글제목</th>
							<th>글내용</th>
							<th>아이디</th>
							<th>수강과정</th>
							<th>작성일자</th>
							<th>조회수</th>
						</thead>
						<tbody id="classboardlist" align="center"> 
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>