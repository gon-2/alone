	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
			
<section class="wrapper style1">
	<div class="container">
				<h2>회원정보 수정</h2><br>
		<div class="clear overflow">
			<section class="col-md-12">
				</section>
			<form role="form" action="/member/modify_run" id="frmRegist"
				method="post">
					
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
					<input type="email"class="form-control" name="email" id="email" placeholder="Email"/>
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
				
				<button type="submit" class="btn btn-primary">수정하기</button>		
			</form>
				
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>