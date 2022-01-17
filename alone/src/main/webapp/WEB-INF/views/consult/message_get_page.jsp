<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>${messageVo.service_message_sender}의 ${messageVo.service_message_title}</title>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					<label for="service_message_sender">보낸사람</label>
					<input type="text" id="service_message_sender" name="service_message_sender" value="${messageVo.service_message_sender}" class="form-control" style="width: 400px;"/>
				</div>
				<div class="form-group">
					<label for="service_message_title">받은사람</label>
					<input type="text" id="service_message_receiver" name="service_message_receiver" value="${messageVo.service_message_receiver}" class="form-control" style="width: 400px;"/>
				</div>				
				<div class="form-group">
					<label for="service_message_title">제목</label>
					<input type="text" id="service_message_title" name="service_message_title" value="${messageVo.service_message_title}" class="form-control" style="width: 400px;"/>
				</div>
				<div class="form-group">
					<label for="service_message_content">내용</label>
					<input type="text" id="service_message_content" name="service_message_content" value="${messageVo.service_message_content}" class="form-control" style="width: 400px; height: 200px;"/>
				</div>
				<div class="form-group">
					<label for="service_message_date">받은 날짜</label>
					<input type="text" id="service_message_date" name="service_message_date" value="<fmt:formatDate value="${messageVo.service_message_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" class="form-control" style="width: 400px; height: 200px;"/>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>