<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$("#btnOk").click(function(e){
		e.preventDefault();
		var cate_code = $("#cate_code").val();
		if(cate_code == ""){
			alert("전공을 선택해주세요.");
		}
		
		var review_writer = $("#review_writer").val();
		
		var content = $("#content").val();
		
		var review_title = $("#review_title").val();
		
		var review_number = $("#review_number").val();
		$("form")[0].submit();
	});
});
</script>

${reviewVo.review_number }
<section class="wrapper style1">
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12">
				<div class="tabbable" id="tabs-214280">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
							<h1>후기 수정하기</h1>
							<hr>
								<form role="form" name="modify" action="/classInfo/reviewModifyRun" method="post">
									<div class="form-group">
										
										<label>선택하세요</label>
										<select id="cate_code" name="cate_code">
											<option>▼ 선택해주세요  ▼</option>
											<option value="1">프로그램</option>
											<option value="2">사무자동화</option>
											<option value="3">제품디자인</option>
											<option value="4">3D프린트</option>
											<option value="5">디자인</option>
										</select>
										<br>
										<input type="hidden" id="review_number" name="review_number" value="${reviewVo.review_number}">
										<label for="exampleInputEmail1">작성자 아이디 </label> 
										<input type="text" id="review_writer" name="review_writer" readonly="readonly" value="${reviewVo.review_writer}" class="form-control" id="exampleInputEmail1" />
									</div>
									<div>
									<label>후기 제목</label>
										<input type="text" id="review_title" name="review_title" placeholder="${reviewVo.review_title}"/>
									</div>
									<strong>후기 작성하기</strong>
									<textarea id="content" name="content" style="resize: none; height:500px;">${reviewVo.content}</textarea>
 								   <br>
								   <a type="button" id="btnOk" class="btn btn-primary">작성완료</a>
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