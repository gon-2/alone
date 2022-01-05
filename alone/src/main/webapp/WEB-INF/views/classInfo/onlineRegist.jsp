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
	<form role="form" method="post" action="" >
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 과정을 선택하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="c_day"><label for="c_day">요일 선택하기</label></th>
					<td><select name="c_day" id="c_day">
							<option value="전체">전체</option>
							<option value="주간반">주간반</option>
							<option value="야간반">야간반</option>
							<option value="주말반">주말반</option>
					</select></td>
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
							<option class="slt_option">선택하세요</option>
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
			<p></p>
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
										<input type="number" name="r_num1" id="r_num1" class="r_num1" style="width: 60px" maxlength="6" required="required" />-
										<input type="number" name="r_num2" id="r_num2" class="r_num2" style="width: 70px" maxlength="7" required="required" />
									</dd>
								</dl>
							</td>
						</tr>
						<tr>
							<th class="j-spot"><label for="gender">성별</label></th>
							<td class="td_infomation">
									<em><input type="radio" name="gender" id="gender" value="남자" class="hand" checked="checked"/></em> <label for="gender">남성</label>
									<em><input type="radio" name="gender" id="gender" value="여자" class="hand" /></em> <label for="gender">여성</label>
							</td>
							<th class="normal"><label for="foreigner">내/외국인</label></th>
							<td class="td_infomation">
									<em><input type="radio" name="foreigner" id="foreigner" value="KOREAN" class="hand" checked="checked" /></em> <label for="foreigner" class="hand">내국인</label>
									<em><input type="radio" name="foreigner" id="foreigner" value="FOREIGNER" class="hand" /></em> <label for="foreigner" class="hand">외국인</label>
							</td>
						</tr>
						<tr>
							<th class="j-spot"><label for="phone_num">휴대전화</label></th>
							<td class="td_infomation">
								<input type="text" name="phone_num1" id="phone_num1" style="width: 35px; ime-mode: disabled;" maxlength="3" required="required"/> - 
								<input type="text" name="phone_num2" id="phone_num2" style="width: 35px; ime-mode: disabled;" maxlength="4" required="required"/> - 
								<input type="text" name="phone_num3" id="phone_num3" style="width: 35px; ime-mode: disabled;" maxlength="4" required="required"/>
							</td>
							<th class="normal"><label for="home_num2">일반전화</label></th>
							<td>
								<input type="text" name="home_num1" id="home_num1" style="width: 35px; ime-mode: disabled;" maxlength="4"/> - 
								<input type="text" name="home_num2" id="home_num2" style="width: 35px; ime-mode: disabled;" maxlength="4"/> - 
								<input type="text" name="home_num3" id="home_num3" style="width: 35px; ime-mode: disabled;" maxlength="4"/>
							</td>
						</tr>
						<tr>
							<th class="normal"><label for="e_mail" style="text-color:red;">메일주소</label></th>
							<td colspan="3" class="td_infomation">
							<input type="text" name="e_mail1" id="e_mail1"style="width: 100px; ime-mode: disabled;" maxlength="120" /> @
							<input type="text" name="e_mail2" id="e_mail2" style="width: 120px; ime-mode: disabled;" maxlength="130" /> 
								<select name="tmp_email_domain" id="tmp_email_domain">
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
		<p></p>
		<h3 class="tpad20 bpad5 font14 bold dark-gray">추가정보</h3>
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 추가정보를 입력하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="j-spot"><label for="regist_path">지원경로</label></th>
					<td colspan="3" id="regist_path">
						<div class="overflow">
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">유튜브</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">블로그</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">인스타그램</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">페이스북</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">HRD-Net</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">네이버 검색</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">구글검색</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">다음검색</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">본원 홈페이지</label>
								<br>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">전단지</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">본원 수료생 소개</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">지인소개</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">국민내일배움카드 상담기관</label>
								<em><input type="radio" name="regist_path" class="stu_td"/></em> <label for="regist_path">고용센터 전단지</label>
								<em><input type="radio" name="regist_path" class="stu_td" checked="checked"/></em> <label for="regist_path">기타</label>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<p></p>
		<h3 class="tpad20 bpad5 font14 bold dark-gray">국민취업지원제도</h3>
		<table class="tbl-l tbl-fix" summary="온라인 수강신청을 위한 국민취업지원제도 정보를 입력하세요.">
			<colgroup><col width="110" /><col width="*" /><col width="110" /><col width="*" /><col width="110" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th class="normal">참여여부</th>
					<td colspan="5">
							<em><input type="radio" name="employment" id="employment"/></em>
							<label for="employment" class="hand">Ⅰ유형</label>
							<em><input type="radio" name="employment" id="employment"/></em>
							<label for="employment" class="hand">Ⅱ유형</label>
							<em><input type="radio" name="employment" id="employment" checked="checked" /></em> <label for="employment">미참여</label>
					</td>
				</tr>
				<tr>
					<th class="normal">참여센터</th>
					<td><input type="text" name="employment_center" id="employment_center" style="width: 120px; ime-mode: active;" maxlength="30" disabled="disabled" /></td>
					
					<th class="normal">담당자</th>
					<td><input type="text" name="employment_counselor" id="employment_counselor" style="width: 120px; ime-mode: active;" maxlength="30" disabled="disabled" /></td>
					
					<th class="normal">연락처</th>
					<td><input type="text" name="employment_num" id="employment_num" style="width: 120px; ime-mode: disabled;" maxlength="20" disabled="disabled" /></td>
				</tr>
			</tbody>
		</table>
		<p></p>
		<div>
				<a href="/classInfo/onlineRegist" class="btn btn-sm btn-outline-secondary">동의</a> 
				<a href="home" class="btn btn-sm btn-outline-danger">취소</a>
			</div>	
	</form>
</div>
</div>
</section>
