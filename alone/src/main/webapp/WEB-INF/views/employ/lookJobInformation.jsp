<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCBPe1Po7YlOGcZ_x7IMunrHraiJnhBw04" ></script>
<style>
.th_information {
	background-color: #969696;
	width:150px;
}
.divBottom {
	padding-right:50px;
	text-align:right;
}
#map_ma {
	width:100%; 
	height:400px;
	clear:both;
	border:solid 1px red;
}
</style>

<script>
$(function() {
	$(".job_btnList").click(function() {
		location.href="/employ/lookJob";
	});
	
});
</script>

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<h2>
						업체 정보
					</h2>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form name="lookJob">
			<table class="table">
				<tbody>
					<tr>
						<th class="th_information">회사명</th>
						<td>${lookJobVo.company}</td>
						<th class="th_information">고용형태</th>
						<td>${lookJobVo.employForm}</td>
					</tr>
					<tr>
						<th class="th_information">사업자번호</th>
						<td>${lookJobVo.companyNum }</td>
						<th class="th_information">업태/종목</th>
						<td>${lookJobVo.companyForm }</td>
					</tr>
					<tr>
						<th class="th_information">대표자명</th>
						<td>${lookJobVo.representative }</td>
						<th class="th_information">담당자</th>
						<td>${lookJobVo.personInCharge }</td>
					</tr>
					<tr>
						<th class="th_information">연락처</th>
						<td>${lookJobVo.contact }</td>
						<th class="th_information">팩스</th>
						<td>${lookJobVo.fax }</td>
					</tr>
					<tr>
						<th class="th_information">메일주소</th>
						<td colspan="3">${lookJobVo.mail }</td>
					</tr>
					<tr>
						<th class="th_information">주소</th>
						<td colspan="3">${lookJobVo.address }</td>
					</tr>
					<tr>
						<th class="th_information">근무부서</th>
						<td>${lookJobVo.department }</td>
						<th class="th_information">담당업무</th>
						<td>${lookJobVo.work }</td>
					</tr>
					<tr>
						<th class="th_information">근무시간</th>
						<td>${lookJobVo.workTime }</td>
						<th class="th_information">급여</th>
						<td>${lookJobVo.salary }</td>
					</tr>
					<tr>
						<th class="th_information">모집시작일</th>
						<td>${lookJobVo.recruitmentStart }</td>
						<th class="th_information">모집종료일</th>
						<td>${lookJobVo.recruitmentEnd}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<div>
						${lookJobVo.content}
				</div>
				<c:forEach items="${jobImageList}" var="jobImageList">
					<img src="/upload/download?fileName=${jobImageList.job_image}" width="1200px"/><br>
				</c:forEach>
				<div style="text-align:center;"> 찾아오는길
					<div id="map_ma"></div>
				</div>
			</div>
		</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="divBottom">
						<input type="button" class="job_btnList btn-sm" value="목록">
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>	

<script type="text/javascript">
$(document).ready(function() {
		
// 		var myLatlng = new google.maps.LatLng(${lookJobVo.y_point}, ${lookJobVo.x_point});
		var Ypoint = ${lookJobVo.y_point};
		var Xpoint = ${lookJobVo.x_point};
		var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
		var markerTitle = "구인중 회사입니다."; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
		var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 // 말풍선 내용
		var contentString = '<div>' + '해당 회사 지도입니다.' + '<p>안녕하세요. 구글지도입니다.</p>' + '</div>';
		var myLatlng = new google.maps.LatLng(Ypoint, Xpoint); // 위치값 위도 경도
		var mapOptions = {
				zoom: zoomLevel,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
				}
		var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: markerTitle
			});
		var infowindow = new google.maps.InfoWindow({
			content: contentString,
			maxWizzzdth: markerMaxWidth
			});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		
			
		
	});
});

</script>						
<%@ include file="/WEB-INF/views/include/footer.jsp" %>