<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function () {
	// 아이디 찾기
	$("#id_search").click(function() {
		var name = $("#id_username").val();
		var email = $("#id_email").val();
		
		url = "/id_search";
		sData = {
				"username" : name,
				"email" : email
		};
		if (name == "" || name == null) {
			alert("이름을 입력해주세요.");
		} else if (email == "" || email == null) {
			alert("이메일을 입력해주세요.");
		} else {
			$.post(url, sData, function(rData) {
				if (rData == "fail") {
					alert("입력하신 정보를 다시 확인해주세요.");
				} else {
					var value = confirm("찾고자 하시는 아이디는 " + rData + " 입니다." + "계속 진행 하시겠습니까?");
					if (!value) {
						window.close();
					}
				}
			});
		}
	});
	
	// 비밀번호 찾기
	$("#pw_search").click(function() {
		var userid = $("#pw_userid").val();
		var name = $("#pw_username").val();
		var email = $("#pw_email").val();
		
		url = "/pw_search";
		sData = {
				"userid" : userid,
				"username" : name,
				"email" : email
		};
		if (name == "" || name == null) {
			alert("이름을 입력해주세요.");
		} else if (email == "" || email == null) {
			alert("이메일을 입력해주세요.");
		} else if (userid = "" || userid == null) {
			alert("아이디를 입력해주세요.")
		} else {
			$.post(url, sData, function(rData) {
				if (rData == "fail") {
					alert("입력하신 정보를 다시 확인해주세요.");
				} else {
					var value = confirm("찾고자 하시는 비밀번호는 " + rData + " 입니다." + "계속 진행 하시겠습니까?");
					if (!value) {
						window.close();
					} 
				}
			});
		}
	});
	
	// id 리셋
	$("#id_link").click(function () {
		$("#id_username").val("");
		$("#id_email").val("");
	});
	
	// pw 리셋
	$("#pw_link").click(function () {
		$("#pw_userid").val("");
		$("#pw_username").val("");
		$("#pw_email").val("");
	});
});
</script>

<section class="wrapper style1">
	<div class="container">
		<div class="row">
			<section class="col-md-12">
				<div class="tabbable" id="tabs-214280">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a id="id_link" class="nav-link active show" href="#tab1" data-toggle="tab">아이디 찾기</a></li>
						<li class="nav-item"><a id="pw_link" class="nav-link" href="#tab2" data-toggle="tab">비밀번호 찾기</a></li>
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
								<div class="form-group">
									<label>이름</label> 
									<input type="text" class="form-control" id="id_username" name="username" required/>
								</div>
								<div class="form-group">
									<label>이메일</label> 
									<input type="text" class="form-control" id="id_email" name="email" required/>
								</div>
								<button type="button" id="id_search">아이디 찾기</button>
							</div>
						</div>
						<div class="tab-pane" id="tab2">
							<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
								<div class="col-md-12" style="overflow:auto; width:1500px; height:500px;">
								<div class="form-group">
									<label>아이디</label> 
									<input type="text" class="form-control" id="pw_userid" name="userid" required/>
								</div>
								<div class="form-group">
									<label>이름</label> 
									<input type="text" class="form-control" id="pw_username" name="username" required/>
								</div>
								<div class="form-group">
									<label>이메일</label> 
									<input type="text" class="form-control" id="pw_email" name="email" required/>
								</div>
								<button type="button" id="pw_search">비밀번호 찾기</button>
							</div>
							</div>
						</div>
					</div>
					
				</div>
			</section>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>