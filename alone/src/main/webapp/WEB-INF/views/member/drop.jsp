<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	$("#btnDrop").click(function(){
		alert("회원탈퇴가 완료되었습니다.")
	});
});

</script>
				

<section class="wrapper style1">
	<div class="container">
				<h1>회원탈퇴</h1><br>
		
		<div class="clear overflow">
			<section class="col-md-12">
				</section>
				<div class="form-group">
					<label>아이디</label> &nbsp;&nbsp; <span>${memberVo.userid}</span>
				</div> 
				<div class="form-group">
					<label>생년월일</label>&nbsp;&nbsp;<span>${memberVo.birthdate}</span>
				</div>
				<div class="form-group">
					<label>이메일</label> &nbsp;&nbsp;<span>${memberVo.email}</span>
				</div>
				<div class="form-group">
					<label>성별</label> &nbsp;&nbsp; <span>${memberVo.gender}</span>
				</div>		
				<div class="form-group">
					<label>전화번호</label> &nbsp;&nbsp; <span>${memberVo.pnumber}</span>
				</div>		
				<div class="form-group">
					<label>탈퇴사유</label><textarea class="form-control">
					</textarea><br>
					<button type="button" class="btn btn-primary btn-sm" id="btnDrop">회원탈퇴</button>
			</div>
		</div>
	</div>
</section>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>