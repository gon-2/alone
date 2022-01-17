<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
<style>
#regist_path {
	width:1200px;
}
.slt_option {
	width:98%;
}
.td_infomation {
	width: 300px;
}
</style>

<script>
$(function(){
	// 취성패 참여여부
	$(".sy").change(function() {
		if ($(this).attr("id") == "employment3") {
			$(".sy1").attr("disabled", true);
			console.log("막기");
			$("#employment_center").val("");
			$("#employment_staff").val("");
			$("#employment_num").val("");
		} else {
			$(".sy1").attr("disabled", false);
			console.log("사용가능");
		}
		
	});
	
	// 온라인신청 데이터 받아오기 및 제약조건걸기
	$("#btnOk").click(function(){
		var r_num1 = $("#r_num1").val();
		var r_num2 = $("#r_num2").val();
		var r_num = ""; // 주민번호 받아오기
		if(r_num1.length < 6 || r_num2.length < 7){
			alert("주민번호 다시 입력해주세요.");
		}else{
			r_num = r_num1 + r_num2;	
		}
		console.log("주민번호: " + r_num);
		
		
		var info_code = $("#c_title").val();
		console.log(info_code);
		
		var student_name = $("#c_name").val();
		console.log("신청자 이름: " + student_name); //신청자이름
		if(c_name.langth == 0){
			alert("이름을 입력해주세요.");
		}
		
		
		
		
		
		var gender = $("input:radio[name=gender]:checked").val();
		console.log("성별: " + gender);     //성별받아오기
		
		var nationality = $("input:radio[name=nationality1]:checked").val();
		console.log("내/외국인: " + nationality); // 내/외국인 받아오기
		
		var phone_num1 = $("#phone_num1").val();
		var phone_num2 = $("#phone_num2").val();
		var phone_num3 = $("#phone_num3").val();
		var phone_num = ""; // 휴대전화받아오기
		if(phone_num1.length < 3 || phone_num2.length < 4 || phone_num3.length < 4){
			alert("휴대폰전화 확인해주세요.");
		}else if(phone_num1 == "" || phone_num2 == "" || phone_num3 == "" ){
			alert("휴대전화를 입력해주세요.");
		}else{
			phone_num = phone_num1 + "-" + phone_num2 + "-" + phone_num3;
		}
		
		
		var home_num1 = $("#home_num1").val();
		var home_num2 = $("#home_num2").val();
		var home_num3 = $("#home_num3").val();
		var home_num = ""; //일반전화 받아오기
		
		if( (home_num1 != "") && (home_num2 == "") && (home_num3 == "") ){
			alert("일반전화를 확인해주세요.");
		}else if( (home_num == "") && (home_num2 != "") && (home_num3 == "") ){
			alert("일반전화를 확인해주세요.");
		}else if( (home_num1 == "") && (home_num == "") && (home_num3 != "") ){
			alert("일반전화를 확인해주세요.");
		}else if( (home_num1.length == 0) && (home_num2.length == 0) && (home_num3.length == 0) ){
			home_num = "미등록";
			console.log("일반전화: " + home_num);
		}else{
			home_num = home_num1 + "-" + home_num2 + "-" + home_num3;
		}
		
		
		var e_mail1 = $("#e_mail1").val();
		
		var e_mail2 = $("#e_mail2").val();
		
		var email_domain = $("#email_domain").val();
		
		var e_mail = "";
		
		if ((e_mail1 == "") || (e_mail2 == "")) {
			alert("이메일을 확인해주세요.");
			return false;
		}
		e_mail = e_mail1 + "@" + e_mail2;
		

		var regist_path = $("input:radio[name=regist_path]:checked").val();
		console.log("지원경로: " + regist_path);
		if(regist_path == undefined){
			alert("지원경로를 선택해주세요.");
		}



		var employment1 = $("input:radio[name=employment]:checked").val(); // 1유형
	    var employment = "";
	    
	    if( employment1 == "Ⅰ유형" ){
	    	employment = "1유형";
	    }else if( employment1 == "Ⅱ유형" ){
	    	employment = "2유형";
	    }else{
	    	employment = "미참여";
	    }
	    
	    var employment_center1 = $("#employment_center").val();
	    var employment_center = "";
	    if(employment_center1 == ""){
	    	employment_center ="미참여";
	    }else{
	    	employment_center = $("#employment_center").val();
	    }
	    var employment_staff1 = $("#employment_staff").val();
	    var employment_staff = "";
	    
	    if(employment_staff == ""){
	    	employment_staff = "미참여";
	    }else{
	    	employment_staff = $("#employment_staff").val();
	    }
	    
	    var employment_num1 = $("#employment_num").val();
	    var employment_num = "";
	    if(employment_num1 == ""){
	    	employment_num = "미참여";
	    }else{
	    	employment_num = $("#employment_num").val();
	    }
	    
	    var sData = {
	    	"r_num" 				: r_num,
	    	"info_code" 			: info_code,
	    	"student_name"			: student_name,
	    	"gender" 				: gender,
	    	"nationality" 			: nationality,
	    	"phone_num" 			: phone_num,
	    	"home_num" 				: home_num,
	    	"e_mail" 				: e_mail,
	    	"regist_path" 			: regist_path,
	    	"employment" 			: employment,
	    	"employment_center" 	: employment_center,
	    	"employment_staff" 		: employment_staff,
	    	"employment_num" 		: employment_num
	    };
	    
	    console.log(" sData : " , sData );
	    
	    var url = "/classInfo/onlineRegistRun";
	    
	    $.post (url, sData, function(rData) {
	    	console.log(rData);
	    	if (rData == "success") {
	    		
	    		location.href = "/classInfo/myStatusForm";
	    	}
	    });
	}); // 전송버튼 클릭
	
	$("#btnNok").click(function(){
		var url = "/";
		$.get(url, function(){
			location.href = "/";
		});
	}); // 홈으로 가기 버튼클릭
	
	$("#email_domain").change(function() {
		var val = $(this).val();
		$("#e_mail2").val(val);
	});
	
	
	$(".c_time").change(function(){
			var time_code = $(this).val();
			if(time_code == ""){
				alert("훈련직종분류를 선택해주세요.");
				return false;
			}
			var url = "/classInfo/classListByTimeCode/" + time_code;
			
			var sendData = {
					"time_code" : time_code
			};
			
			$.get(url, sendData, function(rData) {
				
				var options = "<option value=''>선택해주세요</option>";
				$.each(rData, function(index) {
					$("#c_cate").empty();
					options += "<option value='" + this.cate_code + "'>" + this.cate_code_name;
					
				});
				$("#c_cate").append(options);
				
			});
	});
		
	$("#c_cate").change(function(){
		var cate_code = $(this).val();
		if(cate_code == ""){
			alert("과정명을 선택해주세요.");
			return false;
		}
		
		var url ="/classInfo/classListByCateCode/" + cate_code;
		
		var sendData = {
				"cate_code"	:cate_code
		};
		
		
		$.get(url, sendData, function(rData){
			console.log("rData", rData);
			var options = "<option value=''>선택해주세요</option>";
		
			$.each(rData, function(index){
				$("#c_title").empty();
				options += "<option value='" + this.info_code + "'>" + this.c_title;
				
			});
			$("#c_title").append(options);
			
		});
	});

});

