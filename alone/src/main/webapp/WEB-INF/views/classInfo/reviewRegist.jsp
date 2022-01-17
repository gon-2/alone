<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$("#btnOk").click(function(){
		var cate_code = $("#cate_code").val();
		console.log("cate_code", cate_code);
		
		var review_writer = $("#review_writer").val();
		console.log("review_writer", review_writer);
		
		var content = $("#content").val();
		console.log("content", content);
		
		var review_title = $("#review_title").val();
		console.log("title: " + review_title);
		var url = "/classInfo/reviewRegistRun";
		var sData = {
				"review_writer" : review_writer,
				"review_title" : review_title,
				"content" : content,
				"cate_code" : cate_code
		};
		
		console.log("sData: ", sData);
		
		$.post(url, sData, function(rData){
			if(rData == "success"){
				console.log(rData);
				alert("후기 등록이 완료되었습니다.");
				location.href = "/classInfo/reviewList";
			}
			
		});
	});
});
</script>


<section class="wrapper style1">
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12">
				<!-- 게시판 영역잡기 -->
				<div class="tabbable" id="tabs-214280">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
							<h1>후기 작성하기</h1>
							<hr>
								<form role="form">
									<div class="form-group">
										<input type="hidden" value="seq_review.nextval">
										<label>선택하세요</label>
										<select id="cate_code">
											<option>▼ 선택해주세요  ▼</option>
											<option value="1">프로그램</option>
											<option value="2">사무자동화</option>
											<option value="3">제품디자인</option>
											<option value="4">3D프린트</option>
											<option value="5">디자인</option>
										</select>
										<br>
										
										<label for="exampleInputEmail1">작성자 아이디 </label> 
										<input type="text" id="review_writer" name="review_writer" class="form-control" id="exampleInputEmail1" />
									</div>
									<div>
									<label>후기 제목</label>
										<input type="text" id="review_title" name="review_title"/>
									</div>
									<strong>후기 작성하기</strong>
									<textarea id="content" name="content" style="resize: none; height:500px;"></textarea>
 								   <br>
								   <button type="button" id="btnOk" class="btn btn-primary">작성완료</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>