<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	$("#loginBtn").click(function(){
		var userid = $("#userid").val();
		var userpw = $("#userpw").val();
		var saveId = $("#saveId").val();
		var userpwd = userpw.length;
		
		console.log(userid);
		console.log(userpw);
		console.log(userpwd);
		
		if (userid == "" || userid == null) {
			alert("아이디를 입력해주세요.");
		} else if (userpw == "" || userpw == null) {
			alert("비밀번호를 입력해주세요.");
		} else {
			var url = "/checkId/" + userid + "/" + userpw;
			$.get(url, function(rData) {
				console.log(rData);
				if (rData == "idFail") {
					$("#checkId").html("아이디를 다시 확인 해주세요.");
					$("#checkId").css("color", "red");
					$("#checkPw").html("");
				} else if (rData == "pwFail") {
					$("#checkPw").html("비밀번호를 다시 확인 해주세요.");
					$("#checkPw").css("color", "red");	
					$("#checkId").html("");
				} else {
					$("#checkId").html("");
					$("#checkPw").html("");
					location.href="/login_run/" + userid + "/" + userpw + "/" + saveId;
				}
			});
		}
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
					로그인
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
			<form role="loginForm" action="login_run" method="post">
				<div class="form-group">
					 
					<label for="userid">
						아이디
					</label>
					<input type="text" class="form-control" name="userid" id="userid" />
					<br>
					<span id="checkId"></span>
				</div>
				<div class="form-group">
					 
					<label for="userpw">
						비밀번호
					</label>
					<input type="password" class="form-control" name="userpw" id="userpw" />
					<br>
					<span id="checkPw"></span>
				</div>
				<button type="button" id="loginBtn" class="btn btn btn-primary">
					로그인
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div>
				<a href="#">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
				<a href="#">아이디/비번찾기</a>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>