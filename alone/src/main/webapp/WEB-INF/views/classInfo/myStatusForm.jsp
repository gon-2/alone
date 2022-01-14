<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<style>
#rb {
	width: 50px;
	text-align: center;
}
</style>

<script>
	$(function() {
		$("#btnOk").click(function() {
			var r_num1 = $("#r_num1").val();
			var r_num2 = $("#r_num2").val();
			var r_num = "";

			if (r_num1.length < 6 || r_num2.length < 7) {
				alert("주민번호 다시 입력해주세요.");
			} else {
				r_num = r_num1 + r_num2;
			}
			$("#r_num").val(r_num);
			$("#r_numForm").submit();
			
		});
	});
</script>
<section id="banner">
	<header>
		<strong style="color: #FFDC37;">※ 과정 신청시 입력하신 정보를 정확히 입력하세요 ※</strong>
	</header>
</section>
<!-- Main -->
<section class="wrapper style1">
	<div class="container">
		<div class="clear overflow">
			<section class="col-md-12">
				<div class="tabbable" id="tabs-214280">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<form role="form" action="/classInfo/myStatusRun" id="r_numForm" method="post">
									<input type="hidden" name="r_num" id="r_num">
										<div class="form-group">
											<table>
												<thead>
													<tr>
														<th colspan="3"><strong>주민번호를 입력하세요</strong></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input type="text" maxlength="6" class="form-control" id="r_num1" style="width: 50;" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></td>
														<td id="rb">-</td>
														<td><input type="password" maxlength="7" class="form-control" id="r_num2" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></td>
													</tr>
												</tbody>
											</table>
											<table>
												<thead>
													<tr>
														<th colspan="3"><strong>이름을 입력하세요</strong></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input type="text" class="form-control"  style="width: 50;" required="required" /></td>

													</tr>
												</tbody>
											</table>
										</div>
										<button type="button" id="btnOk" class="btn btn-primary">조회하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>