</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>온라인 수강신청</h2>
			</div>
		</div>
	</div>
</div>
<section class="wrapper style1">
<div class="container">
<div class="row">
	<hr>
	<form role="form" name="onlineForm" method="post" action="/classInfo/onlineRegistRun" >
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 과정을 선택하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="c_time"><label for="c_time">훈련직종분류</label></th>
					<td class="td_infomation">
					
						<select id="c_time" name="c_time" class="c_time">
							
							<c:choose>
								<c:when test="${not empty classInfoVo.info_code}">
									<option value="${classInfoVo.time_code}">${classInfoVo.time_code_name}</option>
								</c:when>
								<c:when test="${empty classInfoVo.info_code}">
									<option value="">선택해주세요</option>
									<option value="1">주간반</option>
									<option value="2">야간반</option>
									<option value="3">주말반</option>
								</c:when>
							</c:choose>
						</select>
					</td>
					<th class="j-spot">
					<label for="c_cate">교육과정분류</label></th>
					<td>
						<select name="c_cate" id="c_cate" required>
							<c:choose>
								<c:when test="${not empty classInfoVo.info_code}">
									<option value="${classInfoVo.cate_code}">${classInfoVo.cate_code_name}</option>
								</c:when>
								<c:when test="${empty classInfoVo.info_code}">
									 <option value="">선택해주세요</option>
								</c:when>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<th class="c_title"><label for="c_title">과정명</label></th>
					<td colspan="3">
						<select name="c_title" id="c_title" style="width: 200px;">
							<c:choose>
								<c:when test="${not empty classInfoVo.info_code}">
									<option value="${classInfoVo.info_code}">${classInfoVo.c_title}</option>
								</c:when>
								<c:when test="${empty classInfoVo.info_code}">
									 <option value="">선택해주세요</option>
								</c:when>
							</c:choose>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="clear tpad20">
			<hr>
			<h3 class="hidden">기본정보</h3>
			<div>
				<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 기본정보를 입력하세요.">
					<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
					<tbody>
						<tr>
							<th class="j-spot"><label for="c_name" >이름</label></th>
							<td class="td_infomation">
								<input type="text" name="c_name" id="c_name" style="width: 120px; ime-mode: active;" maxlength="50" required="required"/>
							</td>
							<th class="j-spot"><label for="r_num">주민번호</label></th>
							<td class="form-group">
								<dl>
									<dd>
										<input type="text" name="r_num" id="r_num1" class="r_num1" style="width: 90px" maxlength="6" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> -
										<input type="password" name="r_num" id="r_num2" class="r_num2" style="width: 90px" maxlength="7" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
									</dd>
								</dl>
							</td>
						</tr>
						<tr>
							<th class="normal"><label>성별</label></th>
							<td class="td_infomation">
									<em><input type="radio" name="gender" id="gender" checked="checked" value="남자"/></em><label for="gender">남자</label>
									<em><input type="radio" name="gender" id="gender" value="여자"/></em> <label for="gender">여자</label>
							</td>
							<th class="normal"><label>내/외국인</label></th>
							<td class="td_infomation">
									<em><input type="radio" name="nationality1" id="nationality" value="내국인" class="hand" checked="checked" /></em> <label for="foreigner" class="hand">내국인</label>
									<em><input type="radio" name="nationality1" id="nationality" value="외국인" class="hand" /></em> <label for="foreigner" class="hand">외국인</label>
							</td>
						</tr>
						<tr>
							<th class="j-spot"><label>휴대전화</label></th>
							<td class="td_infomation">
								<input type="text" id="phone_num1" name="phone_num"style="width: 55px; ime-mode: disabled;" maxlength="3" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> - 
								<input type="text" id="phone_num2" name="phone_num"style="width: 55px; ime-mode: disabled;" maxlength="4" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> - 
								<input type="text" id="phone_num3" name="phone_num"style="width: 55px; ime-mode: disabled;" maxlength="4" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							</td>
							<th class="normal"><label>일반전화</label></th>
							<td>
								<input type="text" id="home_num1" name="home_num" style="width: 55px; ime-mode: disabled;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> - 
								<input type="text" id="home_num2" name="home_num" style="width: 55px; ime-mode: disabled;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> - 
								<input type="text" id="home_num3" name="home_num" style="width: 55px; ime-mode: disabled;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							</td>
						</tr>
						<tr>
							<th class="normal"><label for="e_mail" style="text-color:red;">메일주소</label></th>
							<td colspan="3" class="td_infomation">
							<input type="text" id="e_mail1" style=" width: 100px; ime-mode: disabled;" maxlength="120" /> @
							<input type="text" id="e_mail2" style=" width: 120px; ime-mode: disabled;" maxlength="130" /> 
								<select name="tmp_email_domain" id="email_domain">
										<option>선택하세요</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="paran.com">paran.com</option>
										<option value="korea.com">korea.com</option>
										<option value="hitel.net">hitel.net</option>
										<option value="unitel.co.kr">unitel.co.kr</option>
										<option value="kornet.net">kornet.net</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="chollian.net">chollian.net</option>
										<option value="hotmail.com">hotmail.com</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<h3 class="tpad20 bpad5 font14 bold dark-gray">추가정보</h3>
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 추가정보를 입력하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="j-spot"><label>지원경로</label></th>
					<td colspan="3" id="regist_path">
						<div class="overflow">
								<em><input type="radio" name="regist_path" class="regist_path" value="유튜브"/></em> <label>유튜브</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="블로그"/></em> <label>블로그</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="인스타그램"/></em> <label>인스타그램</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="페이스북"/></em> <label>페이스북</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="HRD-Net"/></em> <label>HRD-Net</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="네이버 검색"/></em> <label>네이버 검색</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="구글 검색"/></em> <label>구글 검색</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="다음 검색"/></em> <label>다음 검색</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="본원 홈페이지"/></em> <label>본원 홈페이지</label>
								<br>
								<em><input type="radio" name="regist_path" class="regist_path" value="전단지"/></em> <label for="regist_path">전단지</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="본원 수료생 소개"/></em> <label for="regist_path">본원 수료생 소개</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="지인소개"/></em> <label for="regist_path">지인소개</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="국민내일배움카드 상담기관"/></em> <label for="regist_path">국민내일배움카드 상담기관</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="고용센터 전단지"/></em> <label for="regist_path">고용센터 전단지</label>
								<em><input type="radio" name="regist_path" class="regist_path" value="기타"/></em> <label for="regist_path">기타</label>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<h3 class="tpad20 bpad5 font14 bold dark-gray">국민취업지원제도</h3>
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 국민취업지원제도 정보를 입력하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="normal">참여여부</th>
					<td colspan="5">
						<em><input type="radio" name="employment" id="employment1" class="sy" value="Ⅰ유형"/></em><label for="employment">Ⅰ유형</label>
						<em><input type="radio" name="employment" id="employment2" class="sy" value="Ⅱ유형"/></em><label for="employment" >Ⅱ유형</label>
						<em><input type="radio" name="employment" id="employment3" class="sy" value="미참여" checked="checked"/></em><label for="employment">미참여</label>
					</td>
				</tr>
				<tr>
					<th>참여센터</th>
					<td><input type="text" class="sy1" name="employment_center" id="employment_center" style="margin-right:20px; width: 120px;" maxlength="30" disabled/></td>
					
					<th>담당자</th>
					<td><input type="text" class="sy1" name="employment_staff" id="employment_staff" style="width: 120px;" maxlength="30" disabled/></td>
					
					<th>연락처</th>
					<td><input type="text" class="sy1" name="employment_num" id="employment_num" style="width: 120px;" maxlength="20" disabled oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
				</tr>
			</tbody>
		</table>
		<hr>
		<div>
			<button type="button" id="btnOk" class="btn btn-primary">신청 완료</button>
			<button type="button" id="btnNok" class="btn btn-primary">홈으로 가기</button>
		</div>	
	</form>
</div>
</div>
</section>
