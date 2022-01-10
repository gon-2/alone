<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script>
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<form action="/employ/referenceRoomRegist_run" method="post">
				<input type="hidden" name="rwriter" value="김동명">
				<input type="hidden" name="userid" value="star01">
				<table>
					<tbody>
						<tr>
							<th style="width:100px; text-align:center; background-color:#dcdcdc;">제목</th>
							<td class="rboard_td"><input type="text" name="rtitle" style="width:672px;"></td>
						</tr>
						<tr>
							<td colspan="2" class="rboard_td">
								<textarea name="r_content" style="float: left; resize: none; width: 772px; height: 437px; margin-top:30px; margin-bottom:10px;"></textarea>
							</td>
						</tr>
						
						<tr>
							<th style="width:100px;">
							<div style="text-align:center; background-color:#dcdcdc; margin-top: 5px; margin-bottom: 5px;">첨부파일</div>
							</th>
							<td class="rboard_td">
							<div><input type="file" name="r_images" placeholder="파일 선택" style="margin-left:20px;"></div>
							</td>
						</tr>
						<tr>
							<th style="width:100px;">
							<div style="text-align:center; background-color:#dcdcdc; margin-top: 5px; margin-bottom: 5px;">첨부파일</div>
							</th>
							<td class="rboard_td">
							<div><input type="file" name="r_images" placeholder="파일 선택" style="margin-left:20px;"></div>
							</td>
						</tr>
						<tr>
							<th style="width:100px;">
							<div style="text-align:center; background-color:#dcdcdc; margin-top: 5px; margin-bottom: 5px;">첨부파일</div>
							</th>
							<td class="rboard_td">
							<div><input type="file" name="r_images" placeholder="파일 선택" style="margin-left:20px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align:right;">
					<input type="submit" class="r_RegistBtn btn-sm" id="r_RegistBtn" value="글쓰기 완료">
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