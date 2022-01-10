	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
// $(function(){
// 	$("#tabbable").click(function(){
// 		var c_day = $("#c_day").val();
// 		console.log("정소주정 받아오기:" + c_day);
		
// 	});
	
// });


</script>
<section class="wrapper style1">
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12"><!-- 게시판 영역잡기 -->
				<div class="tabbable" id="tabbable">
					<ul class="nav nav-tabs"><!--  주간반 야간반 주말반 카테고리 나누기 -->
						<li class="nav-item"><a class="nav-link active show" href="#tab1" data-toggle="tab">전체보기</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">개인정보 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab3" data-toggle="tab">비밀번호 변경</a></li>
						<li class="nav-item"><a class="nav-link" href="#tab4" data-toggle="tab">회원탈퇴 </a></li>
					</ul>
					
				</div>
			</section>
				<div class="form-group">
					<label>아이디</label> <br>
					<span>${memberVo.userid}</span>
					<input type="hidden" class="form-control" id="userid" name="userid" value="${memberVo.userid}" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호</label> 
					<input type="password" class="form-control" id="userpw" name="userpw"/>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호 확인</label> 
					<input type="password" class="form-control" id="userpwd" name="userpwd"/>
				</div>
				<div class="form-group">
					<label>이름</label> 
					<input type="text" class="form-control" id="username" name="username"/>
				</div>
				<div class="form-group">
				
					<label>생년월일</label> 
					<input type="date" class="form-control" id="birthdate" name="birthdate"/>
				</div>
				<div class="form-group">
					<label>이메일</label> 
					<input type="email" class="form-control" id="email" name="email"/>
				</div>
				
				<div class="form-group">
				
					<label>성별</label> 
						<select class="form-control" id="gender" name="gender">
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select>	
				</div>
				
				<div class="form-group">
					<label>연락처</label> 
					<input type="text" class="form-control" id="pnumber" name="pnumber"/>
				</div>
				
				<button type="submit" class="btn btn-primary">수정완료</button>		
			
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>