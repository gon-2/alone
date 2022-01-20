<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	// 파일 Ajax이용 업로드 (비동기)
	$("#r_RegistBtn").click(function() {
		var form = $("form")[0];
		if ($("#r_images1").val() == "" && $("#r_images2").val() == "") {
			r_images = 0;
		} else if ($("#r_images2").val() == "") {
			r_imagesVal = $("#r_images1").val();
			r_images = 1;
		} else {
			var r_imagesVal = [
				$("#r_images1").val(),
				$("#r_images2").val()
			];
			r_images = 2
		}
		
		for (i = 0; i < r_images; i++) {
		var formData = new FormData();
			
		formData.append("file", $("input[name=r_images]")[i].files[0]);
		var url = "/upload/uploadAjax";
			$.ajax({
	                url: url,
	                processData: false,
	                contentType: false,
	                data: formData,
	                type: 'POST',
	                success: function(rData){
	                }
			});
		}
	    form.submit();
	});
});

</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<form name="insertReferenceRoom" action="/employ/referenceRoomRegist_run" method="post">
				<input type="hidden" id="rwriter" name="rwriter" value="${sessionScope.memberVo.username}">
				<input type="hidden" id="userid" name="userid" value="${sessionScope.memberVo.userid}">
				<table class="table">
					<tbody>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">작성자</th>
							<td class="rboard_td">
							<div style="width:672px;">${sessionScope.memberVo.username}(${sessionScope.memberVo.userid})</div>
							</td>
						</tr>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">제목</th>
							<td class="rboard_td"><input type="text" id="rtitle" name="rtitle" style="width:672px;"></td>
						</tr>
						<tr>
							<td colspan="2" class="rboard_td">
								<textarea id="r_content" name="r_content" style="float: left; resize: none; width: 772px; height: 437px; margin-top:30px; margin-bottom:10px;"></textarea>
							</td>
						</tr>
						
						<tr>
							<th style="width:100px;">
							<div style="text-align:center; background-color:#dcdcdc; margin-top: 5px; margin-bottom: 5px;">첨부파일</div>
							</th>
							<td class="rboard_td">
							<div><input class="r_images" type="file" name="r_images" id="r_images1" placeholder="파일 선택" style="margin-left:20px;"></div>
							</td>
						</tr>
						<tr>
							<th style="width:100px;">
							<div style="text-align:center; background-color:#dcdcdc; margin-top: 5px; margin-bottom: 5px;">첨부파일</div>
							</th>
							<td class="rboard_td">
							<div><input class="r_images" type="file" name="r_images" id="r_images2" placeholder="파일 선택" style="margin-left:20px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align:right;">
					<input type="button" class="r_RegistBtn btn-sm" id="r_RegistBtn" value="글쓰기 완료">
				</div>
				</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>