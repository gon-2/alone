<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(".sy").change(function() {
		if ($(this).attr("id") == "employment3") {
			$(".sy1").attr("disabled", true);
			console.log("막기");
			$("#employment_center").val("");
			$("#employment_counselor").val("");
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
			r_num = r_num1 + "-" + r_num2;	
		}
		console.log("주민번호: " + r_num);
		
		var c_day1 = $("#c_day").val(); // 야간반인지 받아오기
		var c_day = "";
		if(c_day1 == "전체"){
			c_day = "전체";
		}
		console.log("야간반인지 받아오기: " + c_day);
		
		var c_cate1 = $("#c_cate").val(); // 교육과정분류 받아오기
		var c_cate = "";
		if(c_cate1 == "전체"){
			c_cate = "전체";
		}
		console.log("교육과정분류: " + c_cate); 
		
		var c_title1 = $("#c_title").val();
		var c_title = "";
		if(c_title1 == "전체"){
			c_title = "전체";
		}
		console.log("과정명: " + c_title);   //과정명 받아오기
		
		var c_name = $("#c_name").val();
		console.log("신청자 이름: " + c_name); //신청자이름
		if(c_name.langth == 0){
			alert("이름을 입력해주세요.");
		}
		
		
		
		
		
		var gender = $("input:radio[name=gender]:checked").val();
		console.log("성별: " + gender);     //성별받아오기
		
		var foreigner = $("input:radio[name=foreigner]:checked").val();
		console.log("내/외국인: " + foreigner); // 내/외국인 받아오기
		
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
			console.log("123일반전화: " + home_num);
		}
		
		
		var e_mail1 = $("#e_mail1").val();
		console.log("e_mail1: " + e_mail1);
		
		var e_mail2 = $("#e_mail2").val();
		console.log("e_mail2: " + e_mail2);
		
		var email_domain = $("#email_domain").val();
		console.log("email_domain" + email_domain);
		
		var e_mail = "";
		
		if( (e_mail1 != "") && (e_mail2 == "") && (email_domain == "선택하세요")){
			alert("이메일도메인을 선택해주세요.");
		}else if( (e_mail1 == "") && (e_mail2 != "") && (email_domain == "선택하세요")){
			alert("이메일을 확인해주세요.")
		}else if((e_mail1 == "") && (e_mail2 == "") && (email_domain != "선택하세요")){
			alert("이메일을 확인해주세요.");
		}else if((e_mail1 == "") && (e_mail == "") && (email_domain == "선택하세요")){
			email = "미등록";
			console.log("이메일: " + email);
		}else{
			e_mail = e_mail1 + "@" + e_mail2;
		}

		var regist_path = $("input:radio[name=regist_path]:checked").val();
		console.log("지원경로: " + regist_path);
		if(regist_path == undefined){
			alert("지원경로를 선택해주세요.");
		}



		var employment1 = $("input:radio[name=employment]:checked").val(); // 1유형
	    var employment = "";
	    
	    if( employment1 == "Ⅰ유형" ){
	    	employment = "1유형";
	    	console.log("1유형 확인하기: " + employment);
	    }else if( employment1 == "Ⅱ유형" ){
	    	employment = "2유형";
	    	console.log("2유형 확인하기: " + employment);
	    }else{
	    	employment = "미참여";
	    	console.log("미참여 확인하기: " + employment);
	    }
	    
	    var employment_center1 = $("#employment_center").val();
	    var employment_center = "";
	    if(employment_center1 == ""){
	    	employment_center ="미참여";
	    	console.log("참여센터: " + employment_center);
	    }else{
	    	employment_center = $("#employment_center").val();
	    	console.log("참여센터: " + employment_center);
	    }
	    var employment_counselor1 = $("#employment_counselor").val();
	    var employment_counselor = "";
	    
	    if(employment_counselor1 == ""){
	    	employment_counselor = "미참여";
	    	console.log("담당자: " + employment_counselor);
	    }else{
	    	employment_counselor = $("#employment_counselor").val();
	    	console.log("담당자: " + employment_counselor);
	    }
	    
	    var employment_num1 = $("#employment_num").val();
	    var employment_num = "";
	    if(employment_num1 == ""){
	    	employment_num = "미참여";
	    	console.log("연락처: " + employment_num);
	    }else{
	    	employment_num = $("#employment_num").val();
	    	console.log("연락처: " + employment_num);
	    }
	    
	    var sData = {
	    	"r_num" : r_num,
	    	"c_day" : c_day,
	    	"c_cate" : c_cate,
	    	"c_title" : c_title,
	    	"c_name" : c_name,
	    	"gender" : gender,
	    	"foreigner" : foreigner,
	    	"phone_num" : phone_num,
	    	"home_num" : home_num,
	    	"e_mail" : e_mail,
	    	"regist_path" : regist_path,
	    	"employment" : employment,
	    	"employment_center" : employment_center,
	    	"employment_counselor" : employment_counselor,
	    	"employment_num" : employment_num
	    };
	    
	    console.log("제발 넘어와라 sData : " + sData );
	    
	    var url = "/classInfo/onlineRegistRun";
	    
	    $.get (url, sData, function(rData) {
	    	console.log(rData);
	    	if (rData == "success") {
	    		method="post";
	    		location.href = "/classInfo/myStatus";
	    	}
	    });
	    
	    
// 	    location.href = location;
	    
	}); // 전송버튼 클릭
	
	
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
					<th class="c_day"><label for="c_day">선택하기</label></th>
					<td class="td_infomation">
						<select id="c_day" name="c_day">
							<option value="전체">전체</option>
							<option value="주간반">주간반</option>
							<option value="야간반">야간반</option>
							<option value="주말반">주말반</option>
						</select>
					</td>
					<th class="j-spot">
					<label for="c_cate">교육과정분류</label></th>
					<td>
						<select name="c_cate" id="c_cate">
							<option>전체</option>
							<option>디자인</option>
							<option>제품디자인</option>
							<option>프로그램</option>
							<option>사무자동화</option>
							<option>3D프린트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="c_title"><label for="c_title">과정명</label></th>
					<td colspan="3">
						<select name="c_title" id="c_title" style="width: 200px;">
							<option class="slt_option">전체</option>
							<option class="slt_option">[재직자] 전산회계 1,2급 자격증 취득 / 주4일 / 월~목 / 30일 과정 (수시모집)</option>
							<option class="slt_option">[재직자] 3D프린팅을 활용한 모형설계제작(주말) / 주1일(매주 토요일) / 일4시간 / 10주 과정 (2022.02.12~2022.04.16)</option>
							<option class="slt_option">[재직자] 파이썬으로 시작하는 프로그래밍 첫걸음(주말) / 주1일 / 매주 토요일 / 일4시간(09:00~12:50) / 10주 과정 (2022.01.15~2022.03.26)</option>
							<option class="slt_option">[재직자] ITQ 자격증 (한글,파워포인트,엑셀)자격증 주3일 / 월.수.금 (2022.01.10~2022.03.02)</option>
							<option class="slt_option">직업상담사2급 자격증 취득 (필기+실기) / 2022년 1회차 시험대비 / (3.6일 필기 5.8 실기) (2022.01.10~2022.04.08)</option>
							<option class="slt_option">[재직자] 컴퓨터활용능력2급(필기+실기)자격증 / 주2일 / 화.목 / 20일 / 일3시간 (2022.01.18~2022.03.31)</option>
							<option class="slt_option">[재직자] 캐드(CAD)기초 &amp; 활용(도면작성&amp;CAT2급) / 주4일 / 월.화.수.목 / 20일과정 (2022.01.17~2022.02.23)</option>
							<option class="slt_option">[재직자] 포토샵을 활용한 디자인(GTQ2급) 주말과정 / 주1일(매주 토요일) / 일4시간 / 11주 과정 (2022.03.05~2022.05.14)</option>
							<option class="slt_option">사무자동화(컴활2급(필기+실기),ITQ(한글,엑셀,파워포인트)자격증 취득 / 주5일(월~금) / 7주 과정 / 오전반 (2022.01.17~2022.03.16)</option>
							<option class="slt_option">(제품디자인)3D프린팅 제품설계제작(캐드,CAD,인벤터,MAX,포토샵) / 2022년 1월 개강 준비과정 / 스마트교육 (오프라인 + 온라인) (별도문의)</option>
							<option class="slt_option">[재직자] 프리미어와 에펙을 활용한 동영상편집과정(주말) / 주1일(매주 토요일) / 일4시간 / 10주 과정 (2022.03.12~2022.05.14)</option>
							<option class="slt_option">(디지털컨버전스)멀티 디바이스 융합 자바(Java) 디지털 컨버전스 과정 / 2022년 2월 개강 준비과정 / (별도문의)</option>
							<option class="slt_option">전산세무회계(회계경리사무원) / 주5일(월~금) / 10주 과정 / 오후반 (2022.02.09~2022.04.27)</option>
							<option class="slt_option">사무자동화(컴활2급(필기+실기),ITQ(한글,엑셀,파워포인트)자격증 취득 / 주5일(월~금) / 7주 과정 / 오후반 (2022.02.21~2022.04.14)</option>
							<option class="slt_option">(내선공사)전기 및 소방 내선공사 실무자과정(전기기능사(필기+실기)취득) 스마트훈련 (온라인 90시간) / 2022년 2월 개강 준비과정 / (별도문의)</option>
							<option class="slt_option">(과정평가형 자격)웹디자인기능사 취득과정 / 2022년 2월 개강 준비과정 / (별도문의)</option>
							<option class="slt_option">[재직자] OA기초 (한글,파워포인트,엑셀) / 15일과정 / 주2일 / 화.목 / 일3시간 (2022.02.15~2022.04.07)</option>
							<option class="slt_option">[재직자] 컴퓨터활용능력1급(필기+실기)자격증 주3일 / 월.수.금 / 25일 과정 (2022.02.28~2022.04.27)</option>
							<option class="slt_option">[재직자] 직업상담사2급 1차대비 (필기) /주2일 / 월,수 / 2022년 3차 필기시험 7.2~7.22 CBT (2022.04.25~2022.06.29)</option>
							<option class="slt_option">[재직자] 직업상담사2급 2차(실기) 대비 /주2일 / 월,수 / 5월 8일 2차(실기) 시험 대비 (2022.03.14~2022.04.27)</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="clear tpad20">
			<hr>
			<h3 class="hidden">기본정보</h3>
			<div>
				<!-- <div class="ej-conts"> 2019-03-10 00:26:32-->
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
									<em><input type="radio" name="foreigner" id="foreigner" value="내국인" class="hand" checked="checked" /></em> <label for="foreigner" class="hand">내국인</label>
									<em><input type="radio" name="foreigner" id="foreigner" value="외국인" class="hand" /></em> <label for="foreigner" class="hand">외국인</label>
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
										<option>gmail.com</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>paran.com</option>
										<option>korea.com</option>
										<option>hitel.net</option>
										<option>unitel.co.kr</option>
										<option>kornet.net</option>
										<option>dreamwiz.com</option>
										<option>chollian.net</option>
										<option>hotmail.com</option>
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
					<td><input type="text" class="sy1" name="employment_counselor" id="employment_counselor" style="width: 120px;" maxlength="30" disabled/></td>
					
					<th>연락처</th>
					<td><input type="text" class="sy1" name="employment_num" id="employment_num" style="width: 120px;" maxlength="20" disabled oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
				</tr>
			</tbody>
		</table>
		<p></p>
		<div>
				<button type="button" id="btnOk" class="btn btn-primary">신청 완료</button>
		</div>	
	</form>
</div>
</div>
</section>
